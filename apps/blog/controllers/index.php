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
		
		public function index(){

			/* 数据库连接测试 */
			//$db = new Mysql(get_cfgs('db_config'));
			//$data = $db->getAll('user');
			//pre($data);

			/* 数据模型测试 ----------------------------------------------- */
			$user = M('user');
			//$user = $model->getUser();
			//$user = $model->getUsers();
			//$data = $user->find_by_id(2);
			//$data = $user->destroy(4); 				/* 删除单调记录 */
			//$data = $user->destroy('10,11,,,'); 		/* 多条删除, 字符串形式 */
			//$data = $user->destroy(array(9, 12)); 	/* 多条删除 数组形式 */
			/*$data = $user->update(array(
						'name'=>'LuoYong', 
						'email'=>'453474593@qq.com'
					), 15);*/ 							/* 更新一条数据 */
			/* $data = $user->insert(array(
						'name'=>'李海燕', 
						'pass'=>'123456', 
						'email'=>'li@3434.com'
					)); */ 								/* 插入一条数据 */

			//插入多条数据
			/*$users = array(
						array('name'	=> 'Luo', 'pass'	=> '098765', 'email'	=> '90809df@qq.com'),
						array(
								'name'	=> 'Yong',
								'pass'	=> '438955454',
								'email'	=> '84dfasdf@gmail.com',
								'age'	=> 25,
								'phone'	=> 12723722479,
								'intro'	=> 'My name is Rodey!'
						)
					);									
			$data = $user->insert($users);*/		/* 插入多条数据 */

			//按条件查询
			/* $data = $user->find(array(
						'filed' => array('id','name', 'email', 'age'),
						'where' => array('type'=>'AND', 'age'=>25),
						'order' => array('id'=>'asc'),
						'limit'	=> array('start'=>0, 'end'=>5)
					)); */							/* 按条件查询 */
			
			//$data2 = $user->find_by('id', '2'); 		/* 按照单个指定的条件查询 */
			
			//$sql = 'INSERT INTO `syst_user`(id,name,pass) VALUES ( NULL,"SYSTacm", "9999")';
			//$sql = 'SELECT * FROM `syst_user` ORDER BY `id` DESC';
			$sql = 'SELECT * FROM `syst_user` WHERE `id`=2000 LIMIT 1';
			//$sql = 'UPDATE `syst_user` SET `reg_time`='. strtotime(date('Y-m-d H:i:s')) .' WHERE `id`=2 ';
			//$sql = 'DELETE FROM`syst_user` WHERE `id`=66';
			//$sql = 'DELETE FROM`syst_user` WHERE `id` in (65,64)';
			$data = $user->doSQL($sql);		/* mysql类预留，直接执行sql语句 */
			
			

			//$data = $user->pass;
			
			pre($data);
			//pre($data2);

			/* 本控制器数据模型 */
			//$this->model->getAll();

			/* Smarty测试 */
			$this->assign('title' , 'Blog->Index->index');
			$this->assign('name' , 'Blog->Index->index');
			$this->display('index');
		}

		/* 执行当前操作前动作 */
		public function _before_add(){
			Bcho( 'Before_add..');
		}

		public function add(){
			$this->assign('title' , 'Blog->Index->add');
			$this->assign('name' , 'Blog->Index->add');
			$this->display('add');
		}

		/* 执行当前操作后动作 */
		public function _after_add(){
			Bcho('After_add..');
		}

		public function edit(){
			Bcho('Blog->edit()');
		}

		/* url重定向测试 */
		public function add_user(){
			$url = Url_str(APP_NAME.'/posts/add');   	/* URL模式为 PATH_INFO模式  */
			//$url = Url_str('?a=blog&c=posts&m=add'); 	/* URL模式为普通模式 */
			
			$this->redirect($url);
		}

		/* url重定向测试 */
		public function add_comment(){
			$url = Url_str(APP_NAME.'/comments/add', array('post_id'=>'1', 'post_name'=>'title'));
			$this->redirect($url);
		}


	}