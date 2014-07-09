<?php
	/**
	 * SYSTcms 
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	//设置系统的输出字符为utf-8
	header("Content-Type:text/html;charset=utf-8");
	//设置时区（中国）
	date_default_timezone_set("PRC");
	//打印所有报错,开发阶段使用，在生成环境下，注释或者改为0
	error_reporting(E_ALL);
	
	//防跳墙
	!defined('ACT') ? define('ACT', true) : die('ACT Undefined， Access Violation！');

	//应用路径
	define('DS', DIRECTORY_SEPARATOR);
	define('APP_PATH', str_replace('\\', '/', realpath(dirname(__FILE__)).'/'));
	define('ROOT_DIR', '.'. DS);
	define('DATA_DIR', '.'. DS .'data'. DS);
	define('CORE_DIR', '.'. DS .'libs'. DS .'core'. DS);
	define('LIB_DIR', '.'. DS .'libs'. DS);
	define('SYS_PLUGINS_DIR', '.'. DS .'libs'. DS .'plugins'. DS);
	define('HELPER_DIR', '.'. DS .'libs'. DS .'helper'. DS);
	define('APPS_DIR', '.'. DS .'apps'. DS);
	define('TEMPS', '.'. DS .'temps'. DS);
	define('CACHE_DIR', TEMPS.'cache');
	define('COMPLIE_DIR', TEMPS.'complie');
	define('UPLOAD_DIR', 'uploadfile'. DS);
	define('ENCODING_DIR', '.'. DS .'data'. DS .'encoding'. DS);

	require LIB_DIR.'function.class.php';

	/**
	 * 自动加载类文件
	 * @param  string $classname 类名
	 * @return false | true
	 */
	function __autoload($classname){
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
	}

	//如果不使用上面的自动加载，请使用这里的分别引入
	/*require LIB_DIR.'config.class.php';
	require CORE_DIR.'app.class.php';
	require CORE_DIR.'db.class.php';
	require CORE_DIR.'mysql.class.php';
	require CORE_DIR.'model.class.php';
	require CORE_DIR.'controller.class.php';*/
	//pre(get_cfgs());

	/* 检查是否已经安装 */
	if(!file_exists(DATA_DIR.'install.lock')){
		header('Location: '. rtrim(get_cfgs('base_url'), DS). DS .'install');
		die;
	}

	load_file(CORE_DIR.'app.class.php');

	/* 系统初始化 */
	SY_APP::run();

	if(!defined('DEBUG')) define('DEBUG', get_cfgs('is_debug'));

	//输出系统引入的文件
	if(DEBUG){
		Echo '<hr color="#009900" size="2" style="margin-top:150px;"/>';
		pre(get_included_files());
	} 

