<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * Mysql类 (数据库基类 继承DB类)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-01-01
	 */
	
	class Mysql extends DB{


		/* 初始化数据库连接配置信息 */
		public function __construct($db_config = ''){

			if($db_config != ''){
				if($db_config['dns']){
					$dns = explode(':', $db_config['dns']);
					$this->db_config['type'] = $this->db_type = $dns[0];
					$config = explode(';', $dns[1]);
					$host = explode('=', $config[0]);
					$dbname = explode('=', $config[1]);
					$this->db_config['host'] = $host[1];
					$this->db_config['dbname'] = $dbname[1];
				}else{
					$this->db_config['host'] 	= isset($db_config['host']) 	? $db_config['host'] 	: $this->error(0);
					$this->db_config['dbname'] 	= isset($db_config['dbname']) 	? $db_config['dbname'] 	: $this->error(3);
					$this->db_config['type'] 	= isset($db_config['type']) 	? $db_config['type'] 	: $this->error(4);
				}
				
				$this->db_config['user'] 	= isset($db_config['user']) 	? $db_config['user'] 	: $this->error(1);
				$this->db_config['pass'] 	= isset($db_config['pass']) 	? $db_config['pass'] 	: $this->error(2);
				$this->db_config['char'] 	= isset($db_config['char']) 	? $db_config['char'] 	: 'utf8';
				$this->db_config['prefix'] 	= isset($db_config['prefix']) 	? $db_config['prefix'] 	: '';
			}else{
				$this->db_config = get_cfgs('db_config');
			}
			//define('DB_PRE', $this->db_config['prefix']);!
			/* 创建连接 */
			$this->connect();
		}
		
		/**
		 * 连接数据库
		 * @return bool 成功 true，失败 false
		 */
		public function connect(){
			if(!$this->connented){
				$this->link = mysqli_connect(
				    $this->db_config['host'],
                    $this->db_config['user'],
                    $this->db_config['pass'],
                    $this->db_config['dbname'],
                    $this->db_config['port']
                );
				$this->connented = $this->link ? true : false;
                mysqli_query($this->link, 'SET NAMES '. $this->db_config['char']);
			}
			return $this->connented;
		}

		/**
		 * 执行mysql操作
		 * @return  mysql result 
		 */
		protected function query(){
			$this->queryID = mysqli_query($this->link, $this->sql);
			return $this->queryID;
		}
		
		/**
		 * 系统预留，直接执行 SQL 语句函数
		 * insert、update、delete 成功返回 true， 失败返回 false
		 * select 成功返回结果集
		 * 其他语句 	成功返回 true，失败返回 false
		 * @param string $sql
		 */
		public function doSQL($sql = ''){
			if(empty($sql) || $sql == ''){ return false; }
			$this->sql = $sql;
			$this->queryID = mysqli_query($this->link, $this->sql);
			//Bcho($sql);
			//var_dump($this->queryID);
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			if($this->queryID){
				if($this->queryID == 1){
					return true;
				}elseif($this->queryID <= 0 || $this->queryID == false){
					return false;
				}else{
					return $this->record($this->queryID);
				}
			}else{
				return false;
			}
		}
		/**
		 * 获取表字段数
		 * @param  [string] $sql [SQL语句]
		 * @return [array]      []
		 */
		public function num_fileds($sql){
			$this->sql = $sql;
			$this->queryID = $this->query();
			return mysqli_num_fields($this->queryID);
		}
		/**
		 * 获取记录总行数
		 * @param  [string] $sql [SQL语句]
		 * @return [int]      []
		 */
		public function num_rows($sql){
			$this->sql = $sql;
			$this->queryID = $this->query();
			return mysqli_num_rows($this->queryID);
		}

		/**
		 * 获取数据总数
		 * @param  boolean $table   [表名]
		 * @param  array   $options [条件]
		 * @return [type]           []
		 */
		public function getRows($table = false, $options=array()){
			if($table){
				$table = $this->db_config['prefix'].$table;
			}else{
				$table = $this->db_config['prefix'].$this->table;
			}
			$where = '';
			if(isset($options['where'])){
				$where .= ' WHERE ';
				foreach ($options['where'] as $key => $value) {
					$where .= '`'. $key .'`='. $value .' AND ';
				}
			}
			if(isset($options['filed'])){
				$filed = strtolower($options['filed']);
			}else{
				$filed = 'id';
			}
			$where = rtrim($where, ' AND ');
			$this->sql = 'SELECT COUNT(`'. $filed .'`) AS num_rows FROM `' .$table. '`'. $where;
			$this->queryID = $this->query();
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			//var_dump($this->queryID);
			list($rows) = mysqli_fetch_row($this->queryID);
			return $rows;
		}

		/**
		 * 查询单条数据
		 * 根据指定的编号返回结果集
		 * @param INT $id
		 */
		public function getOne($id, $table = false){
			if($table){
				$table = $this->db_config['prefix'].$table;
			}else{
				$table = $this->db_config['prefix'].$this->table;
			}
			if(!isset($id)) show_error('ERROR', '必须指定'.$table.'中需要查询的id值！');
			$this->sql = "SELECT * FROM `". $table ."` WHERE `id`=$id";
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			$this->queryID = $this->query();
			if($this->queryID){
				$this->rows = mysqli_fetch_assoc($this->queryID);
				return $this->rows;
			}else{
				return false;
			}
		}

		/**
		 * 获取所有数据列表
		 * @param  boolean $table 是否转入表名
		 * @return array          返回数据列表           
		 */		
		public function getAll($table=false, $options=false){
			if($table){
				$table = $this->db_config['prefix'].$table;
			}else{
				$table = $this->db_config['prefix'].$this->table;
			}

			$fix = '';
			if($options){
				if(is_array($options)){
					$where = isset($options['where']) ? ' WHERE '.$options['where'] :  '';
					$order = isset($options['order']) ? ' ORDER BY '. $options['order'] : '';
					$limit = isset($options['limit'])? ' LIMIT ' .$options['limit'] : '';
					$fix = $where . $order . $limit;
				}elseif(is_string($options)){
					$fix = $options;
				}else{
					show_error('ERROR', 'getALL()函数中参数传递错误！');
				}
			}
			
			$this->sql = 'SELECT * FROM `'. $table .'`'. $fix;
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			$this->queryID = $this->query();
			return $this->record($this->queryID);
		}

		/**
		 * 获取指定区域数据
		 * @param  int $start 		[开始]
		 * @param  int $end   		[结束]
		 * @param  boolean $table 	[表名]
		 * @return [record]         [返回查询数据]
		 */
		public function getTop($start = 0, $end = 5, $table = false, $where=''){
			if($table){
				$table = $this->db_config['prefix'].$table;
			}else{
				$table = $this->db_config['prefix'].$this->table;
			}

			if(!empty($where)){
				$where = ' WHERE '. $where;
			}

			$this->sql = "SELECT * FROM `". $table ."`". $where ." ORDER BY `id` DESC LIMIT ". $start ."," .$end;
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			$this->queryID = $this->query();
			return $this->record($this->queryID);
		}

		/**
		 * 删除指定主键值的一行数据记录
		 * @param  [int] $id 需要指定的主键值
		 * @return [type]    删除成功返回 TRUE, 失败返回 FALSE
		 */
		public function destroy($id, $table = false){
			if($table){
				$table = $this->db_config['prefix'].$table;
			}else{
				$table = $this->db_config['prefix'].$this->table;
			}
			$this->sql = "DELETE FROM `". $table ."` WHERE `id`='$id'";
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			$this->queryID = $this->query();

			if($this->queryID > 0)
				return true;
			else
				return false;
		}

		/**
		 * 批量删除多条数据记录
		 * @param  [string | array] $ids 指定主键值集合 exp: '1,2,4,5'; array(1,2,3,4)
		 * @return [type]      [description]
		 */
		public function destroys($ids, $table = false){
			if($table){
				$table = $this->db_config['prefix'].$table;
			}else{
				$table = $this->db_config['prefix'].$this->table;
			}
			$wheres = '';
			if(is_string($ids) && strpos(',', $ids)){
				$wheres = $ids;
			}elseif(is_array($ids)){
				$wheres = implode(',', $ids);
			}

			$this->sql = "DELETE FROM `". $table ."` WHERE `id`=in('$wheres')";
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			$this->queryID = $this->query();

			if($this->queryID > 0) 
				return true;
			else
				return false;
		}

		/**
		 * 执行数据相关操作
		 * C: 插入操作
		 * U: 更新操作
		 * R: 查询操作
		 * D: 删除操作
		 * @param  array  $datas 操作需要的数据集
		 * @param  string $type  数据操作方式
		 * @param  [type] $id    数据操作需要的指定主键值
		 * @return [type]        成功则返回结果，失败则返回 FALSE
		 */
		public function execute($datas=array(), $type = 'U', $id = null, $table = false){
			if($table){
				$table = $this->db_config['prefix'].$table;
			}else{
				$table = $this->db_config['prefix'].$this->table;
			}

			$fileds = array();
	    	$values = array();
	    	$amongs = '';
	    	if(!empty($datas) && is_array($datas)){
	    		foreach ($datas as $key => $value) {
	    			$amongs .= $key .'=\''. $value .'\',';
	    			$fileds[] = $key;
	    			$values[] = '\''. $value. '\'';
	    		}
	    	}
	    	$fileds = implode(', ', $fileds);
	    	$values = implode(', ', $values);

	    	$data = false;
	    	
			if($type == 'U'){		/* UPDATA 更新数据 */
				$this->sql = "UPDATE `". $table ."` SET ". rtrim($amongs, ',') ." WHERE `id`='". $id. "' LIMIT 1";
			
			}elseif($type == 'C'){	/* INSERT 插入数据 */
				$this->sql = "INSERT INTO `".$table."` (".$fileds.") VALUES (".$values.")";

			}elseif($type == 'R'){	/* SELECT 查询数据 */
				if(!isset($id))
					$this->sql = "SELECT * FROM `". $table ."`";
				else
					$this->sql = "SELECT * FROM `". $table ."` WHERE `id`='".$id."' LIMIT 1";

			}elseif($type == 'D'){	/* DELETE 删除数据 */
				if(isset($id))
					$this->sql = "DELETE FROM `".$table."` WHERE `id`='".$id."' LIMIT 1";
				else
					$this->sql = "DELETE FROM `".$table."`";
			}
			//Bcho($this->sql);
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			$data = $this->query();
			if($data){
				return $data;
			}else{
				return false;
			}
		}

		/**
		 * 根据指定条件查询
		 * @param  [array] $options 条件集合
		 * @return [array | int]    返回以数组组成的结果集：【如何只有一条】-->一维数组
		 * 												       【如果有多条】	  -->二维数组
		 *                          					       【如果返回 false 】      -->无查询结果
		 *
		 * use exp:
		 *
		 * 	$data = $user->find(array(
		 *		'filed' => array('id','name', 'email', 'age'),
		 *		'where' => array('type'=> 'OR', 'name'=>'rodey', 'email'=> 'rodeyluo@gmail.com'),
		 *		'order' => array('id'=>'asc'), | array('id'=>'asc', 'add_time'=>'desc'),
		 *		'limit'	=> array('start'=>5, 'end'=>5),
		 *		'table' => 'user'
		 *	));
		 *
		 * 合成后的SQL：
		 * 				SELECT * | `id`, `name`, `email`, `age` FROM `{table}` 
		 *     			WHERE `name`='Rodey' {$type[AND/OR]} `email`='rodeyluo@gmail.com' 
		 *        		ORDER BY `id` ASC, `add_time` DESC 
		 *          	LIMIT 5, 5;
		 */
		public function find($options){
			//初始化内部变量,用于临时储存
			if(isset($options['table']))
				$table = $this->db_config['prefix'].$options['table'];
			else
				$table 	= $this->db_config['prefix'].$this->table;
			
			$sql 	= 'SELECT ';
			$fileds = '';
			$where 	= '';
			$limit 	= '';
			$order 	= '';
			$type = 'AND';

			//判断指定的字段查询
			if(isset($options['filed'])){
				$fileds .= ' ';
				foreach ($options['filed'] as $value) {
					$fileds .= '`'. $value .'`,';
				}
				$fileds = rtrim($fileds, ',');
			}else{
				$fileds = ' * ';
			}

			//判断查询条件
			if(isset($options['where'])){
				$where .= ' WHERE ';
				if(isset($options['where']['type'])){
					if(is_string($options['where']['type'])){
						$type = $options['where']['type'];
					}
				}
				foreach ($options['where'] as $key => $value) {
					$where .= '`'. $key .'`=\''. $value. '\' '. $type .' ';
				}
				$where = str_replace('`type`=\''.$type.'\' '.$type.' ', '', $where);
				$where = substr(rtrim($where, ' '), 0, -3);

			}

			//判断排序方式
			if(isset($options['order'])){
				$order .= ' ORDER BY ';
				if(is_array($options['order'])){
					if(isset($options['order']['type'])){
						$type = $options['order']['type'];
					}
					foreach ($options['order'] as $key => $value) {
						if(!is_string($key)){
							show_error('ERROR', __CLASS__.'->find()函数中[order]参数传递错误！数组中的key必须是字段名(字符串)');
						}
						if(!is_string($value)){
							show_error('ERROR', __CLASS__.'->find()函数中[order]参数传递错误！数组中的value取值( asc/desc )');
						}
						$order .= '`'. $key. '` ' .strtoupper($value) .', ';
					}
					$order = rtrim($order, ', ');
				}elseif(is_string($options['order'])){
					$order .= $options['order'];
				}else{
					show_error('ERROR', __CLASS__.'->find()函数中[order]参数传递错误！');
				}
			}

			//判断查询限制
			if(isset($options['limit'])){
				$limit .= ' LIMIT ';
				$limit .= isset($options['limit']['start']) ? $options['limit']['start'] : 0;
				$limit .= ', ';
				$limit .= isset($options['limit']['end'])	? $options['limit']['end'] : '';
				$limit = rtrim($limit, ' ');	
			}

			//然后执行
			$this->sql = $sql . $fileds .' FROM `'. $table .'`'. $where . $order . $limit;
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
//			Bcho($this->sql);

			$this->queryID = $this->query();
			return $this->record($this->queryID);
			
		}
		
		//getOne别名
		public function findOne($id, $table = false){
			$data = $this->getOne($id, $table);
			return $data;
		}
		//getAll别名
		public function findAll($table = false){
			$data = $this->getAll($table);
			return $data;
		}
		//获取最后新增的ID值
		public function getLastID(){
			return mysqli_insert_id();
		}
		
		/**
		 * 获取当前数据表的字段名列表
		 * @param  boolean $table 传入的表名
		 * @return [type]         以数组返回数据表字段列表
		 */
		public function getFileds($table = false){
			if(!is_bool($table))
				$table = $this->db_config['prefix'] . $table;
			else
				$table = $this->db_config['prefix'].$this->table;

			$this->sql = 'SHOW COLUMNS FROM `'. $table .'`';
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			$this->queryID = mysqli_query($this->link, $this->sql);
			$fileds = array();

			if($this->queryID){
				$flen = mysqli_num_rows($this->queryID);
				for ($i=0; $i < mysqli_num_rows($this->queryID); $i++) {
					$filed_name = mysqli_fetch_row($this->queryID);
					//$fileds[] = $filed_name[0];
					$fkeys[] = $filed_name[0];
					$fvals[] = $filed_name[0];
				}
				
				for ($j = 0; $j < count($fkeys); $j++) {
					$fileds[$fkeys[$j]] = $fvals[$j];
				}
			}
			return $fileds;
		}

		/**
		 * 获取单条数据记录
		 * @param  string  			$filed [表字段名]
		 * @param  string | int  	$value [指定的字段值]
		 * @param  boolean 			$table [指定的表名称]
		 * @return array         		   [返回由数据结果集]
		 */
		public function find_by($filed, $value, $table=false){
			if($table)
				$table = $this->db_config['prefix'] . $table;
			else
				$table = $this->db_config['prefix'] . $this->table;

			$this->sql = "SELECT * FROM `". $table ."` WHERE `". $filed ."`='". $value ."'";
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			$this->queryID = $this->query();
			return $this->record($this->queryID);
		}
		
		public function from($tables){
			if(is_array($tables)){
				$tables = implode(',', $tables);
			}
			return trim($tables);
		}
		
		/**
		 * $j = $this->join(array(
		 *						'selection'=>array('*','uid', 'name as role_name'),
		 *						'tables'=>array('manager', 'user'), 
		 *						'where'=>array('uid', 'id')
		 *					));
		* output:
		 *			SELECT syst_user.*, syst_manager.uid, syst_role.name as role_name 
		 *			FROM syst_manager 
		 *			LEFT JOIN (syst_user, syst_role) 
		 *			ON syst_user.id = syst_manager.uid AND syst_manager.role=syst_role.id
		 * 
		 * @param unknown_type $options
		 * @return Ambigous <boolean, multitype:>
		 */
		
		public function join($options){
			$selection = array();
			$tables = array();
			$where = array();
			
			if(isset($options['selection'])){
				foreach ($options['selection'] as $value){
					$selection[] = $value;
				}
			}
			
			if(isset($options['tables'])){
				foreach ($options['tables'] as $value){
					$tables[] = $this->db_config['prefix'].$value;
				}
			}
			//$ts = implode(',', $tables);
						
			$type = $options['type'] ? $options['type'] : 'LEFT';
			
			if(isset($options['where'])){
				foreach ($options['where'] as $value){
					$where[] = $value;
				}
			}
			
			$this->sql = 'SELECT * FROM '. $tables[0] .' '. $type .' JOIN '. $tables[1] .' ON '. $tables[0] .'.'. $where[0] .'='. $tables[1] .'.'. $where[1];
			$this->queryID = $this->query();
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//Bcho($this->sql);
			return $this->record($this->queryID);
		}
		
		//解析输出数据结果集
		private function record($query){
			//Bcho(mysqli_num_rows($query));
			if(empty($query)){
				$query = $this->queryID;
			}
			if(mysqli_num_rows($query) <= 0){
				return FALSE;
			}elseif(mysqli_num_rows($query) == 1){
				return mysqli_fetch_assoc($query);
			}else{
				$rows = array();
				while($row = mysqli_fetch_assoc($query)){
					array_push($rows, $row);
				}
				return $rows;
			}
		}
		
		/* -------------------------------------------创建SQL相关------------------------------------------ */
		/**
		 * 创建数据库
		 * @param boolean $database [description]
		 */
		public function Cdatabase($database = false){
			if(empty($database)){
				show_error('ERROR', 'Cdatabase($database)方法：参数不能为空');
			}
			$this->sql = sprintf("CREATE DATABASE `%s`" , $database);
			$this->queryID = $this->query();
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//pre($this->sql);
			return $this->queryID ? true : false;
		}
		/**
		 * 删除数据库
		 * @param boolean $database [description]
		 */
		public function Ddatabase($database = false){
			if(empty($database)){	show_error('ERROR', 'Ddatabase($database)方法：参数不能为空');}
			$this->sql = sprintf("DROP DATABASE `%s`" , $database);
			$this->queryID = $this->query();
			if(DEBUG){	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');}
			//pre($this->sql);
			return $this->queryID ? true : false;
		}

		/**
		 * 列出所有表
		 */
		public function Stable(){
			$dbname = $this->db_config['dbname'];
			$this->sql = sprintf("SHOW TABLE STATUS FROM `%s`", $dbname);
			$this->queryID = $this->query();
			if(!$this->queryID){	show_error('ERROR', '数据库'.$dbname.'目前还没有任何表');}
			$tables = array();
			while ($row = mysqli_fetch_assoc($this->queryID)) {
		       	//$tables[] = $row[ 'Tables_in_'. $dbname ];
		       	$tables[] = $row;
		    }
		    mysqli_free_result($this->queryID);
		    if(DEBUG){	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');}
		   	return $tables;
		}

		/**
		 * 创建表
		 * @param [type] $table_name [表名]
		 *
		 * array(
		 * 		'table'=>'gg',
		 * 		'primary'=>'id',
		 * 		'charset'=>'utf8',
		 * 		'auto_increment'=>1,
		 * 		'engine'=>'MyISAM',
		 * 		'fileds'=>array(
		 * 			array( 'name'		=> 'id', 
		 * 				   'type'		=> 'int(11)', 
		 * 				   'attr'		=> '', 
		 * 				   'is_null'	=> false,
		 * 				   'default'	=> '1',
		 * 				   'auto'		=> true,
		 * 				   'comment'	=> '自动编号'
		 * 			),
		 * 		    array( 'name'		=> 'name',
		 * 		    	   'type' 		=> 'char(30)',
		 * 		    	   'is_null'	=> false,
		 * 		    	   'comment' 	=> '名称'
		 * 		    )
		 * 		)
		 * )
		 */
		public function Ctable($options = array()){
			if(empty($options) || !is_array($options)){
				show_error('ERROR', '参数不能为空或者格式不正确');
			}
			$table = null;
			$fileds = array();
			$table = trim($options['table']);
			$fileds = $options['fileds'];
			$primary = empty($options['primary']) ? ' PRIMARY KEY (`id`) ' : ' PRIMARY KEY (`'. $options['primary'] .'`) ';
			$charset = empty($options['charset']) ? 'utf8' : strtolower($options['charset']);
			$crement = empty($options['auto_increment']) ? 1 : intval($options['auto_increment']);
			$engine = empty($options['engine']) ? 'MyISAM' : trim($options['engine']);

			$names = array();
			$types = array();
			$is_null = array();
            $colums = '';

			if(is_null($table))		show_error('ERROR', '参数表名不能为空');
			/* 字段 */
			if(empty($fileds) || !is_array($fileds))	show_error('ERROR', '参数表字段不能为空');
			$table = $this->db_config['prefix'] . $table;
			$sql = sprintf("CREATE TABLE IF NOT EXISTS `%s`", $table) ."` ( \n\t";
			foreach ($fileds as $k => $v) {
				if(!empty($v['attr']))		$attr = ' '. strtoupper(trim($v['attr']));
				if(!empty($v['default']))	$default = ' DEFAULT \''. trim($v['default']) .'\'';
				if($v['is_null'] === false) $is_null = ' NOT NULL ';
				else 						$is_null = ' NULL ';
				if(!empty($v['auto']) && $v['auto'] === true) 	$auto = ' auto_increment '; 
				else 											$auto = '';
				if(!empty($v['comment']))	$comment = ' COMMENT \''. trim($v['comment']) . '\'';

				$colums .= '`'. $v['name'] .'` '. 
								$v['type'] . 
								$attr . 
								$is_null . 
								$default . 
								$auto . 
								$comment .",\n\t";
			}
			$colums = $colums . $primary;
			$sql .= $colums ."\n )";
			$sql = $sql .' ENGINE='. $engine .' DEFAULT CHARSET='. $charset .' AUTO_INCREMENT='. $crement; 


			$this->sql = $sql;
			$this->queryID = $this->query();
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//pre($this->sql);
			return $this->queryID ? true : false;
		}

		/**
		 * 删除表或者清空表
		 * @param boolean $table [表名]
		 */
		public function Dtable($table = false, $type = 'DROP'){
			if(empty($table)) 	show_error('ERROR', 'Dtable($table)方法：参数表名不能为空!');
			$tables = '';
			if(is_array($table)){
				foreach ($table as $key => $value) {
					$tables .=  '`'. $this->db_config['prefix'] . $value .'`, ';
				}
				$tables = rtrim($tables, ', ');
			}elseif(strpos($table, ', ')){
				$table = explode(', ', $table);
				foreach ($table as $key => $value) {
					$tables .=  '`'. $this->db_config['prefix'] . $value .'`, ';
				}
				$tables = rtrim($tables, ', ');
			}else{
				$tables =  '`'. $this->db_config['prefix'] . $table .'` ';
			}
			
			if(strtoupper($type)){
				$this->sql = strtoupper($type).sprintf(" TABLE %s", $tables);
			}elseif(strtoupper($type) === 'TRUNCATE' || strtoupper($type) === 'CLEAR' || $type === '清空'){
				$this->sql = sprintf("TRUNCATE `%s`", $tables);
			}
			$this->queryID = $this->query();
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//pre($this->sql);
			return $this->queryID ? true : false;
		}

		public function Ttable($table = false, $type = 'TRUNCATE'){
			return $this->Dtable($table, $type);
		}

		public function Otable($table=false){
			if(empty($table))	show_error('ERROR', 'Otable($tables)方法：参数不能为空');
			$tables = '';
			if(is_array($table)){
				foreach ($table as $key => $value) {
					$tables .= sprintf('`%s`', $this->db_config['prefix'] . $value) .', ';
				}
				$tables = rtrim($tables, ', ');
			}elseif(strpos($table, ',')){
				$tables = explode(',', $table);
				foreach ($tables as $key => $value) {
					$tables .= trim(sprintf('`%s`', $this->db_config['prefix'] . $value)) .', ';
				}
				$tables = rtrim($tables, ', ');
			}else{
				$tables = '`'. trim($table) .'`';
			}

			$this->sql = sprintf('OPTIMIZE TABLE %s', $tables);
			$this->queryID = $this->query();
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			//pre($this->sql);
			return $this->queryID ? true : false;
		}

		//添加表字段
		//ALTER TABLE  `syst_attachment` ADD  `ddd` VARCHAR( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER  `author`
		/**
		 * array(
		 * 		'field_name' => 'my_name',
		 * 		'field_type' => 'varchar( 200 )',
		 * 		'field_attr' => 'unsigne',
		 * 		'field_char' => 'utf8',
		 * 		'field_isNull' => 'not null',
		 * 		'field_default'=> 'default 1',
		 * 		'field_comment' => '字段描述',
		 * 		'field_after'  => 'author',
		 * 		'field_brfore' => 'author',
		 * 		'field_key'    => 'primary key',
		 * 		'field_auto'   => 'autoincrement=1'
		 * )
		 * 
		 * @param [type]  $alerts [description]
		 * @param boolean $table  [description]
		 */
		public function Calter($alters=array()){
			if(empty($alters['fields']) || !is_array($alters['fields'])) return false;
			if(!empty($alters['table']))
				$table = $this->db_config['prefix'] . trim($alters['table']);
			else
				$table = $this->db_config['prefix'] . $this->table;

			$type = !empty($alters['type']) ? strtoupper(trim($alters['type'])) : 'ADD'; 
			$adds = 'ALTER TABLE `'. $table .'` '; 

			$sql = '';
			if(is_array($alters['fields'][0])){
				for ($i=0; $i < count($alters['fields']); $i++) { 
					//批量添加
					$sql .= $this->parseFields($alters['fields'][$i], $table, $type) .',';
				}
			}else{
				//单个
				$sql .= $this->parseFields($alters['fields'], $table, $type);
			}
			$this->sql = trim(rtrim($adds . $sql, ','));
			if(DEBUG)	Logging('ERROR', 'Mysql', __METHOD__, $this->sql, 'FILE_LOG');
			/*Bcho($this->sql);
			Bcho($type);*/
			$this->queryID = $this->query();
			return $this->queryID ? true : false;
		}

		private function parseFields($alters = array(), $table = false, $type = 'ADD'){
			$field_name 	= '';
			$field_type 	= '';
			$field_attr 	= '';
			$field_char 	= '';
			$field_isNull 	= '';
			$field_default 	= '';
			$field_comment 	= '';
			$field_after 	= '';
			$field_brfore 	= '';
			$field_key 		= '';
			$field_auto 	= '';

			if(!empty($alters['field_name'])){
				$field_name = ' `'. trim(strtolower($alters['field_name'])) .'` ';
			}
			if(!empty($alters['field_type'])){
				$field_type = strtoupper($alters['field_type']) .' ';
			}else{
				$field_type = 'VARCHAR( 255 ) ';
			}
			if(!empty($alters['field_char'])){
				$field_char = 'CHARACTER SET '. strtolower($alters['field_char']) .' COLLATE '. strtolower($alters['field_char']) .'_general_ci ';
			}
			if(!empty($alters['field_attr'])){
				$field_attr = strtoupper($alters['field_attr']) .' ';
			}
			if(!empty($alters['field_isNull'])){
				$field_isNull = strtoupper($alters['field_isNull']) .' ';
			}else{
				$field_isNull = 'NOT NULL ';
			}
			if(!empty($alters['field_default'])){
				$field_attr = 'DEFAULT \''. $alters['field_default'] .'\' ';
			}
			if(!empty($alters['field_before'])){
				$field_before = 'BEFORE `'. strtolower($alters['field_before']) .'` ';
			}
			if(!empty($alters['field_after'])){
				$field_after = 'AFTER `'. strtolower($alters['field_after']) .'` ';
			}
			if(!empty($alters['field_comment'])){
				$field_comment = 'COMMENT \''. $alters['field_comment'] .'\' ';
			}
			if(!empty($alters['field_auto'])){
				$field_auto = 'AUTO_INCREMENT '. intval($alters['field_auto']);
			}
			if($type === 'CHANGE'){
				$adds = $type. ' ' .$field_name. ' ' .$field_name .$field_type .$field_attr .$field_char .$field_isNull .$field_default .$field_comment .$field_auto .$field_key .$field_after .$field_brfore .',';
			}elseif($type === 'DROP'){
				if(is_array($alters) && !empty($alters)){
					for ($i=0; $i < count($alters); $i++) { 
						$field_name .= $type .'`'. $alters[$i] .'`, ';
					}
				}elseif(is_string($alters)){
					$fnames = explode(',', $alters);
					for ($i=0; $i < count($fnames); $i++) { 
						$field_name .= $type .'`'. $fnames[$i] .'`, ';
					}
				}
				$field_name = trim(rtrim($field_name, ', '));
				$adds = ' '. $field_name;
			}else{
				$adds = $type. ' ' .$field_name .$field_type .$field_attr .$field_char .$field_isNull .$field_default .$field_comment .$field_auto .$field_key .$field_after .$field_brfore .',';
			}

			return trim(rtrim($adds, ','));
		}


		/* -------------------------------------------错误提示------------------------------------------ */

		private function error($type){

			switch($type){
				case 0 :
					show_error('ERROR', '数据库连接失败，数据库主机有误！');
					break;
				case 1 : 
					show_error('ERROR', '数据库连接失败，数据库连接用户名有误！');
					break;
				case 2 :
					show_error('ERROR', '数据库连接失败，数据库连接密码有误！');
					break;
				case 3 : 
					show_error('ERROR', '数据库连接失败，选择的数据库不存在！');
					break;
				case 4 :
					show_error('ERROR', '数据库类型配置不正确！');
					break;
				case NULL : 
					show_error('ERROR', '数据库连接失败，必须指定连接信息！');
					break;

			}
		}

		public function Version(){
			if(!$this->connented){
				$this->connect();
			}
			return mysqli_get_server_info($this->link);
		}

		public function __get($key){
			return $key;
		}

		public function __set($key, $val){
			$this->$key = $val;
		}

	}