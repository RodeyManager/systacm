<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');

	/**
	 * SY_Model类 (s数据模型基类)
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-02-01
	 */
	
	class Model {

		//本模型名称
		protected $model_name 			= '';
		//数据库配置信息
		protected $db_config			= array();	
		//数据库连接对象
		public $db						= null;
		//数据库名称
		protected $db_name				= '';
		//数据表名称
		protected $table_name 			= '';
		//数据表前缀
		protected $table_prefix 		= '';
		//数据表字段信息
		protected $table_fileds			= array();
		//数据信息列表
		protected $data 				= array();
		//当前数据表字段名称列表
		protected $fileds 				= null;
		/* 数据表主键名称 默认为 ‘id’ */
		protected $pkey 				= 'id';
		//错误信息
		protected $error            	= '';
		//是否自动检测数据表字段信息
	    protected $autoCheckFields  	=   true;
	    //是否批处理验证
	    protected $patchValidate    	=   false;

	    public function __construct(){

	    	if(method_exists($this, 'init')) //初始化操作
				$this->init();
			if(method_exists($this, 'auto')) //自动执行
				$this->auto();
			if(method_exists($this, 'author')) // 权限控制
				$this->author();

	    	/* 取得本模型名称 */
	    	if('' == $this->model_name){
	    		$this->model_name = $this->getModel();
	    	}

	    	if(empty($this->table_name)){
	    		$this->table_name = strtolower($this->model_name);
	    	}

	    	if(empty($this->db)){
	    		$this->db = $this->getDB_instance();
	    		$this->db->table = $this->table_name;
	    	}
	    	if(is_null($this->fileds)){
	    		$this->fileds = $this->getFileds();
	    	}
	    	extract($this->fileds);
	    	//pre($this->fileds);

	    }



	    /* ------------------------数据操作------------------------------- */

	    public function getRows($table=null, $options=array()){
	    	$data = $this->db->getRows($table, $options);
	    	return $data;
	    }

	    /**
	     * 获取一行数据记录
	     * @param  [int] $id 指定的主键值
	     * @return [array]    返回数组组成的一行数据
	     */
	    public function getOne($id, $table=false){
	    	$data = $this->db->getOne($id, $table);
	    	return $data;
	    }

	    /**
	     * 获取所有数据行
	     * @return [type] 返回二维数组组成的数据集
	     */
	    public function getAll($table=false, $options=false){
	    	$data = $this->db->getAll($table, $options);
	    	return $data;
	    }

	    /**
		 * 获取指定区域数据
		 * @param  int $start 		[开始]
		 * @param  int $end   		[结束]
		 * @param  boolean $table 	[表名]
		 * @param  string $where    [条件]
		 * @return [record]         [返回查询数据]
		 */
	    public function getTop($start=0, $end=5, $table=false, $where=''){
	    	$data = $this->db->getTop($start, $end, $table, $where);
	    	return $data;
	    }

	    /**
	     * 根据主键值查询该条数据记录
	     * @param  [type] $id [description]
	     * @return [type]     [description]
	     */
	    public function find_by_id($id, $table=false){
	    	$data = $this->db->getOne($id, $table);
	    	return $data;
	    }

	    /**
	     * 删除数据记录， 支持批量删除
	     * @param  [int | string | array] $ids 指定主键值集合 exp: 1; '1,2,3,4,5,,,'; array(1,2,3,4,5,,,)
	     * @return [boolean]      成功返回 TRUE, 失败返回 FALSE
	     */
	    public function destroy($ids, $table=false){
	    	if(isset($ids)){
	    		if(is_array($ids)){
	    			$ids = array_filter($ids);
	    			foreach ($ids as $value) {
	    				$data = $this->db->destroy($value, $table);
	    			}
	    		}elseif(is_string($ids)){
	    			if(strpos($ids, ',') > 0){
	    				$wheres = explode(',', rtrim($ids, ','));
		    			foreach ($wheres as $value) {
		    				$data = $this->db->destroy($value, $table);
		    			}
	    			}else{
	    				$data = $this->db->destroy($ids, $table);
	    			}
	    		}elseif(is_numeric($ids)){
	    			$data = $this->db->destroy($ids, $table);
	    		}
	    	}
	    	return $data;
	    }

	    /**
	     * 更新一条数据
	     * @param  [array] $data 以数组方式储存的数据集
	     * @param  [int] $id   	 指定需要更新的主键值
	     * @return [type]        更新成功返回 TRUE, 失败返回 FALSE
	     */
	    public function update($data, $id=null, $table=false){
	    	//$data['add_time'] = $data['update_time'] = NOW_TIME;
	    	$data['update_time'] = NOW_TIME;
			$session = new session();
			$author = unserialize($session->user);
			$data['author'] = $author['name'];
	    	$fileds = $this->getFileds($table);
			$data = array_intersect_key($data, $fileds);
	    	$data = $this->db->execute($data, 'U', $id, $table);
	    	return $data;
	    }

	    public function updates($data, $ids=array(), $table=false){
	    	if(empty($ids)) return false;
	    	foreach ($data as $k => $v) {
	    		$data = $this->update($v, $ids[$k], $table);
	    	}
	    	return $data;
	    }

	    /**
	     * 插入数据， 支持批量插入
	     * @param  [array] $data 以数组方式储存的数据集，二维数组形式支持批量插入
	     * @return [type]        插入成功返回 TRUE， 失败返回 FALSE
	     */
	    public function insert($data, $table=false){
	    	$session = new session();
			$author = unserialize($session->user);
			$fileds = $this->getFileds($table);

	    	if(isset($data[0]) && is_array($data[0])){
	    		foreach ($data as $key => $value) {
	    			$value['add_time'] = $value['update_time'] = NOW_TIME;
					$value['author'] = $author['name'];
					$value = array_intersect_key($value, $fileds);
	    			$data = $this->db->execute($value, 'C', null, $table);
	    		}
	    	}else{
	    		$data['add_time'] = $data['update_time'] = NOW_TIME;
				$data['author'] = $author['name'];
				$data = array_intersect_key($data, $fileds);
	    		$data = $this->db->execute($data, 'C', null, $table);
	    	}
	    	return $data;
	    }

	    public function add($data, $table=false){
	    	$data = $this->insert($data, $table);
	    	return $data;
	    }
	    public function getLastID(){
	    	return $this->db->getLastID();
	    }

	    /**
	     * 
	     */
	    public function select(){
	    	$data = $this->db->execute();
	    }

	    public function find($options){
	    	$data = $this->db->find($options);
	    	return $data;
	    }

	    public function find_by($filed, $value, $table=false){
	    	$data = $this->db->find_by($filed, $value, $table);
	    	return $data;
	    }
	    
	    public function save($table =false){
	    	$fileds_key = array();
	    	$fileds_val = array();
	    	pre($this->db);
	    	/* foreach ($this->fileds as $key => $val){
	    		
	    	} */
	    }
	    
	    public function join($options){
	    	$data = $this->db->join($options);
	    	return $data;
	    }

	    public function doSQL($sql = null){
	    	$data = $this->db->doSQL($sql);
	    	return $data;
	    }

	    /**
	     * 获取结果集
	     * @param  [int]  $limit [指定获取数据的limit]
	     * @param  boolean $table [表名]
	     * @return [array]         [结果集]
	     */
	    public function getRecord($limit, $table=false){
	    	$data = $this->db->find(array(
	    			'table'=>$table,
					'order'=>array('id'=>'DESC'),
					'limit'=>array('start'=>$limit, 'end'=>PAGE_SIZE)
				));
			if(empty($data))	return false;
			$datas = array();
			if(!is_array($data[1]))		$datas[0] 	= $data;
			else 						$datas 		= $data;
			return $datas;
	    }

	    /**
	     * 获取当前数据表字段名称列表
	     * @return [type] [description]
	     */
	    public function getFileds($table=false){
	    	$data = $this->db->getFileds($table);
	    	return $data;
	    }

	    /* 创建SQL相关 */
	    public function Cdatabase($database=false){
	    	return $this->db->Cdatabase($database);
	    }
	    public function Ddatabase($database=false){
	    	return $this->db->Ddatabase($database);
	    }
	    public function Stable(){
	    	return $this->db->Stable();
	    }
	    public function Ctable($options=array()){
	    	return $this->db->Ctable($options);
	    }
	    public function Dtable($table=false, $type='DROP'){
	    	return $this->db->Dtable($table, $type);
	    }
	    public function Ttable($table=false, $type='TRUNCATE'){
	    	return $this->db->Ttable($table, $type);
	    }
	    public function Calter($alters=array()){
	    	return $this->db->Calter($alters);
	    }
	    public function Otable($table=false){
	    	return $this->db->Otable($table);
	    }

	    public function H_table($table=false, $type='CREATE'){
	    	$type = trim(strtoupper($type));
	    	switch ($type) {
	    		case 'CREATE': //创建表
	    			return $this->db->Ctable($table);
	    			break;
	    		case 'DROP': //删除表
	    			return $this->db->Dtable($table, $type);
	    			break;
	    		case 'CLEAR': //清空表
	    			return $this->db->Dtable($table, $type);
	    			break;
	    		case 'TRUNCATE': //清空表
	    			return $this->db->Dtable($table, $type);
	    			break;
	    		case 'OPTIMIZE': //优化表
	    			return $this->db->Dtable($table, $type);
	    			break;
	    		case 'REPAIR': //修复表
	    			return $this->db->Dtable($table, $type);
	    			break;
	    		case 'CHECK': //检查表
	    			return $this->db->Dtable($table, $type);
	    			break;
	    		case 'ANALYZE':  //分析表
	    			return $this->db->Dtable($table, $type);
	    			break;
	    		default:
	    			return $this->db->Ctable($table);
	    			break;
	    	}
	    }

		
	    /**
	     * 设置
	     * @param  [type] $key [description]
	     * @return [type]      [description]
	     */
	    public function __get($key){
	    	if(!empty($key)){
	    		return $this->fileds[$key];
	    	}
	    }

	    /**
	     * 设置字段值
	     * @param [string] $key 字段名称
	     * @param [all] $val 字段值
	     */
	    public function __set($key, $val){
	    	if($this->fileds[$key]){
	    		$this->fileds[$key] = $val;
	    	}
	    }

	    /**
	     * 设置当前模型表
	     * @param [type] $table_name [description]
	     */
	    protected function set_Table($table_name){
	    	if(empty($this->table_name)){
	    		$this->table_name = $table_name;
	    	}
	    }

	    /**
	     * 创建DB类实例
	     * @return [type] [description]
	     */
	    protected function getDB_instance(){
	    	$link = null;
	    	if(is_array($this->db_config) && !empty($this->db_config)){
	    		$link = new Mysql($this->db_config);
	    	}else{
	    		$link = new Mysql();
	    		$link->table = $this->table_name;
	    	}
	    	return $link;
	    }

	    /**
	     * 获取本模型名称
	     * @return [string] 返回本模型名称
	     */
	    protected function getModel(){
	    	$model_name = '';
	    	if(empty($this->model_name)){
	    		$model_name = get_class($this);
	    	}
	    	return $model_name;
	    }

	}