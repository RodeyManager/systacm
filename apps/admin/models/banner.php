<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Banner (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-17
	 */
	 
	class Banner extends Model {
	
		public function getBanners($limit){
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

		public function getBanner_types($limit){
			$data = $this->db->find(array(
					'table'=>'banner_type',
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
			$data['add_time'] = now_time();
			$session = new Session();
			$user = unserialize($session->user);
			$data['author'] = $user['name'];
			unset($fileds);
			unset($user);
			if(!isset($_POST['banner_width'])){
				$data['banner_width'] = intval(get_cfgs('catbanner_width'));
			}
			if(!isset($_POST['banner_height'])){
				$data['banner_height'] = intval(get_cfgs('catbanner_height'));
			}
			
			$data = $this->add($data);
			$data = $data ? true : false;
			return $data;
		}

		public function mod($data){
			$fileds = $this->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data['update_time'] = now_time();
			unset($fileds);
			if(empty($data['banner_width']))	$data['banner_width'] = intval(get_cfgs('catbanner_width'));
			if(empty($data['banner_height']))	$data['banner_height'] = intval(get_cfgs('catbanner_height'));
			//pre($data);
			
			$data = $this->update($data, $data['id']);
			$data = ($data > 0) ? true : false;
			return $data;
		}
	
	}