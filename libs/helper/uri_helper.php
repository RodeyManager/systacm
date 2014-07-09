<?php

	class Uri_Helper {

		var $uri_string = '';

		public function __construct(){}

		public function getModule(){


			if(isset($_SERVER['REQUEST_URI']) && $_SERVER['REQUEST_URI'] != '/'){
				$uri = $_SERVER['REQUEST_URI'];
				$uri = explode('/', $uri);
				$uri = array_filter($uri);

				if($controller = array_shift($uri)){
					Echo 'this is ' . $controller . ' controller'.BR;
				}

				if($action = array_shift($uri)){
					Echo 'this is ' . $controller . ' controller ' . $action . ' action'.BR;
				}

				pre($uri);
			}

		}

	}