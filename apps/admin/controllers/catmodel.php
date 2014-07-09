<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Cattype (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Catmodel_Controller extends SY_Controller {

		public function index(){
			$cmodel = M('catmodel');
			$total = $cmodel->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$cmodels = $cmodel->getCatmodels($limit);
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
			if(!$cmodels) 	$cmodels = '暂无数据';
			$this->assign('cmodels', $cmodels);
			$this->assign('page_link', $pagelink);
			$this->show('list');
		}

		public function add(){

			$this->show();
		}

		public function create(){
			$cmodel = M('catmodel');
			$data = $cmodel->create($_POST);
			$data = $data ? 'OK' : 'NO';
			Echo $data;
		}

		public function edit(){
			if(!isset($_GET['id']) || '' == trim($_GET['id']))	show_error('ERROR', '没有可修改的项');
			$id = intval(trim($_GET['id']));
			$catm = M('catmodel');
			$catm = $catm->getOne($id);
			$this->assign('catm', $catm);
			$this->show();
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$catmodel = M('catmodel');
			$data = $catmodel->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';

		}




	}
