<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * DB类 (数据库基类/抽象类)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-12
	 */
	
	abstract class DB{

		public $db_config 	= null;		/* 数据库配置 */
		public $db_type 	= 'mysqli';	/* 数据库类型 */
		public $pconnectd 	= false;  	/* 是否永久连接 */
		public $con_type  	= 'mysqli'; 	/* 数据库链接类型 */
		public $sql 		= ''; 		/* SQL语句 */
		public $rows 		= array();	/* 执行后的结果集 */
		public $cols 		= array();	/* 数据表字段列表 */
		public $filedsList  = array();  /* 数据表字段名列表 */
		public $result		= '';		/* 当前结果集 */
		public $table 		= '';		/* 当前执行的数据表名 */
		public $queryID		= '';		/* 当前执行的sql ID */
		public $link		= null;		/* 当前数据库连接对象 */
		public $connented 	= false;	/* 是否已连接数据库 */

		/**
		 * 执行查询
		 * @param  [string] $sql SQL语句
		 * @return [type]      [description]
		 */
		abstract protected function query();

		/**
		 * 执行SQL语句
		 * @param  [array] $data   等待执行数据集
		 * @param  array  $options [description]
		 * @return [type]          [description]
		 */
		//abstract protected function execute($data, $options=array()){}

		//abstract protected function insert($data, $options=array()){}

		//abstract protected function selectAll($table){}
		
		abstract protected function getOne($id);

		//abstract protected function getAll($table){}

		//abstract protected function update($id, $options=array()){}

		//abstract protected function select_U($data, $table, $id){}

		//abstract protected function select_A($data, $options=array()){}

		//abstract protected function destroy($id, $options=array()){}

		//abstract protected function getFields($table){}

		//abstract protected function connect($db_config){}

		//abstract protected function free(){}

		//abstract protected function close(){}

	}