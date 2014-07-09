<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Sms (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Sms_Controller extends SY_Controller {

		public function index(){

			$sms = M('sms');
			$total = $sms->getRows('sms', array('where'=>array('type'=>1)));
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$smses = $sms->getSms($limit, $_GET);
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
			$type = M('sms_type');
			$types = $type->getSms_types($limit);
			if(!$smses) 	$smses = '暂无数据';
			foreach ($smses as $key => $value) {
				$from_user = $sms->find_by_id($value['from_id'], 'user');
				$to_user = $sms->find_by_id($value['to_id'], 'user');
				$smses[$key]['from_user'] = $from_user['name'];
				$smses[$key]['to_user'] = $to_user['name'];

				$type_name = $type->find_by_id($value['type_id']);
				$smses[$key]['type_name'] = $type_name['name'];
			}
			
			$this->assign('types', $types);
			$this->assign('smses', $smses);
			$this->assign('page_link', $pagelink);
			$this->show('list');
		}

		//消息类型
		public function sms_type(){
			$type = M('sms_type');
			$total = $type->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$types = $type->getSms_types($limit);
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
				if($value['disabled'] == 0){
					$types[$key]['disabled_title'] = '系统内置';
				}else{
					$types[$key]['disabled_title'] = '自定义';
				}
			}
			$this->assign('types', $types);
			$this->assign('page_link', $pagelink);
			$this->show('list_type');
		}

		//添加类型
		public function add_sms_type(){
			$type = M('sms_type');
			$data = $type->add_sms_type($_POST);
			if(!empty($data)){
				Echo 'OK-+-'. $data['id'] .'-+-'. $data['name'];
			}else{
				Echo 'NO';
			}
		}
		//修改类型
		public function edit_sms_type(){
			$type = M('sms_type');
			$data = $type->edit_sms_type($_POST);
			Echo $data ? 'OK' : 'NO';
		}
		//删除
		public function del_sms_type(){
			if(!isset($_POST['id']) || '' == rtrim($_POST['id'], ',')) 	Dcho('NO');
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			$type = M('sms_type');
			$data = $type->destroy($id);
			Echo $data>0 ? 'OK' : 'NO';
		}

		public function index_group(){
			$sms = M('sms');
			$total = $sms->getRows('sms', array('where'=>array('type'=>2)));
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$smses = $sms->getSms_group($limit);		
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
			//消息类型
			$type = M('sms_type');
			$types = $type->getSms_types($limit);
			$this->assign('types', $types);
			if(!$smses) 	$smses = '暂无数据';
			foreach ($smses as $key => $value) {
				$from_user = $sms->find_by_id($value['from_id'], 'user');
				$to_user = $sms->find_by_id($value['to_id'], 'user_group');
				$smses[$key]['from_user'] = $from_user['name'];
				$smses[$key]['to_user'] = $to_user['name'];

				$type_name = $type->find_by_id($value['type_id']);
				$smses[$key]['type_name'] = $type_name['name'];
			}
			$this->assign('smses', $smses);
			$this->assign('page_link', $pagelink);
			$this->show('list_group');
		}

		public function add_sms(){
			if(!isset($_POST['title']) || '' == trim($_POST['title']))		Dcho('NO');
			if(!isset($_POST['to_id']) || '' == trim($_POST['to_id']))		Dcho('NO');
			if(!isset($_POST['content']) || '' == trim($_POST['content']))	Dcho('NO');
			$data['title'] = trim($_POST['title']);
			$data['to_id'] = trim($_POST['to_id']);
			$data['content'] = trim($_POST['content']);
			$data['type_id'] = trim($_POST['type_id']);
			
			$session = new Session();
			$user = unserialize($session->user);
			$data['from_id'] = $user['user_id'];
			$sms = M('sms');
			if(stripos($data['to_id'], ',') !== false){
				//群发
				$data['to_id'] = rtrim($data['to_id'], ',');
				$datas['to_id'] = explode(',', $data['to_id']);
				foreach ($datas['to_id'] as $key => $name) {
					$to_id = $sms->find_by('name', $name, 'user');
					$data['to_id'] = $to_id['id'];
					$data['add_time'] = NOW_TIME;
					$rs = $sms->add($data);
				}
			}else{
				$data['add_time'] = NOW_TIME;
				$data['to_id'] = $sms->find_by('name', $data['to_id'], 'user');
				$data['to_id'] = $data['to_id']['id'];
				$rs = $sms->add($data);
			}
			/*pre($data);
			die;*/
			Echo ($rs > 0) ? 'OK' : 'NO';			
		}

		//群发
		public function add_smses(){
			if(!isset($_POST['type']) || '' == trim($_POST['type']))		{ Dcho('NO'); }
			if(!isset($_POST['title']) || '' == trim($_POST['title']))		{ Dcho('NO'); }
			if(!isset($_POST['content']) || '' == trim($_POST['content']))	{ Dcho('NO'); }
			$sms = M('sms');
			$session = new Session();
			$user = unserialize($session->user);
			$data['from_id'] = $user['user_id'];
			$data['title']	 = trim($_POST['title']);
			$data['content'] = trim($_POST['content']);
			$data['type_id'] = trim($_POST['type_id']);

			if(intval(trim($_POST['type'])) == 1){
				if(!isset($_POST['to_id']) || '' == trim($_POST['to_id']))	{ Dcho('NO'); }
				
				//一次发送多条
				$data['type'] = intval(trim($_POST['type']));
				if(stripos(trim($_POST['to_id']), ',') !== false){
					$to_ids = rtrim(trim($_POST['to_id']), ',');
					$to_ids = explode(',', trim($_POST['to_id']));
					foreach ($to_ids as $key => $value) {
						$data['add_time'] = NOW_TIME;
						$data['to_id'] = $sms->find_by('name', trim($value), 'user');
						$data['to_id'] = $data['to_id']['id'];
						$rs = $sms->add($data);
						$rs > 0 ? Dcho('SEND_SMSES') : Dcho('NO');
					}
				}
			}elseif(intval(trim($_POST['type'])) == 2){
				if(!isset($_POST['group_id']) || '' == trim($_POST['group_id']))	{ Dcho('NO'); }
				//按照用户组发送
				$data['type'] = intval(trim($_POST['type']));
				$data['to_id'] = intval(trim($_POST['group_id']));
				$data['add_time'] = NOW_TIME;
				$rs = $sms->add($data);
				$rs > 0 ? Dcho('SEND_GROUP') : Dcho('NO');
			}
		}

		public function add(){
			$group = M();
			$groups = $group->getAll('user_group');
			$this->assign('groups', $groups);
			$type = M('sms_type');
			$types = $type->getAll();
			$this->assign('types', $types);
			$this->show();
		}

		public function user_list(){
			$user = M('user');
			$total = $user->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$users = $user->getUsers($limit);
			$this->assign('users', $users);
			
			//Bcho($urows);
			load_helper('pagetion');
			$pcfg = array(
					'page' 	=> $page,
					'total' => $total,
					'size'	=> 10,
					'link'	=> $this->vars['__URL__'],
					'link_class' => 'page_link'
				);
			$pagetion = new Pagetion_Helper($pcfg);
			$pagelink = $pagetion->pageLinks();
			if(!$users) 	$users = '暂无数据';
			$this->assign('page_link', $pagelink);
			$this->show();
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$sms = M('sms');
			$data = $sms->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}


	}

