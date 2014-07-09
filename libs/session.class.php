<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * SESSION类
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-02-04
	 */
	 
	class Session {
		
		var $key = array();
		
		public function __construct(){
			self::start();
		}
		
		 public static function start(){
			if(!isset($_SESSION)){
				session_start();
			}
		}
		
		public static function setUid($uid){
			$_SESSION['uuid'] = sha1($uid) . md5(time());
			return md5(time());
		}
		
		public static function setDomain($domain){
			$_SESSION['domain'] = rtrim($domain);
		}
		
		public static function get($key){
			if(isset($_SESSION[$key]))
				return $_SESSION[$key];
			else 
				return false;
		}
		
		public static function set($key, $value){
			$_SESSION[$key] = $value;
		}
		
		public static function del($key){
			unset($_SESSION[$key]);
		}
		
		public function __get($key){
			if(isset($_SESSION[$key]))
				return $_SESSION[$key];
			else
				return false;
		}
		
		public function __set($key, $value){
			$_SESSION[$key] = $value;
		}
		
		
	}