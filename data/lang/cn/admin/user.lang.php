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

		'point_list' 		=> '积分列表',
		'add_point' 		=> '添加积分',
		'rech_type' 		=> '充值类型',
		'recharge'			=> '在线充值',
		'put_money' 		=> '请输入金额',
		'select_user'		=> '请选择用户',
		'put_money_tips' 	=> '输入金额必须是数值类型，最大小数点两位! <i style="color:orange;">注意：输入负值则减少积分</i>',
		'sms_type' 			=> '通知类型',
		'email_sms' 		=> '邮件通知',
		'phone_sms' 		=> '短信通知',
		'send_sms' 			=> '短信息',
		'sms_content'		=> '消息内容',
		'sms_content_tips' 	=> '充值完成后同时发送给用户的消息内容（通知用户）<br />
							   <i style="color:orange;">注意：如果选择了短信通知，建议消息内容不宜过长</i>',
		'sms_is_nut_content'=> '请输入用户名',

		/* 用户管理 */
		'user_list' 		=> '用户列表',
		'add_user'			=> '添加用户',
		'edit_user'			=> '编辑用户',
		'del_user' 			=> '删除用户',
		'edit_money' 		=> '修改金额',
		'edit_point'		=> '修改积分',
		'user_group' 		=> '用户组',
		'user_group_id'		=> '用户组ID',
		'user_group_name'	=> '用户组名称',
		'user_group_point'	=> '默认积分',
		'user_id' 			=> '用户ID',
		'user_name' 		=> '用户名',
		'user_nick_name' 	=> '用户昵称',
		'user_email' 		=> '邮箱地址',
		'user_true_name' 	=> '真实姓名',
		'user_phone' 		=> '手机号码',
		'user_tel' 			=> '电话号码',
		'user_pass'			=> '用户密码',
		'user_birthday' 	=> '用户生日',
		'user_intro' 		=> '用户简介',
		'user_signa' 		=> '用户签名',
		'user_point' 		=> '用户积分',
		'user_money' 		=> '用户金额',
		'user_locked' 		=> '用户锁定',
		'user_headport' 	=> '用户头像',
		'user_headport_tips'=> '点击进行上传或者修改',
		'user_ip' 			=> '注册IP',
		'user_level' 		=> '用户级别',
		'last_update_time' 	=> '最后更新时间',
		'last_login_time' 	=> '最后一次登录时间',
		'last_login_ip'   	=> '最后一次登录IP',
		'is_locked'			=> '是否锁定',
		'user_reg_time' 	=> '注册时间',
		'pass_to_no' 		=> '您输入的两次密码不一致!',
		'pass_no_empty'		=> '密码不能为空',
		'pass_len' 			=> '密码应在6-16为之间',
		'user_disabled'		=> '点击设置可用性',

		//输入检验
		'v_p_name' 			=> '请输入用户名',
		'v_name_len' 		=> '用户名应该为2-30位之间',
		'v_name_no' 		=> '该用户名不可用或者已被占用，请更换用户名',
		'v_name_ing' 		=> '正在对该用户名进行合法性校验，请稍候...',
		'v_p_tname'			=> '请输入真实姓名',
		'v_tname_len'		=> '真实姓名应该为2-30位之间',
		'v_p_nname'			=> '请输入用户昵称',
		'v_p_group'			=> '请选择用户组',
		'v_nname_len'		=> '用户昵称应该为2-100位之间',
		'v_p_tel'			=> '请输入电话号码',
		'v_format'			=> '格式',
		'v_format_success'	=> '格式正确',
		'v_format_fail'		=> '格式错误',
		'v_p_email'			=> '请输入邮箱',
		'v_email_len'		=> '邮箱应该为2-32位之间',
		'v_email_no' 		=> '该邮箱不可用或者已被占用，请更换邮箱！',
		'v_email_ing' 		=> '正在对该邮箱进行合法性校验，请稍候...',
		'v_nick_name_no' 	=> '该昵称不可用或者已被占用，请更换昵称！',
		'v_nick_name_ing' 	=> '正在对该昵称进行合法性校验，请稍候...',
		'v_p_phone'			=> '请输入手机号码',
		'v_phone_len'		=> '手机号码必须为11位数字',
		'v_phone_no' 		=> '该手机号码不可用或者已被占用，请更换手机号码！',
		'v_phone_ing' 		=> '正在对手机号码进行合法性校验，请稍候...',
		'v_p_point'			=> '请输入积分数',
		'v_point_int'		=> '积分数必须为整数',
		'v_point_len'		=> '积分数必须为整数，最大不能超过11位',
		'v_p_money'			=> '请输入金额',
		'v_money_int'		=> '金额必须为整数或者小数',
		'v_money_len'		=> '金额必须为整数或者小数，最大不能超过11位',
		'v_pass_empty'		=> '为空则不修改密码',
		'v_p_pass' 			=> '请输入密码',
		'v_pass_to'			=> '请输入确认密码',

		'rech_title'		=> '后台充值',
		'point_title' 		=> '后台充积分',
		'money_title' 		=> '后台充金额',
		'rech_body'			=> '后台充值成功！'

	);