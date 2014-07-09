<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Sms (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Sms extends Model {
	
		public function getSms($limit, $data){
			if(!empty($data) && is_array($data)){
				if(!empty($data['type_id'])){
					$where = array('type'=>1, 'type_id'=>$data['type_id']);
				}elseif(!empty($data['from_id'])){
					$where = array('type'=>1, 'from_id'=>$data['from_id']);
				}elseif(!empty($data['to_id'])){
					$where = array('type'=>1, 'to_id'=>$data['to_id']);
				}else{
					$where = array('type'=>1);
				}
			}else{
				$where = array('type'=>1);
			}
			$data = $this->db->find(array(
					'where'=>$where,
					'order'=>array('add_time'=>'DESC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}

		public function getSms_group($limit){
			$data = $this->db->find(array(
					'where'=>array('type'=>2),
					'order'=>array('add_time'=>'ASC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
	
	}