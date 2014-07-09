<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	/**
	 * 后台语言包
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-6
	 */
	
	return array(

			//banner
			'databese'				=> '数据库',
			'table_list' 			=> '数据表列表',
			'add_table' 			=> '添加数据表',
			'edit_table'			=> '编辑数据表',
			'del_table' 			=> '删除数据表',
			'optimize_table' 		=> '优化',
			'optimize_tables' 		=> '批量优化',
			'repair_table' 			=> '修复',
			'repair_tables' 		=> '批量修复',
			'check_table'			=> '检查',
			'check_tables'			=> '批量检查',
			'analyze_table'			=> '分析',
			'analyzek_tables'		=> '批量分析',
			'formation_table'		=> '表结构',
			'formation'				=> '结构',
			'select_tables_rqe'			=> '必须选择需要修改的项',

			't_name' 				=> '表名',
			't_engine' 				=> '类型',
			't_collation'			=> '编码',
			't_rows' 				=> '记录数',
			't_length' 				=> '使用空间',
			't_free' 				=> '碎片',
			't_comment' 			=> '备注',
			'backup'				=> '备份数据库',
			'backupper'				=> '立即备份',
			'backupping' 			=> '正在备份数据库中......',
			'backup-table' 			=> '备份表',

			'shunt' 				=> '每个分卷大小',
			'data_format'			=> '指定备份数据格式',
			'charset' 				=> '强制字符集',

			'tb_list' 				=> '备份文件列表',
			'tb_name' 				=> '文件名称',
			'tb_size' 				=> '文件大小',
			'tb_time' 				=> '备份时间',
			'tb_shunt' 				=> '卷号',
			'restore'				=> '恢复数据',
			'is_restore'			=> '恢复中有可能出现问题，建议使用PhpMyAdmin恢复，您确认要恢复数据吗？',

			'select_table' 			=> '选择需要操作的表',
			'run_sql' 				=> '运行SQL命令行',
			'multi_row' 			=> '多行数据操作',
			'one_row' 				=> '单行数据操作',
			'complex_row' 			=> '复杂SQL语句',
			'sql_result' 			=> '运行结果',
			'multi_row_synbom'		=> 'SELECT * FROM `table_name`;',
			'complex_row_synbom' 	=> 'SELECT a.au_fname, a.au_lname, p.pub_name FROM `authors` a FULL OUTER JOIN `publishers` p ON a.city = p.city ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC',
			'one_row_synbom' 		=> 'SELECT * FROM `table_name` WHERE `field`=\'value\';',

			/* File Action */
			'file_auto_check' 		=> '木马病毒自检程序',
			'file_check' 			=> '文件校验',
			'safe_tips' 			=> '安全提示',
			'safe_tips_info'		=> '1、有条件的用户把中 data、templets、uploads、html、special、images、install目录设置为不允许执行脚本，其它目录禁止写入，系统将更安全；<br />
										2、本检测程以开发模式为标准，如果您的网站目录包含其它系统，此检测程序可能会产生错误判断；<br />
										3、检测程序会跳过对模板缓存目录的检测，为了安全起见，检测完成后建议清空模板缓存。',
			'file_type'				=> '文件类型',
			'file_type_tips' 		=> '需要检查的文件类型',
			'file_check_code'		=> '侦查代码',
			'file_check_code_tips'	=> '需要扫描的特征代码，代码间用英文‘|’隔开',
			'start_check' 			=> '开始扫描',
			'clear_cache'			=> '清空文件缓存',
			'view_code'				=> '查看源码',
			'doup_file'				=> '可以文件',
			'check_result' 			=> '检测结果：(结果仅供参考，请务必查看源码后才删除非法文件)',

			//系统日志
			'log'					=> '日志',
			'log_list'				=> '日志列表',
			'log_id'				=> '日志ID',
			'log_module' 			=> '对应模块',
			'log_action'			=> '对应操作',
			'log_msg'				=> '信息',
			'log_state'				=> '日志状态',
			'log_user'				=> '所属用户',
			'log_link'				=> '操作地址',
			'log_ip'				=> 'IP',
			'log_time'				=> '日志时间',
			'clear_log'				=> '清空所有日志',
			'clear30_log'			=> '清空30天前日志',
			'clear7_log'			=> '清空7天前日志',
			'del_log'				=> '删除日志',
			'clear_day_log'			=> '指定天数删除日志',
			'clear_logs_tips'		=> '你确认清空所以日志信息吗？',

			//IP管理
			'ipbans'				=> 'IP管理',
			'ipbans_list'			=> 'IP列表',
			'ipbans_add'			=> '添加IP',
			'ipbans_id'				=> 'ID编号',
			'ipbans_addr'			=> 'IP地址',
			'ipbans_reason'			=> '禁止理由',
			'ipbans_reason_tips'	=> '理由可以为空！',
			'ipbans_eunlock_time'	=> '解禁时间',
			'ipbans_eunlock_time_over'	=> '已解禁',
			'ipbans_eunlock_time_out'	=> '未解禁',
			'ipbans_eunlock_time_tips'	=> '请填选解禁时间, 空值标识永久禁止！',
			'ipbans_t_ipaddrs'		=> '请输入ip地址',
			'ipbans_ipaddrs_formate'=> 'IP1,IP2,IP3,...,IPn',
			'ipbans_ipaddrs_tips'	=> 'ip地址不能为空！<br />说明：IP地址之间用英文逗号","隔开<br />格式：“IP1,IP2,IP3,...,IPn”<br /> 注意：参数之间请使用英文状态下的符号，如：","',
			'ipbans_ipin'			=> '此IP已经存在禁止列表中！',

			//邮件订阅
			'subemail_list'			=> '邮件列表',
			'subemail_id'			=> 'ID编号',
			'subemail_name'			=> '名称',
			'subemail_addr'			=> '邮箱地址',
			'subemail_time'			=> '订阅时间',
			'subemail_untime'		=> '取消时间',
			'subemail_sendtime'		=> '发送时间',
			'subemail_state'		=> '是否订阅',
			'subemail_yes'			=> '已订阅',
			'subemail_no'			=> '已取消订阅',
			'subemail_push'			=> '推送邮件',
			'subemail_title'		=> '推送标题',
			'subemail_title_tips'	=> '推送标题不能为空!',
			'subemail_content'		=> '推送内容',
			'subemail_content_tips'	=> '推送内容不能为空！',
			'subemail_sendtime_tips'=> '请填选推送时间, 空值表示立即发送！',
			'subemail_addr_formate'	=> "admin@systacm.com,info@systacm.com,...,453474593@qq.com",
			'subemail_addr_tips'	=> '邮箱地址不能为空！<br />说明：邮箱地址之间用英文逗号","隔开<br />格式：<br />“admin@systacm.com,<br />info@systacm.com,<br />,...,453474593@qq.com”<br /> 注意：参数之间请使用英文状态下的符号，如：","',

			//短息群发
			'subphone_list'			=> '手机号码列表',
			'subphone_id'			=> 'ID编号',
			'subphone_number'		=> '手机号码',
			'subphone_push'			=> '推送短信',
			'subphone_content'		=> '推送内容',
			'subphone_content_tips'	=> '推送内容不能为空！',
			'subphone_sendtime_tips'=> '请填选推送时间, 空值表示立即发送！',
			'subphone_phone_formate'=> "13723722479,15817343910,...,15813704141",
			'subphone_phone_tips'	=> '手机号码不能为空！<br />说明：手机号码之间用英文逗号","隔开<br />格式：<br />“13723722479,<br />15817343910,<br />,...,<br />15813704141”<br /> 注意：参数之间请使用英文状态下的符号，如：","',





			);