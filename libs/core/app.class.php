<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * APP (应用初始化)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	class SY_APP{

		public function __construct(){}

		public static function run(){

			//session_start();
			load_libs('session');
			Session::start();
			
			//require './libs/url.class.php';
			load_libs('url');

			SY_URL::init();
			//pre(SY_URL::$u_vars);
			//pre(SY_URL::$u_vars['parames']);

			//判断传输方式
			define('REQUEST_METHOD',$_SERVER['REQUEST_METHOD']);
        	define('IS_GET',        REQUEST_METHOD =='GET' ? true : false);
        	define('IS_POST',       REQUEST_METHOD =='POST' ? true : false);
        	define('IS_PUT',        REQUEST_METHOD =='PUT' ? true : false);
        	define('IS_DELETE',     REQUEST_METHOD =='DELETE' ? true : false);
			define('IS_AJAX',       ((isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest')) ? true : false);
			if(!empty(SY_URL::$u_vars['parames'])){
				$_GET = array_merge(SY_URL::$u_vars['parames'], $_GET);
			}
			
			define('SY_LANG', 		get_cfgs('lang'));		//系统言语

			if(!defined('CACHE')) define('CACHE', get_cfgs('is_cache') == 1 ? true : false); //是否开启缓存
			if(!defined('DEBUG')) define('DEBUG', get_cfgs('is_debug') == 1 ? true : false); //是否开启调试模式 仅开发使用
			if(!defined('LOG')) define('LOG', get_cfgs('is_log') == 1 ? true : false); //是否开启日志文件 仅开发使用
			define('PAGE_SIZE', 	get_cfgs('page_size')); //分页数
			define('FONT', 			DATA_DIR .'fonts'. DS);
			define('DATA', 			DATA_DIR);
			define('LANG', 			DATA_DIR. 'lang'. DS);
			define('CLANG', 		DATA_DIR. 'lang'. DS.SY_LANG. DS.APP_NAME);
			define('SYS_IP', $_SERVER['SERVER_ADDR'] ? $_SERVER['SERVER_ADDR'] : $_SERVER['REMOTE_ADDR']);
			$db_config = get_cfgs('db_config');
			define('DB_HOST', $db_config['host']);
			define('DB_USER', $db_config['user']);
			define('DB_PASS', $db_config['pass']);
			define('DB_PORT', $db_config['port']);
			define('DB_NAME', $db_config['dbname']);
			define('DB_PRE', $db_config['prefix']);
			define('DB_CHAR', $db_config['char']);
			//当前时间 int
			if(!defined('NOW_TIME')){
				define('NOW_TIME', strtotime(date('Y-m-d H:i:s')));
			}
			
			/* 定义URL */
			if(!defined('BASE_URL')){
				define('BASE_URL', get_cfgs('base_url'));
			}
			if(!defined('SITE_URL')){
				define('SITE_URL', BASE_URL);
			}

			//当前应用名
			if(!defined('APP_NAME')){
				define('APP_NAME', SY_URL::$u_vars['app']);
			}

			//当前控制器
			if(!defined('CONTROLLER_NAME')){
				define('CONTROLLER_NAME', SY_URL::$u_vars['controller']);
			}

			//当前操作名
			if(!defined('METHOD_NAME')){
				define('METHOD_NAME', SY_URL::$u_vars['method']);
			}

			//应用路径
			if(!defined('__APP_FILE__')){
				define('__APP_FILE__', 'apps'. DS .APP_NAME );
			}

			//控制器路径
			if(!defined('__C_FILE__')){
				define('__C_FILE__', APPS_DIR.APP_NAME. DS .'controllers'. DS );
			}
			
			//模型文件路径
			if(!defined('__M_FILE__')){
				define('__M_FILE__', APPS_DIR.APP_NAME. DS .'model'. DS);
			}

			//data路径
			if(!defined('DATA')){
				define('DATA', 'data'. DS);
			}

			//Bcho(APP_NAME);
			//Bcho(CONTROLLER_NAME);
			//Bcho(METHOD_NAME);
			//pre(SY_URL::$u_vars);

			/* 载入控制器 */
			load_core('controller');
			load_file(__C_FILE__.CONTROLLER_NAME.'.php');
			$c_name = CONTROLLER_NAME . get_cfgs('controller_suffix');
			$m_name = METHOD_NAME;

			$controller = new $c_name;
			
			/**
			 * 下面是 参考 ThinkPHP App.class.php 文件
			 *  类 App下的 exec方法
			 */
			try{
	            if(!preg_match('/^[A-Za-z](\w)*$/', $c_name)){
	                // 非法操作
	                throw new ReflectionException();
	            }
				//执行当前操作
	            $method =   new ReflectionMethod($controller, $m_name);
	            if($method->isPublic()) {
	            	$class  =   new ReflectionClass($controller);
	            	//$construct =   $class->getMethod('__construct');
	            	//$construct->invoke($controller);
	            	// 前置操作
	                if($class->hasMethod('_before_'.$m_name)) {
	                    $before =   $class->getMethod('_before_'.$m_name);
	                    if($before->isPublic()) {
	                        $before->invoke($controller);
	                    }
	                }

	                //参数传递
	                if($method->getNumberOfParameters()>0){
	                	switch($_SERVER['REQUEST_METHOD']) {
	                        case 'POST':
	                            $vars    =  $_POST;
	                            break;
	                        case 'PUT':
	                            parse_str(file_get_contents('php://input'), $vars);
	                            break;
	                        default:
	                            $vars  =  $_GET;
	                    }

	                    $params =  $method->getParameters();
	                    foreach ($params as $param){
	                        $name = $param->getName();
	                        if(isset($vars[$name])) {
	                            $args[] =  $vars[$name];
	                        }elseif($param->isDefaultValueAvailable()){
	                            $args[] = $param->getDefaultValue();
	                        }else{
	                            throw_exception(L('_PARAM_ERROR_').':'.$name);
	                        }
	                    }
	                    $method->invokeArgs($controller,$args);
	                }else{
	                	$method->invoke($controller);
	                }

	                // 后置操作
	                if($class->hasMethod('_after_'.$m_name)) {
	                    $after =   $class->getMethod('_after_'.$m_name);
	                    if($after->isPublic()) {
	                        $after->invoke($controller);
	                    }
	                }
	            }else{
	                // 操作方法不是Public 抛出异常
	                throw new ReflectionException();
	            }
	        } catch (ReflectionException $e) { 
	           show_error('ERROR', $c_name . '类'. $m_name . '方法不存在或者不是Public方法！');
	        }
	        return ;

		}


	}