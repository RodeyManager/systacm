<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * User_group (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Group extends Model {

		function init(){
			$this->table_name = 'user_group';
		}
	
		public function getGroups($limit=0, $type=true){
			if(!$type){
				$data = $this->db->find(array(
					'order'=>array('id'=>'DESC')
				));
			}else{
				$data = $this->db->find(array(
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			}
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
	
	}