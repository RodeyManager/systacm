<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Archive (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-1
	 */
	 
	class Archive extends Model {
	
		public function getArchives($limit){
			$data = $this->db->find(array(
					'order'=>array('add_time'=>'DESC', 'update_time'=>'DESC'), 
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
	
	}