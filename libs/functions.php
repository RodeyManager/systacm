<?php

	/**
	 * Funs (公共函数文件) 
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	//格式化输出数组
	function pre($array, $title = ''){
		if('' != $title){
			Echo $title ;
		}
		Echo '<pre>';
		print_r($array);
		Echo '</pre>';
	}

	/**
	 * 重装Echo方法，换行输出
	 * @param [string] $msg [打印信息]
	 */
	function Bcho($msg){
		Echo $msg. '<br />';
	}
	
	/*
	 * 输出各种类型的数据，调试程序时打印数据使用。
	 * 参数：可以是一个或多个任意变量或值
	 */
	function p(){
		$args = func_get_args();  //获取多个参数
		if(count($args) < 1){
			show_error('ERROR', '必须为p函数设置参数!');
			return;
		}	

		Echo '<div style="width:100%;text-align:left"><pre>';
		//多个参数循环输出
		foreach($args as $arg){
			if(is_array($arg)){
				print_r($arg);
				Echo '<br>';
			}else if(is_string($arg)){
				Echo $arg.'<br>';
			}else{
				var_dump($arg);
				Echo '<br>';
			}
		}
		Echo '</pre></div>';	
	}

	/**
	 * 指定格式化数组
	 * ==USER:
	 * $a = ('id', 8, 'name', 'rodey');
	 * $b = array_key_value($a);
	 * print_r($b);
	 * array(
	 * 		'id'   => 8,
	 * 		'name' => 'rodey'
	 * )
	 * @param  array  $array 要指定格式化的数组
	 * @return array         返回格式化后的数组
	 */
	function array_key_value( array $arr){
		static $combine = array();
		for($i=0; $i < count($arr); $i++) {
			$m = $i+1;
		 	if( $i % 2 == 0 ){
				 $combine[$arr[$i]]	 =  $arr[$i+1];
		 	}   
		}
		return $combine;
	}

	/**
	 * 将数组转为字符串
	 * ==USER:
	 * $a = ('id', 8, 'name', 'rodey');
	 * $b = array_to_string($a, '=,&');
	 * print_r($b);
	 *
	 * -> id=8&name=rodey
	 * 
	 * @param  array  $array 要指定格式化的数组
	 * @return array         返回格式化后的数组
	 */
	function array_to_string($arr, $separa = '=,&'){
		static $_keys = array();
		static $_values = array();
		static $str = '';
		$separa = explode(',', $separa);

		foreach ($arr as $key => $value) {
			$str .= $key . $separa[0] . $value . $separa[1];
		}

		$str = substr($str, 0, strrpos($str, $separa[1]));

		return $str;
	}

	/**
	 * 将字符串转为数组
	 * ==USER:
	 * $a = id=8&name=rodey&age=25;
	 * $b = string_to_array($a, '&,=');
	 * print_r($b);
	 *
	 * -> Array(
	 * 		[0] = id,
	 * 		[1] = 8,
	 * 		[2]	= name,
	 * 		[3] = rodey,
	 * 		[4] = age,
	 * 		[5] = 25
	 * 
	 * )
	 * 
	 * @param  array  $array 要指定格式化的数组
	 * @return array         返回格式化后的数组
	 */
	function string_to_array($str, $separa = '&,='){
		static $ts = array();
		static $vs = array();
		$separa = explode(',', $separa);
		$as = explode($separa[0], $str);

		foreach ($as as $key => $value) {
			$vs[] = explode($separa[1], $value);
		}
		foreach ($vs as $key => $value) {
			foreach ($value as $k => $v) {
				$ts[] = $v;
			}
		}

		return $ts;
	}

	/**
	 * 实例化 Config 类的实例
	 * @return Config 返回Config实例
	 */
	function get_cfg_instance(){
		static $instance;
		require 'configs/config.inc.php';
		$instance = new Config();
		return $instance;
	}

	/**
	 * 获取单个配置项
	 * @param  string $key 配置项名称
	 * @return string|array|int      返回配置项值
	 */
	function get_cfgs($key){
		$cfg = get_cfg_instance();
		return $cfg->get($key);
	}

	/**
	 * 设置|添加配置项
	 * @param string $key   配置项名称	
	 * @param string|array|int $value 配置想值
	 */
	function set_cfgs($key, $value){
		$cfg = get_cfg_instance();
		$cfg->set($key, $value);
	}

	/**
	 * 自动加载类文件
	 * @param  string $classname 类名
	 * @return false | true
	 */
	function __autoload($classname){
		if(file_exists('core/' . $classname . '.class.php') && 
		   is_readable('core/' . $classname . '.class.php')
		   ){
			//载入类文件
			require_once 'core/' . $classname . '.class.php';
		}elseif(
			file_exists('libs/' . $classname . '.class.php') && 
			is_readable('libs/' . $classname . '.class.php')
		){

			require_once 'libs/' . $classname . '.class.php';
		}
	}

	/**
	 * 输入日志信息
	 * @param [type] $msg [description]
	 */
	function Log_message($type = 'ERROR', $msg ){
		$log = get_instance('log');
		$log->write($type, $msg);
	}

	/**
	 * 显示错误信息
	 * @param  [sring] $msg 错误信息
	 * @return [null]
	 */
	if( !function_exists('show_error')){
		function show_error($type = 'ERROR', $msg){
			if( !file_exists('statics/show_error.php')){
				die($msg);
			}else{
				$message = $msg;
				include 'statics/show_error.php';
				exit();
			}
		}
	}

	/**
	 * 动态加载类文件并实例化类
	 * @param  [sring] $class 类名
	 * @return [object]
	 */
	if( !function_exists('get_instance')){
		function get_instance($class, $dir = 'libs/'){
			$dir = rtrim($dir, '/') . '/';
			static $_cls = array();
			$name = false;

			if (isset($_cls[$class]))
			{
				return $cls[$class];
			}
			
			if(file_exists($dir . $class . '.class.php')){

				$name = ucfirst($class);
				if(class_exists($name) == false){
					require $dir . $class . '.class.php';
				}
			}

			if($name === false){
				show_error('ERROR', $class . '：该类没有定义或者类文件不存在！');
			}

			$cls[$class] = new $name();
			return $cls[$class];
		}
	}

	/**
	 * 载入对应文件
	 */
	if(!function_exists('load_file')){
		function load_file($file){
			if(file_exists($file) && is_readable($file)){
				require_once $file;
			}else{
				show_error('ERROR', $file.'文件加载失败或者已经被移出！');
			}
		}
	}

	/**
	 * 载入插件
	 */
	if(!function_exists('load_plugins')){
		function load_plugins($file){
			load_file($file);
		}
	}

	
function Url_str($url, $params='', $redirect=true){
	static $p;

	//判断URL模式 
	if(get_cfgs('url_model') === 0){
		//普通URL模式
		if(!empty($params)){
			if(is_array($params)){
				foreach ($params as $key => $value) {
					$p .= '&'.$key.'='.$value;
				}
				$p = substr($p, 1, strlen($p));
				$p = '?' . $p;
			}else{
				$p = '?' . $p;
			}
		}
	}else{
		//PATH-INFO URL模式
		if(is_array($params)){
			foreach ($params as $key => $value) {
				$p .= $key. '/' .$value. '/';
			}
			$p = '/' .rtrim($p, '/');
		}else{
			$p = rtrim($params, '/');
		}

	}

	$url = '/' .rtrim($url . $p, '/');
	$url = get_cfgs('base_url'). $url;
	if(is_ssl()){
		$url = preg_replace('http://', 'https://', $url);
	}
	//$url = (is_ssl() ? 'https://' : 'http://') . $url;
	if($redirect)
		redirect($url);
	else
		return $url;
}


/**
 * 判断是否SSL协议
 * @return boolean
 */
function is_ssl() {
    if(isset($_SERVER['HTTPS']) && ('1' == $_SERVER['HTTPS'] || 'on' == strtolower($_SERVER['HTTPS']))){
        return true;
    }elseif(isset($_SERVER['SERVER_PORT']) && ('443' == $_SERVER['SERVER_PORT'] )) {
        return true;
    }
    return false;
}

/**
 * URL重定向
 * @param string $url 重定向的URL地址
 * @param integer $time 重定向的等待时间（秒）
 * @param string $msg 重定向前的提示信息
 * @return void
 */
function redirect($url, $time=0, $msg='') {
    //多行URL地址支持
    $url        = str_replace(array("\n", "\r"), '', $url);
    if (empty($msg))
        $msg    = "系统将在{$time}秒之后自动跳转到{$url}！";
    if (!headers_sent()) {
        // redirect
        if (0 === $time) {
            header('Location: ' . $url);
        } else {
            header("refresh:{$time};url={$url}");
            echo($msg);
        }
        exit();
    } else {
        $str    = "<meta http-equiv='Refresh' content='{$time};URL={$url}'>";
        if ($time != 0)
            $str .= $msg;
        exit($str);
    }
}

/**
 * 实例化数据库模型对象
 * @param string $model_name [description]
 */
function M($model_name = ''){
	static $model;
	$model_file = './apps/' .APP_NAME .'/models/'. $model_name .'.php';
	if(file_exists($model_file) && is_readable($model_file)){
		require_once $model_file;
		if(empty($model_name)){
			$model = 'Model';
		}else{
			$model = ucfirst($model_name);
		}
		$model = new $model();
		return $model;
	}else{
		show_error('ERROR', '模型文件: '. $model .' 不存在或者不可读！');
	}
}
/*------------------------------------------------文件操作相关------------------------------------------------*/
/*
 * 文件尺寸转换，将大小将字节转为各种单位大小
 * 参数$bytes：字节大小
 */
function tosize($bytes) {       	 	     //自定义一个文件大小单位转换函数
	if ($bytes >= pow(2,40)) {      		     //如果提供的字节数大于等于2的40次方，则条件成立
		$return = round($bytes / pow(1024,4), 2);    //将字节大小转换为同等的T大小
		$suffix = "TB";                        	     //单位为TB
	} elseif ($bytes >= pow(2,30)) {  		     //如果提供的字节数大于等于2的30次方，则条件成立
		$return = round($bytes / pow(1024,3), 2);    //将字节大小转换为同等的G大小
		$suffix = "GB";                              //单位为GB
	} elseif ($bytes >= pow(2,20)) {  		     //如果提供的字节数大于等于2的20次方，则条件成立
		$return = round($bytes / pow(1024,2), 2);    //将字节大小转换为同等的M大小
		$suffix = "MB";                              //单位为MB
	} elseif ($bytes >= pow(2,10)) {  		     //如果提供的字节数大于等于2的10次方，则条件成立
		$return = round($bytes / pow(1024,1), 2);    //将字节大小转换为同等的K大小
		$suffix = "KB";                              //单位为KB
	} else {                     			     //否则提供的字节数小于2的10次方，则条件成立
		$return = $bytes;                            //字节大小单位不变
		$suffix = "Byte";                            //单位为Byte
	}
	return $return ." " . $suffix;                       //返回合适的文件大小和单位
}


