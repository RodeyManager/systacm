<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Flinks (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-4
	 */
	 
	class Flinks_Controller extends SY_Controller {
	
		
		/**
		 *本模块 默认操作
		*/
		public function index(){
			$flinks = M('flinks');	
			$total = $flinks->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$flinkses = $flinks->getflinks($limit);
			
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
			if(!$flinkses) 	$flinkses = '暂无数据';
			$this->assign('flinkses', $flinkses);
			$this->assign('page_link', $pagelink);
			$this->display('list');
		}
		
		public function add(){
			$this->display();
		}

		public function create(){
			$data = $_POST;
			if(!isset($_POST['link_title']) || '' == trim($_POST['link_title'])){
				Echo 'NO';
				die;
			}	
			$data['add_time'] = NOW_TIME;
			$session = new session();
			$author = unserialize($session->user);
			$data['author'] = $author['name'];
			
			$flinks = M('flinks');
			$fileds = $flinks->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data = $flinks->add($data);
			Echo ($data > 0) ? 'OK' : 'NO';
		}

		public function edit(){
			if(empty($_GET['id'])) show_error('ERROR', '没有可修改的项');
			$id = intval(trim($_GET['id']));
			$flinks = M('flinks');
			$flinks = $flinks->getOne($id);
			$this->assign('flinks', $flinks);
			$this->display();
		}

		public function mod(){
			if(empty($_POST['id']) || '' == trim($_POST['id'])){
				Echo 'NO';
				die;
			}
			if(empty($_POST['link_title'])){
				Echo 'NO';
				die;
			}
			if(empty($_POST['linkto']) || stripos($_POST['linkto'], 'http://') === false){
				$_POST['linkto'] = SITE_URL;
			}
			$data = $_POST;
			$flinks = M('flinks');
			$fileds = $flinks->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data = $flinks->update($data, $data['id']);
			Echo ($data > 0) ? 'OK' : 'NO';
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$flinks = M('flinks');
			$data = $flinks->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//显示或隐藏
		public function is_show(){
			if(isset($_POST['id'])) 	$data['id'] = intval($_POST['id']);
			else 						Echo 'NO';
			if(isset($_POST['disabled'])) $data['disabled'] = intval(trim($_POST['disabled']));
			else 						Echo 'NO';
			$data['disabled'] = ($data['disabled'] == 1) ? 0 : 1;
			$flinks = M('flinks');
			$data = $flinks->update($data, $data['id']);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//上传
		public function upload_logo(){
			load_helper('upload');
			$file = 'flinks_logo';
			$file_fix = 'flinks_';
			$file_path = 'uploadfile/flinks';
			$ucfgs = array(
					'file' 		=> $file,
					'file_fix' 	=> $file_fix,
					'root_dir' 	=> $file_path,
					'max_size' 	=> 502400
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
	
	}