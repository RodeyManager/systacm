<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * URL类 (系统URL调度类)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	class SY_URL{

		static public $u_vars = array();

		static public function init(){


			$uri = $_SERVER['REQUEST_URI'];
			//$url_model = get_cfgs('url_model');
			$url_model = get_cfgs('url_model');
			
			if(!defined('URL_MODEL')) define('URL_MODEL', $url_model);
			$paths = array();


			if($url_model == 1){ // PATH_INFO 模式

				$paths = parse_url($uri);
				if($uri == '/'){
					self::$u_vars['default_uri'] = get_cfgs('default_app') . '/' .get_cfgs('default_controller') . '/' .get_cfgs('default_method');
				}

				if(empty($paths) || empty($paths[0]))
				{
					$paths[0] = $paths[1] = 'index';
				}

				$paths = array_slice(explode('/', $paths['path']), 1);
				
				//pre($paths);
				
				if(in_array($paths[0], get_cfgs('app_names'))){
					self::setApp($paths[0]);
					self::setController($paths[1]);
					self::setMethod($paths[2]);
					self::setParames(array_slice($paths, 3));
				}else{
					self::setApp(null);
					self::setController(null);
					self::setMethod(null);
					self::setParames(array_slice($paths, 2));
				}
				//self::$u_vars['default_uri'] = $_app . '/' .$_controller . '/' .$_method;
				//结束 PATH_INFO判断
				//pre($paths[0]);
			}else{
				if(strpos($uri, '?')){
					$paths = parse_url($uri);
					$paths = explode('&', $paths['query']);

					$ps = array();
					$vs = array();
					foreach ($paths as $key => $value) {
						$vs[] = explode('=', $value);
					}
					foreach ($vs as $key => $value) {
						foreach ($value as $k => $v) {
							$ps[] = $v;
						}
					}

					//将 query部分转为数组
					$paths 		= array_key_value($ps);

					//获取普通URL模式配置前缀
					$_app 		= get_cfgs('var_app');
					$_controller = get_cfgs('var_controller');
					$_method 	= get_cfgs('var_method');

					//获取并设置url
					self::setApp($paths[$_app]);
					self::setController($paths[$_controller]);
					self::setMethod($paths[$_method]);
					
					//获取并设置参数
					$_parames = array_to_string($paths);
					$_ps = string_to_array($_parames);
					self::setParames($_ps);

					//pre($paths[$_app]);
					
				}
				
				//pre($paths);
			}
			
			define('APP_NAME', self::$u_vars['app']);
			define('CONTROLLER_NAME', self::$u_vars['controller']);
			define('METHOD_NAME', self::$u_vars['method']);
		}

		/** 
		 * 获取应用程序名称	
		*/
		private static function setApp($app=''){

			if(!isset($app) || empty($app)){
				self::$u_vars['app'] = get_cfgs('default_app');
			}else{
				self::$u_vars['app'] = strip_tags($app);
			}
			//pre(self::$u_vars['app'], 'AppName: ', false);

			
			return self::$u_vars['app'];
		}

		/** 
		 * 获取控制器名称	
		*/
		private static function setController($controller=''){
			if(!isset($controller) || empty($controller)){
				self::$u_vars['controller'] = get_cfgs('default_controller');
			}else{
				self::$u_vars['controller'] = strip_tags($controller);
			}
			//pre(self::$u_vars['controller'], 'Controller: ', false);
			
			return self::$u_vars['controller'];
		}

		/** 
		 * 获取操作名称	
		*/
		private static function setMethod($method=''){
			if(!isset($method) || empty($method)){
				self::$u_vars['method'] = get_cfgs('default_method');
			}else{
				self::$u_vars['method'] = strip_tags($method);
			}
			//pre(self::$u_vars['method'], 'Method: ', false);

			return self::$u_vars['method'];
		}

		/** 
		 * 获取参数名称	
		*/
		private static function setParames($parames=''){
			static $ps = array();
			if(!empty($parames) && is_array($parames)){
				$ps = array_key_value($parames);
				unset($ps[get_cfgs('var_app')]);
				unset($ps[get_cfgs('var_controller')]);
				unset($ps[get_cfgs('var_method')]);

				self::$u_vars['parames'] = $ps;
				//pre(self::$u_vars['parames'], 'Parames: ', true);

				return self::$u_vars['parames'];
			}

		}


	}