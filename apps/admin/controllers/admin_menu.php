<?php
	if(!defined('ACT')) die('ACT Undefined， Access Violation！');
	
	/**
	 * 后台菜单
	 * Author: 	Rodey
	 * Email : 	Rodeyluo@gmail.com
	 * QQ 	 : 	453474593
	 * Date  : 	2013-3-6
	 */
	class Admin_menu {
		
		static function get($mod){
			if(!Session::get($mod)){
				Session::set('mod', $mod);
			}
			$mod = Session::get('mod');
			$menus = array();
			switch ($mod){
				case 'top':
					$menus = self::fetch('头部菜单');
					break;
				case 'home':
					$menus = self::fetch('个人信息,快捷操作');
					break;
				case 'setting':
					$menus = self::fetch('网站设置');
					break;
				case 'users':
					$menus = self::fetch('用户管理,用户组管理,角色管理,权限管理');
					break;
				case 'archive':
					$menus = self::fetch('栏目管理,内容管理,类别管理,标签管理');
					break;
				case 'apps':
					$menus = self::fetch('应用管理,接口管理');
					break;
				case 'plugins':
					$menus = self::fetch('插件管理,扩展管理,生成管理');
					break;
				case 'module':
					$menus = self::fetch('模块管理,卡管理');
					break;
				case 'shop':
					$menus = self::fetch('商城设置,商品管理,类别管理,规格管理,订单管理,单据管理');
					break;
				case 'themes':
					$menus = self::fetch('模板管理');
					break;
				case 'site':
					$menus = self::fetch();
					break;
				default :
					$menus = self::fetch('个人信息,快捷操作');
					break;
			}
			return $menus;
		}
		
		
		static function fetch($string){
			$names = explode(',', $string);
			$allmenu = self::allmenu();
			$menus = array();
			foreach($names as $key){
				$menus[$key] = $allmenu[$key];
			}
			return $menus;
		}
		
		
		static function allmenu(){
			return $allmenu = array(
						'头部菜单'=>array(
								'我的面板'	=>array('mod'=>'home', 		'class'=>'atop-nav-home', 		'url'=>'', 		'flag'=>false),
								'设置'		=>array('mod'=>'setting', 	'class'=>'atop-nav-set', 		'url'=>'', 		'flag'=>false),
								'用户'		=>array('mod'=>'users', 	'class'=>'atop-nav-user', 		'url'=>'', 		'flag'=>false),
								'内容'		=>array('mod'=>'archive', 	'class'=>'atop-nav-content', 	'url'=>'', 		'flag'=>false),
								'模块'		=>array('mod'=>'module', 	'class'=>'atop-nav-module', 	'url'=>'', 		'flag'=>false),
								'商城'		=>array('mod'=>'shop', 		'class'=>'atop-nav-shop', 		'url'=>'', 		'flag'=>false),
								'界面'		=>array('mod'=>'themes', 	'class'=>'atop-nav-interface', 	'url'=>'', 		'flag'=>false),
								'应用'		=>array('mod'=>'apps', 		'class'=>'atop-nav-app', 		'url'=>'', 		'flag'=>false),
								'插件'		=>array('mod'=>'plugins', 	'class'=>'atop-nav-plugin', 	'url'=>'', 		'flag'=>false),
								'进入站点'	=>array('mod'=> 'site', 	'class'=>'atop-nav-site', 		'url'=>SITE_URL,'flag'=>false)		
						),
						'个人信息'=>array(
								'修改个人信息'=>'/user/edit/id/'. $_SESSION['id'],
								'修改密码'=>'/user/mpass/id/'. $_SESSION['id']
						),	
						'快捷操作'=>array(
				        		'网站配置'=>'/setting/index',
				                '添加内容'=>'/archive/add',
				                '用户管理'=>'/user/index',
				                '更新缓存'=>'/main/upcache'
				        ),
				        '网站设置'=>array(
				                '网站配置'=>'/setting/index',
				                '水印设置'=>'/setting/wmaker',
				                '附件设置'=>'/setting/attac',
				                '字符过滤'=>'/setting/baword',
				                '邮箱配置'=>'/setting/email',
				                '统计配置'=>'/setting/statistics',
				                '语言包编辑'=>'/setting/lang',
				                '焦点图设置'=>'/banner/index',
				                '短信设置'=>'/setting/phone',
								'地图设置'=>'/setting/map',
				        ),
				        '接口管理'=>array(
				        		'新浪微博'=>'/api/bind',
				        		'腾讯微博'=>'/api/bind',
				        		'QQ账号'  =>'/api/bind',
				        		'豆瓣账号'=>'/api/bind',
				        		'百度账号'=>'/api/bind',
				        		'搜狐账号'=>'/api/bind'
				        ),
						'用户管理'=>array(
								'用户列表'=>'/user/index',
								'添加用户'=>'/user/add',
								'在线充值'=>'/user/recharge'		
						),
						'用户组管理'=>array(
								'用户组列表'=>'/groups/index',
								'添加用户组'=>'/groups/add'		
						),
						'角色管理'=>array(
								'角色列表'=>'/role/index',
								'添加角色'=>'/role/add'		
						),
						'权限管理'=>array(
								'权限列表'=>'/power/index',
								'添加权限'=>'/power/add'	
						),
						'内容管理'=>array(
								'内容列表'=>'/archive/index',
								'添加内容'=>'/archive/add',
								'审核内容'=>'/archive/audit',
								'关键字管理'=>'/keyword/index'
						),
						'类别管理'=>array(
								'模型列表'=>'/catmodel/index',
								'添加模型'=>'/catmodel/add',
								'分类列表'=>'/cattype/index',
								'添加分类'=>'/cattype/add'
						),
						'标签管理'=>array(
								'Tag列表'=>'/tag/index',
								'添加Tag'=>'/tag/add'
						),
						'栏目管理'=>array(
								'站点栏目'=>'/category/index',
								'添加栏目'=>'/category/add',
								'栏目设置'=>'/category/set'
						),
						'插件管理'=>array(
								'在线升级'=>'/plugins/upgrade',
								'插件列表'=>'/plugins/index',
								'安装新插件'=>'/plugins/install'
						),
						'扩展管理'=>array(
								'数据库管理'	=>'/expand/database',
								'SQL命令行工具'	=>'/expand/sqlcmd',
								'文件校验'		=>'/expand/file_check',
								'病毒扫描'		=>'/expand/scan_virus',
								'系统修复'		=>'/expand/sys_restore',
								'IP管理'		=>'/expand/ipbans',
								'支付配置'		=>'/expand/payer',
								'邮件订阅'		=>'/expand/subemail',
								'邮件群发'		=>'/expand/send_email',
								'短信群发'		=>'/expand/subphone',
								'系统日志'		=>'/expand/sys_log'
						),
						'生成管理'=>array(
								/*'生成首页'		=>'/main/fetch_index',
								'生成栏目'		=>'/main/fetch_cats',
								'生成内容'		=>'/main/fetch_arts',*/
								'更新缓存'		=>'/main/upcache'
						),
						'应用管理'=>array(
								'应用列表'		=>'/apps/index',
								'安装新应用'	=>'/apps/install'
						),
						//商品
						'商城设置'=>array(
							'基本设置' 			=>'/goods/base_setting',
							'商品图片设置'		=>'/goods/pic_setting'
						),
						'商品管理'=>array(
								'商品列表'		=>'/goods/index',
								'添加商品'		=>'/goods/add'
						),
						'商品类别'=>array(
								'商品分类' 		=>'/mall/goods_cat',
								'商品类型'		=>'/mall/goods_type'
						),
						'规格管理'=>array(
								'商品规格' 		=>'/mall/goods_spec',
								'商品品牌' 		=>'/mall/goods_brand'
						),
						'订单管理'=>array(
								'订单列表'		=>'/order/index',
								'添加订单'		=>'/order/add'
						),
						'单据管理'=>array(
								'收款单'		=>'/order/gather',
								'退款单'		=>'/order/refund',
								'发货单'		=>'/order/deliver',
								'退货单'		=>'/order/retured'
						),
						//模块
						'模块管理'=>array(
								'广告'			=>'/module/advert',
								'公告'			=>'/notice/index',
								'新闻'			=>'/module/news',
								'评论'			=>'/comment/index',
								'留言'			=>'/guestbook/index',
								'投票'			=>'/vote/index',
								'专题'			=>'/special/index',
								'活动'			=>'/active/index',
								'积分'			=>'/user/point',
								'短消息'		=>'/sms/index',
								'友情链接'		=>'/flinks/index',
								'服务网络'		=>'/resnet/index',
								'广告联盟'		=>'/union/index',
								'CNZZ统计'		=>'/main/cnzz',
								'站点统计'		=>'/main/statistics'
						),
						'卡管理'=>array(
							'服务卡管理'		=> '/card/index',
							'临时卡管理'		=> '/card/temp',
							'卡创建程序'		=> '/card/setup',
							'卡策略管理'		=> '/card/based'
						),
						'模板管理'=>array(
								'模板选择'=>'/themes/index',
								'文件管理'=>'/themes/fileos',
								'标记管理'=>'/themes/flag',
								'表情管理'=>'/themes/face',
								'表态图标'=>'/themes/icon'
						),
					);
		}
		
	}