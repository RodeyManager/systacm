<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Banner (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Banner_Controller extends SY_Controller {

		public function index(){
			$banner = M('banner');	
			$total = $banner->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$banners = $banner->getBanners($limit);
			
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
			if(!$banners) 	$banners = '暂无数据';
			foreach ($banners as $key => $value) {
				$types = $banner->getOne($value['type_id'], 'banner_type');
				$banners[$key]['type_name'] = $types['name'];
			}
			$this->assign('banners', $banners);
			$this->assign('page_link', $pagelink);
			$this->show('list');
		}

		public function add(){
			$type = M();
			$types = $type->getAll('banner_type');
			$this->assign('types', $types);
			$this->show('add');
		}
		public function create(){
			$data = $_POST;
			if(!isset($_POST['title']) || '' == trim($_POST['title'])){
				Echo 'NO';
				die;
			}
			if(!isset($_POST['banner']) || '' == trim($_POST['banner'])){
				Echo 'NO';
				die;
			}
			if(empty($_POST['banner_width'])){
				$data['banner_width'] = intval(get_cfgs('banner_width'));
			}
			if(empty($_POST['banner_height'])){
				$data['banner_height'] = intval(get_cfgs('banner_height'));
			}
			if(strtotime($_POST['start_time']) > strtotime($_POST['end_time'])){
				Echo 'LS';
				return false;
			}
			$data['start_time'] = empty($_POST['start_time']) 	? NOW_TIME : strtotime($_POST['start_time']);
			$data['end_time'] 	 = empty($_POST['end_time']) 	? NOW_TIME : strtotime($_POST['end_time']);		
			$data['add_time'] = NOW_TIME;
			$session = new session();
			$author = unserialize($session->user);
			$data['author'] = $author['name'];
			
			$banner = M();
			$fileds = $banner->getFileds('banner');
			$data = array_intersect_key($data, $fileds);
			$data = $banner->add($data, 'banner');
			Echo ($data > 0) ? 'OK' : 'NO';
		}
		//编辑
		public function edit(){
			if(empty($_GET['id'])) show_error('ERROR', '没有可修改的项');
			$id = intval(trim($_GET['id']));
			$banner = M('banner');
			$types = $banner->getAll('banner_type');
			$this->assign('types', $types);
			$this->assign('banner', $banner->getOne($id));
			$this->show();
		}
		public function mod(){
			if(empty($_POST['id']) || '' == trim($_POST['id'])){
				Echo 'NO';
				die;
			}
			if(empty($_POST['title']) || empty($_POST['banner'])){
				Echo 'NO';
				die;
			}
			if(empty($_POST['linkto']) || stripos($_POST['linkto'], 'http://') <= 0){
				$_POST['linkto'] = SITE_URL;
			}
			$data = $_POST;
			$data['start_time'] = empty($_POST['start_time']) 	? NOW_TIME : strtotime($_POST['start_time']);
			$data['end_time'] 	= empty($_POST['end_time']) 	? NOW_TIME : strtotime($_POST['end_time']);	
			$banner = M('banner');
			$fileds = $banner->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data = $banner->update($data, $data['id']);
			Echo ($data > 0) ? 'OK' : 'NO';
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$banner = M('banner');
			$data = $banner->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}
		//上传
		public function upload_banner(){
			$session = new session();
			$author = unserialize($session->user);
			//$data['author'] = $author['name'];

			load_helper('upload');

			$file = 'banner_pic';
			$file_fix = 'banner_';
			$file_path = 'uploadfile/slider';
			$ucfgs = array(
					'file' 		=> $file,
					'file_fix' 	=> $file_fix,
					'root_dir' 	=> $file_path,
					'max_size' 	=> 502400
				);
			$upload = new Upload_Helper($ucfgs);
			$upload->upload();
			$banner = $upload->getFilePath();
			$attac = M('attachment');
			$attacs['file_module'] 	= $session->mod;
			$attacs['file_name'] 	= $upload->getName();
			$attacs['file_size'] 	= $upload->getSize();
			$attacs['file_ext']		= $upload->getExt();
			$attacs['file_path'] 	= $banner;
			$attacs['is_image'] 	= in_array($attacs['file_ext'], array('jpg','jpeg','png','gif')) ? 1 : 0;
			$attacs['author'] 		= $author['name'];
			$attacs['add_time'] 	= NOW_TIME;
			$attac->add($attacs);
			Echo BASE_URL .'/'. $banner;
			return false;
		}

		/* banner——type 类别管理 */
		public function banner_type(){
			$type = M('banner');	
			$total = $type->getRows('banner_type');
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($page == 1)
				$limit = 0;
			else
				$limit = PAGE_SIZE * ($page - 1);
			$types = $type->getBanner_types($limit);
			
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
			if(!$types) 	$types = '暂无数据';
			foreach ($types as $key => $value) {
				$num = $type->getRows('banner', array( 'where'=> array('type_id'=>$value['id']), 'filed'=>'type_id'));
				$types[$key]['num'] = $num;
			}
			$this->assign('types', $types);
			$this->assign('page_link', $pagelink);
			$this->show();
		}

		public function add_type(){
			if(!isset($_POST['name']) || ''==trim($_POST['name'])){
				$data = 'NO';
				die;
			}
			$datas['name'] = trim($_POST['name']);
			$datas['add_time'] = $datas['update_time'] = NOW_TIME;
			$type = M();
			$data = $type->add($datas, 'banner_type');
			$data = ($data > 0) ? 'OK' : 'NO';
			$data .= '-'. $type->getLastID();
			$data .= '-'. trim($_POST['name']);
			Echo $data;
		}

		public function del_type(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$type = M('banner');
			$data = $type->destroy($id, 'banner_type');
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		public function edit_type(){
			if(empty($_POST['id']) || '' == trim($_POST['id'])){
				Echo 'NO';
				die;
			}
			if(empty($_POST['name']) || '' == trim($_POST['name'])){
				Echo 'NO';
				die;
			}
			$data['id'] = intval($_POST['id']);
			$data['name'] = trim($_POST['name']);
			$data['update_time'] = NOW_TIME;
			$type = M('banner');
			$data = $type->update($data, $data['id'], 'banner_type');
			Echo ($data > 0) ? 'OK' : 'NO';
		}

	}