<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Notice (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Notice_Controller extends SY_Controller {

		public function index(){
			$notice = M('notice');
			$total = $notice->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$notices = $notice->getnotices($limit);
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
			if(!$notices) 	$notices = '暂无数据';
			$this->assign('notices', $notices);
			$this->assign('page_link', $pagelink);
			$this->show('list');
		}

		public function add(){
			$notice = M('notice');
			$notices = $notice->getAll();

			$types = array('文章/archive', '图片集/picture', '产品/product', '下载/download', '商品/shop', '分类信息/infos');

			$this->assign('types', $types);
			$this->assign('notices', $notices);
			$this->show();
		}

		public function create(){

			if(strtotime($_POST['start_time']) > strtotime($_POST['end_time'])){
				Echo 'LS';
				return false;
			}
			$_POST['start_time'] = empty($_POST['start_time']) 	? NOW_TIME : strtotime($_POST['start_time']);
			$_POST['end_time'] 	 = empty($_POST['end_time']) 	? NOW_TIME : strtotime($_POST['end_time']);
			$notice = M('notice');
			$data = $notice->create($_POST);
			$data = $data ? 'OK' : 'NO';
			Echo $data;
			return false;
		}

		public function edit(){
			if(!isset($_GET['id']) || trim($_GET['id']) == ''){
				show_error('ERROR', '没有可修改的选项');
				exit();
			}else{
				$id = intval(trim($_GET['id']));
			}
			$notice = M('notice');
			$notice = $notice->getOne($id);
			
			$types = array('文章/archive', '图片集/picture', '产品/product', '下载/download', '商品/shop', '分类信息/infos');

			$this->assign('type_ids', array_keys($types));
			$this->assign('notice', $notice);
			$this->assign('type_id', $notice['type_id']);
			$this->show();
		}

		public function mod(){
			if(!isset($_POST['id']) || trim($_POST['id']) == ''){
				Echo 'NO';
				exit();
			}
			if(strtotime($_POST['start_time']) > strtotime($_POST['end_time'])){
				Echo 'LS';
				exit();
			}
			$_POST['start_time'] = empty($_POST['start_time']) 	? NOW_TIME : strtotime($_POST['start_time']);
			$_POST['end_time'] 	 = empty($_POST['end_time']) 	? NOW_TIME : strtotime($_POST['end_time']);
			$notice = M('notice');
			$data = $notice->mod($_POST);
			$data = $data ? 'OK' : 'NO';
			Echo $data;
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$notice = M('notice');
			$data = $notice->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//显示或隐藏
		public function is_show(){
			if(isset($_POST['id'])) 	$data['id'] = intval($_POST['id']);
			else 						Echo 'NO';
			if(isset($_POST['is_show'])) $data['disabled'] = intval(trim($_POST['is_show']));
			else 						Echo 'NO';
			$data['disabled'] = ($data['disabled'] == 1) ? 0 : 1;
			$notice = M('notice');
			$data = $notice->update($data, $data['id']);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//栏目设置
		public function set(){

			$this->show();
		}


	}

