<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Catmodel (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-1
	 */
	 
	class Catmodel extends Model {


		public function getCatmodels($limit){
			$data = $this->db->find(array(
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}

		public function create($post){
			$fileds = $this->getFileds();
			$data = array_intersect_key($post, $fileds);
			$data['add_time'] = $data['update_time'] = now_time();
			if(empty($data['name']) || empty($data['mtable'])){
				return false;
			}
			$data = $this->add($data);
			return ($data > 0) ? true : false;
		}

	}

