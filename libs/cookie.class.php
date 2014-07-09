<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * Cookie类
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-02-04
	 */
	
	class Cookie {
		
		static function get($key){
			if(isset($_COOKIE[$key]))
				return $_COOKIE[$key];
			else
				return false;
		}
		
		static function set($key, $value, $expire=null, $path='/', $domain=''){
			if(!isset($key) || !isset($value)) return;
			if(!$expire){
				$expire = time() + 3600;
			}
			setcookie($key, $value, $expire, $path, $domain);
			$_COOKIE[$key] = $value;
		}
		
		static function del($key) {
			setcookie($key,'',time() -3600,'/');
		}
		
		public function __get($key){
			if(isset($_COOKIE[$key])) return $_COOKIE$key;
			else return false;
		}
		public function __set($key, $value){
			setcookie($key, $value);
			$_COOKIE[$key] = $value;
		}
		
		
	}