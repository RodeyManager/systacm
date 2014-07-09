<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Expand (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-4
	 */
	 
	class Expand_Controller extends SY_Controller {
	
		
		/**
		 *本模块 默认操作
		*/
		public function index(){

			$model = M();
			
			$this->display();
		}
/* 数据库操作 Start */
		public function database(){
			$model = M();
			$tables = $model->Stable();
			$ts = array();
			for ($i=0; $i<count($tables); $i++) {
				$ts[$i]['name'] = $tables[$i]['Name'];
				$ts[$i]['table'] = substr($tables[$i]['Name'], stripos($tables[$i]['Name'], '_')+1, strlen($tables[$i]['Name']));
				$ts[$i]['engine'] = $tables[$i]['Engine'];
				$ts[$i]['collation'] = $tables[$i]['Collation'];
				$ts[$i]['rows'] = $tables[$i]['Rows'] . ' 条';
				$ts[$i]['length'] = $tables[$i]['Data_length'] + $tables[$i]['Index_length'];
				$ts[$i]['length'] = round($ts[$i]['length'] / 1024, 2) . ' KB';
				$ts[$i]['free'] = $tables[$i]['Data_free'];
				$ts[$i]['comment'] = $tables[$i]['Comment'];
			}
			unset($tables);
			$this->assign('tables', $ts);
			$this->display();
		}
		public function htable(){
			if(!isset($_POST['name']) || '' == trim($_POST['name'])) { Dcho('NO'); }
			if(!isset($_POST['type']) || '' == trim($_POST['type'])) { Dcho('NO'); }
			$name = trim($_POST['name']);
			$type = trim(strtoupper($_POST['type']));
			$model = M();
			if(isset($_POST['flag']) && $_POST['flag'] == 'ats'){
				$name = rtrim($name, ',');
				$names = explode(',', $name);
				foreach ($names as $key => $value) {
					$data = $model->H_table($value, $type);
				}
			}else{
				$data = $model->H_table($name, $type);
			}
			Echo ($data > 0) ? 'OK' : 'NO';
		}
		public function get_table_formation(){
			if(!isset($_POST['name']) || '' == trim($_POST['name'])) { Dcho('NO'); }
			if(!isset($_POST['type']) || '' == trim($_POST['type'])) { Dcho('NO'); }
			$name = DB_PRE.rtrim($_POST['name'], DB_PRE);
			$type = trim(strtoupper($_POST['type']));
			$m = M();
			$sql = "DROP TABLE IF EXISTS `". $name ."`;\n";
			$create = $m->doSQL('SHOW CREATE TABLE `'. $name .'` ');
			$sql .= $create['Create Table'].";\n\n";
			$nbsp = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			$sql = str_replace(';', ";<br/>", $sql);
			$sql = str_replace('` (', "(<br/>$nbsp", $sql);
			$sql = str_replace(',', ",<br/>$nbsp", $sql);
			$sql = str_replace(') ENGINE=', '<br/>) ENGINE=', $sql);
			Echo $sql;
		}
		public function export(){

			$data['tables'] = $_POST['check'];
			$data['shunt'] = $_POST['shunt'];
			$data['format'] = $_POST['format'];
			$data['charset'] = $_POST['charset'];
			$m = M();
			$data['version'] = $m->db->Version();
			$data['version'] = substr($data['version'], 0, stripos($data['version'], '-'));
			$backfile = DATA .'backup';
			mkkdir($backfile);
			$data['file_name'] = $backfile . DS .'systacm_tables_'. date('Ymd_His') . mt_srand(1000) .'.sql';
			$tables = $data['tables'];
			$cts = array();
			$insters = array();
			$sql = '';

			foreach ($tables as $key => $value) {
				$create = $m->doSQL('SHOW CREATE TABLE `'. $value .'` ');
				array_push($cts, $create['Create Table'].";\n\n");
				if($data['format'] == 'MYSQL41' && $data['version'] < '4.1') {
					$sql .= preg_replace("/TYPE\=([a-zA-Z0-9]+)/", "ENGINE=\\1 DEFAULT CHARSET=". $data['charset'], $sql);
				}
				if($data['version'] > '4.1' && $data['charset']) {
					$sql .= preg_replace("/(DEFAULT)*\s*CHARSET=[a-zA-Z0-9]+/", "DEFAULT CHARSET=". $data['charset'], $sql);
				}
				$table['sstr'] = 'SELECT * FROM `'. $value .'`';
				$table['table'] = str_replace(DB_PRE, '', $value);
				$table['rows'] = $m->getAll($table['table']);
				$table['num_rows'] = $m->db->num_rows($table['sstr']);

				for ($j=0; $j < $table['num_rows']; $j++) { 
					array_push($insters, $table['rows'][$j]);
				}
			}
			foreach ($cts as $key => $value) {
				$sql .= (string)$value;
			}
			foreach ($insters as $key => $value) {
				$sql .= "INSERT INTO `". $value ."` VALUES(";
				$comma = '';
				foreach($value as $k => $v){
					$sql .= $comma .'\''. $v .'\'';
					$comma = ',';
				}
				$sql .= ");\n";
			}
			$sql = "# SYSTacm backup_file\n# version:SYSTacm\n# time:".date('Y-m-d H:i:s')."\n# type:SYSTacm\n# SYSTacm:http://www.systacm.com\n# --------------------------------------------------------\n\n\n". $sql;

			@chmod($data['file_name'], 0777);
			$data['data'] = file_put_contents($data['file_name'], $sql);

			Echo ($data['data'] > 0) ? 'OK' : 'NO';
			if($data){
				Logging(2, $this->lang['databese'], $this->lang['backup'], $this->lang['backup'].$this->lang['success'], 1);
			}else{
				Logging(2, $this->lang['databese'], $this->lang['backup'], $this->lang['backup'].$this->lang['fail'], 1);
			}
			unset($data);
		}
		public function database_list(){
			$backfiles = glob(DATA .'backup/*.sql');
			$files = array();
			if($backfiles){
				if(is_array($backfiles)){
					foreach ($backfiles as $item => $file) {
						if(preg_match('/(systacm_tables_[0-9]{8}_[0-9]{6})\.sql/i', basename($file), $num)){
							$files[$item]['name'] = basename($file);
							$files[$item]['size'] = round(filesize($file) / (1024*1024), 2);
							$files[$item]['shunt'] = $item + 1;
							$files[$item]['time'] = date('Y-m-d H:i:s',filemtime($file));
						}
					}
				}
			}
			$this->assign('files', $files);
			unset($backfiles);
			unset($files);
			$this->show();
		}
		public function del_backfile(){
			$names = $_POST['id'];
			if(strpos($names, ',') !== false){
				$names = explode(',', $names);
				array_pop($names);
				foreach ($names as $item => $file) {
					if(file_exists(DATA .'backup'. DS . $file) && is_writable(DATA .'backup'. DS . $file)){
						$data = @unlink(DATA .'backup'. DS . $file);
					}else{
						$data = false;
					}
				}
			}else{
				if(file_exists(DATA .'backup'. DS . $names) && is_writable(DATA .'backup'. DS . $names)){
					$data = @unlink(DATA .'backup'. DS . $names);
				}else{
					$data = false;
				}
			}
			Echo $data ? 'OK' : 'NO';

			/*if($data){
				Logging(2, $this->lang['databese'], $this->lang['backup'], $this->lang['delete'].$this->lang['backup'].$this->lang['success'], 1);
			}else{
				Logging(2, $this->lang['databese'], $this->lang['backup'], $this->lang['delete'].$this->lang['backup'].$this->lang['fail'], 1);
			}*/
		}
		public function import(){
			if(!isset($_POST['name']) || '' == trim($_POST['name'])){ Dcho('NO'); }
			$file = trim($_POST['name']);
			$file = DATA .'backup/'. $file;
			if(!file_exists(DATA .'backup/'. $names) && !is_writable(DATA .'backup/'. $names)){
				Echo 'NO';
				die;
			}else{
				//导入备份数据
				$sqls = file($file);
				$sql_str = '';
				foreach ($sqls as $sql) {
					$sql_str .= $sql;
				}
				$line = explode(";\n", $sql_str);
				$m = M();
				$count = count($line)-1;
				$success = 0;
				$fail = 0;
				for ($i=0; $i < $count; $i++) { 
					$data = $m->doSQL($line[$i]);
					if($data){		$success += 1; }
					else{			$fail +=1; $fail_command[$fail] = $line[$i]; }
				}
				$data = 'OK-+-';
				$data .= '执行完毕！<br />';
				$data .= '总共执行：'. $count .' 条SQL命令语句，<br />';
				$data .= '执行成功：'. $success .' 条SQL命令语句，<br />';
				$data .= '执行失败：'. $fail .' 条SQL命令语句，<br />';
				Echo $data;
				//pre($line);
				Logging(2, $this->lang['databese'], $this->lang['import'], $this->lang['import'].$this->lang['complete'], 1);
			}
		}
		public function sqlcmd(){
			$model = M();
			$tables = $model->Stable();
			$ts = array();
			for ($i=0; $i<count($tables); $i++) {
				$ts[$i]['name'] = $tables[$i]['Name'];
				$ts[$i]['table'] = substr($tables[$i]['Name'], stripos($tables[$i]['Name'], '_')+1, strlen($tables[$i]['Name']));
				$ts[$i]['rows'] = $tables[$i]['Rows'] . ' 条';
				$ts[$i]['length'] = $tables[$i]['Data_length'] + $tables[$i]['Index_length'];
				$ts[$i]['length'] = round($ts[$i]['length'] / 1024, 2) . ' KB';
				$ts[$i]['free'] = $tables[$i]['Data_free'];
				$ts[$i]['comment'] = $tables[$i]['Comment'];
			}
			$this->assign('tables', $ts);
			$this->display();
		}
		public function run_sql(){
			$m = M();
			$data = $m->doSQL($_POST['sqlcmd']);
			if(empty($data)){
				$data = '未查询到任何数据或者SQL语句错误！';
			}
			Logging(2, $this->lang['databese'], $this->lang['run_sql'], $this->lang['del'].$this->lang['complete'], 1);
			pre($data);
		}
/* 数据库操作 End */

/* 病毒扫描 Start */
		public function file_check(){
			$this->display();
		}



		public function file_auto_check(){
			$dir_root = dir("./");
			$dir = array();
			$doup = array();
			while (false !== ($entry = $dir_root->read())) {
				if($entry != '.' || $entry != '..'){
					$dir[] = $entry;
				}
			}
			//$dir_root->close();
			foreach ($dir as $key => $value) {
				if($value === '.' || $value === '..'){
					continue;
				}else{
					if(is_dir('./'. $value)){
						//Bcho('./'. $value.'  Y-----');
						$files = glob('./'.$value. '/*.php');
						if(is_array($files) && count($files) > 0){
							foreach ($files as $k => $file) {
								$content = file_get_contents($file);
								$regs = explode('|',$_POST['file_code']);
								foreach ($regs as $r => $pattern) {
									if(preg_match('/'. $pattern .'/', $content)){
										$doup[] = $file;
									}
								}
							}
						}else{
							continue;	
						}
					}else{
						$content = file_get_contents($value);
						if(preg_match('/SY_Controller/', $content)){
							$doup[] = $value;
						}
					}
				}
			}
			//Echo
			if(count($doup) > 0){
				foreach ($doup as $key => $value) {
					Echo '<tr>';
					Echo '<td class="alignf">可疑文件：'. $value .'</td>';
					Echo '<td>';
					Echo '<a href="javascript:void(0);" style="margin-left:50px;">删除</a>';
					Echo '<a href="'. SITE_URL .'/admin/expand/view_code?filename='. $value .'" style="margin-left:50px;">查看源码</a>';
					Echo '</td></tr>';
				}
			}

			Logging(2, '病毒扫描', '扫描病毒', '扫描成功！', 1);
		}

		public function view_code(){
			$file_name = $_GET['filename'];
			$strs = file($file_name);
			$sql_str = '';
			foreach ($strs as $str) {
				$sql_str .= $str."<br />";
			}
			$this->assign('code', $sql_str);
			$this->assign('file_name', $file_name);
			$this->display();
		}

		public function scan_virus(){
			$this->display();
		}

/* 病毒扫描 End */
/* 日志 Start */
		public function sys_log(){
			$log = M('user');
			$total = $log->getRows('log');
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$logs = $log->getLogs($limit);
			if(!$logs){
				$logs = '暂无数据';
			}else{
				foreach ($logs as $key => $value) {
					//如果用户不存在则显示ip地址, 一般用户统计非法登录或者是暴力破解
					if($value['user_id'] != 0){
						$user = $log->find_by_id($value['user_id'], 'user');
						$logs[$key]['user'] = $user['name'];
					}else{
						$logs[$key]['user'] = $value['ip'];
					}
				}
			}
			
			//Bcho($urows);
			load_helper('pagetion');
			$pcfg = array(
					'page' 	=> $page,
					'total' => $total,
					'size'	=> PAGE_SIZE,
					'link'	=> $this->vars['__URL__'],
					'link_class' => 'page_link'
				);
			$pagetion = new Pagetion_Helper($pcfg);
			$pagelink = $pagetion->pageLinks();
			
			$this->assign('logs', $logs);
			$this->assign('page_link', $pagelink);
			$this->show('log_list');
		}
		public function del_log(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$log = M();
			$data = $log->destroy($id, 'log');
			Echo ($data > 0) ? 'OK' : 'NO';
		}
		public function clear_log(){
			$m = M();
			$data = $m->H_table('log', 'TRUNCATE');
			Echo ($data > 0) ? 'OK' : 'NO';
		}
		public function clear_week_log(){
			$m = M();
			$data = $m->doSQL('DELETE FROM `'. DB_PRE. 'log` WHERE `add_time`<'. strtotime('last week'));
			Echo ($data > 0) ? 'OK' : 'NO';
		}
		public function clear_month_log(){
			$m = M();
			$data = $m->doSQL('DELETE FROM `'. DB_PRE. 'log` WHERE `add_time`<'. strtotime('last month'));
			Echo ($data > 0) ? 'OK' : 'NO';
		}
/* 日志 End */
/* IP管理 Start */
		public function ipbans(){

			$ipban = M();
			$total = $ipban->getRows('ipbans');
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$ipbans = $this->getIPbans($limit);
			if(!$ipbans){
				$ipbans = '暂无数据';
			}
			load_helper('pagetion');
			$pcfg = array(
					'page' 	=> $page,
					'total' => $total,
					'size'	=> PAGE_SIZE,
					'link'	=> $this->vars['__URL__'],
					'link_class' => 'page_link'
				);
			$pagetion = new Pagetion_Helper($pcfg);
			$pagelink = $pagetion->pageLinks();

			$this->assign('ipbans', $ipbans);
			$this->display();
		}

		private function getIPbans($limit){
			$ipban = M();
			$data = $ipban->find(array(
					'table'=>'ipbans',
					'order'=>array('id'=>'desc'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}

		public function add_ipban(){
			if(empty($_POST['ipaddrs'])){ Dcho('UIPS'); }
			if(empty($_POST['eunlock_time'])){
				$data['eunlock_time'] = 0;
			}else{
				$data['eunlock_time'] = strtotime($_POST['eunlock_time']);
			}
			$data['reason'] = empty($_POST['reason']) ? '' : trim($_POST['reason']);
			$data['ip_addrs'] = rtrim($_POST['ipaddrs'], ',');
			$ipban = M();
			if(strpos($data['ip_addrs'], ',') !== false){
				$ips = explode(',', $data['ip_addrs']);
				foreach ($ips as $key => $value) {
					$ip = $ipban->find_by('ip_addr', $value, 'ipbans');
					if($ip>0){ continue; }
					$data['ip_addr'] = $value;
					$rs = $ipban->add($data, 'ipbans');
				}
			}else{
				$ip = $ipban->find_by('ip_addr', $data['ip_addr'], 'ipbans');
				if($ip>0){ Dcho('IPIN'); }
				$rs = $ipban->add($data, 'ipbans');
			}
			if($rs > 0){
				Logging('success', 'IP管理', '添加IP', '添加成功！', 1);
			}else{
				Logging('error', 'IP管理', '添加IP', '添加失败！', 1);
			}
			Dcho(($rs > 0) ? 'OK' : 'NO');
		}

		public function del_ipban(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){ Dcho('NO'); }
			$ipban = M();
			$data = $ipban->destroy($id, 'ipbans');
			if($data > 0){
				Logging('success', 'IP管理', '删除IP', '删除成功！', 1);
			}else{
				Logging('error', 'IP管理', '删除IP', '删除失败！', 1);
			}
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
/* IP管理 End */
/* 邮件订阅 Start */
		public function subemail(){
			$subemail = M();
			$total = $subemail->getRows('subemail');
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$subemails = $this->getSubEmails($limit);
			if(!$subemails){
				$subemails = '暂无数据';
			}
			load_helper('pagetion');
			$pcfg = array(
					'page' 	=> $page,
					'total' => $total,
					'size'	=> PAGE_SIZE,
					'link'	=> $this->vars['__URL__'],
					'link_class' => 'page_link'
				);
			$pagetion = new Pagetion_Helper($pcfg);
			$pagelink = $pagetion->pageLinks();

			$this->assign('subemails', $subemails);
			$this->display();
		}
		private function getSubEmails($limit, $page_size = PAGE_SIZE){
			$subemail = M();
			$data = $subemail->find(array(
					'table'=>'subemail',
					'order'=>array('id'=>'desc'),
					'limit'=>array('start'=>$limit, 'end'=>$page_size)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
		public function del_subemail(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){ Dcho('NO'); }
			$subemail = M();
			$data = $subemail->destroy($id, 'subemail');
			if($data > 0){
				Logging('success', '邮件管理', '删除邮件', '删除成功！', 1);
			}else{
				Logging('error', '邮件管理', '删除邮件', '删除失败！', 1);
			}
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		//推送邮件
		public function send_email(){
			$emails = !empty($_GET['emails']) ? $_GET['emails'] : '';

			$subemails = $this->getSubEmails(0, 50);
			if(!$subemails){
				$subemails = '暂无数据';
			}
			$this->assign('subemails', $subemails);
			$this->assign('emails', $emails);
			$this->display();
		}
		public function email_sending(){
			$data['emails'] = !empty($_POST['emails']) ? rtrim($_POST['emails'], ',') : Dcho('UEMILAS');
			$data['etitle'] = !empty($_POST['etitle']) ? trim($_POST['etitle']) : Dcho('UETITLE');
			$data['econtent'] = !empty($_POST['econtent']) ? $_POST['econtent'] : Dcho('UECONTENT');
			$data['send_time'] = !empty($_POST['send_time']) ? strtotime(trim($_POST['send_time'])) : NOW_TIME;
			$data['emails'] = explode(',', $data['emails']);
			$session = new session();
			$user = unserialize($session->user);
			$data['send_name'] = !empty($_POST['send_name']) ? trim($_POST['send_name']) : $user['name']; 
			
			//email configs
			/*$emails = get_cfgs('email');
			$smtp = $emails['host'];
			$from_email = $emails['from_email'];
			$from_pass = $emails['from_pass'];
			$from_name = $emails['from_name'];*/
			$smtp = get_cfgs('email_host');
			$from_email = get_cfgs('email_from_addr');
			$from_pass = get_cfgs('email_from_pass');
			$from_name = get_cfgs('email_from_name');
			//pre($data);die;
			//统计
			$success = 0;
			$fail = 0;
			$success_list = '';
			$fail_list = '';

			foreach ($data['emails'] as $key => $value) {
				$rs = send_email($smtp, $from_email, $from_pass, $from_name, $value, $to_name, $data['etitle'], $data['econtent']);
				if($rs){
					$success += 1;
					$success_list .= $value .'<br />';
				}else{
					$fail += 1;
					$fail_list .= $value .'<br />';
				}
			}
			$success_list = '发送成功数：'. $success ."<br \/>成功列表: <br \/>". $success_list;
			$fail_list = '发送失败数：'. $fail ."<br \/>失败列表: <br \/>". $fail_list;
			Echo $success_list .'<br /><br /><br />'. $fail_list. '<br />'; 
			if($success == 0){
				Logging('error', '邮件订阅', '发送邮件', '发送失败！', 1);
			}else{
				Logging('success', '邮件订阅', '发送邮件', '发送成功！', 1);
			}
		}
/* 邮件订阅 End */
/* 短息群发 Start */
		public function subphone(){
			$subphone = M();
			$total = $subphone->getRows('subphone');
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$subphones = $subphone->getRecord($limit, 'subphone');
			if(!$subphones){
				$subphones = '暂无数据';
			}
			load_helper('pagetion');
			$pcfg = array(
					'page' 	=> $page,
					'total' => $total,
					'size'	=> PAGE_SIZE,
					'link'	=> $this->vars['__URL__'],
					'link_class' => 'page_link'
				);
			$pagetion = new Pagetion_Helper($pcfg);
			$pagelink = $pagetion->pageLinks();

			$this->assign('subphones', $subphones);
			$this->display();
		}
		public function send_phone(){
			$subphones = $this->getSubPhones(0, 50);
			if(!$subphones){
				$subphones = '暂无数据';
			}
			$this->assign('subphones', $subphones);
			$this->display();
		}
		private function getSubPhones($limit, $page_size = PAGE_SIZE){
			$subphone = M();
			$data = $subphone->find(array(
					'table'=>'subphone',
					'order'=>array('id'=>'desc'),
					'limit'=>array('start'=>$limit, 'end'=>$page_size)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
		}
		public function del_subphone(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){ Dcho('NO'); }
			$subemail = M();
			$data = $subemail->destroy($id, 'subphone');
			if($data > 0){
				Logging('success', '短信群发管理', '删除短信', '删除成功！', 1);
			}else{
				Logging('error', '短信群发管理', '删除短信', '删除失败！', 1);
			}
			Dcho(($data > 0) ? 'OK' : 'NO');
		}
		public function phone_sending(){
			$data['phones'] = !empty($_POST['phones']) ? rtrim($_POST['phones'], ',') : Dcho('UPHONES');
			$data['pcontent'] = !empty($_POST['pcontent']) ? $_POST['pcontent'] : Dcho('UPCONTENT');
			$data['send_time'] = !empty($_POST['send_time']) ? strtotime(trim($_POST['send_time'])) : NOW_TIME;
			$data['phones'] = explode(',', $data['phones']);
			$session = new session();
			$user = unserialize($session->user);
			$data['send_name'] = !empty($_POST['send_name']) ? trim($_POST['send_name']) : $user['name']; 
			
			//phone configs
			
			//pre($data);die;
			//统计
			$success = 0;
			$fail = 0;
			$success_list = '';
			$fail_list = '';
			foreach ($data['phones'] as $key => $value) {
				$rs = send_phone($value, $data['pcontent']);
				if($rs){
					$success += 1;
					$success_list .= $value .'<br />';
				}else{
					$fail += 1;
					$fail_list .= $value .'<br />';
				}
			}
			$success_list = '发送成功数：'. $success ."<br \/>成功列表: <br \/>". $success_list;
			$fail_list = '发送失败数：'. $fail ."<br \/>失败列表: <br \/>". $fail_list;
			Echo $success_list .'<br /><br /><br />'. $fail_list. '<br />'; 
			if($success == 0){
				Logging('error', '短信群发', '发送短息', '发送失败！', 1);
			}else{
				Logging('success', '短信群发', '发送短息', '发送成功！', 1);
			}
		}
/* 短息群发 End */
	
	}