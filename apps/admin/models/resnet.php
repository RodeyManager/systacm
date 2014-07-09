<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Resnet (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Resnet extends Model {
	
		public function getResnets($limit){
			$data = $this->db->find(array(
					'order'=>array('add_time'=>'ASC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}

		public function getResnetTypes($limit){
			$data = $this->db->find(array(
					'table'=>'resnettype',
					'order'=>array('id'=>'ASC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
	
	}