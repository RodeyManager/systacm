<?php

	class Posts_Controller extends SY_Controller{

		public function index(){
			Bcho('Posts->index()');
		}
		
		public function add(){
			$this->assign('title', 'Blog->posts->add');
			$this->assign('name', 'Blog->posts->add');
			Bcho('Blog->Posts->add');
			$this->show('add');
		}




	}