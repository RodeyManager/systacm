<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * Welcome (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	class Welcome_Controller extends SY_Controller{

		public function index(){
			$this->assign('name', 'Welcome');
			$this->show('index');
		}

		public function add(){
			Echo __CLASS__. '->add()';
		}

	}