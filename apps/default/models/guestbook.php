<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Guestbook (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-8-30
	 */
	 
	class Guestbook extends Model {
	
		public function getGBooks($limit){
			$data = $this->db->find(array(
					'order'=>array('id'=>'DESC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
	
	}