<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * (系统配置文件)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	/* 项目路径 */
	$cfgs['base_url'] = 'http://systacm.com';

	/* 是否开启 调试模式 */
	$cfgs['is_debug'] 	= true;

	/* 是否开启缓存 */
	$cfgs['is_cache'] 	= true;

	/* 是否开启日志 */
	$cfgs['is_log'] 	= true;

	/* 系统默认语言 */
	$cfgs['lang'] = 'cn';

	/* 系统默认分页数 */
	$cfgs['page_size'] = 12;

	/* 栏目banner尺寸 */
	$cfgs['catbanner_width'] = 980;
	$cfgs['catbanner_height'] = 200;

	/* 首页焦点尺寸 */
	$cfgs['banner_width'] = 980;
	$cfgs['banner_height'] = 200;
	
	/**
	 * default_app 默认启动的应用名称 
	 * 必须设置, 如果没有设置，那么url中省略的appName将无法定位
	 * <code>
	 * 		http://serverName/appName/Controller/Method/Parames 没有设定的应用路径
	 *	  	http://serverName/Controller/Method/Parames 设置应用为默认开启应用后的访问路径
	 * </code>
	 */
	$cfgs['default_app'] = 'default';

	/* 默认启动的控制器 */
	$cfgs['default_controller'] = 'index';

	/* 默认定位的控制执行方法 */
	$cfgs['default_method'] = 'index';

	/* 控制器后缀 */
	$cfgs['controller_suffix'] 	= '_Controller';

	/* 模板文件后缀 */
	$cfgs['view_suffix']		= '.html';

	/**
	 * URL模式
	 * 0 : http://serverName/appName/?c=webcome&m=index&id=8&name=hello (普通url方式)
	 *  	->  a 代表应用名称
	 *   	->  c 代表控制器[controller]名称
	 *    	->  m 代表控制器中的方法名[method]
	 *     	->  id 和 name 代表m中所需的参数 相对于普通url来说就可以这样：$id = $_GET['id'] | $name = $_GET['name']
	 *
	 * 1 : http://serverName/appName/Controller/Method/id/8/name/hello (URL_REWRITE模式，前提是环境必须支持PATH_INFO模式)
	 * 		->Apache必须开启 URL_REWRITE模块支持,这样可以跳过index.php
	 * 		->将系统根目录下的htaccess.txt文件 改名为 .htaccess
	 *
	 * 2 : http://serverName/appName/Controller/Method/id/8/name/hello (PATH_INFO模式)
	 */
	$cfgs['url_model'] = 1;

	/**
	 * url_path_info之间的分隔符 （默认为：'/'）
	 * 可以设置为其它的符号，比如 ',' 或者 '-'等, 不建议大家使用 '&' 和 ':'
	 * 字符建议设置为 英文输入法状态下的字符
	 * 最终构成：http://servername/appName/Controller/Method/id/8
	 * 如果设置为 '-'，那最终将构成：
	 * 			 http://servername/appName/Controller-Method-id-8
	 */
	$cfgs['url_pathInfo_space'] = '/';

	/* app_names  系统应用程序列表  如有新增应用必须在此处添加上*/
	$cfgs['app_names'] = array('default', 'admin', 'blog');

	/* 系统变量名称设置 */
	$cfgs['var_app'] 			= 'a'; 	//应用
	$cfgs['var_controller']		= 'c';	//控制器
	$cfgs['var_method']			= 'm';	//操作方法

	//系统默认主题
	$cfgs['app_default_themes'] = array(
			'admin'  => 'default',
			'blog'	 => 'default',
			'default'=> 'default'
		);


	/*------------------数据库配置--------------------*/
	/*$cfgs['db_config'] = array(
		'host' 		=> 'localhost',
		'user' 		=> 'root',
		'pass'		=> '8289732916',
		'dbname'	=> 'systacm',
		'prefix'	=> 'syst_',
		'char'		=> 'utf8',
		'port'		=> '3306'
	);*/


	/*-------------------邮件配置----------------------*/
	$cfgs['email'] 	= array(
		'host' 		=> 'smtp.szhff.com',
		'port' 		=> '',
		'from_email'=> 'info@szhff.com',
		'from_pass' => 'huafeng082500',
		'from_name' => 'SYSTacm'
	);
