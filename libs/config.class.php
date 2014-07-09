<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * Config类 (读取系统配置项 | 单例)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	class Config {

		//private static $instance;
		private $cfgs = array();

		public function __construct(){
			if(!file_exists('.'. DS .'configs'. DS .'db_config.php') || !is_writable('.'. DS .'configs'. DS .'db_config.php')){
				show_error('ERROR', '数据库配置文件(db_config.php)不存在!请检查数据库配置项是否存在！');
				die;
			}
			require_once '.'. DS .'configs'. DS .'db_config.php';
			$configs = glob('.'. DS .'configs'. DS .'*.php');
			//pre($configs);
			foreach ($configs as $key => $value) {
				require $value;
			}
			$this->cfgs = $cfgs;
		}

		public function get_cfgs(){
			return $this->cfgs;
		}

		public function get_db_cfgs(){
			require '.'. DS .'configs'. DS .'db.config.php';
			$this->cfgs['db_cfgs'] = $db_cfgs;
			return $this->cfgs['db_cfgs'];
		}

		//获取单个配置项
		public function get($key){
			return $this->cfgs[$key];
		}

		//添加单个配置项
		public function set($key, $value){
			$this->cfgs[$key] = $value;
		}

	}