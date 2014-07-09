<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * User (User控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-6
	 */
	 
	class User_Controller extends SY_Controller {
	
		
		/**
		 *本模块 默认操作
		*/
		public function index(){
			$user = M('user');
			$total = $user->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$users = $user->getUsers($limit);
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
			if(!$users) 	$users = '暂无数据';

			$url = 'http://www.gravatar.com/avatar/';
			foreach ($users as $key => $value) {
				//$u = $user->find_by_id($value['id']);
				if(!empty($value['email'])){
					$ug = $url . md5($value['email']) . '?r=R&s=100';
					//if(!$ug)
				}elseif(!empty($value['headport'])){
					$ug = BASE_URL . $value['headport'];
				}else{
					$ug = SYSIMAGES . '/comme/default_gavatar.png';
				}
				$users[$key]['gravatar'] = $ug;
			}
			$this->assign('users', $users);
			$this->assign('page_link', $pagelink);
			$this->show('list');
		}
	
		public function add(){
			$this->assign('title', '添加用户');
			//会员级别列表
			$level = M();
			$levels = $level->getAll('level', array('order'=>'id ASC'));
			$sexs = array('保密', '男', '女' );

			//获取用户组列表
			$group = M('group');
			$groups = $group->getGroups(0, false);

			$this->assign('groups', $groups);
			$this->assign('sexs', $sexs);
			$this->assign('levels', $levels);
			$this->display();
		}

		public function create(){
			$data = $_POST;
			$user = M('user');
			$fileds = $user->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data['pass'] = sha1(md5($data['pass']));
			$data['reg_time'] = NOW_TIME;
			$data['ip'] = $_SERVER['SERVER_ADDR'] ? $_SERVER['SERVER_ADDR'] : $_SERVER['REMOTE_ADDR'];
			/*pre($data);
			pre($_POST);
			pre($fileds);*/
			$data = $user->add($data);
			Echo $data>0 ? 'OK' : 'NO';
			//$this->jump('/user/index');

		}
	
		public function edit(){
			$this->assign('title', '用户修改');

			$id = intval($_GET['id']);
			$user_model = M('user');
			$user = $user_model->getOne($id);
			if($user['disabled'] == 1)	$user['lock'] = '锁定';
			else  $user['lock'] = '解锁';

			//会员级别列表
			$model = M();
			$levels = $model->getAll('level', array('order'=>'id ASC'));
			$groups = $model->getAll('user_group', array('order'=>'id ASC'));
			$sexs = array('1'=>'男', '2'=>'女', '0'=>'保密');
			
			$this->assign('sexs', $sexs);
			$this->assign('groups', $groups);
			$this->assign('levels', $levels);
			$this->assign('user', $user);
			$this->display();
		}

		public function edits(){
			$this->assign('title', '批量编辑用户');

			$this->display();
		}

		public function update(){
			$data = $_POST;
			$data['sex'] = $_POST['sex'][0];
			$data['birthday'] = strtotime($_POST['birthday']);
			$data['update_time'] = strtotime(date('Y-m-d H:i:s'));
			$user = M('user');
			$user_fileds = $user->getFileds();
			$data = array_intersect_key($data, $user_fileds);
			$data = $user->update($data, $data['id']);
			if($data > 0)	$this->redirect(Url_str(APP_NAME.'/user/index'));
			else			return false;
		}
		
		public function del(){
			$user = M('user');
			$id = rtrim($_POST['id'], ',');
			$ids = explode(',', $id);
			$data = $user->destroy($ids);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';
		}
		
		public function mod_pass(){
			$data['id'] = intval($_POST['id']);
			$data['pass'] = trim($_POST['pass']);
			if(!isset($data['id'])) 	Beturn('NO');
			if(!isset($data['pass'])) 	Beturn('NO');
			$user = M('user');
			$data = $user->mod_pass($data);

			if($data) 		Echo 'OK';
			else 			Echo 'NO';
		}

		public function mpass(){
			$id = isset($_GET['id']) ? intval(trim($_GET['id'])) : '';
			if($id == '') return false;
			$user_model = M('user');
			$user = $user_model->getOne($id);
			$this->assign('user', $user);
			$this->display();
		}

		//邮件修改密码
		public function email_modpass(){
			$data['id'] = intval($_POST['id']);
			$email = trim($_POST['email']);
			$rand_pass = random(mt_rand(6, 16));
			$data['pass'] = $rand_pass;
			if(!isset($data['id'])) 	Beturn('NO');
			if(!isset($data['pass'])) 	Beturn('NO');
			$user = M('user');
			$data = $user->mod_pass($data);
			if(!$data) 		Beturn('NO');

			//email configs
			$emails = get_cfgs('email');
			$smtp = $emails['host'];
			$from_email = $emails['from_email'];
			$from_pass = $emails['from_pass'];
			$from_name = $emails['from_name'];
			$to_email = $email;
			$to_name = $data['name'];
			$title = 'SYSTacm修改密码提示！';
			$body = '<strong>您好！您的密码已经修改成：<u style="color:red;">'. $rand_pass .'</u> , 请牢记您的新密码.</strong><br />';

			$rs = send_email($smtp, $from_email, $from_pass, $from_name, $to_email, $to_name, $title, $body);

			if($rs) 		Echo 'OK';
			else 			Echo 'NO';
		}

		//发送短信
		public function send_phone(){
			$id = intval($_POST['id']);
			if($id < 30) 	Echo 'OK';
			else 			Echo 'NO';
		}
		//编辑积分
		public function add_point(){
			$id = intval($_POST['id']);
			$point = intval($_POST['point']);
			$user = M('user');
			$data = $user->update(array('point'=>$point), $id);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';
		}
		//积分
		public function point(){
			$groups = M();
			$groups = $groups->getAll('user_group');
			if(empty($groups)) 	$groups = '暂无数据';
			$this->assign('groups', $groups);
			$this->display();
		}
		//修改用户组默认积分
		public function edit_group_point(){
			if(!isset($_POST['id']) || trim($_POST['id']) == ''){ Dcho('NOID'); }
			if(!isset($_POST['point']) || trim($_POST['point']) ==''){ Dcho('NOPOINT'); }
			$data['id'] = trim($_POST['id']);
			$data['point'] = trim($_POST['point']);
			$group = M();
			$data = $group->update($data, $data['id'], 'user_group');
			Dcho($data > 0 ? 'OK' : 'NO');

		}
		//修改金额
		public function mod_money(){
			$id = intval($_POST['id']);
			$point = intval($_POST['money']);
			$user = M('user');
			$data = $user->update(array('money'=>$point), $id);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';
		}

		//用户状态
		public function lock(){
			$user = M('user');
			$id = intval($_POST['id']);
			$disabled = intval($_POST['disabled']);
			$disabled = ($disabled == 0) ? 1 : 0;
			$data = $user->update(array('disabled'=>$disabled), $id);
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';

		}
		//批量更改用户状态
		public function locks(){
			if(isset($_POST['state'])){
				$state = $_POST['state'];
				$ids = explode(',', rtrim($_POST['ids'], ','));
				if($state == 'inlock'){
					$disabled = 0;
				}else{
					$disabled = 1;
				}
			}
			$user = M('user');
			foreach ($ids as $key => $value) {
				$data = $user->update(array('disabled'=>$disabled), $value);
			}
			if($data > 0) 	Echo 'OK';
			else 			Echo 'NO';
		}
		//发送邮件
		public function send_email(){
			$id = intval($_POST['id']);
			$email = trim($_POST['email']);
			$body = trim($_POST['body']);
			$user = M('user');
			$data = $user->getOne($id);
			//email configs
			/*$emails = get_cfgs('email');
			$smtp = $emails['host'];
			$from_email = $emails['from_email'];
			$from_pass = $emails['from_pass'];
			$from_name = $emails['from_name'];*/
			$smtp = get_cfgs('email_host');
			$from_email = get_cfgs('email_from_addr');
			$from_pass = get_cfgs('email_from_pass');
			$from_name = get_cfgs('email_from_name');
			$to_email = $email;
			$to_name = $data['name'];
			$title = substr($body, 0, 200);

			$rs = send_email($smtp, $from_email, $from_pass, $from_name, $to_email, $to_name, $title, $body);
			if($rs) 	Echo 'OK';
			else 		Echo 'NO';
		}

		//查看用户信息
		public function show_user(){
			$id = $_GET['id'];
			$user_model = M('user');
			$user = $user_model->getOne($id);
			if($user['level'] == 0)			$user['level'] = '游客';
			elseif($user['level'] == 1)		$user['level'] = '初级会员';
			elseif($user['level'] == 2) 	$user['level'] = '中级会员';
			elseif($user['level'] == 3) 	$user['level'] = '高级会员';
			else 							$user['level'] = 'VIP会员';

			if($user['disabled'] == 1) 		$user['disabled'] = '可用';
			else 							$user['disabled'] = '不可用';
			$url = 'http://www.gravatar.com/avatar/';
			if(!empty($user['headport'])){
				$user['gravatar'] = BASE_URL.'/'. $user['headport'];
			}else{
				if(!empty($user['email'])){
					$user['gravatar'] = $url . md5($user['email']) .'?r=R&s=100';
				}else{
					$user['gravatar'] = SYSIMAGES .'/comme/default_gavatar.png';
				}
			}
			$this->assign('user', $user);
			$this->display();
		}

		//检查用户唯一性
		public function check_uname(){
			$name = $_GET['uname'];
			$user = M('user');
			$data = $user->find_by('name', $name);
			Echo !$data ? '1' : '0';
		}
		//检查用户昵称唯一性
		public function check_unick_name(){
			$nick_name = $_GET['unick_name'];
			$user = M('user');
			$data = $user->find_by('nick_name', $nick_name);
			Echo !$data ? '1' : '0';
		}
		//检查邮箱的唯一性
		public function check_uemail(){
			$email = $_GET['email'];
			$user = M('user');
			$data = $user->find_by('email', $email);
			Echo !$data ? '1' : '0';
		}
		//检查手机的唯一性
		public function check_uphone(){
			$phone = $_GET['name'];
			$user = M('user');
			$data = $user->find_by('phone', $phone);
			Echo !$data ? '1' : '0';
		}
		//上传头像
		public function upload_headport(){
			$id = intval($_POST['id']);

			load_helper('upload');
			load_helper('ImageMagic');

			$file = 'headport_pic';
			$file_fix = 'user_';
			$file_path = 'uploadfile/users/headport';
			$ucfgs = array(
					'file' 		=> $file,
					'file_fix' 	=> $file_fix,
					'root_dir' 	=> $file_path,
					'max_size' 	=> 502400
				);
			$upload = new Upload_Helper($ucfgs);
			$upload->upload();
			//缩略图
			$img_size = array(
					array(100, 100, true),
					array(50, 50),
					array(30, 30)
				);
			$img_width = 100;
			$img_height = 100;
			$file_raw_path = $upload->getFilePath();
			$default = 100;
			foreach ($img_size as $key => $value) {
				$file_new_path = $file_path .'/'. $value[0] .'/'. $upload->getFileName();
				$img = new ImageMagic_Helper($file_raw_path, $file_new_path);
				$img->cropImage($value[0], $value[1]);
				if($value[2])	$default = $file_path .'/'. $value[0] .'/'. $upload->getFileName();
			}

			if(!isset($id)){
				Echo $default;
				return false;
			}
			$user = M('user');
			$data['headport'] = $default;
			$data['id'] = $id;
			$data = $user->upload_headport($data);
			if($data) 	Echo $default;
			else 		Echo 'NO';
		}

		/* 在线充值 */
		public function recharge(){
			$this->display();
		}
		public function getComplates(){
			if(!isset($_POST['keyword']) || '' == trim($_POST['keyword'])) { return false; }
			$keyword = trim($_POST['keyword']);
			$user = M('user');
			$data = $user->getComplates($keyword);
			if(empty($data)) { return false; }
			foreach ($data as $key => $value) {
				$value['name'] = str_replace($keyword, '<span style="color:red;">'. $keyword .'</span>', $value['name']);
				$users .= '<li data-id="'. $value['id'] .'">'. $value['name'] .'</li>';
			}
			Echo $users;
		}
		public function put_recharge(){
			if(!isset($_POST['rech_type']) || '' == trim($_POST['rech_type'])) 	Dcho('NO');
			if(!isset($_POST['money']) || '' == trim($_POST['money'])) 			Dcho('NO');
			if(!isset($_POST['to_user']) ||  '' == trim($_POST['to_user']))		Dcho('NO');
			if(isset($_POST['sms_type']) && '' != trim($_POST['sms_type'])){
				$sms_type = $_POST['sms_type'];
			}
			if(isset($_POST['content']) && '' != trim($_POST['content'])){
				$body = trim($_POST['content']);
			}
			//pre($sms_type);
			//die;

			$to_users = strpos(trim($_POST['to_user']), ',') ? explode(',', trim($_POST['to_user'])) : trim($_POST['to_user']);
			$to_ids = strpos(trim($_POST['user_ids']), ',') ? explode(',', trim($_POST['user_ids'])) : trim($_POST['user_ids']);
			$user = M('user');
			if(intval($_POST['rech_type']) == 1){
				//积分
				$point = intval(trim($_POST['money']));
				//$this->lang['rech_title']
				$data = $user->put_point($to_users, $point, $sms_type, Lang($this, 'rech_title'), $body);
				Dcho( $data > 0 ? 'OK': 'NO' );
			}elseif(intval($_POST['rech_type']) == 2){
				//金额
				$money = floatval(trim($_POST['money']));
				$data = $user->put_money($to_users, $money, $sms_type, Lang($this, 'rech_title'), $body);
				Dcho( $data > 0 ? 'OK': 'NO' );
			}
		}


		//用户选择列表
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

	}