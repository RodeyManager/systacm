<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	/**
	 * ----------------------------------------------
	 * 	Class Pagetion(Pagetion类) ：分页类 
	 *
	 *	Author: 	Rodey
	 *	E-mail: 	Rodeyluo@gmail.com
	 * 	Date  : 	2012-12-29 AM
	 *	WebSite: 	http://www.roadey.com
	 * ---------------------------------------------
	 */

	class Pagetion_Helper{

		//定义参数定义的变量名称,默认为'page'
		private $_var = 'page';

		//上一页 prev
		private $_prev = '上一页';

		//下一页 next
		private $_next = '下一页';

		//首页
		private $_first = '首页';

		//末页
		private $_last = '末页';

		//页码
		private $_page = 1;

		//总记录数
		private $_total;

		//每页显示数
		private $_size;

		//总页数
		private $_count;

		//显示样式
		private $_type;

		//连接按钮Class
		private $_link_class;

		//当前页面按钮样式
		private $_link_current_class;

		//连接
		private $_link;

		public function __construct(array $vars){

			
			foreach ($vars as $key => $value) {
				
				$k = '_' . strtolower($key);
				
				if( in_array($k, array_keys(get_class_vars(__CLASS__))) ){
					$this->$k = $value;
				}
			}
			
			//获取总页数
			$this->_count = ceil($this->_total / $this->_size);
			if($this->_total == $this->_size) 	$this->_page = 1;
			//Echo $this->_linkClass;
			
			$this->_link = $this->_link .'/'. $this->_var .'/';

		}

		//上一页
		private function getPrev(){
			if(!isset($this->_page) || !is_numeric($this->_page) || $this->_page <= 0)
				$this->_page = 1;
			$this->_page--;
			$prev = $this->_page;
			return $prev;
		}

		//下一页
		private function getNext(){
			if(!isset($this->_page) || !is_numeric($this->_page) || $this->_page > $this->_count)
				$this->_page = $this->_count;
			$this->_page++;
			$next = $this->_page;
			return $next;
		}

		//首页
		private function first(){
			$current = $this->getCurrent();
			$page = 1;
			$link = $this->_link . $page;

			if($current <= 1)
				$first_link = '<a href="javascript:void(0);" class="link_first ' . $this->_link_class . ' link_false" disabled="true">' . $this->_first .'</a>';
			else
				$first_link = '<a href="'. $link .'" class="link_first ' . $this->_link_class . '"">' . $this->_first .'</a>';

			return $first_link;
		}

		//末页
		private function last(){

			//type 样式
			//首页 1 2 3 ... 末页
			//首页 ... 4 5 6 ... 末页
			//首页 1 ... 7 8 9 末页
			$current = $this->getCurrent();
			$link = $this->_link . $this->_count;

			if($current >= $this->_count) 
				$last_link = '<a href="javascript:void(0);" class="link_last ' . $this->_link_class . ' link_false" disabled="true" >' . $this->_last .'</a>';
			else
				$last_link = '<a href="'. $link .'" class="link_last ' . $this->_link_class . '">' . $this->_last .'</a>';

			return $last_link;
		}

		//上一页连接
		private function link_prev(){
			$current = $this->getCurrent();
			$prev = $this->_link . ((($current - 1) <= 0) ? 1 : $current - 1);
			if($current <= 1)
				$prev_link = '<a href="javascript:void(0);" class="link_last ' . $this->_link_class . ' link_false" disabled="true">' . $this->_prev .'</a>';
			else
				$prev_link = '<a href="'. $prev .'" class="link_last ' . $this->_link_class . '">' . $this->_prev .'</a>';
			return $prev_link;
		}
		//下一页连接
		private function link_next(){
			$current = $this->getCurrent();
			$next = $this->_link . ((($current + 1) > $this->_count) ? $this->_count : $current + 1);
			//下一页
			if($current >= $this->_count)
				$next_link = '<a href="javascript:void(0);" class="link_last ' . $this->_link_class . ' link_false" disabled="true">' . $this->_next .'</a>';
			else
				$next_link = '<a href="'. $next .'" class="link_last ' . $this->_link_class . '">' . $this->_next .'</a>';
			return $next_link;
		}

		//总条数和总页数
		private function rows(){
			return '<a href="javascript:void(0);"' . ' class="' . $this->_link_class . ' link_info" disabled="true">共<strong>'. $this->_total .'</strong>条记录 | 共<strong>'. $this->_count .'</strong>页 | 每页显示<strong>'. $this->_size .'</strong>条</a>';
		}

		//当前页
		public function getCurrent(){
			if(!is_numeric($this->_page) || $this->_page < 0)
				$this->_page = 1;
			return $this->_page;
		}

		//输出分页条
		public function pageLinks(){

			$current = $this->getCurrent();

			$page_links = '';

			$page_links .= $this->rows();
			$page_links .= $this->first();
			$page_links .= $this->link_prev();


			for($x = 1; $x < $this->_count + 1; $x++){
				if($x == $current)
					$_link_class = $this->_link_class . ' link_current';
				else
					$_link_class = $this->_link_class;

				$page_links .= '<a href="'. $this->_link.$x .'" class="plinks ' . $_link_class . '">' . $x .'</a>';
			}

			$page_links .= $this->link_next();
			$page_links .= $this->last();

			return $page_links;
		}

	}