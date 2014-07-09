<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * ----------------------------------------------
	 * 	Class Upload(Upload类) ：文件上传类 
	 *
	 *	Author: 	Rodey
	 *	E-mail: 	Rodeyluo@gmail.com
	 * 	Date  : 	2012-12-29 AM
	 *	WebSite: 	http://www.roadey.com
	 * ---------------------------------------------
	 *
	 * 
	 * Use
	 * 
	 * require './upload_helper.php';
	 * 	$ucfgs = array(
	 *				'file' 		=> 'myfile',
	 *				'root_dir' 	=> 'upload',
	 *				'max_size' 	=> 102400
	 *			);
	 *	$upload = new Upload_Helper($ucfgs);
	 *	$upload->upload();
	 *	Echo $upload->getFilePath();
	 *	Echo $upload->getFileName();
	 *	$upload->getError();
	 * 
	 * 
	 */

	class Upload_Helper {

		//form域file name
		private $_file;
		//文件名
		private $_file_name;
		//临时文件名
		private $_tmp_file;
		//文件后缀
		private $_file_ext;
		//文件大小
		private $_file_size;
		//文件上传根目录
		private $_root_dir;
		//文件储存目录
		private $_folder_path;
		//文件存储目录名
		private $_folder_name;
		//新文件名
		private $_file_new_name;
		//文件前缀
		private $_file_fix = '';
		//文件类型
		private $_file_type = array('image/png', 'image/gif', 'image/jpg', 'image/jpeg');
		//错误提示
		private $_error;
		//上传文件限制
		private $_max_size = 5120;
		//是否生成子目录
		private $_is_mkdir = true;


		public function __construct(array $vars){

			if(empty($vars))
				die('上传类中必须要有参数');

			if(is_array($vars)){
				foreach ($vars as $key => $value) {
					$k = '_' . strtolower($key);
					$this->$k = $value;
				}
			}

			$this->_file_name = $_FILES[$this->_file]['name'];
			$this->_tmp_file = $_FILES[$this->_file]['tmp_name'];
			$this->_file_size = $_FILES[$this->_file]['size'] / 1024;
			$this->_file_ext = ereg(".([^\.]+)$",$this->_file_name,$r)? strtolower($r[1]) : '';

			$this->_folder_name = $this->getFolderName();
			$this->_folder_path = $this->_root_dir . DS . $this->_folder_name . DS;

			$this->_file_new_name = $this->getFileNewName() . '.' . $this->_file_ext;
			$this->_file_new_path = $this->_folder_path . $this->_file_new_name;
			
		}

		public function getFileInfo(){
			return $_FILES[$this->_file];
		}

		public function upload(){
			try{
				if(!$this->CheckImage())
					throw new Exception('您上传的不是图片类型');
				if(!$this->CheckSize())
					throw new Exception('您上传的文件超过系统上传限制大小');
				if(!$this->mkFolder())
					throw new Exception('创建目录失败');
				if(!$this->moveFile())
					throw new Exception('系统移动临时文件失败');
					
				return true;	
 
			}catch(Exception $e){
				$this->_error[] = $e->getMessage();
				return false;
			}
		}

		private function CheckImage(){
			$type = false;
			if(in_array($_FILES[$this->_file]['type'], $this->_file_type))
				$type = true;
			elseif($_FILES[$this->_file]['type'] == 'application/octet-stream')
				$type = true;
			else
				$type = false;
			return $type;
		}

		private function CheckSize(){
			if($_FILES[$this->_file]['size'] > $this->_max_size)
				return false;
			else
				return true;
		}

		private function mkRootDir(){
			if(!is_dir($this->_root_dir)){
				if(mkdir($this->_root_dir, 0777))
					return true;
				else
					return false;
			}else{
				return true;
			}
		}
		
		private function mkFolder(){
			if(!is_dir($this->_root_dir . DS .$this->_folder_name)){
				if(mkdir($this->_root_dir . DS .$this->_folder_name, 0777))
					return true;
				else
					return false;
			}else{
				return true;
			}
		}

		private function moveFile(){
			//Echo $this->_tmp_file . '<br />';
			//Echo $this->_file_new_path . '<br />';
			if(@move_uploaded_file($this->_tmp_file, $this->_file_new_path))
				return true;
			else
				return false;
		}

		//获取上传后 的文件路径
		public function getFilePath(){
			return $this->_file_new_path;
		}
		
		public function getFileName(){
			return $this->_file_new_name;
		}
		
		//获取当前上传目录名称
		public function getFolderPath(){
			return $this->_folder_path;
		}
		
		public function getError(){
			pre($this->_error);
		}

		//获取目录名
		private function getFolderName(){
			$date = strtotime(date('Y-m-d'));
			return $date;
		}

		//获取新文件名
		private function getFileNewName(){
			$date = $this->_file_fix . strtotime(date('Y-m-d')) . mt_rand(1000,9999);
			return $date;
		}
		
		


	}

class UploadException extends Exception{}