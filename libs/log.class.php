<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * SY_Log (日志信息输出类)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */

	class Log {

		protected $_log_path;
		protected $_enabled	= TRUE;
		protected $_db = null;
		
		public function __construct()
		{
			$this->_log_path = '.'. DS .'data'. DS .'logs'. DS;
		}

		// --------------------------------------------------------------------

		/**
		 * 写入日志文件
		 *
		 * @param	string	the error level
		 * @param	string	the error message
		 * @param	bool	whether the error is a native PHP error
		 * @return	bool
		 */
		public function write_file($type='ERROR', $module='', $action='', $msg='', $_enabled = true)
		{
			if( !is_dir($this->_log_path) OR !is_readable($this->_log_path)){
				@mkdir($this->_log_path, 0777);
				return FALSE;
			}
			$shunt = 0;
			$log_file = $this->_log_path .'log--'. date('Y-m-d') .'--'. $shunt .'.log';
			$now = date('Y-m-d H:i:s');
			$message = "[$type] - [$now] - [$module] - [$action] : ". $msg ."\r\n";
			if($_enabled === false){
				show_error($type, $message);
			}
			if( !file_exists($log_file) && !is_writable($log_file) ){
				file_put_contents($log_file, $message);
			}else{
				if( ceil(filesize($log_file) / (1024 * 1024)) > 20 ){
					$shunt += 1;
					$log_file = $this->_log_path . 'log--' . date('Y-m-d') .'--'. $shunt .'.log';
					file_put_contents($log_file, $message);
				}else{
					$fp = @fopen($log_file, 'aw+');
					if(flock($fp, LOCK_EX)){
						fwrite($fp, $message);
						flock($fp, LOCK_UN);
					}
					fclose($fp);
				}
				@chmod($filepath, FILE_WRITE_MODE);
				return TRUE;
			}
		}

		/**
		 * 将日志写入数据库
		 * @param  string $type   日志状态
		 * @param  string $module 模块
		 * @param  string $action 操作
		 * @param  string $msg    日志信息
		 * @return 
		 */
		public function write_data($type='ERROR', $module='', $action='', $msg=''){
			$data['module'] = $module;
			$data['action'] = $action;
			$data['massage'] = $msg;
			if(strtolower(trim($type)) == 'success' || intval($type) == 1){
				$data['state'] = 1; //成功
			}elseif(strtolower(trim($type)) == 'error' || intval($type) == 0){
				$data['state'] = 0; //错误
			}elseif(strtolower(trim($type)) == 'wraning' || intval($type) == 2){
				$data['state'] = 2; //警告
			}else{
				$data['state'] = 3; //未知
			}
			if(SYS_IP){
				$data['ip'] = SYS_IP;
			}else{
				$data['ip'] = $_SERVER['SERVER_ADDR'] ? $_SERVER['SERVER_ADDR'] : $_SERVER['REMOTE_ADDR'];
			}
			$session = new Session();
			if($session->user){
				$user = unserialize($session->user);
				$data['user_id'] = $user['uid'];
			}
			$data['add_time'] = strtotime(date('Y-m-d H:i:s'));
			$m = M();
			$data = $m->add($data, 'log');
			if($data <= 0){
				$this->write_file('ERROR', '日志信息写入数据库失败！');
			}
		}

	}