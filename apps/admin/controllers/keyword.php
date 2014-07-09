<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Keyword (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	
	class Keyword_Controller extends SY_Controller {


		public function index(){
			$keyword = M('keyword');
			$total = $keyword->getRows();
			//$keywords = $keyword->getAll();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$keywords = $keyword->getKeywords($limit);
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
			if(!$keywords) 	$keywords = '暂无数据';
			$this->assign('keywords', $keywords);
			$this->assign('page_link', $pagelink);
			$this->display('list');

			/*$keyword = M('keyword');
			$total = $keyword->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$keywords = $keyword->getKeywords($limit);
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
			if(!$keywords) 	$keywords = '暂无数据';
			$this->assign('keywords', $keywords);
			$this->assign('page_link', $pagelink);
			$this->display('list');*/
		}

		public function add(){

			$this->display();
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$keyword = M('keyword');
			$data = $keyword->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		public function edit(){

			$keywords = array();
			if(isset($_GET['id'])){
				$ids = explode(',', trim($_GET['id']));
				$keyword = M('keyword');
				foreach ($ids as $key => $value) {
					$keywords[] = $keyword->getOne($value); 
				}
			}else{
				show_error('ERROR', '没有可修改的选项!');
			}
			$this->assign('keywords', $keywords);
			$this->display();
		}

		//编辑
		public function edit_kw(){
			$data['id'] = intval($_POST['id']);
			$data['keyword_name'] = $_POST['keyword_name'];
			if(!isset($data['id']) || !isset($data['keyword_name'])){
				Echo 'NO';
				return false;
			}
			$keyword = M('keyword');
			$data = $keyword->update($data, $data['id']);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//批量编辑
		public function edit_kws(){
			if(isset($_POST['id']) && isset($_POST['keywords'])){
				$ids = explode(',', trim($_POST['id']));
				$keyword_names =explode(',', trim($_POST['keywords']));
				$datas = array();
				for ($i=0; $i < count($ids); $i++) {
					$datas[]['keyword_name'] = $keyword_names[$i];
				}
				$keyword = M('keyword');
				$data = $keyword->updates($datas, $ids);
				if($data > 0) 		Echo 'OK';
				else 				Echo 'NO';
			}else{
				Echo 'NO';
			}
		}

		public function insert(){
			$kws = trim($_POST['kws']);
			if($kws ==  ''){
				Echo 'NO';
				return false;
			}
			$keyword_name = explode(',', $kws);
			$name = array();
			foreach ($keyword_name as $key => $value) {
				$name[$key]['keyword_name'] = $value;
				$name[$key]['add_time'] = strtotime(date('Y-m-d H:i:s'));
			}
			$keyword = M('keyword');
			$data = $keyword->add($name);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO'; 		
		}


	}