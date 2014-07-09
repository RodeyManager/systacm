<?php

	class Setting_Controller extends SY_Controller{

		public function index(){
			$m = M();

			//基本设置
			$bases = $m->find(array('table'=>'config', 'where'=>array('group_id'=>1) ));
			$waters = $m->find(array('table'=>'config', 'where'=>array('group_id'=>2) ));
			$attacs = $m->find(array('table'=>'config', 'where'=>array('group_id'=>3) ));
			$emails = $m->find(array('table'=>'config', 'where'=>array('group_id'=>4) ));
			$mbs = $m->find(array('table'=>'config', 'where'=>array('group_id'=>6) ));
			$maps = $m->find(array('table'=>'config', 'where'=>array('group_id'=>7) ));
			$safes = $m->find(array('table'=>'config', 'where'=>array('group_id'=>8) ));

			$this->assign('bases', $bases);
			$this->assign('waters', $waters);
			$this->assign('attacs', $attacs);
			$this->assign('emails', $emails);
			$this->assign('mbs', $mbs);
			$this->assign('maps', $maps);
			$this->assign('safes', $safes);
			$this->display();
		}
		/* 配置项 */
		public function create_set(){
			if(!isset($_POST['var_name']) || ''==trim($_POST['var_name'])) { Dcho('NO'); }
			if(!isset($_POST['var_info']) || ''==trim($_POST['var_info'])) { Dcho('NO'); }
			if(!isset($_POST['var_type']) || ''==trim($_POST['var_type'])) { Dcho('NO'); }
			if(!isset($_POST['group_id']) || ''==trim($_POST['group_id'])) { Dcho('NO'); }
			if(trim($_POST['var_value'] != '')) {
				$data['var_value'] = trim($_POST['var_value']);
			}
			if(trim($_POST['var_rmark']) != '') {	$data['var_rmark'] = trim($_POST['var_rmark']); }
			$data['var_name'] = trim($_POST['var_name']);
			$data['var_info'] = trim($_POST['var_info']);
			$data['var_type'] = trim($_POST['var_type']);
			$data['group_id'] = intval(trim($_POST['group_id']));
			$m = M();
			$data = $m->add($data, 'config');
			Echo ($data>0) ? 'OK' : 'NO';
		}

		public function mod_set(){
			if(isset($_POST['mod__submit'])){
				array_pop($_POST);
			}
			$data['id'] = isset($_POST['ids']) ? $_POST['ids'] : Dcho('NO');
			array_shift($_POST);
			//array_pop($_POST);
			$posts = $_POST;
			foreach ($_POST as $key => $value) {
				$data['var_name'][] = str_replace('mod__', '', $key);
				$data['var_value'][] = trim($value);
			}
			//$datas = array_combine($data['var_name'], $data['var_value']);
			for ($i=0; $i < count($data['id']); $i++) { 
				//$datas[$i]['id'] = $data['id'][$i];
				//$datas[$i]['var_name'] = $data['var_name'][$i];
				$datas[$i]['var_value'] = $data['var_value'][$i];
			}
			$m = M();
			$data = $m->updates($datas, $data['id'], 'config');
			Dcho($data>0 ? 'OK' : 'NO');
			//Echo ($data > 0) ? 'OK' : 'NO';
		}

		function check_var(){
			if(!isset($_POST['varn']) || ''==trim($_POST['varn'])) { Dcho('ERROR'); }
			if(!preg_match('/^[a-zA-Z0-9_]{1,}$/', trim($_POST['varn']))) { Dcho('FORMAT_ERROR'); }
			$m = M();
			$data = $m->find_by('var_name', trim($_POST['varn']), 'config');
			Dcho($data>0 ? 'OK' : 'NO');
		}
		//
		public function del_var(){
			if(!isset($_POST['id']) || trim($_POST['id']) == ''){ Dcho('NO'); }
			$id = trim($_POST['id']);
			$var = M();
			$data = $var->destroy($id, 'config');
			Dcho($data>0 ? 'OK' : 'NO');
		}
		//生成配置文件
		function build_config(){
			$filename = isset($_POST['filename']) ? trim($_POST['filename']) : Dcho('NO');
			$m = M();

			//基本设置
			$sets = $m->getAll('config');
			if($sets){
				if($filename != ''){
					$file = '.'. DS .'configs'. DS . $filename;
				}else{
					$file = '.'. DS .'configs'. DS .'sys_config.php';
				}
				$back = $file .'.back';
				if(file_exists($file) && is_writable($file)){
					if(file_exists($back)){
						@unlink($back);
					}
					rename($file, $file .'.back');
				}
				
				$con = "<?php\n\t";
				$con .= "/**\n\t";
				$con .=	"* (系统配置文件)\n\t";
				$con .=	"* Author: 	Rodey\n\t";
				$con .=	"* Email : 	Rodeyluo@gmail.com\n\t";
				$con .=	"* QQ 	 : 	453474593\n\t";
				$con .=	"* Date  : 	". date('Y-m-d H:i:s') ."\n\t";
				$con .=	"*/\n\n\n\t";
				foreach ($sets as $key => $value) {
					$con .= '/*'. $value['var_info'] ."*/\n\t";

					if($value['var_type'] == 'string' || $value['var_type'] == 'bigstring'){
						$con .= '$cfgs[\''. $value['var_name'] .'\'] = \''. $value['var_value'] ."';\n\n\t";
					}elseif($value['var_type'] == 'int'){
						if($value['var_value'] == ''){ $value['var_value'] = 0; }
						$con .= '$cfgs[\''. $value['var_name'] .'\'] = '. $value['var_value'] .";\n\n\t";
					}elseif($value['var_type'] == 'bool'){
						if($value['var_value'] == '1'){
							$con .= '$cfgs[\''. $value['var_name'] .'\'] = true'.";\n\n\t";
						}else{
							$con .= '$cfgs[\''. $value['var_name'] .'\'] = false'.";\n\n\t";
						}
					}
				}
				$con .= "\n\n\n\n //End\n?>";
				$data = file_put_contents($file, $con);
				if($data > 0){
					Dcho('OK');
					unset($contents);
					unset($con);
					Logging(2, $this->lang['site_set'], $this->lang['build_config'], $this->lang['build_config'].$this->lang['success'], 1);
					die;
				}else{
					Dcho('NO');
					unset($contents);
					unset($con);
					Logging(0, $this->lang['site_set'], $this->lang['build_config'], $this->lang['build_config'].$this->lang['error'], 1);
					die;
				}
			}else{
				Dcho('NO');
			}
		}

		/* 敏感词 */
		public function baword(){
			$baword = M('keyword');
			$total = $baword->getRows('baword');
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$bawords = $baword->getBawords($limit);
			//载入分页类
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
			if(!$bawords) 	$bawords = '暂无数据';
			$this->assign('bawords', $bawords);
			$this->assign('page_link', $pagelink);
			$this->display('baword');
		}
		public function add_bw(){
			if(!isset($_POST['baword']) || '' == trim($_POST['baword']))	Dcho('NO');
			$data['baword'] = trim($_POST['baword']);
			$data['reword'] = trim($_POST['reword']) 	? trim($_POST['reword']) : '';
			$data['level']  = trim($_POST['level']) 	? trim($_POST['level']) : 1;
			$data['add_time'] = NOW_TIME;
			$m = M();
			$rs = $m->find_by('baword', $data['baword'], 'baword');
			if($rs > 0) { Dcho('IN'); }
			$data = $m->add($data, 'baword');
			Echo ($data > 0) ? 'OK' : 'NO';
		}
		public function add_bws(){
			if(!isset($_POST['bawords']) || '' == trim($_POST['bawords']))	{ Dcho('NO'); }
			$bawords = rtrim(trim($_POST['bawords']), ',');
			if(stripos($bawords, ',') === false)	{ Dcho('NO'); }
			$bawords = explode(',', $bawords);
			$baword = M();
			$rs = false;
			foreach ($bawords as $key => $value) {
				if(stripos($value, ':') !== false){
					$line = explode(':', $value);
					if(empty($line[0])) { Dcho('NO'); }
					if(empty($line[1])) { $line[1] = ''; }
					if(empty($line[2]) || !is_int($line[2]) || strlen($line[2]) > 1) { $line[2] = 1;  }
					$data['baword'] 	= $line[0];
					$data['reword'] 	= $line[1];
					$data['level'] 		= $line[2];
					$data['add_time'] 	= NOW_TIME;
					//检查是否已经存在
					$is_bein 			= $baword->find_by('baword', $data['baword'], 'baword');
					if($is_bein > 0)	{ array_shift($bawords); continue; }
					$rs 				= $baword->add($data, 'baword');
				}else{
					Dcho('NO');
				}
			}
			//pre($bawords);
			unset($is_bein);
			unset($baword);
			Echo ($rs > 0) ? 'OK' : 'NO';
		}
		public function del_bw(){
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			if(!isset($id)){
				Echo 'NO';
				return false;
			}
			$baword = M();
			$data = $baword->destroy($id, 'baword');
			if($data > 0) 		Echo 'OK';
			else 				Echo 'NO';
		}

		public function check_bw(){
			if(!isset($_POST['varn']) || '' == trim($_POST['varn'])) 	{ Dcho('NO'); }
			$m = M();
			$data = $m->find_by('baword', trim($_POST['varn']), 'baword');
			Echo ($data > 0) ? 'OK' : 'NO';
		}

		/* Map S */
		public function map(){
			$m = M();
			$maps = $m->find(array('table'=>'config', 'where'=>array('group_id'=>7) ));
			$map = array();
			if($maps){
				foreach ($maps as $key => $value) {
					$map[$value['var_name']] = $value['var_value'];
				}
			}
			
			$this->assign('map', $map);
			$this->display();
		}

		public function set_map(){
			if(!isset($_POST['mapx']) || '' == trim($_POST['mapx']))	{ Dcho('NO'); }
			if(!isset($_POST['mapy']) || '' == trim($_POST['mapy']))	{ Dcho('NO'); }
			if(!isset($_POST['mapz']) || '' == trim($_POST['mapz']))	{ Dcho('NO'); }
			$data['mapx'] = trim($_POST['mapx']);
			$data['mapy'] = trim($_POST['mapy']);
			$data['mapz'] = trim($_POST['mapz']);
			$map = M();
			foreach ($data as $key => $value) {
				$sql = "UPDATE `". DB_PRE ."config` SET `var_value`='". $value. "' WHERE `var_name`='". $key ."'";
				$rs = $map->doSQL($sql);
			}
			Echo ($rs > 0) ? 'OK' : 'NO';
		}
		/* Map E */

		/* Email S */
		public function email(){
			$m = M();
			$emails = $m->find(array('table'=>'config', 'where'=>array('group_id'=>4) ));
			$this->assign('emails', $emails);
			$this->display();
		}

		public function mail_test(){
			if(!isset($_POST['tomail']) || '' == trim($_POST['tomail']))  { Dcho('NO'); }
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
			$to_email = trim($_POST['tomail']);
			$to_name = $data['name'];
			$title = 'SYSTacm邮件发送测试提示！';
			$body = '<h3>您好！您的邮件发送成功了！</h3>';

			/*pre('stmp='. $smtp ."<br />". 'from_email='. $from_email ."<br />". 'from_pass='. $from_pass ."<br />". 'from_name='. $from_name. '========<br />');
			pre('stmp='. $smtp2 ."<br />". 'from_email='. $from_email2 ."<br />". 'from_pass='. $from_pass2 ."<br />". 'from_name='. $from_name2);
			die;*/

			$rs = send_email($smtp, $from_email, $from_pass, $from_name, $to_email, $to_name, $title, $body);
			Dcho( $rs ? 'OK' : 'NO' );
		}
		/* Email E */

		/* Attach S */
		public function attac(){
			$m = M();
			$attacs = $m->find(array('table'=>'config', 'where'=>array('group_id'=>3) ));
			$this->assign('attacs', $attacs);
			$this->display();
		}
		/* Attach E */

		/* Wmaker S */
		public function wmaker(){
			$m = M();
			$waters = $m->find(array('table'=>'config', 'where'=>array('group_id'=>2) ));
			$this->assign('waters', $waters);
			$this->display();
		}
		//上传
		public function upload_wmaker(){
			$session = new session();
			$author = unserialize($session->user);
			//$data['author'] = $author['name'];

			load_helper('upload');

			$file = 'wmaker_pic';
			$file_fix = 'wmaker_';
			$file_path = 'uploadfile/common';
			$ucfgs = array(
					'file' 		=> $file,
					'file_fix' 	=> $file_fix,
					'root_dir' 	=> $file_path,
					'is_mkdir'  => false
				);
			$upload = new Upload_Helper($ucfgs);
			$upload->upload();
			$wmaker = $upload->getFilePath();
			$attac = M('attachment');
			$attacs['file_module'] 	= $session->mod;
			$attacs['file_name'] 	= $upload->getName();
			$attacs['file_size'] 	= $upload->getSize();
			$attacs['file_ext']		= $upload->getExt();
			$attacs['file_path'] 	= $wmaker;
			$attacs['is_image'] 	= in_array($attacs['file_ext'], array('png','gif')) ? 1 : 0;
			$attacs['author'] 		= $author['name'];
			$attacs['add_time'] 	= NOW_TIME;
			$attac->add($attacs);
			Echo BASE_URL .'/'. $wmaker;
			return false;
		}
		/* Wmaker E */

		/* Phone S */
		public function phone(){
			$m = M();
			$phones = $m->find(array('table'=>'config', 'where'=>array('group_id'=>5) ));
			$this->assign('phones', $phones);
			$this->display();
		}
		/* Phone E */

		/* Lang S */
		public function lang(){
			Dcho('语言包管理 请到data文件夹下面的lang中修改');
			//$this->display();
		}
		/* Lang E */

		/* Statistics S */
		public function statistics(){
			Dcho('待编码......');
		}
		/* Statistics S */
	}