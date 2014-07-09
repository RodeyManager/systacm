<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Tag (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Role_Controller extends SY_Controller {
		
	
		/**
		 *本模块 默认操作
		*/
		public function index(){
			$role = M('role');
			$total = $role->getRows();
			$roles = $role->getAll();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$roles = $role->getRoles($limit);
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
			if(!$roles) 	$roles = '暂无数据';
			$this->assign('roles', $roles);
			$this->assign('page_link', $pagelink);
			$this->display('list');
		}
	
		public function add(){
			$this->display();
		}
	
		public function edit(){
			$id = intval($_GET['id']);
			
			if(empty($id)){
				$this->jump('index', array(), 5, '没有可修改的选项！');
			}
			$role = M('role');
			$role = $role->getOne($id);
			$this->assign('role', $role);
			$this->display();
		}
		public function mod(){
			$data = $_POST;
			if(!isset($data['id'])){
				show_error('ERROR', '角色名称不能为空');
			}
			if(empty($data['name'])){
				Echo '角色名称不能为空';
				return false;
			}
			$role = M('role');
			if(empty($data['level'])){
				$max = $role->doSQL("SELECT MAX(`level`) FROM `syst_role`");
			}
			$fileds = $role->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data = $role->update($data, $data['id']);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}
		
		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$role = M('role');
			$data = $role->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}
		
		
		public function insert_role(){

			$data = $_POST;
			if(empty($data['name'])){
				Echo '角色名称不能为空';
				return false;
			}
			$role = M('role');
			if(empty($data['level'])){
				$max = $role->doSQL("SELECT MAX(`level`) FROM `syst_role`");
			}
			if(empty($data['module']))		$data['module'] = 'all';
			if(empty($data['method']))		$data['method'] = 'c,u,r,d';

			$data['level'] = (int)$max['MAX(`level`)'] + 1;
			$fileds = $role->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data = $role->add($data);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO'; 		
		}
		//编辑
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
		//批量编辑
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

		//锁定与解锁
		public function locked(){
			$data['id'] = intval(trim($_POST['id']));
			$data['disabled'] = intval(trim($_POST['disabled']));
			$data['disabled'] = ($data['disabled'] == 0) ? 1 : 0;
			$role = M('role');
			$data = $role->update($data, $data['id']);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';
		}

		//检查角色名称
		public function check_role_name(){
			$name = $_GET['name'];
			$role = M('role');
			$data = $role->find_by('name', $name);
			if(!$data)		Echo '1';
			else 			Echo '0';
		}
	}