<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * Guestbook (控制器)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-8-30
	 */
	 
	class Guestbook_Controller extends SY_Controller {


		public function index(){
			$gbook = M('guestbook');
			$total = $gbook->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$gbooks = $gbook->getGBooks($limit);
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
			if(!$gbooks) 	$gbooks = '暂无数据';
			foreach ($gbooks as $key => $value) {
				$gbt = $gbook->find_by_id($value['pid'], 'guestbook_type');
				$gbooks[$key]['type'] = $gbt['name']; 
				if($value['reply'] == 0){
					$gbooks[$key]['reply'] = '未回复';
					$gbooks[$key]['reply_num'] = 0;
				}else{
					$reply_num = $gbook->getRows('guestbook_reply', array('where'=>array('gid'=>$value['id'])));
					$gbooks[$key]['reply_num'] = $reply_num;
					$gbooks[$key]['reply'] = '已回复';
				}
			}
			$this->assign('gbooks', $gbooks);
			$this->assign('page_link', $pagelink);
			$this->display('list');
		}

		public function index_block(){
			$gbook = M('guestbook');
			$total = $gbook->getRows();
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			if($total == PAGE_SIZE)		$page = 1;
			if($page == 1)				$limit = 0;
			else 						$limit = PAGE_SIZE * ($page - 1);
			$gbooks = $gbook->getGBooks_Block($limit, PAGE_SIZE);
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
			if(!$gbooks) 	$gbooks = '暂无数据';
			foreach ($gbooks as $key => $value) {
				$gbt = $gbook->find_by_id($value['pid'], 'guestbook_type');
				$gbooks[$key]['type'] = $gbt['name'];
				if($value['reply'] == 0){
					$gbooks[$key]['reply'] = '未回复';
					$gbooks[$key]['reply_num'] = 0;
				}else{
					$gbooks[$key]['reply'] = '已回复';
					$gbooks[$key]['reply_num'] = $gbook->getRows('guestbook_reply', array('where'=>array('gid'=>$value['id'])));
					//$reply_list= $gbook->find_by('gid', $value['id'], 'guestbook_reply');
					//$gbooks[$key]['reply_list'] = array_rand($reply_list, 3);
					$reply_list = $gbook->getTop(0, 5, 'guestbook_reply', '`gid`='. $value['id']);
					if(empty($reply_list[0]) || !is_array($reply_list[0])){
						$gbooks[$key]['reply_list'][0] = $reply_list;
					}else{
						$gbooks[$key]['reply_list'] = $reply_list;
					}
				}
			}

			//$this->assign('page_size', PAGE_SIZE);
			$this->assign('total', $total);
			$this->assign('gbooks', $gbooks);
			$this->assign('page_link', $pagelink);
			$this->display('list_block');
		}

		//滚动加载
		public function index_block_scroll(){
			if(!isset($_POST['start']) || $_POST['start'] == ''){ Dcho('NO'); }
			$start = intval($_POST['start']);
			$gbook = M('guestbook');
			$data = $gbook->find(array(
				'table'=>'guestbook', 
				'limit'=>array(
					'start'=>PAGE_SIZE * ($start - 1), 
					'end'=>PAGE_SIZE
					),
				'order'=>array('id'=>'desc')
				));

			$gbooks = '';
			if(!empty($data)){
				if(!is_array($data[0])){ $data[0] = $data; }
				foreach ($data as $key => $value) {
					$type = $gbook->find_by_id($value['pid'], 'guestbook_type');
					$gbooks .= "<div class=\"m-gbs-items\">\n\t<div class=\"m-gbs-item\">\n\t<dl class=\"m-gbs-item-dl\">\n\t";
					$gbooks .= "<dt>". $this->vars['lang']['guestbook_type'].'：[ '. $type['name'] ." ]</dt>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_uname'].'：' ."</b> ". $value['uname'] . "(ID：". $value['id'] .")" ."</dd>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_uemail'].'：' ."</b> ". $value['uemail'] ."</dd>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_uphone'].'：' ."</b> ". $value['uphone'] ."</dd>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_uphone'].'：' ."</b> ". $value['uphone'] ."</dd>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_ucompany'].'：' ."</b> ". $value['ucompany'] ."</dd>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_title'].'：' ."</b> ". $value['title'] ."</dd>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_content'].'：' ."</b> ". substr($value['uphone'], 0, 200) ."</dd>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_isshow'].'：' ."</b> ";
					if($value['disabled'] == 1){
						$gbooks .= "<i class=\"m-mini-btn m-mini-show m-mini-isshow\" data-id=\"". $value['id'] ."\" data-value=\"". $value['disabled'] ."\" style=\"float:none;\" title=\"". $this->vars['lang']['guestbook_show_yes'] ."\"></i>";
					}else{
						$gbooks .= "<i class=\"m-mini-btn m-mini-show m-mini-usshow\" data-id=\"". $value['id'] ."\" data-value=\"". $value['disabled'] ."\" style=\"float:none;\" title=\"". $this->vars['lang']['guestbook_show_no'] ."\"></i>";
					}
					$gbooks .= "</dd>\n\t";
					$gbooks .= "<dd><b>". $this->vars['lang']['guestbook_time'].'：' ."</b> ". date('Y-m-d H:i:s', $value['add_time']) ."</dd>\n\t";
					if($value['reply'] ==1){
						//有回复内容
						$reply_num = $gbook->getRows('guestbook_reply', array('where'=>array('gid'=>$value['id'])));
						$gbooks .= "<span><b>". $this->vars['lang']['guestbook_reply_state'] ."：</b>已回复( ". $reply_num ." )</span>\n\t";
						//获取对应的回复,取前5条
						$reply_list = $gbook->getTop(0, 5, 'guestbook_reply', '`gid`='. $value['id']);
						if(!empty($reply_list)){
							if(isset($reply_list[0]) && !is_array($reply_list[0])){ $reply_list[0] = $reply_list; }
							//回复列表
							foreach ($reply_list as $k => $v) {
								$gbooks .= "<hr style=\"height:1px;padding:0px;margin:2px; background:#222;\"/>\n\t";
								$gbooks .= "<ul>\n\t";
								$gbooks .= "<li><b>". $this->vars['lang']['reply_uname'] ."：</b> ". $v['uname'] ."</li>\n\t";
								$gbooks .= "<li><b>". $this->vars['lang']['reply_content'] ."：</b> ". $v['content'] ."</li>\n\t";
								$gbooks .= "<li><b>". $this->vars['lang']['reply_time'] ."：</b> ". date('Y-m-d H:i:s', $v['add_time']) ."</li>\n\t";
								$gbooks .= "</ul>\n\t";
							}
						}
					}else{
						//无回复内容
						$gbooks .= "<span><b>". $this->vars['lang']['guestbook_reply_state'] ."：</b>未回复</span>\n\t";
					}
					$gbooks .= "</dl>\n\t";
					//操作按钮
					$gbooks .= "<a href=\"javascript:_VIEW_GB('". CURL ."show_gb/id/". $value['id'] ."');void(0);\" class=\"m-mini-btn m-mini-view m-gb-view\" data-id=\"". $value['id'] ."\" title=\"". $this->vars['lang']['view'] ."\" >". $this->vars['lang']['view'] ."</a>\n\t";
					$gbooks .= "<a href=\"javascript:_REPLY('". CURL ."reply', '". $value['id'] ."');void(0);\" class=\"m-mini-btn m-mini-edit m-gb-edit\" title=\"". $this->vars['lang']['guestbook_reply'] ."\" data-id=\"". $value['id'] ."\" >". $this->vars['lang']['guestbook_reply'] ."</a>\n\t";
					$gbooks .= "<a href=\"javascript:_D('". $value['id'] ."', '". CURL ."del');void(0);\"  class=\"m-mini-btn m-mini-del m-gb-del\" data-id=\"". $value['id'] ."\" title=\"". $this->vars['lang']['delete'] ."\">". $this->vars['lang']['delete'] ."</a>\n\t";		
					$gbooks .= "</div>\n</div>\n"; //结束一个列表
				}
			}else{
				$gbooks = 'NO';
			}
			
			Echo $gbooks;
		}

		public function add(){
			$this->display();
		}

		public function edit(){
			if(empty($_GET['id'])) show_error('ERROR', '没有可修改的项');
			$id = intval(trim($_GET['id']));
			$gbook = M('guestbook');
			$gbook = $gbook->getOne($id);
			$this->assign('guestbook', $gbook);
			$this->display();
		}

		public function mod(){
			if(empty($_POST['id']) || '' == trim($_POST['id'])){ Dcho('NO'); }
			$data = $_POST;
			$gbook = M('guestbook');
			$gbook = $gbook->getFileds();
			$data = array_intersect_key($data, $fileds);
			$data = $gbook->update($data, $data['id']);
			Echo ($data > 0) ? 'OK' : 'NO';
		}

		public function del(){
			if(!isset($_POST['id'])){ Dcho('NO'); }
			$id = rtrim($_POST['id'], ',');
			$id = explode(',', $id);
			$gbook = M('guestbook');
			$data = $gbook->destroy($id);
			foreach ($id as $value) {
				$rs = $gbook->find_by('gid', $value, 'guestbook_reply');
				if($rs){
					$rs = $gbook->doSQL("DELETE FROM `". DB_PRE .'guestbook_reply` WHERE `gid`='. $value);
				}
			}
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		//批量清理留言
		public function dels(){
			if(!isset($_POST['exec']) || trim($_POST['exec']) == ''){ Dcho('NO'); }
			$gbook = M('guestbook');
			//$data = $gbook->Dtable('guestbook', 'TRUNCATE'); 
			$data = $gbook->Ttable();
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		public function show_gb(){
			if(!isset($_GET['id']) || trim($_GET['id']) == ''){
				show_error('ERROR', '留言ID不能为空！');
			}
			$id = trim($_GET['id']);
			$gbook = M('guestbook');
			$data = $gbook->find_by_id($id);
			if(!empty($data)){
				$gbt = $gbook->find_by_id($data['pid'], 'guestbook_type');
				$data['type'] = $gbt['name']; 
				if($data['disabled'] == 1){
					$data['disabled'] = '显示';
				}else{
					$data['disabled'] = '不显示';
				}
				$reply_list = array();
				$reply_lists = array();
				if($data['reply'] ==1){
					$data['reply'] = '已回复';
					$reply_list = $gbook->getTop(0, 50, 'guestbook_reply', '`gid`='. $data['id']);
					if(!empty($reply_list)){
						if(!is_array($reply_list[0])){ 
							$reply_lists[0] = $reply_list; 
							$data['reply_list'] = $reply_lists;
						}else{
							$data['reply_list'] = $reply_list;
						}
					}
				}else{
					$data['reply'] = '未回复';
				}
				$this->assign('gbook', $data);
				$this->display('show_gb');
				unset($reply_list);
				unset($reply_lists);
			}else{
				show_error('ERROR', '系统无法查询到ID为'. $id .'的留言记录！');
			}
		}

		//显示或隐藏
		public function is_show(){
			if(isset($_POST['id'])) 	$data['id'] = intval($_POST['id']);
			else 						Echo 'NO';
			if(isset($_POST['disabled'])) $data['disabled'] = intval(trim($_POST['disabled']));
			else 						Echo 'NO';
			$data['disabled'] = ($data['disabled'] == 1) ? 0 : 1;
			$gbook = M('guestbook');
			$data = $gbook->update($data, $data['id']);
			Dcho(($data > 0) ? 'OK' : 'NO');
		}

		//回复留言
		public function reply(){
			if(!isset($_POST['id']) || trim($_POST['id']) == '') { Dcho('NOID'); }
			if(!isset($_POST['content']) || trim($_POST['content']) == '') { Dcho('NOCON'); }
			$data['gid'] = intval($_POST['id']);
			$data['content'] = $_POST['content'];
			$data['add_time'] = NOW_TIME;
			$session = new session();
			$author = unserialize($session->user);
			$data['uname'] = $author['name'];
			$user = M('user');
			$user = $user->find_by('aname', $data['uname'], 'manager');
			if($user){
				$data['uname'] = $data['uname']. '(管理员)';
			}
			
			$gbook = M('guestbook');
			$data = $gbook->add($data, 'guestbook_reply');
			if($data > 0){
				$gb['reply'] = 1;
				$gb['id'] = intval($_POST['id']);
				$data = $gbook->update($gb, $gb['id']);
				Dcho('OK');
			}else{
				Dcho('NO');
			}

		}
		


	}