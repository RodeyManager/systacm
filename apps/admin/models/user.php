<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * User (模型)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-1
	 */
	 
	class User extends Model {
	
		public function login($data){
			$admin = $this->find(array(
						'where'=>array('type'=>'AND', 'aname'=>$data['uname'], 'apass'=>$data['upass']),
						'limit'=>array('start' => 0, 'end' => 1),
						'table'=>'manager'
					));
			if($admin){
				$sql = 'SELECT '.DB_PRE.'user.*, '.DB_PRE.'user.id as user_id, '.DB_PRE.'manager.uid, '.DB_PRE.'role.name as role_name 
						FROM '.DB_PRE.'manager 
						LEFT JOIN ('.DB_PRE.'user, '.DB_PRE.'role)
						ON '.DB_PRE.'user.id='.DB_PRE.'manager.uid 
						AND '.DB_PRE.'manager.role='.DB_PRE.'role.id';				
				$admin = $this->doSQL($sql);
				$point = $this->add_point($admin['point'] + 5, $admin['id']);
				if($point > 0) 	$admin['point'] = $admin['point'] + 5;
				return $admin;
			}else{
				return false;
			}
		}
		
		public function getUsers($limit){
			$data = $this->db->find(array(
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}

		public function locking($data, $id){
			if(is_array($id)){
				$data = $this->updates($data, $id);
			}else{
				$data = $this->update($data, $id);
			}
			return $data;
		}

		public function mod_pass($data){
			if(empty($data)) 			return false;
			if(!isset($data['id'])) 		return false;
			if(!isset($data['pass']))	return false;
			$data['pass'] = md5(sha1($data['pass']));
			$data = $this->update(array('pass'=>$data['pass']), $data['id']);
			if($data > 0) 	return true;
			else 			return false;
		}

		//每次登录自动加积分
		public function add_point($point, $id){
			$data = $this->update(array('point'=>$point), $id);
			return $data;
		}

		//增加积分
		public function put_point($user, $money, $sms_type, $title, $body){
			$users = array();
			if(is_array($user)){
				foreach ($user as $value) {
					$u = $this->find_by('name', $value);
					array_push($users, $u);
					$point = intval($u['point']) + $money;
					$data = $this->add_point($point, $u['id']);
				}
			}else{
				$u = $this->find_by('name', $user);
				$point = intval($u['point']) + $money;
				$data = $this->add_point($point, $u['id']);
				$users = array($u);
			}
			//发送消息
			$this->send_msg($sms_type, $users, $title, $body, 3);
			return $data;
		}
		//增加金额
		public function put_money($user, $money, $sms_type, $title, $body)
		{
			$users = array();
			if(is_array($user)){
				foreach ($user as $value) {
					$u = $this->find_by('name', $value);
					array_push($users, $u);
					$money = intval($u['money']) + $money;
					$data = $this->update(array('money'=>$money), $u['id']);
				}
			}else{
				$u = $this->find_by('name', $user);
				$money = intval($u['money']) + $money;
				$data = $this->update(array('money'=>$money), $u['id']);
				$users = array($u);
			}
			//发送消息
			$this->send_msg($sms_type, $users, $title, $body, 4);
			return $data;
		}

		//发送消息列表（指定发送类型）
		private function send_msg($sms_type, $users, $title, $body, $type_id=1){
			foreach ($users as $key => $value) {
				foreach ($sms_type as $k => $v) {
					if($v == 'email'){
						$s = $this->send_email($value['name'], $value['email'], $title, $body);
					}elseif($v == 'sms'){
						$s = $this->send_sms($value['id'], $title, $body, $type_id);
					}elseif($v == 'phone'){
						//$s = $this->send_phone($value['name'], $value['email'], $title, $body);
					}
				}
			}
		}

		//发送邮件
		public function send_email($to_user, $to_email, $title, $body){
			//后去系统邮件配置项
			$emails = get_cfgs('email');
			$smtp = $emails['host'];
			$from_email = $emails['from_email'];
			$from_pass = $emails['from_pass'];
			$from_name = $emails['from_name'];
			$data = send_email($smtp, $from_email, $from_pass, $from_name, $to_email, $to_name, $title, $body);
			return $data;
		}

		public function send_sms($to_id, $title='', $body='', $type_id=1){
			if(empty($to_id) || '' == trim($to_id)){
				return false;
			}
			$data['title'] = ($title == '') ? $this->lang['point_title'] : $title;
			$data['content'] = ($body == '') ? $this->lang['rech_body'] : $body;
			$data['type_id'] = intval($type_id);
			$data['type'] = 1;
			$data['add_time'] = NOW_TIME;
			$session = new session();
			$user = unserialize($session->user);
			$data['from_id'] = $user['id'];
			$data['to_id'] = intval($to_id);
			$data = $this->add($data, 'sms');
		}

		public function upload_headport($data){
			$data = $this->update(array('headport'=>$data['headport']), $data['id']);
			if($data > 0) 	return true;
			else 			return false;
		}

		public function getLogs($limit){
			$data = $this->db->find(array(
					'table'=>'log',
					'order'=>array('id'=>'desc'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}

		public function getComplates($keyword){
			$data = $this->db->doSQL("SELECT * FROM `". DB_PRE.$this->table_name ."` WHERE `name` LIKE '". $keyword ."%' ORDER BY `id` ASC");
			if(!is_array($data[0])){
				$datas[0] = $data;
				return $datas;
			}else{
				return $data;
			}
		}
	
	}