@+@-----| 2013-06-29 |
	1、添加了消息类型
	2、修复添加用户对邮箱的唯一性验证错误问题
	3、修复了添加用户没有选择用户组的功能问题
	发现问题;
		1. 用户管理->用户列表发送邮件   (未解决)

@+@-----| 2013-06-29 |
	1. 修复后台查看用户头像显示路径错误问题
	2. 修复增加jquery tips插件后，一些js操作title属性获取不到值问题
	发现问题;
		1. 用户管理->在线充值 页面 添加用户问题    (解决)
		2. 添加用户组时没有填写用户组icon的输入项（应该指定一个icon文件夹）(解决)
		3. 内容管理->添加栏目 没有对输入项进行js验证控制
		4. 内容管理->添加内容 没有对输入项进行js验证控制
		5. 模块管理->积分

@+@-----| 2013-03-03 |

	1. 完成后台整体布局框架
	2. 完成登录验证（用户名和密码）
		--》遗留 验证码 验证步骤

@+@-----| 2013-02-27 |

	1. 解决数据存储和读取乱码问题。
	2. 解决 Mysql类中 find 方法返回数据的处理，返回0表示无查询数据

@+@-----| 2013-02-03 |

	1. 增加Mysql类方法

	2. 遗留问题：
		find
		find_by
		查询单条数据输出有误
		
		
	
提示：
	记得每次迁移时必须清空根目录下的 temps文件夹下面的内容

	nginx 支持pathInfo 设置

	fastcgi_split_path_info ^((?U).+.php)(/?.+)$;
    fastcgi_param           SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_param 	        PATH_INFO $fastcgi_path_info;
    fastcgi_param 	        PATH_TRANSLATED $document_root$fastcgi_path_info;