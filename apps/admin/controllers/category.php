<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Category (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Category_Controller extends SY_Controller {

		public function init(){
			
		}

		public function index(){
			$category = M('category');
			/*$total = $category->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$categorys = $category->getCategorys($limit);*/
			//载入分页类
			/*load_helper('pagetion');
			$pcfg = array(
					'page' 	=> $page,
					'total' => $total,
					'size'	=> PAGE_SIZE,
					'link'	=> $this->vars['__URL__'],
					'link_class' => 'page_link'
				);
			$pagetion = new Pagetion_Helper($pcfg);
			$pagelink = $pagetion->pageLinks();*/
			$categorys = $category->getAll();
			if(!$categorys) 	$categorys = '暂无数据';
			$categorys = $this->getSons($categorys, 0);
			foreach ($categorys as $key => $value) {
				$categorys[$key]['name'] = str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;', $value['level']). $value['name'];
				//添加模型名称
				$cmodel = $category->find_by('id', $value['model_id'], 'catmodel');
				$categorys[$key]['model_name'] = $cmodel['name'];
			}
			$parent = $category->find_by('pid', 0);
			
			///
			//pre($this->getParents($categorys, 17));

			$this->assign('categorys', $categorys);
			//$this->assign('page_link', $pagelink);
			$this->show('list');
		}

		//获取无限极分类 找子孙
	    function getSons($categorys, $id=0, $flag='', $level=0) {
	    	static $sons = array();
	       	foreach ($categorys as $key => $value) {
	       		if($value['pid'] == $id){
	       			$value['level'] = $level;
	       			$value['name'] = $flag . $value['name'];
	       			$sons[$value['id']] = $value;
	       			$this->getSons($categorys, $value['id'], '└─ ', $level+1);
	       		}
	       	}
	       	return $sons;
	    }

	    //获取无限极分类，找家谱
	    private function getParents($categorys, $id=0){
	    	static $parent = array();
	    	foreach ($categorys as $key => $value) {
	    		if($value['id'] == $id){
	    			$parent[$value['id']] = $value;
	    			if($value['pid'] > 0){
	    				$this->getParents($categorys, $value['pid']);
	    			}
	    		}
	    	}
	    	return $parent;
	    }


		public function add(){
			$category = M('category');
			$categorys = $category->getAll();

			//分类和类型
			$cids = $category->getAll();
			$cids = arr2arrs($cids);

			$cstr = "<option value=\$id \$selected>\$spacer\$name</option>";
			$icon = array('&nbsp;&nbsp;&nbsp; ','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
			$nbsp = '&nbsp;&nbsp;&nbsp;';
			$tree = new Tree();
			$tree->icon = $icon;
			$tree->nbsp = $nbsp;
			$tree->init($cids);
			$cids = $tree->get_tree(0, $cstr);

			//$types = array('文章/archive', '图片集/picture', '产品/product', '下载/download', '商品/shop', '分类信息/infos');
			//获取分列模型
			$type = M('catmodel');
			$types = $type->getAll();

			$this->assign('cids', $cids);
			$this->assign('types', $types);
			$this->assign('categorys', $categorys);
			$this->show();
		}

		public function create(){
			$category = M('category');
			$data = $category->create($_POST);
			$data = $data ? 'OK' : 'NO';
			Echo $data;
			return false;
		}

		public function edit(){
			if(!isset($_GET['id']) || trim($_GET['id']) == ''){
				show_error('ERROR', '没有可修改的选项');
				exit();
			}
			$id = intval(trim($_GET['id']));
			$category = M('category');
			$categorys = $category->getAll();
			$cat_current = $category->getOne($id);

			//去除当前栏目
			foreach ($categorys as $key => $value) {
				if($value['id'] == $cat_current['id']){
					unset($categorys[$key]);
					continue;
				}
			}
			$categorys = $this->getSons($categorys, 0);
			foreach ($categorys as $key => $value) {
				$categorys[$key]['name'] = str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;', $value['level']). $value['name'];
			}
			
			//$types = array('文章/archive', '图片集/picture', '产品/product', '下载/download', '商品/shop', '分类信息/infos');
			$type = M('catmodel');
			$types = $type->getAll();

			if(empty($cat_current['banner'])){
				$cat_current['banner'] = 'uploadfile/cat/banner/catbanner.gif';
			}

			$this->assign('types', $types);
			$this->assign('type_ids', array_keys($types));
			$this->assign('categorys', $categorys);
			$this->assign('cat_current', $cat_current);
			$this->show();
		}

		public function mod(){
			if(!isset($_POST['id']) || trim($_POST['id']) == '')	Dcho('NO');
			$category = M('category');
			$data = $category->mod($_POST);
			Echo $data ? 'OK' : 'NO';
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$category = M('category');
			$data = $category->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//显示或隐藏
		public function is_show(){
			if(isset($_POST['id'])) 	$data['id'] = intval($_POST['id']);
			else 						Echo 'NO';
			if(isset($_POST['is_show'])) $data['is_show'] = intval(trim($_POST['is_show']));
			else 						Echo 'NO';
			$data['is_show'] = ($data['is_show'] == 1) ? 0 : 1;
			$category = M('category');
			$data = $category->update($data, $data['id']);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//上传头像
		public function upload_banner(){
			$id = intval($_POST['id']);

			load_helper('upload');
			load_helper('ImageMagic');

			$file = 'banner_pic';
			$file_fix = 'banner_';
			$file_path = 'uploadfile/cat/banner';
			$ucfgs = array(
					'file' 		=> $file,
					'file_fix' 	=> $file_fix,
					'root_dir' 	=> $file_path,
					'max_size' 	=> 502400
				);
			$upload = new Upload_Helper($ucfgs);
			$upload->upload();
			$banner['img_width'] = get_cfgs('banner_width');
			$banner['img_height'] = get_cfgs('banner_height');
			$file_raw_path = $upload->getFilePath();
			$banner['path'] = '';
			$file_new_path = $file_path .'/'. $upload->getFileName();
			$img = new ImageMagic_Helper($file_raw_path, $file_new_path);
			$img->resizeImage($banner['img_width'], $banner['img_height']);
			$banner['path'] = $file_path .'/'. $upload->getFileName();

			if(!isset($_POST['id'])){
				$banner = implode('--', array_map('trim',$banner));
				Echo $banner;
				return false;
			}
			$user = M('user');
			$data['headport'] = $default;
			$data['id'] = $id;
			$data = $user->upload_headport($data);
			if($data) 	Echo $default;
			else 		Echo 'NO';
			unset($data);
			unset($banner);
		}

		//检查目录名称唯一性
		public function check_name(){
			$name = (isset($_POST['varn']) && '' != trim($_POST['varn'])) ? trim($_POST['varn']) : NULL;
			if(!is_null($name)){
				$cat = M('category');
				$data = $cat->find_by('name', $name);
				Echo $data ? 'OK' : 'NO';
			}
		}

		//检查目录英文名称唯一性
		public function check_ename(){
			$ename = (isset($_POST['varn']) && '' != trim($_POST['varn'])) ? trim($_POST['varn']) : NULL;
			if(!is_null($ename)){
				$cat = M('category');
				$data = $cat->find_by('ename', $ename);
				Echo $data ? 'OK' : 'NO';
			}
		}

		//栏目设置
		public function set(){

			$this->show();
		}


	}

