<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * User_group (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Mall extends Model {

		/*function init(){
			$this->table_name = 'goods_brand';
		}*/
	
		public function getBrands($limit){
			$data = $this->db->find(array(
					'table'=>'goods_brand',
					'order'=>array('sort'=>'ASC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}

		public function getGcats($limit){
			$data = $this->db->find(array(
					'table'=>'goods_cat',
					'order'=>array('sort'=>'ASC')
					//'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
	
	}