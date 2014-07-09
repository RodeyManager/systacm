<?php

	class User extends Model{
			
		public function __construct(){
			parent::__construct();
		}

		public function getUser(){
			Bcho('User->getUser()');
			$data = $this->getOne(3);
			return $data;
		}

		public function getUsers(){
			$data = $this->getAll();
			return $data;
		}
		
		

	}