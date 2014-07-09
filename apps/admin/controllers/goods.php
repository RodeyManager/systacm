<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Goods (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-5-5
	 */
	 
	class Goods_Controller extends SY_Controller {

		/* List S */
		public function index(){
			$m = M('goods');
			$total = $m->getRows();
			//$brands = $m->getAll();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$goodses = $m->getGoods($limit);
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
			if(!$goodses) {
				$goodses = '暂无数据';
			}else{
				foreach ($goodses as $key => $value) {
					$gcat = $m->find_by_id($value['cat_id'], 'goods_cat');
					$goodses[$key]['cat_name'] = $gcat['cat_name'];
				}
			}
			$this->assign('goodses', $goodses);
			$this->assign('page_link', $pagelink);
			$this->display('list');
		}
		/* List E */

		/* Add S */
		public function add(){
			$m = M();

			//品牌列表
			$brands = $m->getAll('goods_brand');
			$brands = arr2arrs($brands); // $brand = (!is_array($brands[0])) ? array($brands) : $brands;

			//分类和类型
			$cids = $m->getAll('goods_cat');
			$tids = $m->getAll('goods_type');
			$cids = arr2arrs($cids);
			$tids = arr2arrs($tids);

			$cstr = "<option value=\$id \$selected>\$spacer\$cat_name</option>";
			$icon = array('&nbsp;&nbsp;&nbsp; ','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
			$nbsp = '&nbsp;&nbsp;&nbsp;';
			$tree = new Tree();
			$tree->icon = $icon;
			$tree->nbsp = $nbsp;
			$tree->init($cids);
			$cids = $tree->get_tree(0, $cstr);

			$this->assign('cids', $cids);
			$this->assign('tids', $tids);
			$this->assign('brands', $brands);
			$this->display();
		}
		public function create(){
			$data = $_POST;
			if(!isset($_POST['name']) || '' == trim($_POST['name']))	{ Dcho('NO'); }
			$m = M('goods');
			$is_exists = $m->find_by('name', trim($_POST['name']));
			if($is_exists) { Dcho('已经存在'); }

			$page_seo = array(
					'page_title'=>$data['page_title'],
					'page_keywords'=>$data['page_keywords'],
					'page_desc'=>$data['page_desc']
				);
			$data['seo'] = serialize($page_seo);
			$list_pics = array();
			if($data['pics']){
				foreach ($data['pics'] as $key => $value) {
					$list_pics[] = $value;
				}
			}
			$data['default_pics'] = explode('|', $list_pics[0]);
			foreach ($data['default_pics'] as $key => $value) {
				if(stripos(BASE_URL.'/', $value) === false){
					$data['default_pics'][$key] = str_replace(BASE_URL.'/', '', $value);
				}else{
					continue;
				}
			}
			$data['image_default'] = $data['default_pics'][0];
			$data['thumb_pic']	= $data['default_pics'][0];	//列表页缩略图
			$data['middle_pic']	= $data['default_pics'][1]; //商品页详细图
			$data['big_pic']	= $data['default_pics'][2];	//商品相册图
			$data['raw_pic']	= $data['default_pics'][3];	//商品上传后原图
			/*pre($gdata);
			die;*/

			$data = $m->add($data);
			$last_id = $m->getLastID();
			//添加图片
			$gimages = array();
			foreach ($list_pics as $key => $value) {
				$img_list = explode('|', $value);
				foreach ($img_list as $k => $v) {
					if(stripos(BASE_URL.'/', $v) === false){
						$img_list[$k] = str_replace(BASE_URL.'/', '', $v);
					}else{
						continue;
					}
				}
				$gimages[$key]['raw'] = $img_list[3];
				$gimages[$key]['small'] = $img_list[0];
				$gimages[$key]['middle'] = $img_list[1];
				$gimages[$key]['big'] = $img_list[2];
				$gimages[$key]['gid'] = $last_id;
				$gdata = $m->add($gimages[$key], 'goods_imgs');
			}
			
			//添加关键字
			$_POST['keywords'] = explode(',', $_POST['keywords']);
			$keys = array();
			foreach ($_POST['keywords'] as $key => $value) {
				$rs = $m->find_by('name', $value, 'goods_keywords');
				if($rs){
					$keys['hrefs'] = $rs['hrefs'].','.$last_id;
					$keys['relevan'] = $rs['releva'].','.'goods';
					$krs = $m->update($keys, $rs['id'], 'goods_keywords');
					unset($keys);
				}else{
					$keys['name'] = $value;
					$keys['relevan'] = 'goods';
					$keys['hrefs'] = $last_id;
					$krs = $m->add($keys, 'goods_keywords');
					unset($keys);
				}
			}
			unset($img_list);
			unset($keys);
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		public function edit(){
			if(empty($_GET['id']) || '' == trim($_GET['id'])){
				show_error('ERROR', '没有可修改的项');
			}
			$id = (int)(trim($_GET['id']));
			$m = M();
			$brand = $m->find_by_id($id, 'goods_brand');
			$this->assign('brand', $brand);
			$this->display();
		}
		public function mod(){
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
		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id) || '' == trim($_POST['id']))	{ Dcho('NO'); }
			$m = M();
			$data = $m->destroy($id, 'goods');
			
			if($data > 0){
				//删除相关图片列表信息????????????????????????????????????????????????????????????????????
				//$gdata = $m->doSQL("DELETE FROM `". DB_PRE ."goods_imgs` WHERE `gid` IN (". rtrim($_POST['id'], ',') .")");
				foreach ($id as $key => $value) {
					$gimg_id = $m->getAll('goods_imgs', array('gid'=>$value));
					if($gimg_id[0]){
						foreach ($gimg_id as $k => $pic) {
							@unlink($pic['raw']);
							@unlink($pic['small']);
							@unlink($pic['middle']);
							@unlink($pic['big']);
							$gdata = $m->destroy($pic['id'], 'goods_imgs');
						}
					}else{
						@unlink($gimg_id['raw']);
						@unlink($gimg_id['small']);
						@unlink($gimg_id['middle']);
						@unlink($gimg_id['big']);
						$gdata = $m->destroy($gimg_id['id'], 'goods_imgs');
					}
				}
				//$gdata = $m->doSQL("DELETE FROM `". DB_PRE ."goods_imgs` WHERE `gid` IN (". rtrim($_POST['id'], ',') .")");
				//删除相关关键字列表信息
				$ks = $m->getAll('goods_keywords', array('relevan'=>'goods'));
				if(is_array($ks[0])){
					foreach ($ks as $key => $value) {
						$kas = explode(',', rtrim($value['hrefs'], ','));
						$kas = array_diff($id, $kas);
						$kdata['hrefs'] = implode(',', $kas);
						$kdata = $m->update($kdata, 'goods_keywords');
					}
				}else{
					$ks = explode(',', rtrim($ks['hrefs'], ','));
					$ks = array_diff($id, $ks);
					$kdata['hrefs'] = implode(',', $ks);
					$kdata = $m->update($kdata, 'goods_keywords');
				}
			}
			
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		//上传商品图片
		public function upload_pic(){
			load_helper('upload');
			load_helper('ImageMagic');
			$file = 'goods_thumbs';

			if(!isset($_POST['flag']) || '' == trim($_POST['flag'])) { Dcho('NO'); }
			$flag = trim($_POST['flag']);
			if($flag == 'upload'){
				$file_fix = 'goods_';
				$file_path = UPLOAD_DIR.'goods/raws';
				$raw_path = UPLOAD_DIR.'goods/thumbs/'.date('Y-m-d');
				$ucfgs = array(
						'file' 		=> $file,
						'file_fix' 	=> $file_fix,
						'root_dir' 	=> $file_path,
						'max_size' 	=> 502400
					);
				$upload = new Upload_Helper($ucfgs);
				$upload->upload();
				$path = $upload->getFilePath();
				$raw_file = $path;
				$goods_new_file_size = array(
						'small'=>array(200, 200),
						'middle'=>array(400, 400),
						'big'=>array(800, 800),
					);
				$goods_pic_list = array($path);
				foreach ($goods_new_file_size as $key => $value) {
					//mkkdir($raw_path);
					if(!is_dir($raw_path)){ @mkdir($raw_path, 0777, true); }
					$new_file = $raw_path.'/'.$upload->getFileNewName().'_'. $key .'_'.$value[0].'.'.$upload->getExt();
					$goods_pic_list[] = $new_file;
					$img = new ImageMagic_Helper($raw_file, $new_file);
					$img->cropImage($value[0], $value[1]);
				}
				$goods_pics = array_combine(array('default', 'small', 'middle', 'big'), $goods_pic_list);
				//pre($goods_pics);
				$rstr = BASE_URL .'/'. $goods_pics['small'] .'-+-';
				$rstr .= BASE_URL .'/'. $goods_pics['middle'] .'-+-';
				$rstr .= BASE_URL .'/'. $goods_pics['big'] .'-+-';
				$rstr .= BASE_URL .'/'. $goods_pics['default'];
				Dcho($rstr);
			}elseif($flag == 'uploads'){
				$file_fix = 'gc_';
				$file_path = UPLOAD_DIR.'goods/images';
				$ucfgs = array(
						'file' 		=> $file,
						'file_fix' 	=> $file_fix,
						'root_dir' 	=> $file_path,
						'max_size' 	=> 502400
					);
				$upload = new Upload_Helper($ucfgs);
				$upload->upload();
				$path = $upload->getFilePath();
				Dcho($path);
			}else{
				Dcho('NO');
			}
		}

		public function view_pic(){
			Dcho('OK');
		}

		public function del_pic(){
			$pics = $_POST['pics'];
			$pics = explode('|', $pics);
			foreach ($pics as $key => $value) {
				if($cp = stripos($value, BASE_URL) === false){
					if(file_exists($cp) && is_writable($cp)){
						unlink($cp);
					}
					unset($pics[$key]);
				}
			}
			foreach ($pics as $key => $value) {
				$pic = str_replace(BASE_URL.'/', '', $value);
				if(file_exists($pic) && is_writable($pic)){
					unlink($pic);
				}
			}
			Dcho('OK');
		}
		
		/* Add E */

		/* 添加配件 S */
		public function parts(){
			$m = M('goods');
			$total = $m->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$goodses = $m->getGoods($limit);
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
			if(!$goodses) 	$goodses = '暂无数据';
			$this->assign('goodses', $goodses);
			$this->assign('page_link', $pagelink);
			$this->display();
		}
		/* 添加配件 E */

		
		//显示或隐藏
		public function is_show(){
			if(isset($_POST['id'])) 	$data['id'] = intval($_POST['id']);
			else 						Dcho('NO');
			if(isset($_POST['disabled'])) $data['disabled'] = intval(trim($_POST['disabled']));
			else 						Dcho('NO');
			$data['disabled'] = ($data['disabled'] == 1) ? 0 : 1;
			$goods = M('goods');
			$data = $goods->update($data, $data['id']);
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		
	}