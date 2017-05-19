<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Main (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-4
	 */
	 
	class Main_Controller extends SY_Controller {
	
		
		/**
		 *本模块 默认操作
		*/
		public function index(){

			$model = M();
			$user_len = $model->getRows('user');
			$archive_len = $model->getRows('archive');
			$gbook_len = $model->getRows('guestbook');

			$this->assign('user_len', $user_len);
			$this->assign('archive_len', $archive_len);
			$this->assign('gbook_len', $gbook_len);
			$admin = unserialize($_SESSION['user']);
			$this->assign('admin', $admin['name']);
			$this->assign('role_name', $admin['role_name']);
			$this->assign('last_login_time', date('Y-m-d H:i:s', $admin['last_login_time']));
			$this->assign('last_login_ip', $admin['last_login_ip']);		
			$this->assign('system', PHP_OS);
			$this->assign('apache', $_SERVER['SERVER_SOFTWARE']);
			$this->assign('name', 'Main');
			$this->display();
		}

		public function code(){
			load_helper('cncoder');
			$coder = new Coder_Helper(array(
				'width'=>120,
				'length'=> 6,
				'font' => FONT .'/StayPuft.ttf',
				'font_size' => 18
			));
			$coder->showImg();
			session_start();
			$_SESSION['code'] = strtoupper($coder->getCode());
			$this->display();
		}

		public function getCode(){
			Echo $_SESSION['code'];
		}
		
		public function stable(){
			$m = M();
			pre($m->Stable());
		}
		public function ctable(){
			$m = M();
			$options = array(
		 		'table'=>'mm',
		 		'primary'=>'id',
		 		'charset'=>'utf8',
		 		'auto_increment'=>1,
		 		'engine'=>'MyISAM',
		 		'fileds'=>array(
		 			array( 'name'		=> 'id', 
		 				   'type'		=> 'int(11)', 
		 				   'attr'		=> '', 
		 				   'is_null'	=> false,
		 				   'auto'		=> true,
		 				   'comment'	=> '自动编号'
		 			),
		 		    array( 'name'		=> 'name',
		 		    	   'type' 		=> 'char(30)',
		 		    	   'is_null'	=> false,
		 		    	   'comment' 	=> '名称'
		 		    )
		 		)
		 	);
			//$data = $m->Ctable($options);
			$data = $m->H_table(array('mmd','nn'), 'OPTIMIZE');
			Echo $data ? 'OK' : 'NO';
		}
		public function cdatabase(){
			$m = M();
			$database = 'sss';
			$data = $m->Ddatabase($database);
			Echo $data ? 'OK' : 'NO';
		}
		
		/**
		 * 更新缓存
		 * @return [type] [description]
		 */
		public function up_cache(){
			$cache_path = '.'. DS .'temps'. DS .'cache';
			$comp_path = '.'. DS .'temps'. DS .'complie';

			if(!is_dir($cache_path)) return false; 
			if(!is_dir($comp_path)) return false;
			rrmdir($cache_path);
			rrmdir($comp_path);			
			if(!is_dir($cache_path))	Echo '更新成功！';
			else						Echo '更新失败！';
		}

		/* 生成管理 */
		public function upcache(){

			$this->display();
		}
		public function fetch_index(){
			$index_file = '.'. DS .'apps'. DS . get_cfgs('default_app') . DS . 'views'. DS . get_cfgs('default_controller') . DS . get_cfgs('default_method');
			$html_file = '.'. DS . 'index.html';
			$html = file_put_contents($html_file, $this->fetch($index_file));
			pre($this->vars);
		}
		public function upload(){
			$attac = M('attachment');
			$attacs = $attac->getAll();
			//pre($attacs);
			$this->assign('attacs', $attacs);
			$this->display();
		}

		public function calert(){
			$table = $_GET['table'];
			$alters = array('table'=>$table, 'type'=>'drop', 'fields'=>array('my_ename3','my_ename6')
				);
			$main = M();
			$data = $main->Calter($alters);
			Echo $data ? 'OK' : 'NO';
		}

		//CNZZ统计
		public function cnzz(){
			$this->display();
		}
	
	}