<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * (系统数据库配置)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	/*------------------数据库配置--------------------*/
	$cfgs['db_config'] = array(
		'host' 		=> 'localhost', //主机地址
		'user' 		=> 'systacm',      //用户名
		'pass'		=> '8289732916',//用户密码
		'dbname'	=> 'systacm',   //数据库名称
		'prefix'	=> 'syst_',     //数据库前缀
		'char'		=> 'utf8',      //字符集
		'port'		=> '3306'       //数据库端口. 留空则默认: 3306
	);
	
	/*
	
	$cfgs['db_config'] = array(
		'host' 		=> 'localhost',
		'user' 		=> 'root',
		'pass'		=> '8289732916',
		'dbname'	=> 'systacm',
		'prefix'	=> 'syst_',
		'char'		=> 'utf8',
		'port'		=> '3306'
	);
	
	*/