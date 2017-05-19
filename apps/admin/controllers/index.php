<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Index (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-1
	 */
	 
	class Index_Controller extends SY_Controller {
		
		var $title = '盛艺后台管理中心';
	
		/**
		 *本模块 默认操作
		*/
		public function index(){
			
			if(!isset($_SESSION['uuid'])){
				$this->redirect(Url_str(APP_NAME.'/index/login'));
			}else{
				//Bcho($_SESSION['uuid']);
				$admin = unserialize($_SESSION['user']);
				$this->assign('title', $this->title);
				$this->assign('admin', $admin);
				$this->assign('role_name', $admin['role_name']);
				
				$top_menus = self::get_top_menu();
				$menu = new Admin_menu();
				$setting = $menu->get('setting');
				//pre($setting);
				
				$this->assign('top_menu', $top_menus['头部菜单']);
				$this->assign('setting', $setting['网站设置']);
				
				$this->show('index'); /* $this->show('index') | $this->display() | $this->display('index') */
			}
		}
		
		public function login(){
			$this->assign('title', '管理员后台登录');
			$this->assign('time', now_time());
			$this->display('login');
		}

        public function getCode(){
            Echo $_SESSION['code'];
        }

		public function code(){
            session_start();
			load_helper('coder');
			$coder = new Coder_Helper(array(
				'width'=> 120,
				'height'=> 42,
				'length'=> 4,
				'font' => FONT .'bertram.ttf',
				'font_size' => 18
			));
			$coder->showImg();
			$_SESSION['code'] = strtoupper($coder->getCode());
			$this->display();
		}
		
		public function login_in(){
			if( (!isset($_POST['token']) || trim($_POST['token']) == '') && trim($_POST['token']) != __TOKEN__ ){ Dcho('ULOGIN'); }
			if(empty($_POST['uname']))	Dcho('UNAMENO');	//show_error('ERROR', '用户名不能为空！');
			if(empty($_POST['upass']))	Dcho('UPASSNO'); 	//show_error('ERROR', '密码不能为空！');
			if(empty($_POST['code']))	Dcho('CODENO');	//show_error('ERROR', '验证码不能为空！');
			if(strtoupper(trim($_POST['code'])) !== $_SESSION['code'])	Dcho('CODE=NO'); //show_error('ERROR', '验证码不正确！');
			
			$data['uname'] = $_POST['uname'];
			$data['upass'] = md5(sha1($_POST['upass']));
			$data['code']  = $_POST['code'];

			$login_user = M('user');
			$admin = $login_user->login($data);
			if( !$admin ){
				Logging('ERROR', $this->lang['admin_login'], $this->lang['login'], $this->lang['login_error'], 1);
				Dcho('UNO');
				$this->redirect(Url_str(APP_NAME.'/index/login'));
			}else{
				//设置 Session
				$session = new Session();
				$session->uuid = $session->setUid($data['uname']);
				$session->id = $admin['id'];
				$session->uname = $admin['name'];
				$session->user = serialize($admin);
				unset($_SESSION['code']);
				Logging('success', $this->lang['admin_login'], $this->lang['login'], $this->lang['login_success'], 1);
				//更新登录时间和登录IP
				$data['last_login_time'] = strtotime(date('Y-m-d H:i:s'));
				$data['last_login_ip'] 	 = $_SERVER['SERVER_ADDR'] ? $_SERVER['SERVER_ADDR'] : $_SERVER['REMOTE_ADDR'];
				$login_user->update(array(
							'last_login_time' => $data['last_login_time'],
							'last_login_ip' => $data['last_login_ip']
						), $admin['id']);
				
				Dcho('OK');
				//$this->redirect(Url_str(APP_NAME.'/index/index'));
			}
			
		}
		
		public function logout(){
			Logging(1, $this->lang['admin_login'], $this->lang['logout'], $this->lang['logout_success'], 1);
			session_unset();
			session_destroy();
			/*$session = new Session();
			$session->del('uuid');
			$session->del('id');
			$session->del('user');*/
			$this->up_cache();
			$this->redirect(Url_str(APP_NAME.'/index/index'));
		}
		public function up_cache(){
			$cache_path = '.'. DS .'temps'. DS .'cache';
			$comp_path = '.'. DS .'temps'. DS .'complie';

			if(!is_dir($cache_path)) return false; 
			if(!is_dir($comp_path)) return false;
			rrmdir($cache_path);
			rrmdir($comp_path);
		}
		
		public static function get_top_menu(){
			load_file(__C_FILE__. DS .'admin_menu.php');
			$menus = Admin_menu::get('top');
			return $menus;
		}

		public function getMenu(){
			load_file(__C_FILE__. DS .'admin_menu.php');
			$mod = trim($_POST['mod']);
			$flag = trim($_POST['mod']);
			$menu = new Admin_menu();
			$menus = $menu->get($mod);
			$left = '';
			foreach ($menus as $key => $value) {
				$left .= '<h3 class="left-menu-h3">'. $key .'<i></i></h3>';
				$left .= '<ul class="left-menu-ul">';
				foreach ($value as $k => $v) {
					if($flag == 'true'){
						$left .= '<li><a href="javascript:_A(\''. CAPP. $v .'\', \'true\');void(0);">'. $k .'</a></li>';
					}else{
						$left .= '<li><a href="javascript:_M(\''. CAPP. $v .'\', \'false\');void(0);">'. $k .'</a></li>';
					}
				}
				$left .= '</ul>';
			}
			Echo $left;
		}
	
	}
	