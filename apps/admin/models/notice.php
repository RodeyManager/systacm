<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Notice (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Notice extends Model {
	
		public function getNotices($limit){
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

		public function create($data){
			$fileds = $this->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data['add_time'] = NOW_TIME;
			$session = new Session();
			$user = unserialize($session->user);
			$data['author'] = $user['name'];
			unset($fileds);
			unset($user);
			$data = $this->add($data);
			$data = $data ? true : false;
			return $data;
		}

		public function mod($data){
			$fileds = $this->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data['update_time'] = NOW_TIME;
			unset($fileds);
			
			$data = $this->update($data, $data['id']);
			$data = ($data > 0) ? true : false;
			return $data;
		}
	
	}