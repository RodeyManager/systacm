<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Sms_type (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Sms_type extends Model {
	
		public function getSms_types($limit){
			if(empty($limit)){
				$data = $this->getAll();
			}else{
				$data = $this->db->find(array(
					'order'=>array('id'=>'ASC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			}
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}


		//添加消息类型
		public function add_sms_type($data){
			if(!isset($data['type_name']) && '' == trim($data['type_name'])){ return false; }
			$types['name'] = trim($data['type_name']);
			$types['icon'] = (isset($data['icon']) && '' != trim($data['icon'])) ? trim($data['icon']) : '';
			$types['disabled'] = 1;
			$types['add_time'] = NOW_TIME;
			$data = $this->add($types);
			if($data){
				return $this->find_by('name', $types['name']);
			}else{
				return false;
			}
		}

		public function edit_sms_type($data){
			if(!isset($data['type_name']) && '' == trim($data['type_name'])){ return false; }
			$types['name'] = trim($data['type_name']);
			$types['icon'] = (isset($data['icon']) && '' != trim($data['icon'])) ? trim($data['icon']) : '';
			return $this->update($types, $data['type_id']);
		}







	}