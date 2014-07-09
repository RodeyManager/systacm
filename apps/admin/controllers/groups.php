<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Group (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Groups_Controller extends SY_Controller {


		public function index(){
			$group = M('group');
			$total = $group->getRows();
			$groups = $group->getAll();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$groups = $group->getGroups($limit);
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

			$this->assign('groups', $groups);
			$this->assign('page_link', $pagelink);
			$this->display('list');
		}

		public function add(){
			$this->display();
		}
		//添加用户组
		public function insert_group(){

			$data = $_POST;
			if(empty($data['name'])){
				Echo '角色名称不能为空';
				return false;
			}
			$group = M('group');
			if(empty($data['value'])){
				$max = $group->doSQL("SELECT MAX(`value`) FROM `syst_user_group`");
			}
			$data['value'] = (int)$max['MAX(`value`)'] + 1;
			$data['add_time'] = strtotime(date('Y-m-d H:i:s'));
			$fileds = $group->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data = $group->add($data);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO'; 		
		}

		//删除
		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$group = M('group');
			$data = $group->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//修改积分
		public function add_point(){
			$id = intval($_POST['id']);
			$point = intval($_POST['point']);
			$group = M('group');
			$data = $group->update(array('point'=>$point), $id);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';
		}

		public function edit(){
			$id = intval($_GET['id']);

			$group = M('group');
			$data = $group->getOne($id);
			$this->assign('group', $data);
			$this->show();
		}

		//修改
		public function edit_group(){
			$data = $_POST;
			$group = M('group');
			$fileds = $group->getFileds();
			$data = array_intersect_key($data, $fileds);
			//$data['add_time'] = strtotime(date('Y-m-d H:i:s'));
			$data = $group->update($data, $data['id']);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		//用户组状态
		public function locked(){
			$id = intval($_POST['id']);
			$disabled = intval($_POST['disabled']);
			$disabled = ($disabled == 0) ? 1 : 0;
			$group = M('group');
			$data = $group->update(array('disabled'=>$disabled), $id);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';

		}

		//检查用户组名称
		public function check_group_name(){
			if($_POST['id']){
				Echo $_POST['id'];
				return;
			}
			$name = $_GET['name'];
			$group = M('group');
			$data = $group->find_by('name', $name);
			if(!$data)		Echo '1';
			else 			Echo '0';
		}


	}