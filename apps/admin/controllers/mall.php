<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Mall (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Mall_Controller extends SY_Controller {
		

		//检查角色名称
		public function check_role_name(){
			$name = $_GET['name'];
			$role = M('role');
			$data = $role->find_by('name', $name);
			if(!$data)		Echo '1';
			else 			Echo '0';
		}

		/* 品牌区 S */
		public function goods_brand(){
			$m = M('mall');
			$total = $m->getRows('goods_brand');
			//$brands = $m->getAll();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$brands = $m->getBrands($limit);
			//载入分页类
			load_helper('pagetion');
			$pcfg = array(
					'page' 	=> $page,
					'total' => $total,
					'size'	=> PAGE_SIZE,
					'link'	=> $this->vars['__URL__'],
					'link_class' => 'page_link'
				);
			$pagetion = new Pagetion_Helper($pcfg);
			$pagelink = $pagetion->pageLinks();
			if(!$brands) 	$brands = '暂无数据';
			$this->assign('brands', $brands);
			$this->assign('page_link', $pagelink);
			$this->display('brand');
		}
		public function add_brand(){
			$this->display('add_brand');
		}
		public function create_brand(){
			$data = $_POST;
			if(!isset($_POST['brand_name']) || '' == trim($_POST['brand_name'])) 	{ Dcho('NO'); }
			$data['add_time'] = $data['update_time'] = NOW_TIME;
			$session = new session();
			$author = unserialize($session->user);
			$data['author'] = $author['name'];
			$m = M();
			$data = $m->add($data, 'goods_brand');
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		public function edit_brand(){
			if(empty($_GET['id']) || '' == trim($_GET['id'])){
				show_error('ERROR', '没有可修改的项');
			}
			$id = (int)(trim($_GET['id']));
			$m = M();
			$brand = $m->find_by_id($id, 'goods_brand');
			$this->assign('brand', $brand);
			$this->display('edit_brand');
		}
		public function mod_brand(){
			if(empty($_POST['id']) || '' == trim($_POST['id']))	{ Dcho('NO'); }
			if(empty($_POST['brand_name']))		{ Dcho('NO'); }
			if(empty($_POST['brand_logo']))		{ Dcho('NO'); }
			$data = $_POST;
			$session = new session();
			$author = unserialize($session->user);
			$data['author'] = $author['name'];
			$data['update_time'] = NOW_TIME;
			$m = M();
			$data = $m->update($data, $data['id'], 'goods_brand');
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		public function del_brand(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id) || '' == trim($_POST['id']))	{ Dcho('NO'); }
			$m = M();
			$data = $m->destroy($id, 'goods_brand');
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		//显示或隐藏
		public function brand_is_show(){
			if(isset($_POST['id'])) 	$data['id'] = intval($_POST['id']);
			else 						Dcho('NO');
			if(isset($_POST['disabled'])) $data['disabled'] = intval(trim($_POST['disabled']));
			else 						Dcho('NO');
			$data['disabled'] = ($data['disabled'] == 1) ? 0 : 1;
			$brand = M();
			$data = $brand->update($data, $data['id'], 'goods_brand');
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		//上传
		public function upload_pic(){
			load_helper('upload');
			$file = 'brand_pic';
			$file_fix = 'brand_';
			$file_path = 'uploadfile/brand';
			$ucfgs = array(
					'file' 		=> $file,
					'file_fix' 	=> $file_fix,
					'root_dir' 	=> $file_path,
					'max_size' 	=> 502400,
					'is_mkdir' 	=> false
				);
			$upload = new Upload_Helper($ucfgs);
			$upload->upload();
			$banner = $upload->getFilePath();
			/*$attac = M('attachment');
			$attacs['file_module'] 	= $session->mod;
			$attacs['file_name'] 	= $upload->getName();
			$attacs['file_size'] 	= $upload->getSize();
			$attacs['file_ext']		= $upload->getExt();
			$attacs['file_path'] 	= $banner;
			$attacs['is_image'] 	= in_array($attacs['file_ext'], array('jpg','jpeg','png','gif')) ? 1 : 0;
			$attacs['author'] 		= $author['name'];
			$attacs['add_time'] 	= NOW_TIME;
			$attac->add($attacs);*/
			Echo BASE_URL .'/'. $banner;
			return false;
		}
		/* 品牌区 E */

		/* 商品分类 S */
		public function goods_cat(){
			$m = M('mall');
			//分类不支持分页显示
			//$total = $m->getRows('goods_cat');
			/*$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);*/
			$gcat = $m->getGcats($limit);
			/*//载入分页类
			load_helper('pagetion');
			$pcfg = array(
					'page' 	=> $page,
					'total' => $total,
					'size'	=> PAGE_SIZE,
					'link'	=> $this->vars['__URL__'],
					'link_class' => 'page_link'
				);
			$pagetion = new Pagetion_Helper($pcfg);
			$pagelink = $pagetion->pageLinks();*/
			if(!$gcat) 	$gcat = '暂无数据';
			foreach ($gcat as $key => $value) {
				$gtype = $m->find_by_id($value['tid'], 'goods_type');
				$gcat[$key]['tname'] = $gtype['name'];
				$gcat[$key]['sort'] = '<input type="text" name="sort" id="sort'. $value['id'] .'" value="'. $value['sort'] .'" class="span1 input-text-c"';
				if($value['disabled'] == 1){
					$gcat[$key]['disabled'] = "<i class='m-mini-btn m-mini-show m-mini-isshow' data-id='". $value['id'] ."' data-value='". $value['disabled'] ."' title='". $this->vars['lang']['disabled_false'] ."'></i>";
				}else{
					$gcat[$key]['disabled'] = "<i class='m-mini-btn m-mini-show m-mini-usshow' data-id='". $value['id'] ."' data-value='\$g". $value['disabled'] ."' title='". $this->vars['lang']['disabled_true'] ."'></i>";
				}
				$gcat[$key]['add_time'] = date('Y-m-d H:i:s', $value['add_time']);
				$gcat[$key]['handle'] = "
						<a href='". $this->vars['__CURL__'] ."add_gcat/id/". $value['id'] ."' class='m-mini-btn m-mini-point' title='". $this->vars['lang']['add_subcat'] ."' data-id='". $value['id'] ."' data-value='". $value['cat_name'] ."'>". $this->vars['lang']['add_subcat'] ."</a>
						<a href='". $this->vars['__CURL__'] ."edit_gcat/id/". $value['id'] ."' class='m-mini-btn m-mini-edit' title='". $this->vars['lang']['edit'] ."' data-id='". $value['id'] ."' data-value='". $value['cat_name'] ."'>". $this->vars['lang']['edit'] ."</a>
						<a href='javascript:_D(\"". $value['id'] ."\", \"". $this->vars['__CURL__'] ."del_gcat\");void(0);'  class='m-mini-btn m-mini-del' data-id='". $value['id'] ."' title='". $this->vars['lang']['delete'] ."'>". $this->vars['lang']['delete'] ."</a>
					";

			}
			
			//获取树型分类
			$disabled = 
			$str  = "<tr>
						<td><input type='checkbox' value='\$id' name='check[]' /></td>
						<td>\$sort</td>
						<td>\$id</td>
						<td >\$spacer\$cat_name\$display_icon</td>
						<td>\$tname</td>
						<td>\$disabled</td>
						<td>\$add_time</td>
						<td>\$handle</td>
					</tr>";
			$tree = new Tree();
			$tree->icon = array('&nbsp;&nbsp;&nbsp; ','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
			$tree->nbsp = '&nbsp;&nbsp;&nbsp;';
			$tree->init($gcat);
			$gcats = $tree->get_tree(0, $str);

			$this->assign('gcats', $gcats);
			//$this->assign('page_link', $pagelink);
			$this->display('cat');
		}
		public function add_gcat(){
			
			if(isset($_GET['id']) || '' != trim($_GET['id'])){
				$parentid = (int)trim($_GET['id']);
			}else{
				$parentid = 0;
			}
			$m = M();
			$pid = $m->getAll('goods_cat');
			$tid = $m->getAll('goods_type');
			$pids = (!is_array($pid[0])) ? array($pid) : $pid;
			$tids = (!is_array($tid[0])) ? array($tid) : $tid;
			$cstr = "<option value=\$id \$selected>\$spacer\$cat_name</option>";
			$icon = array('&nbsp;&nbsp;&nbsp; ','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
			$nbsp = '&nbsp;&nbsp;&nbsp;';
			$ptree = new Tree();
			$ptree->icon = $icon;
			$ptree->nbsp = $nbsp;
			$ptree->init($pids);
			$pids = $ptree->get_tree(0, $cstr, $parentid);

			$this->assign('pids', $pids);
			$this->assign('tids', $tids);
			$this->display('add_gcat');
		}
		public function create_gcat(){
			$data = $_POST;
			if(!isset($_POST['cat_name']) || '' == trim($_POST['cat_name'])) 	{ Dcho('NO'); }
			if(!isset($_POST['pid']) || '' == trim($_POST['pid'])) 	{ Dcho('NO'); }

			$data['cat_seo'] = serialize(array('page_title'=>$data['cat_title'], 'page_keywords'=>$data['cat_keywords'], 'page_desc'=>$data['cat_desc']));
			$m = M();
			$data = $m->add($data, 'goods_cat');
			$data = $m->doSQL("UPDATE `".DB_PRE."goods_cat` SET `is_leaf`='0' WHERE `id`='". trim($_POST['pid']) ."'");
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		public function del_gcat(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(empty($id) || '' == trim($_POST['id']))	{ Dcho('NO'); }
			$m = M();
			//查找是否有子分类
			foreach ($id as $key => $value) {
				$cats = $m->find_by('pid', $value, 'goods_cat');
				if($cats > 0){
					show_error('ERROR', '暂不能删除此分类，因为此分类下有商品存在');
				}
				$cats = $m->find_by_id($value, 'goods_cat');
				$data = $m->destroy($value, 'goods_cat');
				//判断子分类全部删除掉，则修改 叶子值
				$pcats = $m->getAll('goods_cat', array('where'=>'pid='.$cats['pid']));
				if(!$pcats){
					$data = $m->doSQL("UPDATE `".DB_PRE."goods_cat` SET `is_leaf`='1' WHERE `id`='". $cats['pid'] ."'");
				}
			}
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		//显示或隐藏
		public function gcat_is_show(){
			if(isset($_POST['id'])) 	$data['id'] = intval($_POST['id']);
			else 						Dcho('NO');
			if(isset($_POST['disabled'])) $data['disabled'] = intval(trim($_POST['disabled']));
			else 						Dcho('NO');
			$data['disabled'] = ($data['disabled'] == 1) ? 0 : 1;
			$brand = M();
			$data = $brand->update($data, $data['id'], 'goods_cat');
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		/* 商品分类 E */
	}