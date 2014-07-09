<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Resnet (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-5-4
	 */
	 
	class Resnet_Controller extends SY_Controller {
	
		
		/**
		 *本模块 默认操作
		*/
		public function index(){
			$resnet = M('resnet');	
			$total = $resnet->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$resnets = $resnet->getResnets($limit);
			
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
			if(!$resnets) 	$resnets = '暂无数据';
			foreach($resnets as $key=>$value){
				$net_type = $resnet->find_by_id($value['net_tid'], 'resnettype');
				$resnets[$key]['net_type'] = $net_type['name'];
			}
			$this->assign('resnets', $resnets);
			$this->assign('page_link', $pagelink);
			$this->display('list');
		}
		
		public function add(){
			$m = M();
			$regions = $m->getAll('region', array('where'=>'region_type=1'));
			$this->assign('regions', $regions);
			$nettypes = $m->getAll('resnettype');
			$this->assign('nettypes', $nettypes);
			$this->display();
		}

		public function create(){
			$data = $_POST;
			if(!isset($_POST['net_name']) || '' == trim($_POST['net_name'])) 			{ Dcho('NO'); }
			if(!isset($_POST['net_address']) || '' == trim($_POST['net_address'])) 		{ Dcho('NO'); }
			if(!isset($_POST['net_hotline']) || '' == trim($_POST['net_hotline'])) 		{ Dcho('NO'); }
			if(!isset($_POST['net_tid']) || '' == trim($_POST['net_tid'])) 				{ Dcho('NO'); }
			if(!isset($_POST['net_region']) || '' == trim($_POST['net_region'])) 		{ Dcho('NO'); }

			$data['net_mapx'] = isset($_POST['ezmarker_x']) ? trim($_POST['ezmarker_x']) : 0;
			$data['net_mapy'] = isset($_POST['ezmarker_y']) ? trim($_POST['ezmarker_y']) : 0;
			$data['net_mapz'] = isset($_POST['ezmarker_z']) ? trim($_POST['ezmarker_z']) : 0;

			$data['add_time'] = $data['update_time'] = NOW_TIME;
			$session = new session();
			$author = unserialize($session->user);
			$data['author'] = $author['name'];
			
			$resnet = M('resnet');
			/*$fileds = $resnet->getFileds();
			$data = array_intersect_key($data, $fileds);*/
			$data = $resnet->add($data);
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		public function edit(){
			if(empty($_GET['id'])) show_error('ERROR', '没有可修改的项');
			$id = (int)(trim($_GET['id']));
			$m = M('resnet');
			$resnet = $m->getOne($id);
			$this->assign('resnet', $resnet);
			//net_type
			$nettypes = $m->getAll('resnettype');
			$ntypes = array();
			$areas = array();
			foreach ($nettypes as $key => $value) {
				$ntypes[$value['id']] = $value['name'];
			}
			$this->assign('ntypes', $ntypes);
			//net_region
			$regions = $m->getAll('region', array('where'=>'region_type=1'));
			foreach ($regions as $key => $value) {
				$areas[$value['region_id']] = $value['region_name'];
			}
			$this->assign('areas', $areas);
			$this->display();
		}

		public function mod(){
			if(empty($_POST['id']) || '' == trim($_POST['id']))	{ Dcho('NO'); }
			if(empty($_POST['net_name']))		{ Dcho('NO'); }
			if(empty($_POST['net_address']))	{ Dcho('NO'); }
			if(empty($_POST['net_hotline']))	{ Dcho('NO'); }
			if(empty($_POST['net_tid']))		{ Dcho('NO'); }
			if(empty($_POST['net_region']))		{ Dcho('NO'); }
			$data = $_POST;
			$resnet = M('resnet');
			/*$fileds = $resnet->getFileds();
			$data = array_intersect_key($data, $fileds);*/
			$data = $resnet->update($data, $data['id']);
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		public function view(){
			if(empty($_GET['id'])) show_error('ERROR', '没有可查看的项');
			$id = (int)(trim($_GET['id']));
			$m = M('resnet');
			$resnet = $m->getOne($id);
			
			//net_type
			$net_type = null;
			$area = null;
			$net_type = $m->find_by_id($resnet['net_tid'], 'resnettype');
			$resnet['net_type'] = $net_type['name'];
			//net_region
			$net_region = $m->find_by('region_id', $resnet['net_region'], 'region');
			$resnet['net_region_name'] = $net_region['region_name'];
			
			$this->assign('resnet', $resnet);
			$this->display();
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$resnet = M('resnet');
			$data = $resnet->destroy($id);
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		//显示或隐藏
		public function is_show(){
			if(isset($_POST['id'])) 	$data['id'] = intval($_POST['id']);
			else 						Echo 'NO';
			if(isset($_POST['disabled'])) $data['disabled'] = intval(trim($_POST['disabled']));
			else 						Echo 'NO';
			$data['disabled'] = ($data['disabled'] == 1) ? 0 : 1;
			$resnet = M('resnet');
			$data = $resnet->update($data, $data['id']);
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		//上传
		public function upload_logo(){
			load_helper('upload');
			$file = 'flinks_logo';
			$file_fix = 'flinks_';
			$file_path = 'uploadfile/resnet';
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

		//list_net_tpe
		public function net_type_list(){
			$resnet = M('resnet');	
			$total = $resnet->getRows('resnettype');
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$resnettypes = $resnet->getResnetTypes($limit);
			
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
			if(!$resnettypes) 	$resnettypes = '暂无数据';
			$this->assign('resnettypes', $resnettypes);
			$this->assign('page_link', $pagelink);
			$this->display('list_type');
		}
		//add_net_type
		public function add_net_type(){
			if(!isset($_POST['net_type']) || '' == trim($_POST['net_type'])) 	{ Dcho('NO'); }
			$data['name'] = trim($_POST['net_type']);
			$data['add_time'] = NOW_TIME;
			$m = M();
			$data = $m->add($data, 'resnettype');
			if($data > 0){
				$name = trim($_POST['net_type']);
				$id = $m->getLastID();
				Dcho('OK-+-'. $id .'-+-'. $name);
			}else{
				Dcho('NO');
			}
		}
		//del_net_type
		public function del_net_type(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$m = M();
			$data = $m->destroy($id, 'resnettype');
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
	
	}