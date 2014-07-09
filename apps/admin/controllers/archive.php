<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Archive (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Archive_Controller extends SY_Controller {
		
	
		/**
		 *本模块 默认操作
		*/
		public function index(){
			$archive = M('archive');
			$total = $archive->getRows();
			$archives = $archive->getAll();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$archives = $archive->getarchives($limit);
			foreach ($archives as $key => $value) {
				if(!empty($value['add_time']))
					$archives[$key]['add_time'] = date('Y-m-d H:i:s', $value['add_time']);
				if(!empty($value['update_time']))
				$archives[$key]['update_time'] = date('Y-m-d H:i:s', $value['add_time']);
			}
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
			if(!$archives) 	$archives = '暂无数据';
			$this->assign('archives', $archives);
			$this->assign('page_link', $pagelink);
			$this->display('list');
		}
	
		public function add(){
			
			$category = M('category');
			$categorys = $category->getAll();
			$this->assign('categorys', $categorys);

			$this->show();
		}
		//添加内容
		public function create(){
			$data = $_POST;
			$archive = M('archive');
			$fileds = $archive->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data['add_time'] = $data['update_time'] = strtotime(date('Y-m-d H:i:s'));
			$session = new Session();
			$user = unserialize($session->user);
			$data['author'] = $user['name'];
			$data = $archive->add($data);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}
	
		public function edit(){
			if(!isset($_GET['id']) || trim($_GET['id']) == '')		show_error('ERROR', '没有可修改的选项');			
			$id = intval(trim($_GET['id']));
			$archive = M('archive');
			$archive = $archive->getOne($id);
			$category = M('category');
			$categorys = $category->getAll();

			$this->assign('categorys', $categorys);
			$this->assign('archive', $archive);
			$this->show();
		}
		public function mod(){
			$data = $_POST;
			if(empty($data['id'])){
				Echo 'NO';
				return false;
			}
			$archive = M('archive');
			$fileds = $archive->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data['update_time'] = now_time();
/*pre($data);
die;*/
			$data = $archive->update($data, $data['id']);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';

		}
		
		//删除，支持批量
		public function del(){
			$archive = M('archive');
			$id = rtrim($_POST['id'], ',');
			$ids = explode(',', $id);
			$data = $archive->destroy($ids);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';
		}
		
		//Tag列表
		public function list_tag(){
			$tag = M('tag');
			$total = $tag->getRows();
			$tags = $tag->getAll();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($page == 1)
				$limit = 0;
			else
				$limit = PAGE_SIZE * ($page - 1);
			$tags = $tag->getTags($limit);
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

			$this->assign('tags', $tags);
			$this->assign('page_link', $pagelink);
			$this->display('list_tag');
		}
		//添加Tag标签
		public function add_tag(){
			$this->display();
		}
		public function mod_tags(){
			$tags = array();
			if(isset($_GET['id'])){
				$ids = explode(',', trim($_GET['id']));
				$tag = M('tag');
				foreach ($ids as $key => $value) {
					$tags[] = $tag->getOne($value); 
				}
			}else{
				show_error('ERROR', '没有可修改的选项!');
			}
			$this->assign('tags', $tags);
			$this->display();
		}
		public function insert_tags(){
			$tags = trim($_POST['tags']);
			if($tags ==  ''){
				Echo 'NO';
				return false;
			}
			$tag_name = explode(',', $tags);
			$name = array();
			foreach ($tag_name as $key => $value) {
				$name[$key]['tag_name'] = $value;
				$name[$key]['add_time'] = strtotime(date('Y-m-d H:i:s'));
			}
			$tag = M('tag');
			$data = $tag->add($name);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO'; 		
		}
		public function del_tag(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$tag = M('tag');
			$data = $tag->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}
		public function edit_tag(){
			$data['id'] = intval($_POST['id']);
			$data['tag_name'] = $_POST['tag_name'];
			if(!isset($data['id']) || !isset($data['tag_name'])){
				Echo 'NO';
				return false;
			}
			$tag = M('tag');
			$data = $tag->update($data, $data['id']);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}
		//批量修改
		public function edit_tags(){
			if(isset($_POST['id']) && isset($_POST['tags'])){
				$ids = explode(',', trim($_POST['id']));
				$tag_names =explode(',', trim($_POST['tags']));
				$datas = array();
				for ($i=0; $i < count($ids); $i++) {
					$datas[]['tag_name'] = $tag_names[$i];
				}
				$tag = M('tag');
				$data = $tag->updates($datas, $ids);
				if($data > 0) 		Echo 'OK';
				else 				Echo 'NO';
			}else{
				Echo 'NO';
			}
		}
	}