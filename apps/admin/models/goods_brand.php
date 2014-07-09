<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Goods_brand (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Goods_brand extends Model {
	
		public function getBrands($limit){
			$data = $this->db->find(array(
					'order'=>array('sort'=>'ASC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
	
	}