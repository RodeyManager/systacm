<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * Index (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	class Index_Controller extends SY_Controller{

		public function init(){
			$this->assign('title', get_cfgs('site_name'));
		}

		public function index(){
			$this->display('index');
		}

		public function welcome(){
			$this->assign('title' , '盛艺设计工作室-设计->像风一样！');
			$this->display();
		}

		public function server(){
			$this->assign('title' , '产品与服务，盛艺设计工作室-设计->像风一样！');
			$this->display();
		}

		public function about(){
			$this->assign('title' , '关于我们，盛艺设计工作室-设计->像风一样！');
			$this->display();
		}

		public function contact(){
			$this->assign('title' , '联系我们，盛艺设计工作室-设计->像风一样！');
			$this->display();
		}

		public function cases(){
			$this->assign('title' , '案例展示，盛艺设计工作室-设计->像风一样！');
			$this->display();
		}

		public function help(){
			$this->assign('title' , '寻求帮助，帮助中心，盛艺设计工作室-设计->像风一样！');
			$this->display();
		}

		//留言
		public function comment(){
			if(!isset($_POST['token']) || '' == $_POST['token'] || $_POST['token'] !== __TOKEN__ ){ Dcho('NO'); }
			// pre($_POST);
			$data = $_POST;
			if(!isset($_POST['uname']) 		|| '' == trim($_POST['uname'])){ Dcho('NO'); }
			if(!isset($_POST['uemail']) 	|| '' == trim($_POST['uemail'])){ Dcho('NO'); }
			if(!isset($_POST['uphone']) 	|| '' == trim($_POST['uphone'])){ Dcho('NO'); }
			if(!isset($_POST['ucompany']) 	|| '' == trim($_POST['ucompany'])){ Dcho('NO'); }
			if(!isset($_POST['ucomment']) 	|| '' == trim($_POST['ucomment'])){ Dcho('NO'); }
			$data['content'] = $data['ucomment'];
			foreach ($data as $key => $value) {
				$data[$key] = trim($value);
			}
			$data['pid'] = 1;
			$data['add_time'] = NOW_TIME;
			$gbook = M('guestbook');
			$fileds = $gbook->getFileds();
			$data = array_intersect_key($data, $fileds);
			$subemail['name'] = $subphone['name'] = $data['uname'];
			$subemail['email'] = $data['uemail'] = strtolower($data['uemail']);
			$subemail['un_time'] = $subphone['un_time'] = strtotime('+2 year');
			$subemail['add_time'] = $subphone['add_time'] = NOW_TIME;
			$subemail['disabled'] = $subphone['disabled'] = 1;
			$subphone['phone'] = $data['uphone'];

			//pre($data);die;
			$rse = $gbook->add($subemail, 'subemail');
			$rsp = $gbook->add($subphone, 'subphone');
			$data = $gbook->add($data, 'guestbook');
			Dcho($data>0 ? 'OK' : 'NO');
		}

	}

