<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Cattype (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Cattype_Controller extends SY_Controller {

		public function index(){
			$this->show('list');
		}

		public function add(){

			$this->show();
		}

		public function edit(){

			$this->show();
		}

		public function del(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$cattype = M('cattype');
			$data = $cattype->destroy($id);
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';

		}




	}
