<?php

/**
 * Funs (公共函数文件) 
 * Author: 	Rodey
 * Email : 	Rodeyluo@gmail.com
 * QQ 	 : 	453474593
 * Date  : 	2013-01-12
 */

//用于调式使用
function dpre($array){
	Echo '<pre>';
	print_r($array);
	Echo '</pre>';
	die;
}
	
//格式化输出数组
function pre($array, $title = ''){
	if('' != $title){
		Echo $title ;
	}
	Echo '<pre>';
	print_r($array);
	Echo '</pre>';
}

/* 重装Echo方法，换行输出 */
function Bcho($msg){
	Echo $msg. '<br />';
}
function Dcho($msg){
	Echo $msg;
	die;
}
function Beturn($msg, $bool = false){
	Bcho($msg);
	return $bool;
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

function a2s($data){
	static $datas = array();
	if(!is_array($data[1]))		$datas[0] 	= $data;
	else 						$datas 		= $data;
	return $datas;
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
 * @param  string $key 配置项名称 ''则获取全部
 * @return string|array|int      返回配置项值
 */
function get_cfgs($key=''){
	$cfg = get_cfg_instance();
	if(empty($key)){
		return $cfg->get_cfgs();
	}else{
		return $cfg->get($key);
	}
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

function CFG($key=''){
	return get_cfgs($key);
}


/**
 * 自动加载类文件
 * @param  string $classname 类名
 * @return false | true
 */
/*function __autoload($classname){
	if(file_exists(CORE_DIR . $classname . '.class.php') && 
	   is_readable(CORE_DIR . $classname . '.class.php')
	   ){
		//载入类文件
		require_once CORE_DIR . $classname . '.class.php';
	}elseif(
		file_exists(LIB_DIR . $classname . '.class.php') && 
		is_readable(LIB_DIR . $classname . '.class.php')
	){

		require_once LIB_DIR . $classname . '.class.php';
	}
}*/

/**
 * 输入日志信息
 * @param [string] $error_type	日志类型
 * @param [string] $msg 	   	日志内容
 * @param [boll]   $type 	   	记录类型
 *                            	FILE_LOG 	| 0 -> 将日志写入文件
 *                            	DATA_LOG 	| 1 -> 将日志写数据库
 *                            	FILE_DATA 	| 2 -> 兼前两者
	 */
function Logging($log_type='ERROR', $module='', $action='', $msg='', $type='FILE_LOG' ){
	$log = get_instance('log');
	$type = trim($type);
	if(intval($type) === 0){
		$log->write_file($log_type, $module, $action, $msg);
	}elseif(intval($type) === 1){
		$log->write_data($log_type, $module, $action, $msg);
	}elseif(intval($type) === 2){
		$log->write_data($log_type, $module, $action, $msg);
		$log->write_file($log_type, $module, $action, $msg);
	}else{
		show_error('ERROR', '函数 Log_message()参数传递错误！');
	}
}


/**
 * 显示错误信息
 * @param  [sring] $msg 错误信息
 * @return [null]
 */
if( !function_exists('show_error')){
	function show_error($type = 'ERROR', $msg='', $jump=''){
		if( !file_exists('.'. DS .'statics'. DS .'show_error.php')){
			die($msg);
		}else{
			$message = $msg;
			include '.'. DS .'statics'. DS .'show_error.php';
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
	function get_instance($class, $dir = LIB_DIR){
		$dir = rtrim($dir, DS) . DS;
		static $_cls = array();
		$name = false;

		if (isset($_cls[$class]))
		{
			return $_cls[$class];
		}
		if(file_exists($dir . $class . '.class.php')){

			$name = ucfirst($class);
			if(class_exists($name) == false){
				require_once $dir . $class . '.class.php';
			}
		}
		if($name === false){
			show_error('ERROR', $class . '：该类没有定义或者类文件不存在！');
		}
        $_cls[$class] = new $name();
		return $_cls[$class];
	}
}

/**
 * 载入对应文件
 */
if(!function_exists('load_file')){
	function load_file($file){
		if(strripos($file, '>') !== false){
			$file = str_ireplace('>', DS, $file);
		}
		$file = rtrim($file, '.php') .'.php';
		if(file_exists($file) && is_readable($file)){
			require_once $file;
		}else{
			show_error('ERROR', $file.'文件加载失败或者已经被移出！');
		}
	}
}

if(!function_exists('load_core')){
	function load_core($file){
		$file_path = CORE_DIR. $file;
		$file_path = rtrim($file_path, '.class.php') .'.class.php';
		load_file($file_path);
	}
}

/**
 * 载入插件
 */
if(!function_exists('load_plugins')){
	function load_plugins($file){
		$file_path = SYS_PLUGINS_DIR. $file;
		load_file($file_path);
	}
}

/**
 * 载入外部助手类 
 */
if(!function_exists('load_helper')){
	function load_helper($file){
		$file_path = HELPER_DIR. $file .'_helper.php';
		load_file($file_path);
	}
}

/**
 * 载入系统类 
 */
if(!function_exists('load_libs')){
	function load_libs($file){
		$file_path = LIB_DIR. $file .'.class.php';
		load_file($file_path);
	}
}
/**
 * 加载语言包
 * @param  [type] $path [description]
 * @param  [type] $name [description]
 * @return [type]       [description]
 */
function load_lang($path, $name=null){
	static $lang = array();
	static $name_lang = array();
	if(SY_LANG){
		if(file_exists('.'. DS .'data'. DS .'lang'. DS .SY_LANG. DS .$path. '.lang.php'))
			$lang = include '.'. DS .'data'. DS .'lang'. DS .SY_LANG. DS .$path. '.lang.php';
		else
			$lang = array();
	}else{
		$lang = include '.'. DS .'data'. DS .'lang'. DS .get_cfgs('lang'). DS .'system.lang.php';
	}
	if(!is_null($name)){
		$name_lang = include '.'. DS .'data'. DS .'lang'. DS .SY_LANG. DS .$name. '.lang.php';
		$lang = array_merge($lang, $name_lang);
	}
	return $lang;
}

/**
 * 载入对应语言包
 * @param [type] $c   [当前控制器]
 * @param [type] $str [description]
 */
function Lang($c, $str){
	$controller = empty($c) ? new SY_Controller() : $c;
	$langs = $controller->lang;
	if(isset($langs[$str])){
		return $langs[$str];
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

/* Url_str 别名函数 */
function U($url, $params='', $redirect=true){
	Url_str($url, $params='', $redirect=true);
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

	if('' != $model_name){
		$model_file = APPS_DIR .APP_NAME. DS .'models'. DS . $model_name .'.php';
		if(file_exists($model_file) && is_readable($model_file)){
			require_once $model_file;
			$model = ucfirst($model_name);
		}else{
			show_error('ERROR', '模型文件: '. $model .' 不存在或者不可读！');
		}
	}else{
		require_once CORE_DIR.'model.class.php';
		$model = 'Model';
	}

	$model_class = new $model();
	return $model_class;
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
/* 验证 */
function is_number($number) {
	if (!is_numeric($number))
		return false;
	else
		return true;
}
function is_word($word) {
	if (!preg_match("%^[a-zA-Z][a-zA-Z0-9_-]*$%"))
		return false;
	else
		return true;
}
function is_email($email) {
	if (!preg_match("%^[-a-zA-Z0-9_\.]+\@([0-9A-Za-z][0-9A-Za-z-]+\.)+[A-Za-z]{2,5}$%",$email))
		return false;
	else
		return true;
}
function is_url($url) {
	if (!preg_match("%^http://[_a-zA-Z0-9-]+(.[_a-zA-Z0-9-]+)*$%",$url))
		return false;
	else
		return true;
}

/**
 * 简单删除目录并打印删除文件列表
 * @param  [type] $dir [description]
 * @return [type]      [description]
 */
function rrmdir($dir) {
    foreach(glob($dir . '/*') as $file) {
        if(is_dir($file)){
            rrmdir($file);
        }else{
            unlink($file);
        }
    }
    rmdir($dir);
}

/**
 * 删除目录及目录下的所有文件
 * @param  [type] $dir [description]
 * @return [type]      [description]
 */
function drmdir($dir) { 
   if (is_dir($dir)) { 
		$objects = scandir($dir); 
		foreach ($objects as $object) { 
			if ($object != "." && $object != "..") { 
				if (filetype($dir."/".$object) == "dir") drmdir($dir."/".$object); 
				else unlink($dir."/".$object); 
			} 
		} 
		reset($objects); 
		rmdir($dir); 
	} 
} 

/**
 * 直接创建多级目录
 */
function mkkdir($path){
	$i = 0;
	while (!@mkdir($path, 0777)) {
		if (is_dir($path) && is_writable($path)) break;
		$i ++; 
		if (@mkdir($path . str_repeat("/..", $i), 0777)) $i = 0;
	}
}

function m_explode($pattern, $string, $standardDelimiter = '')
{
    $string = preg_replace(array($pattern, "/{$standardDelimiter}+/s"), $standardDelimiter, $string);
    return explode($standardDelimiter, $string);
}

/**
 * 发送邮件 
 * @param  [string] $host      smtp邮件服务器
 * @param  [string] $fromemail [发送邮箱地址]
 * @param  [string] $frompwd   [发送邮箱密码]
 * @param  [string] $fromname  [发送邮箱名称]
 * @param  [string] $toemail   [接受者邮箱地址]
 * @param  [string] $toname    [接受者名称]
 * @param  [string] $title     [邮件标题]
 * @param  [string] $body      [邮件内容]
 * @return [bool]              [true | false]
 * send_email('smtp.szhff.com','luoy@szhff.com','hf082500','SYST','453474593@qq.com','Luoy','Hi','<strong>Hello World!</strong>');
 */
function send_email($host, $fromemail, $frompwd, $fromname='', $toemail, $toname='', $title='', $body=''){
	load_plugins('PHPMailer'. DS .'class.phpmailer');
	$mail = new PHPMailer();
	//var_dump($mail);
	$mail->IsSMTP();	// 设置mailer使用SMTP
	$mail->Host = $host;	// 设置主和备用smtp邮件服务器
	$mail->SMTPAuth = true;	// 开启SMTP验证（一般邮件服务器都需要这个才能发信）
	// SMTP服务器的登陆用户名
	//需要注意一下，像网易这样的邮箱，需要写全类似于sfirelife@163.com这样的用户名。
	$mail->Username = $fromemail;
	$mail->Password = $frompwd;// SMTP服务器的用户密码	
	$mail->From = $fromemail;	//设置发件人邮件地址
	$mail->FromName = $fromname;	//发件人姓名
	$mail->AddAddress($toemail, $toname);	//设置收件人邮箱和姓名，必须	
	$mail->WordWrap = 50;		//邮件字符自动断行数
	$mail->IsHTML(true); 		//以HTML格式发送邮件内容体
	$mail->CharSet = 'UTF-8';
	$mail->Encoding = "base64"; //编码方式 
	//$mail->SetLanguage('ch');
	$mail->Subject = $title;	//设置邮件标题	
	$mail->Body    = $body; 	//设置邮件内容
	//设置当邮件服务器不支持HTML邮件时，将以纯文本格式代发送的内容。
	//$mail->AltBody = strip_tags($body);	
	//如果发送出错时的提示。
	if(!$mail->Send()) 	return false;
	else 				return true;
}

/**
 * 发送短息
 * @param  string $phone   [手机号码]
 * @param  string $content [短息内容]
 * @return [bool]          [true | false]
 */
function send_phone($phone='', $content=''){
	return true;
}

function random($length = 8){
	$chars = 'azertyupqsdfghjkmwxcvbnAZERTYUPQSDFGHJKMWXCVBN23456789'; 
	$max = strlen($chars) - 1;
	$rand = null;
	for($i=0; $i < $length; $i++) { 
		$rand .= $chars{mt_rand(0, $max)}; 
	}
	return $rand;
}

function now_time($istime = true){
	if($istime) 	return strtotime(date('Y-m-d H:i:s'));
	else 			return date('Y-m-d H:i:s');
}

function now_date($isflag = true){
	if($isflag)		return date('Y-m-d H:i:s');
	else 			return date('Y-m-d');
}

function arr2arrs(array $array){
	static $arrs = array();
	if(empty($array[0]) || !is_array($array[0])){
		$arrs = array($array);
		return $arrs;
	}else{
		return $array;
	}
}

/**
 * CSV转数组
 * @param  string  $url  [CSV文件]
 * @param  string  $delm [分割符]
 * @param  string  $encl [转换后]
 * @param  boolean $head [是否需要头部]
 * @return Array         [输出数组]
 * call:  $csvdata = csv_in_array( $yourcsvfile, ";", "\"", true );
 * puts:  print_r($csvdata);
 */
function csv_in_array($url,$delm=";",$encl="\"",$head=false) { 
    
    $csvxrow = file($url);   // ---- csv rows to array ----
    
    $csvxrow[0] = chop($csvxrow[0]); 
    $csvxrow[0] = str_replace($encl,'',$csvxrow[0]); 
    $keydata = explode($delm,$csvxrow[0]); 
    $keynumb = count($keydata); 
    
    if ($head === true) { 
    $anzdata = count($csvxrow); 
    $z=0; 
    for($x=1; $x<$anzdata; $x++) { 
        $csvxrow[$x] = chop($csvxrow[$x]); 
        $csvxrow[$x] = str_replace($encl,'',$csvxrow[$x]); 
        $csv_data[$x] = explode($delm,$csvxrow[$x]); 
        $i=0; 
        foreach($keydata as $key) { 
            $out[$z][$key] = $csv_data[$x][$i]; 
            $i++;
            }    
        $z++;
        }
    }
    else { 
        $i=0;
        foreach($csvxrow as $item) { 
            $item = chop($item); 
            $item = str_replace($encl,'',$item); 
            $csv_data = explode($delm,$item); 
            for ($y=0; $y<$keynumb; $y++) { 
               $out[$i][$y] = $csv_data[$y]; 
            }
        $i++;
        }
    }
return $out; 
}

/**
 * utf8转gbk
 * @param $utfstr
 */
function utf8_to_gbk($utfstr) {
	global $UC2GBTABLE;
	$okstr = '';
	if(empty($UC2GBTABLE)) {
		$filename = ENCODING_DIR.'gb-unicode.table';
		$fp = fopen($filename, 'rb');
		while($l = fgets($fp,15)) {        
			$UC2GBTABLE[hexdec(substr($l, 7, 6))] = hexdec(substr($l, 0, 6));
		}
		fclose($fp);
	}
	$okstr = '';
	$ulen = strlen($utfstr);
	for($i=0; $i<$ulen; $i++) {
		$c = $utfstr[$i];
		$cb = decbin(ord($utfstr[$i]));
		if(strlen($cb)==8) { 
			$csize = strpos(decbin(ord($cb)),'0');
			for($j = 0; $j < $csize; $j++) {
				$i++; 
				$c .= $utfstr[$i];
			}
			$c = utf8_to_unicode($c);
			if(isset($UC2GBTABLE[$c])) {
				$c = dechex($UC2GBTABLE[$c]+0x8080);
				$okstr .= chr(hexdec($c[0].$c[1])).chr(hexdec($c[2].$c[3]));
			} else {
				$okstr .= '&#'.$c.';';
			}
		} else {
			$okstr .= $c;
		}
	}
	$okstr = trim($okstr);
	return $okstr;
}
/**
 * gbk转utf8
 * @param $gbstr
 */
function gbk_to_utf8($gbstr) {
	global $CODETABLE;
	if(empty($CODETABLE)) {
		$filename = ENCODING_DIR.'gb-unicode.table';
		$fp = fopen($filename, 'rb');
		while($l = fgets($fp,15)) { 
			$CODETABLE[hexdec(substr($l, 0, 6))] = substr($l, 7, 6); 
		}
		fclose($fp);
	}
	$ret = '';
	$utf8 = '';
	while($gbstr) {
		if(ord(substr($gbstr, 0, 1)) > 0x80) {
			$thisW = substr($gbstr, 0, 2);
			$gbstr = substr($gbstr, 2, strlen($gbstr));
			$utf8 = '';
			@$utf8 = unicode_to_utf8(hexdec($CODETABLE[hexdec(bin2hex($thisW)) - 0x8080]));
			if($utf8 != '') {
				for($i = 0; $i < strlen($utf8); $i += 3) $ret .= chr(substr($utf8, $i, 3));
			}
		} else {
			$ret .= substr($gbstr, 0, 1);
			$gbstr = substr($gbstr, 1, strlen($gbstr));
		}
	}
	return $ret;
}
/**
 * 繁体转简体
 * @param  $Text
 */
function big5_to_gbk($Text) {
	global $BIG5_DATA;
	if(empty($BIG5_DATA)) {
		$filename = ENCODING_DIR.'big5-gb.table';
		$fp = fopen($filename, 'rb');
		$BIG5_DATA = fread($fp, filesize($filename));
		fclose($fp);
	}
	$max = strlen($Text)-1;
	for($i = 0; $i < $max; $i++) {
		$h = ord($Text[$i]);
		if($h >= 0x80) {
			$l = ord($Text[$i+1]);
			if($h==161 && $l==64) {
				$gbstr = '　';
			} else {
				$p = ($h-160)*510+($l-1)*2;
				$gbstr = $BIG5_DATA[$p].$BIG5_DATA[$p+1];
			}
			$Text[$i] = $gbstr[0];
			$Text[$i+1] = $gbstr[1];
			$i++;
		}
	}
	return $Text;
}
/**
 * 简体转繁体
 * @param  $Text
 */
function gbk_to_big5($Text) {
	global $GB_DATA;
	if(empty($GB_DATA)) {
		$filename = ENCODING_DIR.'gb-big5.table';
		$fp = fopen($filename, 'rb');
		$gb = fread($fp, filesize($filename));
		fclose($fp);
	}
	$max = strlen($Text)-1;
	for($i = 0; $i < $max; $i++) {
		$h = ord($Text[$i]);
		if($h >= 0x80) {
			$l = ord($Text[$i+1]);
			if($h==161 && $l==64) {
				$big = '　';
			} else {
				$p = ($h-160)*510+($l-1)*2;
				$big = $GB_DATA[$p].$GB_DATA[$p+1];
			}
			$Text[$i] = $big[0];
			$Text[$i+1] = $big[1];
			$i++;
		}
	}
	return $Text;
}
/**
 * unicode转utf8
 * @param  $c
 */
function unicode_to_utf8($c) {
	$str = '';
	if($c < 0x80) {
		$str .= $c;
	} elseif($c < 0x800) {
		$str .= (0xC0 | $c >> 6);
		$str .= (0x80 | $c & 0x3F);
	} elseif($c < 0x10000) {
		$str .= (0xE0 | $c >> 12);
		$str .= (0x80 | $c >> 6 & 0x3F);
		$str .= (0x80 | $c & 0x3F);
	} elseif($c < 0x200000) {
		$str .= (0xF0 | $c >> 18);
		$str .= (0x80 | $c >> 12 & 0x3F);
		$str .= (0x80 | $c >> 6 & 0x3F);
		$str .= (0x80 | $c & 0x3F);
	}
	return $str;
}
/**
 * utf8转unicode
 * @param  $c
 */
function utf8_to_unicode($c) {
	switch(strlen($c)) {
		case 1:
		  return ord($c);
		case 2:
		  $n = (ord($c[0]) & 0x3f) << 6;
		  $n += ord($c[1]) & 0x3f;
		  return $n;
		case 3:
		  $n = (ord($c[0]) & 0x1f) << 12;
		  $n += (ord($c[1]) & 0x3f) << 6;
		  $n += ord($c[2]) & 0x3f;
		  return $n;
		case 4:
		  $n = (ord($c[0]) & 0x0f) << 18;
		  $n += (ord($c[1]) & 0x3f) << 12;
		  $n += (ord($c[2]) & 0x3f) << 6;
		  $n += ord($c[3]) & 0x3f;
		  return $n;
	}
}

/**
 * Ascii转拼音
 * @param $asc
 * @param $pyarr
 */
function asc_to_pinyin($asc,&$pyarr) {
	if($asc < 128)return chr($asc);
	elseif(isset($pyarr[$asc]))return $pyarr[$asc];
	else {
		foreach($pyarr as $id => $p) {
			if($id >= $asc)return $p;
		}
	}
}
/**
 * gbk转拼音
 * @param $txt
 */
function gbk_to_pinyin($txt) {
	if(CHARSET != 'gbk') {
		$txt = iconv(CHARSET,'GBK',$txt);
	}	
	$l = strlen($txt);
	$i = 0;
	$pyarr = array();
	$py = array();
	$filename = ENCODING_DIR.'gb-pinyin.table';
	$fp = fopen($filename,'r');
	while(!feof($fp)) {
		$p = explode("-",fgets($fp,32));
		$pyarr[intval($p[1])] = trim($p[0]);
	}
	fclose($fp);
	ksort($pyarr);
	while($i<$l) {
		$tmp = ord($txt[$i]);
		if($tmp>=128) {
			$asc = abs($tmp*256+ord($txt[$i+1])-65536);
			$i = $i+1;
		} else $asc = $tmp;
		$py[] = asc_to_pinyin($asc,$pyarr);
		$i++;
	}
	return $py;
}






