<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Goods (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Goods extends Model {
	
		public function getGoods($limit){
			$data = $this->db->find(array(
					'order'=>array('add_time'=>'DESC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
	
	}