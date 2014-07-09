<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * Controller类 (控制器基类)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */

	class SY_Controller {

		/* 本类实例 */
		static $instance;

		/* 模板实例对象 */
		protected $view 	= null;

		/* 当前控制器名称 */
		protected $name 	= '';

		/* 模板变量 */
		protected $vars = array();

		/* 控制器数据模型实例 */
		protected $model = null;
		
		/* 当前操作的前一个操作 */
		protected $prev_m = null;
		
		/* 当前操作的后一个操作 */
		protected $next_m = null;
		
		/* 系统默认模块操作 */
		protected $index_m = 'index';
		
		/* 当前模块跳转URL前缀 */
		protected $curl_prefix = null;

		/* 言语 */
		public $lang = array();

		/* 语言包 */
		public $lang_lib = array();

		/* 构造 */
		public function __construct(){
			
			$this->curl_prefix = APP_NAME;

			/* 模板中的全局变量 */
			$this->vars['__BASE__'] = get_cfgs('base_url'); 	//网站地址
			$this->vars['__APP__']	= APP_NAME;					//应用程序名称
			$this->vars['__C__']	= CONTROLLER_NAME;			//控制器名称
			$this->vars['__M__']	= METHOD_NAME;				//操作名称
			$this->vars['__CAPP__'] = $this->vars['__BASE__'] .'/'. $this->vars['__APP__'];
			$this->vars['__STATIC__'] = $this->vars['__BASE__'] .'/statics/'; //系统公共资源目录
			$this->vars['__SYSCSS__'] = $this->vars['__STATIC__']. 'css';
			$this->vars['__SYSJS__'] = $this->vars['__STATIC__']. 'js';
			$this->vars['__SYSIMAGES__'] = $this->vars['__STATIC__']. 'images';
			/* 应用资源目录 */
			$this->vars['__ASTATIC__'] = $this->vars['__APUBLIC__']	= $this->vars['__BASE__'] .'/apps/'. $this->vars['__APP__'] .'/views/statics/'; //当应用资源目录
			$this->vars['__ACSS__'] 	= $this->vars['__BASE__'] .'/apps/'. $this->vars['__APP__'] .'/views/statics/css'; //当应用资源目录
			$this->vars['__AJS__'] 	= $this->vars['__BASE__'] .'/apps/'. $this->vars['__APP__'] .'/views/statics/js'; //当应用资源目录
			$this->vars['__AIMAGES__'] 	= $this->vars['__BASE__'] .'/apps/'. $this->vars['__APP__'] .'/views/statics/images'; //当应用资源目录

			$this->vars['__UPLOAD__'] = $this->vars['__BASE__'] .'/uploadfile';//上传目录
			$this->vars['__U__'] = $_SERVER['REQUEST_URI'];
			$this->vars['__PLUGINS__'] = $this->vars['__BASE__'] .'/libs/plugins'; //插件目录 
			
			//pre(URL_MODEL);
			/* 判断URL模式,根据系统 URL模式来定义系统的全局变量, 系统默认为PATH_INFO模式 */
			if(URL_MODEL == 0){
				//普通url模式 http://www.systacm.com/?a=admin&c=index&m=index
				$this->vars['__RURL__'] = $this->vars['__BASE__'] .'/?a='. $this->vars['__APP__'] .'&c=';
				$this->vars['__URL__'] 	=  $this->vars['__BASE__'] .'/?a='. $this->vars['__APP__'] .'&c='. $this->vars['__C__'] .'&m='. $this->vars['__M__']; 
				$this->vars['__CURL__'] 	=  $this->vars['__BASE__'] .'/?a='. $this->vars['__APP__'] .'&c='. $this->vars['__C__'] .'&m=';
				$this->vars['__PURL__'] 	=  $this->vars['__BASE__'] .'/?a='. $this->vars['__APP__'] .'&c='. $this->vars['__C__'];
				$this->vars['__NURL__'] 	=  $this->vars['__BASE__'] .'/?a='. $this->vars['__APP__'] .'&c='. $this->vars['__C__'];
			}else{
				$this->vars['__RURL__'] = $this->vars['__BASE__'] .'/'. $this->vars['__APP__'] .'/';
				$this->vars['__URL__'] = $this->vars['__BASE__'] .'/'. $this->vars['__APP__'] .'/'. $this->vars['__C__'] .'/'. $this->vars['__M__'];	//当前URL地址,包括操作名称
				$this->vars['__CURL__'] = $this->vars['__BASE__'] .'/'. $this->vars['__APP__'] .'/'. $this->vars['__C__'] .'/';		//当前模块 URL地址
				$this->vars['__PURL__']	= $this->vars['__BASE__'] .'/'. $this->vars['__APP__'] .'/'. $this->vars['__C__'] .'/';		//当前前一个地址
				$this->vars['__NURL__']	= $this->vars['__BASE__'] .'/'. $this->vars['__APP__'] .'/'. $this->vars['__C__'] .'/';		//当前后一个地址
			}

			//静态
			define('CAPP', $this->vars['__CAPP__']);
			define('RURL', $this->vars['__RURL__']);
			define('URL', $this->vars['__URL__']);
			define('CURL', $this->vars['__CURL__']);
			define('PURL', $this->vars['__PURL__']);
			define('NURL', $this->vars['__NURL__']);

			define('STATIC', $this->vars['__STATIC__']);
			define('SYSCSS', $this->vars['__SYSCSS__']);
			define('SYSJS', $this->vars['__SYSJS__']);
			define('SYSIMAGES', $this->vars['__SYSIMAGES__']);
			define('ASTATIC', $this->vars['__ASTATIC__']);
			define('ACSS', $this->vars['__ACSS__']);
			define('AJS', $this->vars['__AJS__']);
			define('AIMAGES', $this->vars['__AIMAGES__']);
			define('UPLOAD', $this->vars['__UPLOAD__']);
			$this->vars['__TOKEN__'] = session_id();
			define('__TOKEN__', $this->vars['__TOKEN__']);
			$this->vars['__PAGE_SIZE__'] = PAGE_SIZE;

			//SESSION
			$session = new session();
			if(isset($session->user)){
				$this->vars['__USER__'] = unserialize($session->user);
			}

			//载入语言包
			$this->vars['lang'] = array();
			$this->vars['lang'] = $this->load_lang($this->vars['__APP__']. DS .'system');
			$this->vars['lang'] = array_merge($this->vars['lang'], $this->load_lang($this->vars['__APP__']. DS .'admin'));

			if(!$this->name){
				$this->name = $this->getActionName();
				if($this->name == '') $this->name = 'SY_Controller';
			}
	
			if(file_exists('.'. DS .'data'. DS .'lang'.DS.SY_LANG .DS. $this->vars['__APP__'].DS. strtolower($this->name)) .'lang.php')
				$this->vars['lang'] = array_merge($this->vars['lang'], $this->load_lang($this->vars['__APP__'].DS.strtolower($this->name))); 
			else
				$this->vars['lang'] = array_merge($this->vars['lang'], array());
			$this->lang = $this->vars['lang'];

			if(method_exists($this, 'init')) //初始化操作
				$this->init();
			if(method_exists($this, 'auto')) //自动执行
				$this->auto();
			if(method_exists($this, 'author')) // 权限控制
				$this->author();
		}

		protected function getInstance($className){
			if(!self::$instance){
				if($className){
					$className = $className . '_Controller';
				}else{
					$className = 'SY_Controller';
				}
				return new $className;
			}
		}
		
		/**
		 * 初始化模板类
		 * @return [type] [description]
		 */
		protected function getView(){
			if(empty($this->view)){
				load_plugins('smarty'. DS .'Smarty.class');
				load_core('view');
				$this->view = new SY_View();

				/* 是否开启缓存 */
				if(CACHE){
					/* 开启Smarty缓存 */
					$this->view->caching = TRUE;
					$this->view->setCaching(Smarty::CACHING_LIFETIME_SAVED);
					/* 设置缓存文件目录 */
					$this->view->setCacheDir( $this->cache() );
				}else{
					/* 关闭Smarty缓存 */
					$this->view->caching = FALSE;
					$this->view->setCaching(Smarty::CACHING_OFF);

				}
				/* 调试模式 */
				if(DEBUG){
					$this->view->debugging = true;
				}
				//$this->view->debugging = true;
				/* 设置模板路径 */
				$this->view->setTemplateDir('.'. DS .'apps'. DS . $this->vars['__APP__'] . DS .'views'. DS .$this->vars['__C__']);
				/* 设置缓存编译文件路径 */
				$this->view->setCompileDir( $this->complie() );
				
			}

			if($this->vars){
				$this->view->assign($this->vars);
				//$this->view->assign($this->vars['lang']);
			}
		}
		
		/**
		 * 显示模板
		 * @param  [string] $file [如果为空，值则为当前调用本函数的操作名称]
		 * @return [type]       [description]
		 */
		protected function show($file = null){
			if(is_null($file)){
				$file_d = debug_backtrace();
				$file = $file_d[1]['function'];
			}
			$view_name = $file . get_cfgs('view_suffix');
			$view_file = '.'. DS .'apps'. DS . $this->vars['__APP__'] . DS .'views'. DS . $this->vars['__C__'] . DS . $view_name;
			
			if(!file_exists($view_file) || !is_readable($view_file))
				show_error('ERROR', '模板文件： '. $view_name .'不存在或者不可读！');

			$this->getView();
			$this->view->cache_id = md5($view_name);
			$this->view->clearCache($view_name);
			$this->view->display($view_name);
			
		}
		/* 跨应用显示模板 */
		protected function show_to($file = null){
			$view_file = $file . get_cfgs('view_suffix');
			if(stripos($view_file, '/') !== false){
				$view_file = str_replace('/', DS, $view_file);
			}
			if(!file_exists($view_file) || !is_readable($view_file))
				show_error('ERROR', '模板文件： '. $view_file .'不存在或者不可读！');

			$this->getView();
			$this->view->cache_id = md5($view_file);
			$this->view->clearCache($view_file);
			$this->view->display($view_file);
			
		}

		/**
		 * Show 方法的别名
		 * @param  [type] $file [description]
		 * @return [type]       [description]
		 */
		protected function display($file = null){
			if(is_null($file)){
				$file_d = debug_backtrace();
				$file = $file_d[1]['function'];
			}
			if(method_exists($this, 'show'))
				$this->show($file);
		}



		protected function fetch($file = null){
			if(is_null($file)){
				$file_d = debug_backtrace();
				$file = $file_d[1]['function'];
			}
			$view_name = $file . get_cfgs('view_suffix');
			
			if(!file_exists($view_name) || !is_readable($view_name))
				show_error('ERROR', '模板文件： '. $view_name .'不存在或者不可读！');
			define('APP_NAME', get_cfgs('default_app'));
			define('CONTROLLER_NAME', get_cfgs('default_controller'));
			define('METHOD_NAME', get_cfgs('default_method'));
			$this->getView();
			$this->view->cache_id = md5($view_name);
			$this->view->clearCache($view_name);
			return $this->view->fetch($view_name);
		}

		/**
		 * 跨模块渲染 $this->render('user/list')
		 * @param  [type] $file [description]
		 * @return [type]       [description]
		 */
		protected function render($file = null){
			$view_file = '.'. DS .'apps'. DS . APP_NAME . DS .'views'. DS . $file . get_cfgs('view_suffix');
			if(!file_exists($view_file) || !is_readable($view_file)){
				show_error('ERROR', '模板文件： '. $view_file .'不存在或者不可读！');
			}
			$this->getView();
			$this->view->cache_id = md5($view_file);
			$this->view->clearCache($view_file);
			$this->view->display($view_file);
		}

		/* 跨应用渲染 */
		protected function render_to($file = null){
			$view_file = $file . get_cfgs('view_suffix');
			if(stripos($view_file, '/') !== false){
				$view_file = str_replace('/', DS, $view_file);
			}
			if(!file_exists($view_file) || !is_readable($view_file)){
				show_error('ERROR', '模板文件： '. $view_file .'不存在或者不可读！');
			}
			$this->getView();
			$this->view->cache_id = md5($view_file);
			$this->view->clearCache($view_file);
			return $this->show_to($file);
		}

		/**
		 * 植入模板变量
		 * @param  [string | array] $name  [description]
		 * @param  string $value [description]
		 * @return [type]        [description]
		 */
		protected function assign($name, $value = ''){
			if(is_array($name)){
				$this->vars = array_merge($this->vars, $name);
			}else{
				$this->vars[$name] = $value;
			}
		}


		/**
	     * 获取控制器名称
	     * @access protected
	     */
	    protected function getActionName() {
	        if(empty($this->name)) {
	            // 获取控制器名称
	            $this->name = substr(get_class($this), 0, -11);
	        }
	        return $this->name;
	    }

	    /**
	     * 获取编译缓存路径, 不存在则创建
	     * @return [type] [description]
	     */
	    protected function cache(){
	    	
	    	$cache_path = '.'. DS .'temps'. DS .'cache'. DS . $this->vars['__APP__'] . DS .'views'. DS . $this->vars['__C__'] . DS;
	    	if(!is_dir($cache_path) && !is_writable($cache_path)){
	    		$model = 0777;
	    		@mkdir(dirname($cache_path), $model);
	    	}
	    	//Bcho($cache_path);
	    	return $cache_path;
	    }

	    protected function complie(){
	    	$complie_path = '.'. DS .'temps'. DS .'complie'. DS . $this->vars['__APP__'] . DS .'views'. DS . $this->vars['__C__'] . DS;
	    	if(!is_dir($complie_path) && !is_writable($complie_path)){
	    		$model = 0777;
	    		@mkdir(dirname($complie_path), $model);
	    	}
	    	//Bcho($cache_path);
	    	return $complie_path;
	    }

	    /**
	     * 控制器跳转(URL重定向） 支持指定模块和延时跳转
	     * @access protected
	     * @param string $url 跳转的URL表达式
	     * @param array $params 其它URL参数
	     * @param integer $delay 延时跳转的时间 单位为秒
	     * @param string $msg 跳转提示信息
	     * @return void
	     */
	    protected function redirect($url,$params=array(),$delay=0,$msg='') {
	        $url    =   Url_str($url,$params);
	        redirect($url,$delay,$msg);
	    }

	    /**
	     * 本模块中跳转
	     * @param  [type]  $url  [description]
	     * @param  boolean $flag [description]
	     * @return [type]        [description]
	     */
	    protected function jump($url,$params=array(),$delay=0,$msg=''){
	    	$url = $this->vars['__APP__'] .'/'. $this->name .'/'. $url;
	    	$url    =   U($url,$params);
	    	redirect($url,$delay,$msg);
	    }

	    /**
	     * 获取本控制器的数据模型对象
	     * @return [type] [description]
	     */
	    protected function getModel(){
	    	$model = strtolower(substr(get_class($this), 0, -11));
	    	if(class_exists($model)){
	    		$model = new $model;
	    		return $model;
	    	}else{
	    		$prefix = get_cfgs('db_config');
	    		show_error('ERROR', '数据表  '.strtolower($prefix['prefix']. $model).'  不存在！');
	    	}
	    }

	    protected function load_lang($mod){
	    	$lang = load_lang($mod);
	    	//$lang = array_merge($this->vars['lang'], $lang);
	    	return $lang;
	    }

	    protected function getVars($var=''){
	    	return $this->vars[$var];
	    }

	    public function __destruct(){
	    	
	    }

	}