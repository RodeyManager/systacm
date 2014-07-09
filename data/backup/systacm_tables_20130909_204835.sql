# SYSTacm backup_file
# version:SYSTacm
# time:2013-09-09 20:48:35
# type:SYSTacm
# SYSTacm:http://www.systacm.com
# --------------------------------------------------------


CREATE TABLE `syst_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编码',
  `cat_id` int(11) NOT NULL COMMENT '栏目ID',
  `type_id` int(11) NOT NULL COMMENT '类型ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `sub_title` varchar(200) NOT NULL COMMENT '副标题',
  `intro` varchar(200) NOT NULL COMMENT '内容简介',
  `content` text NOT NULL COMMENT '内容',
  `tag` varchar(200) NOT NULL COMMENT '标签',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `source` varchar(255) NOT NULL COMMENT '来源',
  `linkto` varchar(255) NOT NULL COMMENT '连接地址',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `pics` varchar(255) NOT NULL COMMENT '展示图',
  `grade` varchar(11) NOT NULL COMMENT '评分',
  `comment_num` int(11) NOT NULL COMMENT '评论数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_html` int(11) NOT NULL DEFAULT '0' COMMENT '是否生成静态HTML, 0:不生成;1生成',
  `seo_title` varchar(255) NOT NULL COMMENT '页面标题',
  `seo_keyword` varchar(255) NOT NULL COMMENT '关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT '页面描述',
  `url_rule` varchar(255) NOT NULL COMMENT 'URL规则',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `verify` int(11) NOT NULL DEFAULT '1' COMMENT '审核，0：未审核；1：已审核；2：审核通过；3：未通过',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='文章信息表';

CREATE TABLE `syst_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `file_module` char(10) NOT NULL COMMENT '所属模型',
  `file_name` char(150) NOT NULL COMMENT '文件名称',
  `file_size` int(10) NOT NULL COMMENT '文件大小',
  `file_ext` char(10) NOT NULL COMMENT '文件后缀',
  `file_path` varchar(255) NOT NULL COMMENT '文件路径',
  `is_image` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为图片；1：是;0：不是',
  `downloads` mediumint(10) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `author` char(50) NOT NULL COMMENT '上传者',
  `ddd` varchar(200) NOT NULL,
  `add_time` int(30) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='附件信息表';

CREATE TABLE `syst_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `type_id` int(10) unsigned NOT NULL COMMENT '类别ID',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `banner` varchar(200) NOT NULL COMMENT 'banner地址',
  `banner_width` smallint(5) NOT NULL COMMENT '高度',
  `banner_height` smallint(5) NOT NULL COMMENT '宽度',
  `linkto` varchar(255) NOT NULL COMMENT '连接地址',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `disabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用;1:启用;0:禁用',
  `author` varchar(100) NOT NULL COMMENT '添加者',
  `start_time` int(30) NOT NULL COMMENT '起始时间',
  `end_time` int(30) NOT NULL COMMENT '截止时间',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Banner信息表';

CREATE TABLE `syst_banner_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `name` char(30) DEFAULT NULL COMMENT '类别名称',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='banner类别信息表';

CREATE TABLE `syst_baword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `baword` char(20) DEFAULT NULL COMMENT '敏感词',
  `reword` char(20) NOT NULL COMMENT '替换词',
  `level` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '级别',
  `add_time` int(30) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='敏感词过滤信息表';

CREATE TABLE `syst_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '类别名称',
  `ename` varchar(50) NOT NULL COMMENT '英文名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类索引',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `type_id` int(11) NOT NULL COMMENT '栏目内容模型ID',
  `intro` varchar(255) NOT NULL COMMENT '类别简介',
  `content` text NOT NULL COMMENT '栏目内容',
  `banner` varchar(255) NOT NULL COMMENT '栏目图片',
  `banner_width` smallint(8) NOT NULL COMMENT 'banner宽度',
  `banner_height` smallint(8) NOT NULL COMMENT 'banner高度',
  `template` varchar(50) NOT NULL COMMENT '栏目模板',
  `list_template` varchar(50) NOT NULL COMMENT '栏目列表页模板',
  `show_template` varchar(50) NOT NULL COMMENT '栏目内容页模板',
  `sort` tinyint(5) NOT NULL COMMENT '类别排序',
  `author` varchar(50) NOT NULL COMMENT '添加者',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示;0:不显示;1:显示',
  `is_html` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否生成HTML;0:不生成;1生成',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keyword` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `link_to` varchar(255) NOT NULL COMMENT '外部连接',
  `page_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '列表页分页模式；1:分页;0:单页',
  `page_size` smallint(5) NOT NULL COMMENT '列表页每页显示数',
  `add_time` int(30) DEFAULT NULL,
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='类别表';

CREATE TABLE `syst_catmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `name` varchar(50) NOT NULL COMMENT '模型名称',
  `mtable` varchar(50) NOT NULL COMMENT '模型表名',
  `mintro` varchar(255) NOT NULL COMMENT '描述',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='数据模型信息表';

CREATE TABLE `syst_cattype` (
  `id` int(11) NOT NULL COMMENT '自动编号',
  `ctname` int(100) NOT NULL COMMENT '分类模型名称',
  `ctindex` varchar(100) CHARACTER SET ucs2 NOT NULL COMMENT '分类模型索引文件',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类模型信息表';

CREATE TABLE `syst_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `group_id` smallint(3) unsigned DEFAULT '1' COMMENT '分组ID',
  `var_name` char(30) DEFAULT NULL COMMENT '变量名',
  `var_info` varchar(200) DEFAULT NULL COMMENT '提示文',
  `var_value` varchar(255) NOT NULL COMMENT '变量值',
  `var_type` char(30) DEFAULT 'string' COMMENT '变量类型',
  `var_rmark` varchar(255) NOT NULL COMMENT '变量备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='系统配置项信息表';

CREATE TABLE `syst_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编码',
  `cat_id` int(11) NOT NULL COMMENT '栏目ID',
  `type_id` int(11) NOT NULL COMMENT '类型ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `sub_title` char(255) NOT NULL COMMENT '副标题',
  `intro` char(200) NOT NULL COMMENT '内容简介',
  `content` text NOT NULL COMMENT '内容',
  `tag` char(200) NOT NULL COMMENT '标签',
  `company` char(200) NOT NULL COMMENT '产商',
  `home_page` varchar(200) NOT NULL COMMENT '官方主页',
  `file_size` int(30) NOT NULL COMMENT '文件大小',
  `down_url` char(200) NOT NULL COMMENT '下载地址',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `totaldowns` int(11) NOT NULL DEFAULT '0' COMMENT '总下载次数',
  `todaydowns` int(11) NOT NULL DEFAULT '0' COMMENT '当天下载次数',
  `weekdowns` int(11) NOT NULL DEFAULT '0' COMMENT '周下载次数',
  `monthdowns` int(11) NOT NULL DEFAULT '0' COMMENT '月下载次数',
  `source` varchar(255) NOT NULL COMMENT '来源',
  `linkto` varchar(255) NOT NULL COMMENT '连接地址',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `pics` varchar(255) NOT NULL COMMENT '展示图',
  `grade` varchar(11) NOT NULL COMMENT '评分',
  `comments` int(11) NOT NULL COMMENT '评论数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_html` int(11) NOT NULL COMMENT '是否生成静态HTML',
  `seo_title` varchar(255) NOT NULL COMMENT '页面标题',
  `seo_keyword` varchar(255) NOT NULL COMMENT '关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT '页面描述',
  `url_rule` varchar(255) NOT NULL COMMENT 'URL规则',
  `disabled` tinyint(1) unsigned DEFAULT '1' COMMENT '状态；1：可用;0：不可用',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `my_ename9` char(30) NOT NULL COMMENT '英文名字',
  `my_ename8` int(20) NOT NULL DEFAULT '1' COMMENT '英文名字',
  `my_ename4` char(30) NOT NULL COMMENT '英文名字',
  `my_ename2` int(20) NOT NULL DEFAULT '1' COMMENT '英文名字',
  `verify` int(11) NOT NULL DEFAULT '1' COMMENT '审核，0：未审核；1：已审核；2：审核通过；3：未通过',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `my_vesion` char(10) NOT NULL COMMENT '版本号',
  `my_classtype` char(30) NOT NULL COMMENT '软件类型',
  `my_lang` char(10) NOT NULL COMMENT '软件语言',
  `my_copytype` char(30) NOT NULL COMMENT '软件授权方式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='文章信息表';

CREATE TABLE `syst_flinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `link_title` char(100) NOT NULL COMMENT '站点名称',
  `link_logo` char(200) NOT NULL COMMENT '站点logo',
  `link_intro` char(200) NOT NULL COMMENT '站点简介',
  `linkto` char(200) NOT NULL COMMENT '站点地址',
  `disabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `sort` smallint(5) NOT NULL COMMENT '排序',
  `author` char(50) NOT NULL COMMENT '添加者',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='友情连接信息表';

CREATE TABLE `syst_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `cat_id` int(10) unsigned NOT NULL COMMENT '所属分类ID',
  `type_id` int(10) unsigned NOT NULL COMMENT '所属类型ID',
  `bno` varchar(200) NOT NULL COMMENT '商品编号',
  `name` varchar(200) NOT NULL COMMENT '商品名称',
  `intro` varchar(255) NOT NULL COMMENT '商品简介',
  `detail` text NOT NULL COMMENT '详细描述',
  `brand_id` mediumint(8) unsigned NOT NULL COMMENT '品牌ID',
  `image_default` varchar(200) NOT NULL COMMENT '默认图片',
  `image_file` longtext NOT NULL COMMENT '图片文件',
  `thumb_pic` varchar(200) NOT NULL COMMENT '缩略图',
  `middle_pic` varchar(200) NOT NULL COMMENT '商品页详细图',
  `big_pic` varchar(200) NOT NULL COMMENT '大图',
  `market` decimal(20,3) NOT NULL COMMENT '市场价',
  `cost` decimal(20,3) NOT NULL COMMENT '成本价',
  `sale` decimal(20,3) NOT NULL COMMENT '销售价',
  `updown` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '上架；1：上架；0：下架',
  `view_count` mediumint(8) unsigned NOT NULL COMMENT '浏览数',
  `buy_count` mediumint(8) unsigned NOT NULL COMMENT '购买数',
  `comment_count` mediumint(8) unsigned NOT NULL COMMENT '评论数',
  `collect_count` mediumint(8) unsigned NOT NULL COMMENT '收藏数',
  `unit` char(10) NOT NULL COMMENT '单位',
  `store` mediumint(8) unsigned NOT NULL COMMENT '库存',
  `score` int(10) unsigned NOT NULL COMMENT '积分',
  `weight` decimal(20,3) NOT NULL COMMENT '重量',
  `parts` varchar(100) NOT NULL COMMENT '配件ID列表',
  `seo` longtext NOT NULL COMMENT 'SEO优化',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁用；1：可用；0：禁用',
  `sort` mediumint(8) unsigned NOT NULL COMMENT '排序',
  `author` varchar(30) NOT NULL COMMENT '添加者',
  `up_time` int(20) unsigned NOT NULL COMMENT '上架时间',
  `down_time` int(20) unsigned NOT NULL COMMENT '下架时间',
  `add_time` int(20) unsigned NOT NULL COMMENT '添加时间',
  `update_time` int(20) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

CREATE TABLE `syst_goods_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(50) NOT NULL COMMENT '品牌名称',
  `brand_site` varchar(255) NOT NULL COMMENT '品牌网站',
  `brand_logo` varchar(255) NOT NULL COMMENT '品牌LOGO',
  `brand_pic` varchar(255) NOT NULL COMMENT '品牌展示图',
  `brand_desc` text NOT NULL COMMENT '品牌简介',
  `brand_keywords` longtext NOT NULL COMMENT '品牌关键字',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁用；1：可用；0：禁用',
  `author` char(30) NOT NULL COMMENT '添加者',
  `add_time` int(20) unsigned NOT NULL COMMENT '添加时间',
  `update_time` int(20) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品品牌信息表';

CREATE TABLE `syst_goods_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类ID',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属类型ID',
  `cat_name` varchar(100) NOT NULL COMMENT '分类名称',
  `cat_path` varchar(200) NOT NULL DEFAULT ',' COMMENT '分类路径',
  `cat_seo` longtext COMMENT '分类页面信息',
  `is_leaf` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否为叶子；1：叶子；0：不是叶子',
  `goods_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `child_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '子级数量',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁用；1：可用；0：禁用',
  `author` char(30) NOT NULL COMMENT '添加者',
  `add_time` int(20) unsigned NOT NULL COMMENT '添加时间',
  `update_time` int(20) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='商品分类信息表';

CREATE TABLE `syst_goods_imgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `gid` int(10) unsigned NOT NULL COMMENT '商品ID',
  `raw` varchar(255) NOT NULL COMMENT '原图',
  `small` varchar(255) NOT NULL COMMENT '列表页缩略图',
  `middle` varchar(255) NOT NULL COMMENT '商品详细页图',
  `big` varchar(255) NOT NULL COMMENT '商品相册图',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用;1：可用；0：不可用',
  `add_time` int(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='商品图片信息表';

CREATE TABLE `syst_goods_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `relevan` varchar(200) NOT NULL COMMENT '关联表',
  `hrefs` longtext NOT NULL COMMENT '关联的主键列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='商品关键字信息表';

CREATE TABLE `syst_goods_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `name` varchar(100) NOT NULL COMMENT '类型名称',
  `spec` longtext NOT NULL COMMENT '类型规格',
  `props` longtext NOT NULL COMMENT '类型属性',
  `params` longtext NOT NULL COMMENT '类型参数',
  `setting` longtext NOT NULL COMMENT '类型设置',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁用；1：可用；0：禁用',
  `author` char(30) NOT NULL COMMENT '添加者',
  `add_time` int(20) unsigned NOT NULL COMMENT '添加时间',
  `update_time` int(20) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品类型信息表';

CREATE TABLE `syst_guestbook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编码',
  `pid` int(11) unsigned NOT NULL COMMENT '留言类别',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `uname` varchar(50) NOT NULL COMMENT '联系人',
  `uemail` varchar(100) NOT NULL COMMENT '联系邮箱',
  `uphone` varchar(30) NOT NULL COMMENT '联系电话',
  `ucompany` varchar(100) NOT NULL COMMENT '公司名称',
  `reply` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '回复状态',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示；1：显示；0：不显示',
  `add_time` int(30) unsigned NOT NULL COMMENT '留言时间',
  `update_time` int(30) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='留言信息表';

CREATE TABLE `syst_guestbook_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `gid` int(10) unsigned NOT NULL COMMENT '留言ID',
  `uname` varchar(100) NOT NULL COMMENT '回复人',
  `content` text NOT NULL COMMENT '回复内容',
  `disabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示；1：显示；0：不显示',
  `add_time` int(30) unsigned NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='留言恢复信息表';

CREATE TABLE `syst_guestbook_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言类型自动编号',
  `name` varchar(30) NOT NULL COMMENT '留言类型名称',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='留言类型信息表';

CREATE TABLE `syst_ipbans` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `ip_addr` varchar(30) NOT NULL COMMENT 'IP地址',
  `reason` varchar(200) NOT NULL COMMENT '禁止理由',
  `eunlock_time` int(30) unsigned NOT NULL COMMENT '解禁时间',
  `add_tim` int(30) unsigned NOT NULL COMMENT '禁止时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='IP管理信息表';

CREATE TABLE `syst_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `keyword_name` varchar(50) NOT NULL COMMENT '关键字名字',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='关键字信息表';

CREATE TABLE `syst_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `value` tinyint(1) NOT NULL DEFAULT '0' COMMENT '值 0:游客;1:初级会员;2:中级会员;3:高级会员;4:VIP会员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户级别表';

CREATE TABLE `syst_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `module` char(15) DEFAULT NULL COMMENT '所属模块',
  `action` char(15) DEFAULT NULL COMMENT '操作名称',
  `massage` varchar(255) NOT NULL COMMENT '日志信息',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '日志状态; 0:错误;1:成功;2:警告;3:未知',
  `aclink` char(200) NOT NULL COMMENT '操作地址',
  `ip` char(15) NOT NULL COMMENT 'ip地址',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `add_time` int(20) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='系统日志信息表';

CREATE TABLE `syst_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `role` int(11) NOT NULL COMMENT '角色id',
  `aname` varchar(50) NOT NULL COMMENT '管理员名称',
  `apass` varchar(40) NOT NULL COMMENT '管理员密码',
  `disabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用',
  `last_login_time` int(30) NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(30) NOT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

CREATE TABLE `syst_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `title` varchar(150) NOT NULL COMMENT '公告标题',
  `content` text NOT NULL COMMENT '公告内容',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `disabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1:显示；0:隐藏',
  `start_time` int(11) NOT NULL COMMENT '发布时间',
  `end_time` int(11) NOT NULL COMMENT '截至时间',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='公告信息表';

CREATE TABLE `syst_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8 COMMENT='地区信息表';

CREATE TABLE `syst_resnet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `net_tid` int(10) unsigned NOT NULL COMMENT '服务网点类型',
  `net_name` char(150) NOT NULL COMMENT '服务网点名称',
  `net_address` char(255) NOT NULL COMMENT '服务网点地址',
  `net_hotline` char(30) NOT NULL COMMENT '服务网点热线',
  `net_u_name` char(30) NOT NULL COMMENT '联系人姓名',
  `net_u_phone` char(20) NOT NULL COMMENT '联系人电话',
  `net_mapx` char(20) NOT NULL COMMENT '地理经度',
  `net_mapy` char(20) NOT NULL COMMENT '地理纬度',
  `net_mapz` char(20) NOT NULL COMMENT '比例尺级别',
  `net_region` int(11) NOT NULL COMMENT '所属地区',
  `net_pic` varchar(200) NOT NULL COMMENT '展示图片',
  `net_msg` text NOT NULL COMMENT '服务网点介绍',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用；1：可用；0：不可用',
  `author` char(30) NOT NULL COMMENT '添加者',
  `add_time` int(30) unsigned NOT NULL COMMENT '添加时间',
  `update_time` int(30) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='服务网络信息表';

CREATE TABLE `syst_resnettype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编码',
  `name` char(50) NOT NULL COMMENT '服务网点类型名称',
  `add_time` int(30) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='服务网点类型信息表';

CREATE TABLE `syst_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编码',
  `name` varchar(30) NOT NULL COMMENT '角色名称',
  `level` varchar(30) NOT NULL COMMENT '角色级别',
  `module` varchar(255) NOT NULL COMMENT '模块权限',
  `method` varchar(200) NOT NULL COMMENT '权限',
  `disabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `syst_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `ranks` char(15) NOT NULL COMMENT '头衔级别',
  `stars` smallint(6) NOT NULL COMMENT '星星数',
  `points` int(10) NOT NULL COMMENT '积分数',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='积分头衔信息表';

CREATE TABLE `syst_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `type_id` int(10) unsigned NOT NULL COMMENT '消息类型ID',
  `from_id` int(10) unsigned DEFAULT NULL COMMENT '发送人',
  `to_id` int(10) unsigned DEFAULT NULL COMMENT '接收人',
  `title` char(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型;1:单条;2:群发',
  `add_time` int(30) unsigned NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='短消息信息表';

CREATE TABLE `syst_sms_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `name` varchar(100) NOT NULL COMMENT '消息类型名称',
  `icon` varchar(200) NOT NULL COMMENT '消息图标',
  `sms_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '消息类型总数',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统内置',
  `add_time` int(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='消息类型信息表';

CREATE TABLE `syst_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编码',
  `tag_name` varchar(50) NOT NULL COMMENT '标签名称',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='tag标签信息表';

CREATE TABLE `syst_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '账号',
  `pass` varchar(128) NOT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(100) NOT NULL COMMENT '用户昵称',
  `true_name` varchar(30) NOT NULL COMMENT '真实姓名',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别，0:保密;1:男;2:女',
  `birthday` int(30) DEFAULT NULL COMMENT '生日',
  `address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `intro` varchar(200) DEFAULT NULL COMMENT '用户简介',
  `signa` varchar(200) DEFAULT NULL COMMENT '用户签名',
  `headport` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `user_group` int(11) NOT NULL DEFAULT '1' COMMENT '用户组',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `money` decimal(8,2) NOT NULL COMMENT '金额',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活，0：未激活；1已激活',
  `token` varchar(32) NOT NULL COMMENT '激活码',
  `ip` varchar(30) DEFAULT NULL COMMENT '注册IP',
  `level` int(11) NOT NULL COMMENT '用户级别',
  `disabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用',
  `reg_time` int(30) DEFAULT NULL COMMENT '注册时间',
  `last_login_time` int(30) DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(30) NOT NULL COMMENT '上次登录IP',
  `update_time` int(30) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='用户会员信息表';

CREATE TABLE `syst_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `name` varchar(100) NOT NULL COMMENT '用户组名称',
  `value` int(11) NOT NULL COMMENT '用户组值',
  `point` int(11) NOT NULL COMMENT '积分数',
  `sort` int(11) NOT NULL COMMENT '排序',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `disabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用，1：启用；0：禁用',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户组信息表';

INSERT INTO `Array` VALUES('2','0','0','V50地图拷贝工具','地图拷贝工具','','E途V50地图拷贝工具','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','1363670642','1363670642');
INSERT INTO `Array` VALUES('26','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('27','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('28','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('29','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('30','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('31','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('58','3','0','mysql修改表名，列名，列类型，添加表列，删除表列','mysql SQL操作','mysql修改表名，列名，列类型，添加表列，删除表列','<p><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test rename test1; --修改表名</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test add &nbsp;column name varchar(10); --添加表列</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test drop &nbsp;column name; --删除表列</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test modify address char(10) --修改表列类型</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">||alter table test change address address &nbsp;char(40)</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test change &nbsp;column address address1 varchar(30)--修改表列名</span></p>','mysql,SQL','0','','','','','','0','0','1','mysql修改表名，列名，列类型，添加表列，删除表列','MySQL,SQL','','','rodey','1','1363714526','1363716251');
INSERT INTO `Array` VALUES('38','0','0','华锋实业','香港华锋实业有限公司','','<p>深圳市华利隆汽车电子技术有限公司</p>','华锋,E路航,E途','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','1363707797');
INSERT INTO `Array` VALUES('56','0','0','平安保险护航  华锋E路航&E途金牌品质','平安保险护航  华锋E路航&E途金牌品质','平安保险护航  华锋E路航&E途金牌品质','<p>平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质rrrrrrrrrrrrrrrrrrrr777777777777</p>','E路航','0','','','','','','0','0','0','平安保险护航  华锋E路航&E途金牌品质','平安保险护航  华锋E路航&E途金牌品质','平安保险护航  华锋E路航&E途金牌品质','','rodey','1','1363703312','1363705916');
INSERT INTO `Array` VALUES('40','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('41','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('42','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('43','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('44','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('45','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('46','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('47','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('48','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('49','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('50','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('51','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('52','0','0','华锋实业','香港华锋实业有限公司','','深圳市华利隆汽车电子技术有限公司','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','0','0');
INSERT INTO `Array` VALUES('54','0','0','完整版的部署与体验','','','','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','1363675872','1363675872');
INSERT INTO `Array` VALUES('55','0','0','jQuery Form与Uediter数据同步','','','<p><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">$(&#39;#formPost&#39;).submit(function() {</span><br style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;" /><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">editor.sync();</span><br style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;" /><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">$(this).ajaxSubmit(options);</span><br style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;" /><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">return false;</span><br style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;" /><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">});</span></p>','0','0','0','0','0','0','0','0','0','0','','','','','rodey','1','1363681398','1363681398');
INSERT INTO `Array` VALUES('57','0','0','前后端数据交互','前后端数据交互','前后端数据交互','<p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong style="line-height:1.75em;"><span style="font-size:14px;">一、富文本内容交互</span></strong><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;color:black;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;color:black;font-size:14px;">、</span></strong><span style="font-family:宋体;color:black;font-size:14px;">编辑器内容初始化（即往编辑器中设置富文本）</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;">场景一：写新文章，编辑器中预置提示、问候等内容。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;">在editor_config.js文件中找到initialContent参数，设置其值为需要的提示或者问候语即可，如initialContent:’欢迎使用UEditor!’。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;">场景二：编辑旧文章，从数据库中取出富文本放置到编辑器中。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;">显然，编辑文章时需要从后台数据库中取出大段富文本，如果仍然采用场景一中的方式去设置初始值的话，必然会带来诸如引号匹配被截断等问题，因此需要采用另外一种方式去设置，如下代码所示：</span></p><pre class="brush:as3;toolbar:false;">&lt;script type="text/plain"id="editor"&gt;
//从数据库中取出文章内容打印到此处
&lt;/script&gt;</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">此处采用了script标签作为编辑器容器对象，并设置了其类型是纯文本，从而在避免了标签内部JS代码执行的同时解决了部分同学在使用传统的textarea标签作为容器所带来的一次额外转码问题。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">提交编辑器内容至后端</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">场景一：在编辑器所在的Form中存在提交按钮，提交动作由点击此按钮完成。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">该场景适用于最普通的场合，没有太大问题需要注意，仅三点说明：</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">1) </span><span style="font-size:14px;">默认情况下提交到后台的表单名称是 “editorValue”，在editor_config.js中可以配置，参数名为textarea。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">2) </span><span style="font-size:14px;">可以在容器标签（即script标签）上设置name属性，以覆盖editor_config.js中的默认配置。实例代码如下，此处的myContent将成为新的提交表单名称：</span></p><pre class="brush:as3;toolbar:false;">&lt;form action=""method="post"&gt;
&lt;script type="text/plain"id="editor"name="myContent"&gt;
&lt;/script&gt;
&lt;input type="submit"name="submit"value="提交"&gt;
&lt;/form&gt;</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">3）后端接收程序可以通过如下几种方式来获取编辑器中的富文本内容。</span></p><pre class="brush:as3;toolbar:false;">//PHP获取：
$_POST["myContent"]
//JSP获取：
request.getParameter("myContent");
//ASP获取：
request("myContent");
//NET获取:
context.Request.Form["myContent"];</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;"><span style="font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;"><span style="font-size:14px;">场景二：编辑器所在的Form中不存在提交按钮，提交动作由外部事件触发。</span><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><span style="font-size:14px;">该场景适用于站点前端交互较多的场合，需要注意的事项主要是在触发form提交动作之前执行编辑器内容同步操作。一般的代码模式如下所示：</span><span style="font-size:14px;"></span></p><pre class="brush:as3;toolbar:false;">//满足提交条件时同步内容并提交，此处editor为编辑器实例
if(editor.hasContents()){ //此处以非空为例
editor.sync();       //同步内容
someForm.submit();   //提交Form
}</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><strong>如果使用的是jquery validation可以参考如下代码</strong></p><pre class="brush:js;toolbar:false;">$(function(){
vareditor = newUE.ui.Editor();
editor.render('content');
editor.addListener('contentchange',function(){
this.sync();
//1.2.4+以后可以直接给textarea的id名字就行了
$('textarea').valid();
});
varvalidator = $("#myform").submit(function() {
editor.sync();
}).validate({
ignore: "",
rules: {
title: "required",
content: "required"
},
errorPlacement: function(label, element) {
// position error label after generated textarea
if(element.is("textarea")) {
label.insertAfter(element.next());
} else{
label.insertAfter(element)
}
}
});
validator.focusInvalid = function() {
// put focus on tinymce on submit validation
if( this.settings.focusInvalid ) {
try{
vartoFocus = $(this.findLastActive() ||this.errorList.length &amp;&amp; this.errorList[0].element || []);
if(toFocus.is("textarea")) {
editor.focus()
} else{
toFocus.filter(":visible").focus();
}
} catch(e) {
// ignore IE throwing errors when focusing hidden elements
}
}
}
})</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;background-color:#ffffff;line-height:1.5em;text-indent:-28px;margin-right:0cm;margin-left:28px;"><span style="font-size:14px;">此处editor是编辑器实例对象。</span><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;background-color:#ffffff;line-height:1.5em;text-indent:-28px;margin-right:0cm;margin-left:28px;"><span style="font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">场景三：编辑器不在任何Form中，提交动作由外部事件触发。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">该场景使用不多，但特殊时候可能需要。UEditor也提供了对应的处理方案，基本逻辑跟场景二一样，只是在执行同步操作的时候需要传入提交form的id，如editor.sync(myFormID)即可。其他同场景二。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">二、图片上传交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">传统图片上传</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">传统图片上传涉及到的前后端交互主要涉及“上传提交路径”以及“图片保存路径”两个参数，后台保存路径以任何形式（绝对或者相对）、在任何页面展示跟前台无关。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">Flash</span><span style="font-family:宋体;font-size:14px;">图片上传</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">Flahs</span><span style="font-family:宋体;font-size:14px;">图片上传和传统图片上传存在一个很大的区别：它需要服务器端实时返回“图片保存路径”用于在前台的即时展示。具体到编辑器，就是需要将返回的路径插入到编辑器中。由此会引出除传统图片上传中提到的两个参数之外的第三个参数：“前后端修正路径”。如果后台返回的保存路径是绝对路径（指以http开头的路径，以根目录开始的路径也可勉强归入其中），那么前台无须做任何修正，否则用户必须十分清楚自己当前的目录结构并据此修正这个前后端相对路径之间的差异。因此，UEditor极力推荐由服务器端返回以根目录开始的相对路径。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">3</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">UEditor</span><span style="font-family:宋体;font-size:14px;">中的上传实践及注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">在UEditor中，“上传提交路径”和“前后端修正路径”的配置位于editor_config.js中。其中，imageUrl参数对应着“上传提交路径”，imagePath参数对应着“前后端修正路径”。而“图片保存路径”则需要在server/upload/php目录下的imageUp文件中配置。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">路径配置完成之后，还需要配置imageFieldName参数作为文件表单的表单名，后台可以据此获取文件句柄。该参数同样位于editor_config.js中。</span></p><pre class="brush:js;toolbar:false;">//图片上传提交地址
imageUrl:URL+"server/upload/php/imageUp.php",
//图片修正地址，引用了fixedImagePath,如有特殊需求，可自行配置 
imagePath:fixedImagePath,
//图片描述的key             
imageFieldName:"upFile",
//等比压缩的基准，确定maxImageSideLength参数的参照对象.
//0为按照最长边，1为按照宽度，2为按照高度                      
compressSide:0,   
//上传图片最大允许的边长，超过会自动等比缩放,不缩放就设置一个比较大的值
//更多设置在image.html中                          
maxImageSideLength:900</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;margin-top:0px;margin-bottom:0px;"><span style="font-size:14px;">完成上述配置之后，理论上后台应该可以接收到前台上传的图片文件了。在正确保存之后，传统图片上传至此就结束了。但是，在使用Flash上传的编辑器中，流程还远未结束。</span><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">首先，后台需要计算得出图片文件存放的地址字符串。该字符串UEditor极力推荐使用从网站根目录开始算起，一直到图片名结束为止。如果不从网站根目录开始算起，后面需要考虑“前后端修正地址”参数。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">其次，后台返回一个json格式的字符串，格式具体要求如下：</span></p><pre class="brush:as3;toolbar:false;">{ "url":"图片地址", "title":"图片描述", "state":"上传状态"}</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">其中，url对应计算出的图片保存地址——再强调一遍，尽量构造出从网站根目录开始的地址字符串；title对应flash中的描述字段，在图片上将会被设置到title属性中；state对应服务器端返回的图片上传状态字符：除了上传成功返回“SUCCESS”之外，其他任何值都将被直接显示在返回的图片描述字段内。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">最后，UEditor会在返回的url地址前面增加“前后端修整路径”这个参数值作为最后插入编辑器中的图片地址。因此，如果服务器端返回的是从根目录开始的图片路径或者http开头的绝对路径，“前后端修正路径”必须留空。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">举例来讲，如果服务器返回的路径是“/myProject/uploads/sun.jpg”,那么插入到编辑器中的路径会是“前后端修正路径 + &nbsp;/myProject/uploads/sun.jpg”。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">三、Word图片转存交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">图片转存原理</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">所谓word图片转存，是指UEditor为了解决用户从word中复制了一篇图文混排的文章粘贴到编辑器之后，word文章中的图片数据无法显示在编辑器中，也无法提交到服务器上的问题而开发的一个操作简便的图片转存方案。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">该功能的基本操作步骤：复制word文档——》粘贴到编辑器——》编辑器会将所有图片转换成一个占位图，同时在工具栏中高亮转存按钮——》点击转存按钮弹出图片上传框——》点击复制按钮复制图片目录地址——》点击“添加照片”按钮，在弹出的选择框中粘贴刚复制的图片目录地址——》点击打开按钮，选择目录下的所有图片文件，在此点击打开——》执行图片上传——》上传成功确认插入，UEditor将自动完成对应占位图的替换过程。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">配置要点及注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"> &nbsp; &nbsp;word</span><span style="font-family:宋体;font-size:14px;">图片转存跟普通图片上传的配置基本一样，所不同的仅仅是操作上的差异：前者需要首先获取临时图片文件存在的目录，后者直接选择自己指定的文件目录。PS：在部分操作系统的部分版本word中发现单张word图片会生成两张临时图片，且格式不一，清晰度各异，目前暂时未发现改进方法。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">四、远程图片抓取交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">远程抓取原理</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">图片远程抓取是指在插入本地域名之外的图片链接地址时，由服务器将这些外部图片抓取到本地服务器保存的一个功能。实现原理为在编辑器中向服务器发送包含所有外域图片地址的ajax请求，然后由服务器在后端抓取保存后返回图片地址给编辑器，再由编辑器完成外域地址和本地地址的替换工作。</span></p><pre class="brush:js;toolbar:false;">//是否开启远程图片抓取
catchRemoteImageEnable:true,
//处理远程图片抓取的地址
catcherUrl:URL +"server/submit/php/getRemoteImage.php", 
//提交到后台远程图片uri合集的表单名
catchFieldName:"upFile",    
//图片修正地址，同imagePath
catcherPath:fixedImagePath,
//本地顶级域名，当开启远程图片抓取时，除此之外的所有其它域名下的
//图片都将被抓取到本地                                  
localDomain:["baidu.com","10.81.2.114"],</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">远程抓取功能是否开启可在edicot_config.js中通过配置catchRemoteImageEnable参数实现。与这个功能相关的配置还包括了远程抓取的处理程序地址，表单域名称，本地域和“前后端修正地址”。远程抓取处理程序实现了依据前端提交的地址列表（使用ue_separate_ue标示符进行分隔的字符串）进行图片抓取，然后返回地址列表给客户端的功能。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">前后台交互数据格式样例：（URL1，URL2，URL3，URL4）</span><span style="font-size:14px;"></span></p><pre class="brush:as3;toolbar:false;">URL1ue_separate_ueURL2ue_separate_ueURL3ue_separate_ueURL4</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">五、图片在线管理交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">图片在线管理介绍</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">图片在线管理是指通过读取服务器端的文件目录并将其展示到编辑器中的进行额外一些操作的功能。处于安全考虑，目前UEditor仅实现了图片二次插入操作，其他诸如删除、移动等操作将会在后续二次开发教程中陆续放出。</span></p><pre class="brush:as3;toolbar:false;">//图片在线管理的处理地址       
imageManagerUrl:URL + "server/submit/php/imageManager.php",
//图片修正地址，同imagePath       
imageManagerPath:fixedImagePath</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">图片在线管理需要配置的参数跟远程图片抓取一致，两者不同的地方是图片在线管理中的图片数据是由服务器端指定某个目录，然后遍历其下的所有图片文件得到，然后将地址返回给编辑器，而远程图片抓取则是由编辑器提交图片地址，经过服务器端的抓取处理后返回新的地址给编辑器。两者的初始触发都需要ajax的介入。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">六、屏幕截图交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">屏幕截图介绍 </span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">使用了ActiveX控件，目前只支持IE浏览器。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">需要配置的参数除了跟图片上传一样的内容之外，还多出了服务器地址和端口的配置。具体使用时请根据自身服务器的特点做出适应修改。</span></p><pre class="brush:as3;toolbar:false;">//屏幕截图的server端文件所在的网站地址或者ip，请不要加http://
snapscreenHost: '127.0.0.1',    
//屏幕截图的server端保存程序，UEditor的范例代码为“URL                             
snapscreenServerUrl: URL +"server/upload/php/snapImgUp.php", +"server/upload/php/snapImgUp.php"”
//屏幕截图的server端端口
snapscreenServerPort: 80, 
//截图的图片默认的排版方式                                
snapscreenImgAlign: 'center', 
//截图显示修正地址                             
snapscreenPath: fixedImagePath,</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">七、附件上传交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">附件上传注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">附件上传的基本配置跟图片类似。另外，由于附件上传采用了相当成熟的swfupload开源框架，因此大部分的文档和资料尽可参考swfupload的官网教程。官网地址：<a href="http://www.swfupload.org/" target="_blank" title="swfupload" style="outline:none;font-size:16px;"><span style="font-size:14px;">http：//www.swfupload.org</span></a></span></p><p><br /></p>','Uediter','0','','','','','','0','0','0','前后端数据交互','前后端数据交互','前后端数据交互','','rodey','1','1363706124','1363706124');
INSERT INTO `Array` VALUES('25','setting','slider_01.jpg','2334','jpg','uploadfile/slider/1364572800/banner_13645728007794.jpg','1','0','rodey','','1364584536');
INSERT INTO `Array` VALUES('28','setting','03.jpg','360212','jpg','uploadfile/slider/1364572800/banner_13645728001375.jpg','1','0','rodey','','1364585673');
INSERT INTO `Array` VALUES('23','setting','slider_02.jpg','2334','jpg','uploadfile/slider/1364572800/banner_13645728005058.jpg','1','0','rodey','','1364584482');
INSERT INTO `Array` VALUES('22','setting','slider_03.jpg','2332','jpg','uploadfile/slider/1364572800/banner_13645728001800.jpg','1','0','rodey','','1364584455');
INSERT INTO `Array` VALUES('29','setting','QQ截图20130409104822.gif','8464','gif','uploadfile/slider/1365436800/banner_13654368007084.gif','1','0','rodey','','1365475830');
INSERT INTO `Array` VALUES('12','2','Blur','http://systacm.com/uploadfile/slider/1364572800/banner_13645728007794.jpg','980','200','http://www.eroda100.com','0','1','rodey','1364584507','1387480500','1364584540');
INSERT INTO `Array` VALUES('11','2','Green','http://systacm.com/uploadfile/slider/1364572800/banner_13645728005058.jpg','980','200','http://systacm.com','0','1','rodey','1364584469','1376507400','1364584503');
INSERT INTO `Array` VALUES('15','7','G7S','http://systacm.com/uploadfile/slider/1364572800/banner_13645728001375.jpg','980','200','http://systacm.com','0','1','rodey','1364585644','1388004000','1364585676');
INSERT INTO `Array` VALUES('10','2','Red','http://systacm.com/uploadfile/slider/1364572800/banner_13645728001800.jpg','980','200','http://systacm.com','0','1','rodey','1364584421','1368126600','1364584465');
INSERT INTO `Array` VALUES('17','3','Roadey','http://systacm.com/uploadfile/slider/1365436800/banner_13654368007084.gif','980','200','http://systacm.com','0','1','rodey','1365475572','1387986900','1378396736');
INSERT INTO `Array` VALUES('2','首页焦点','1365474418','1365474418');
INSERT INTO `Array` VALUES('3','列表页焦点','1365474432','1365474432');
INSERT INTO `Array` VALUES('4','图片页焦点','1365474446','1365474446');
INSERT INTO `Array` VALUES('5','视频页焦点','1365474459','1365474459');
INSERT INTO `Array` VALUES('6','下载页焦点','1365474468','1365474468');
INSERT INTO `Array` VALUES('7','产品页焦点','1365474568','1365474568');
INSERT INTO `Array` VALUES('4','枪','*','2','1365564715');
INSERT INTO `Array` VALUES('2','色情','**','1','1365561260');
INSERT INTO `Array` VALUES('3','毛泽东','毛主席','2','1365561303');
INSERT INTO `Array` VALUES('5','黄色','**','2','1365564741');
INSERT INTO `Array` VALUES('25','敏感词','敏感词','1','1365579606');
INSERT INTO `Array` VALUES('24','
敏感词b','替换词','1','1365578134');
INSERT INTO `Array` VALUES('23','
敏感词a','替换词','1','1365578134');
INSERT INTO `Array` VALUES('22','
敏感词4','替换词4','1','1365577539');
INSERT INTO `Array` VALUES('21','
敏感词3','替换词3','1','1365577539');
INSERT INTO `Array` VALUES('20','
敏感词2','替换词2','1','1365577539');
INSERT INTO `Array` VALUES('19','
敏感词1','替换词1','1','1365577539');
INSERT INTO `Array` VALUES('26','爱爱','**','1','1365739574');
INSERT INTO `Array` VALUES('27','火药','**','1','1365739610');
INSERT INTO `Array` VALUES('28','弗格森','','1','1365742296');
INSERT INTO `Array` VALUES('1','关于我们','about','0','10','10','关于我们的企业，企业简介','','','980','200','0','0','0','1','rodey','1','0','','','','','0','0','1372605413','1372605413');
INSERT INTO `Array` VALUES('2','产品展示','prodruct','0','3','0','我们的产品，一切以客户为中心，保证质量和服务一体化！','','','980','200','0','0','0','2','rodey','1','0','','','','','0','0','1372605735','1372605735');
INSERT INTO `Array` VALUES('3','新闻中心','news','0','1','0','每天都有我们的消息，我们每天都会有新的动态，请关注我们！','','','980','200','0','0','0','3','rodey','1','0','','','','','0','0','1372605501','1372605501');
INSERT INTO `Array` VALUES('4','服务支持','support','0','10','0','我们会用心服务，做到真正的为客服着想!','','','980','200','0','0','0','4','rodey','1','0','','','','','0','0','1372605700','1372605700');
INSERT INTO `Array` VALUES('5','联系我们','contacUS','0','10','0','联系我们，联系方式：email->rodeyluo@gmail.com','','','980','200','0','0','0','5','rodey','1','0','','','','','0','0','1372605595','1372605595');
INSERT INTO `Array` VALUES('6','服务条款','service','0','10','0','','','','980','200','0','0','0','0','rodey','0','0','','','','','0','0','1372605665','1372605665');
INSERT INTO `Array` VALUES('14','企业文化','enstrpires','0','10','0','企业文化企业文化企业文化','<p>企业文化企业文化企业文化企业文化企业文化</p><p>企业文化企业文化企业文化</p><p>企业文化企业文化企业文化</p><p>企业文化企业文化</p><p>企业文化</p>','uploadfile/cat/banner/banner_13637952001545.jpg','980','300','0','0','0','0','rodey','1','0','企业文化','企业文化','企业文化','','1','20','1372605640','1372605640');
INSERT INTO `Array` VALUES('16','手机','mobile','2','3','2','','','','980','200','0','0','0','0','rodey','1','0','手机','手机','手机','','1','20','1372605768','1372605768');
INSERT INTO `Array` VALUES('17','HTC','HTC','16','3','0','','','uploadfile/cat/banner/catbanner.gif','980','300','0','0','0','0','rodey','1','0','','','','','1','0','1372610403','1372610403');
INSERT INTO `Array` VALUES('18','公司动态','ComNews','3','1','0','','','','0','0','','','','0','rodey','1','0','','','','','1','0','1372604103','1372604103');
INSERT INTO `Array` VALUES('1','文章模型','archive','专门用于发布文章的数据模型','1363881150','1363881150');
INSERT INTO `Array` VALUES('2','下载模型','download','专门用于发布下载资源的数据模型，如软件下载,技术支持,产品手册','1363881332','1363881332');
INSERT INTO `Array` VALUES('3','产品模型','product','专门应用于上传和发布新产品的数据模型','1363881473','1363881473');
INSERT INTO `Array` VALUES('4','商品模型','goods','专门用于发布商品销售的数据模型','1363881535','1363881535');
INSERT INTO `Array` VALUES('5','图片模型','picture','专门用于发布图片组内容的数据模型','1363881589','1363881589');
INSERT INTO `Array` VALUES('6','视频模型','video','专门用于上传和发布视频的数据模型','1363881625','1363881625');
INSERT INTO `Array` VALUES('10','单页模型','page','单独页面模型，如公司简介，关于我们等','1372604612','1372604612');
INSERT INTO `Array` VALUES('11','专题模型','special','用于显示专题的页面模型','1372604680','1372604680');
INSERT INTO `Array` VALUES('1','1','site_url','网站地址','http://systacm.com/','string','尾部不带'/'');
INSERT INTO `Array` VALUES('2','1','site_name','网站名称','盛艺网络科技有限公司','string','');
INSERT INTO `Array` VALUES('3','1','html_path','文档HTML默认保存路径','/html','string','');
INSERT INTO `Array` VALUES('4','1','upload_path','图片/上传文件默认路径','/uploadfile','string','');
INSERT INTO `Array` VALUES('5','1','default_theme','模板默认风格','default','string','');
INSERT INTO `Array` VALUES('6','1','site_desc','网站描述','盛艺科技开发设计中心','bigstring','');
INSERT INTO `Array` VALUES('7','1','site_copyright','网站版权信息','Copyright 盛艺网络科技有限公司  版权所有','string','');
INSERT INTO `Array` VALUES('8','1','site_icp','网站备案号','粤ICP备13046563号-1','string','');
INSERT INTO `Array` VALUES('9','1','site_time','服务器时区设置','8','int','');
INSERT INTO `Array` VALUES('10','1','database_type','数据库类型','mysql','string','');
INSERT INTO `Array` VALUES('11','1','page_size','默认分页大小','12','int','');
INSERT INTO `Array` VALUES('12','3','upload_imgtype','允许上传的图片类型','jpg|gif|png','string','');
INSERT INTO `Array` VALUES('13','3','upload_softtype','允许上传的软件类型','zip|gz|rar|iso|doc|xsl|ppt|wps','string','');
INSERT INTO `Array` VALUES('14','3','upload_mediatype','允许上传的视频类型','swf|mpg|mp3|rm|rmvb|wmv|wma|wav|mid|mov','string','');
INSERT INTO `Array` VALUES('15','3','user_headport_size','会员上传头像大小限制(单位：KB)','50','int','');
INSERT INTO `Array` VALUES('16','1','cookie_code','cookie加密码','SDF90EF3OSDF','string','');
INSERT INTO `Array` VALUES('17','1','admin_email','管理员邮箱','rodeyluo@gmail.com','string','');
INSERT INTO `Array` VALUES('18','2','water_masker_path','水印文件地址','/uploadfile/water_masker.png','string','');
INSERT INTO `Array` VALUES('19','2','water_masker_size','水印文件大小','100,50','string','格式：宽度,高度');
INSERT INTO `Array` VALUES('20','2','water_masker_pos','水印位置','3','int','1：左上；2：右上；3：右下；4：左下；5：上中；6：右中；7：下中；8：左中；9：正中');
INSERT INTO `Array` VALUES('21','4','email_host','邮件服务器','smtp.szhff.com','string','');
INSERT INTO `Array` VALUES('22','4','email_port','邮件发送端口','25','string','');
INSERT INTO `Array` VALUES('23','4','email_from_addr','发件人邮箱','info@szhff.com','string','发件人邮箱地址');
INSERT INTO `Array` VALUES('24','4','email_from_pass','发送人密码','huafeng082500','string','发送人邮箱密码');
INSERT INTO `Array` VALUES('25','4','email_from_name','发送人名称','盛艺SYSTacm','string','');
INSERT INTO `Array` VALUES('26','4','email_is_authlogin','是否开启AUTH LOGIN验证','1','bool','');
INSERT INTO `Array` VALUES('31','6','mb_open','是否开启会员功能','1','bool','');
INSERT INTO `Array` VALUES('32','6','mb_namin','用户账号最小长度','3','int','');
INSERT INTO `Array` VALUES('33','6','mb_pwmin','用户密码最小长度','6','int','');
INSERT INTO `Array` VALUES('34','6','mb_spacesta','会员使用权限开通状态','0','int','1 邮件验证 2 手工审核, 0 没限制');
INSERT INTO `Array` VALUES('35','6','mb_mail_require','是否限制Email只能注册一个帐号','1','string','1:是;0:否');
INSERT INTO `Array` VALUES('36','6','mb_reginfo','注册是否需要完成详细资料的填写','1','string','1:是;0:否');
INSERT INTO `Array` VALUES('37','6','mb_notallow','不允许注册的会员账号名称','www,bbs,ftp,mail,user,users,admin,administrator','bigstring','');
INSERT INTO `Array` VALUES('38','1','site_lang','网站语种','cn','string','');
INSERT INTO `Array` VALUES('39','8','is_log','是否启用后台管理操作日志','1','bool','1:开启;0:关闭');
INSERT INTO `Array` VALUES('40','8','log_path','保存错误日志','/data/logs','string','');
INSERT INTO `Array` VALUES('41','8','log_warm_size','错误日志预警大小','20','int','单位( M )');
INSERT INTO `Array` VALUES('42','8','admin_login_num','后台最大登陆失败次数','5','int','防止攻击登录，限制重试登录次数');
INSERT INTO `Array` VALUES('43','8','refresh_space','连续两次刷新最短间隔','2','int','单位( 秒 )');
INSERT INTO `Array` VALUES('44','8','is_debug','是否开启调试模式','0','bool','1:开启;0:关闭');
INSERT INTO `Array` VALUES('45','8','is_cache','是否开启缓存','1','bool','1:开启;0:关闭');
INSERT INTO `Array` VALUES('46','8','chace_path','缓存文件路径','/temps/cache','string','');
INSERT INTO `Array` VALUES('47','4','email_type','邮件发送模式','1','int','1:SMTP 函数发送; 0:Mail模块发送');
INSERT INTO `Array` VALUES('50','6','my_css','新增测试','css','string','');
INSERT INTO `Array` VALUES('51','8','test_string','单行文本测试','单行文本测试','string','');
INSERT INTO `Array` VALUES('52','8','多行文本测试','多行文本测试','多行文本测试,
多行文本测试,
多行文本测试','bigstring','多行文本，每行以英文‘,’结尾');
INSERT INTO `Array` VALUES('53','8','test_bool','布尔值测试','1','bool','布尔类型，真(True)/假(Flas)，变量值可以为空');
INSERT INTO `Array` VALUES('54','8','test_int','数值测试','10','int','数值类型，变量值可以为空');
INSERT INTO `Array` VALUES('56','7','mapx','经度值','11395437','string','定位经度值');
INSERT INTO `Array` VALUES('57','7','mapy','纬度值','2253923','string','定位纬度值');
INSERT INTO `Array` VALUES('58','7','mapz','比例尺级别','1','string','比例尺级别');
INSERT INTO `Array` VALUES('59','7','cfg_company','公司名称','盛艺网络科技有限公司','string','请填公司名称');
INSERT INTO `Array` VALUES('60','7','cfg_address','公司地址','深圳市南山区科技园南区德赛科技大厦10楼','string','请填写公司详细地址');
INSERT INTO `Array` VALUES('61','7','cfg_website','公司网站','http://www.systacm.com','string','请填写公司网站，用于显示在地图上方');
INSERT INTO `Array` VALUES('62','2','water_masker_isopen','是否开启水印','0','bool','开启水印后上传图片将打上水印图片');
INSERT INTO `Array` VALUES('63','1','catbanner_width','栏目简介图宽度','980','int','必须为数值');
INSERT INTO `Array` VALUES('64','1','catbanner_height','栏目简介高度','300','int','必须为数值');
INSERT INTO `Array` VALUES('2','华锋E路航','http://www.szhff.com/Images/szhff-logo.png','','http://www.szhff.com','1','0','rodey','1364629997');
INSERT INTO `Array` VALUES('3','华锋E途','http://www.etugps.com/upload/images/201208/13462329564438.png','','http://www.etugps.com','1','0','rodey','1364660774');
INSERT INTO `Array` VALUES('4','E途商城','http://www.etu100.com/images/default/20130110/3b6b9489824a9ffb.png','','http://www.etu100.com','1','0','rodey','1364660920');
INSERT INTO `Array` VALUES('7','PHP Class','http://files.phpclasses.org/graphics/phpclasses/logo-phpclasses.png','','http://www.phpclasses.org','0','0','rodey','1364661997');
INSERT INTO `Array` VALUES('1','e途','http://www.etugps.com','http://www.etugps.com/upload/images/201208/13462329564438.png','http://systacm.com/uploadfile/slider/1364572800/banner_13645728001375.jpg','<p class="p-a" style="margin:0px auto;padding:20px;border:0px;width:940px;font-size:13px;font-family:&#39;microsoft yahei&#39;, 宋体;font-weight:bold;background-color:#eeeeee;color:#333333;line-height:21px;">香港华锋实业有限公司成立于2005年，是一家集研发、制造、销售、售后于一体的高新技术企业。公司集合</p>','e途,M7S,G7S,V50一体机','0','1','rodey','1367701287','1367720439');
INSERT INTO `Array` VALUES('2','e路航','http://www.szhff.com','http://www.szhff.com/Images/szhff-logo.png','http://systacm.com/uploadfile/slider/1364572800/banner_13645728005058.jpg','<p><img src="http://www.szhff.com/UploadFile/ads/t-about.jpg" alt="关于华锋" style="margin:0px 10px 0px 0px;padding:0px;border:0px none;width:265px;height:115px;float:left;color:#333333;font-family:verdana, helvetica, sans-serif;font-size:12px;line-height:19p','e路航,华锋e路航,X20,E-V5,E联星空','0','1','rodey','1367701860','1367701860');
INSERT INTO `Array` VALUES('3','小米','http://www.xiaomi.com/','http://p.www.xiaomi.com/open/130507/home/mlogo01.jpg','http://p.www.xiaomi.com/zt/130412/focus_02.jpg','<p class="tac" style="padding:0px;text-align:center;color:#666666;font-family:微软雅黑, 宋体, 黑体, arial;line-height:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><img src="/plugins/uediter/php/upload/37261367702115.jpg" style="border:0px;" />','小米,虾米,小米2A,小米2S','0','1','rodey','1367702136','1367702136');
INSERT INTO `Array` VALUES('4','HTC','http://www.htc.com/cn/','http://www.htc.com/assets-desktop/images/logo-htc.gif','http://www.htc.com/assets-desktop/images/home-page/cn/home/butterfly-index.png','<h3 style="margin:0px 0px 15px;padding:0px;border:0px;font:inherit;vertical-align:baseline;font-family:arial, sans-serif;color:#4d4d4d;background-color:#fafafa;"><a href="http://www.htc.com/assets-desktop/images/about/downloads/About_HTC_Infographic_Full_','HTC,HTC One X','0','1','rodey','1367702370','1367702370');
INSERT INTO `Array` VALUES('5','三星','http://www.samsung.com/cn','http://www.samsung.com/cn/common/img/logo.gif','http://www.samsung.com/cn/consumer-images/type/mobile-phones/S4-KV-1-1.jpg','<p><img src="/plugins/uediter/php/upload/26501367718997.gif" alt="价值与经营理念" class="title-txt" style="border:0px;vertical-align:middle;line-height:18px;font-family:samsungifrg, 微软雅黑, arial, sans-serif;font-size:12px;background-color:#ffffff;" /><br style="l','三星,Galaxy','0','1','rodey','1367719040','1367719040');
INSERT INTO `Array` VALUES('1','0','1','手机',',','a:3:{s:10:"page_title";s:6:"手机";s:13:"page_keywords";s:6:"手机";s:9:"page_desc";s:6:"手机";}','0','0','0','0','1','rodey','1367737434','1367737434');
INSERT INTO `Array` VALUES('2','0','1','电脑',',','a:3:{s:10:"page_title";s:6:"电脑";s:13:"page_keywords";s:6:"电脑";s:9:"page_desc";s:6:"电脑";}','0','0','0','0','1','rodey','1367737633','1367737633');
INSERT INTO `Array` VALUES('3','1','1','智能手机',',','a:3:{s:10:"page_title";s:12:"智能手机";s:13:"page_keywords";s:12:"智能手机";s:9:"page_desc";s:12:"智能手机";}','0','0','0','0','1','rodey','1367739773','1367739773');
INSERT INTO `Array` VALUES('6','1','1','时尚手机',',','a:3:{s:10:"page_title";s:12:"时尚手机";s:13:"page_keywords";s:12:"时尚手机";s:9:"page_desc";s:12:"时尚手机";}','1','0','0','0','1','rodey','1367746241','1367746241');
INSERT INTO `Array` VALUES('7','1','1','双卡双待',',','a:3:{s:10:"page_title";s:18:"双卡双待手机";s:13:"page_keywords";s:18:"双卡双待手机";s:9:"page_desc";s:18:"双卡双待手机";}','1','0','0','0','1','rodey','1367746958','1367746958');
INSERT INTO `Array` VALUES('8','2','1','台式电脑',',','a:3:{s:10:"page_title";s:12:"台式电脑";s:13:"page_keywords";s:12:"台式电脑";s:9:"page_desc";s:12:"台式电脑";}','1','0','0','0','1','rodey','1367747007','1367747007');
INSERT INTO `Array` VALUES('9','2','1','液晶电脑',',','a:3:{s:10:"page_title";s:12:"液晶电脑";s:13:"page_keywords";s:12:"液晶电脑";s:9:"page_desc";s:12:"液晶电脑";}','1','0','0','0','1','rodey','1367747028','1367747028');
INSERT INTO `Array` VALUES('10','2','1','平板电脑',',','a:3:{s:10:"page_title";s:12:"平板电脑";s:13:"page_keywords";s:12:"平板电脑";s:9:"page_desc";s:12:"平板电脑";}','1','0','0','0','1','rodey','1367747049','1367747049');
INSERT INTO `Array` VALUES('11','2','1','上网本',',','a:3:{s:10:"page_title";s:9:"上网本";s:13:"page_keywords";s:9:"上网本";s:9:"page_desc";s:9:"上网本";}','1','0','0','0','1','rodey','1367747067','1367747067');
INSERT INTO `Array` VALUES('12','0','1','数码/影音',',','a:3:{s:10:"page_title";s:13:"数码/影音";s:13:"page_keywords";s:13:"数码,影音";s:9:"page_desc";s:13:"数码/影音";}','1','0','0','0','1','rodey','1367760229','1367760229');
INSERT INTO `Array` VALUES('13','3','1','HTC',',','a:3:{s:10:"page_title";s:3:"HTC";s:13:"page_keywords";s:3:"HTC";s:9:"page_desc";s:3:"HTC";}','1','0','0','0','1','rodey','1367763206','1367763206');
INSERT INTO `Array` VALUES('14','3','1','三星(Samsung)',',','a:3:{s:10:"page_title";s:15:"三星(Samsung)";s:13:"page_keywords";s:15:"三星(Samsung)";s:9:"page_desc";s:15:"三星(Samsung)";}','1','0','0','0','1','rodey','1367763300','1367763300');
INSERT INTO `Array` VALUES('15','0','1','GPS导航仪',',','a:3:{s:10:"page_title";s:12:"GPS导航仪";s:13:"page_keywords";s:12:"GPS导航仪";s:9:"page_desc";s:12:"GPS导航仪";}','0','0','0','0','1','rodey','1368356747','1368356747');
INSERT INTO `Array` VALUES('16','0','1','电子狗',',','a:3:{s:10:"page_title";s:9:"电子狗";s:13:"page_keywords";s:9:"电子狗";s:9:"page_desc";s:9:"电子狗";}','1','0','0','0','1','rodey','1368357766','1368357766');
INSERT INTO `Array` VALUES('17','0','1','移动电源',',','a:3:{s:10:"page_title";s:12:"移动电源";s:13:"page_keywords";s:12:"移动电源";s:9:"page_desc";s:12:"移动电源";}','1','0','0','0','1','rodey','1368357789','1368357789');
INSERT INTO `Array` VALUES('18','0','1','行车记录仪',',','a:3:{s:10:"page_title";s:15:"行车记录仪";s:13:"page_keywords";s:15:"行车记录仪";s:9:"page_desc";s:15:"行车记录仪";}','1','0','0','0','1','rodey','1368357813','1368357813');
INSERT INTO `Array` VALUES('19','15','1','5寸GPS',',','a:3:{s:10:"page_title";s:7:"5寸GPS";s:13:"page_keywords";s:7:"5寸GPS";s:9:"page_desc";s:7:"5寸GPS";}','1','0','0','0','1','rodey','1368357859','1368357859');
INSERT INTO `Array` VALUES('20','15','1','6寸GPS',',','a:3:{s:10:"page_title";s:7:"6寸GPS";s:13:"page_keywords";s:7:"6寸GPS";s:9:"page_desc";s:7:"6寸GPS";}','0','0','0','0','1','rodey','1368357876','1368357876');
INSERT INTO `Array` VALUES('21','15','1','7寸GPS',',','a:3:{s:10:"page_title";s:7:"7寸GPS";s:13:"page_keywords";s:7:"7寸GPS";s:9:"page_desc";s:7:"7寸GPS";}','1','0','0','0','1','rodey','1368357897','1368357897');
INSERT INTO `` VALUES();
INSERT INTO `Array` VALUES('1','1','大口_VS_紫月 kof98拳皇 GGPO对战 2时10分19秒，视频由电玩街制作.','您的需求信息是天空战队的嘛，我和他马甲玩过，EZ上有个山河碎，不过现在很少见了。 //@游戏hold:我其实一直都想知道这个紫月是谁，很早以前看视频就看到过他，可后来就再没见到过了，估计都是当时在GGPO平台玩的高手，大口退出后也都陆续离开了。','Rodey','rodeyluo@gmail.com','13723722479','SYSTacm','1','1','1378136209','1378668061');
INSERT INTO `Array` VALUES('2','1','','感谢您浏览了我们的网站，如果需要更多帮助，
欢迎向我们提交需求信息，我们也欢迎您与我们面谈。','Rodey','rodeyluo@gmail.com','13723722479','SYSTacm','0','1','1378182819','0');
INSERT INTO `Array` VALUES('3','1','','也可以将您的需求信息直接发送至邮箱也可以将您的需求信息直接发送至邮箱也可以将您的需求信息直接发送至邮箱也可以将您的需求信息直接发送至邮箱也可以将您的需求信息直接发送至邮箱也可以将您的需求信息直接发送至邮箱也可以将您的需求信息直接发送至邮箱也可以将您的需求信息直接发送至邮箱也可以将您的需求信息直接发送至邮箱','罗勇','rodeyluo@gmail.com','13723722479','盛艺设计','0','1','1378183774','0');
INSERT INTO `Array` VALUES('4','1','','东风公司更好地恢复价格将会加快构建快好了后路iuop的分公司的敢死队风格三个三个三个死光光地方规划法规','阿斯顿法','rodeyluo@gmail.com','23123412341234','使得公司的','1','1','1378468584','1378474767');
INSERT INTO `Array` VALUES('8','1','','asdfasdfasdf','asdfasd','rodeyluo@gmail.com','fasfdasdf','asdfasdf','0','0','1378463611','0');
INSERT INTO `Array` VALUES('19','1','','sdfasf','asdfas','rodeyluo@gmail.com','dfasdf','asdfa','0','1','1378477453','1378477453');
INSERT INTO `Array` VALUES('20','1','','asdfasdf','dfasdf','rodeyluo@gmail.com','sfasdfas','asf','0','1','1378477673','1378477673');
INSERT INTO `Array` VALUES('21','1','','asfasfa','asefa','rodeyluo@gmail.com','fa','fasf','0','1','1378477729','1378477729');
INSERT INTO `Array` VALUES('22','1','','dfgsdfgsdfgsdfg','rodey','rodeyluo@gmail.com','agagad','fgdfgs','0','1','1378481368','1378481368');
INSERT INTO `Array` VALUES('23','1','','sdfgsdfgsdf','sfadgsd','rodeyluo@gmail.com','sdfg','fgsfg','0','1','1378481373','1378481373');
INSERT INTO `Array` VALUES('24','1','','dfghdfg','ergth','rodeyluo@gmail.com','hdfgh','dfghdfg','0','1','1378481377','1378481377');
INSERT INTO `Array` VALUES('25','1','','fgsdfg','fgsdfg','rodeyluo@gmail.com','fgsd','sdfgsd','0','1','1378481381','1378481381');
INSERT INTO `Array` VALUES('26','1','','fghj','fgfh','rodeyluo@gmail.com','fghfghfgh','fghj','0','1','1378481386','1378481386');
INSERT INTO `Array` VALUES('27','1','','fgbxfgsgsd','kfhjfgj','rodeyluo@gmail.com','gjk,','kkkkkk','0','1','1378481392','1378481392');
INSERT INTO `Array` VALUES('28','1','','etyey45yw45yw45','56y456y','rodeyluo@gmail.com','ertye','6ye546y','0','1','1378481399','1378481399');
INSERT INTO `Array` VALUES('29','1','','dfafawqrq34','4rw34sfgsrf','rodeyluo@gmail.com','erfwerferf','sergwertq3434','0','1','1378481406','1378481406');
INSERT INTO `Array` VALUES('30','1','','ertwer','e5t345twrgw','rodeyluo@gmail.com','rgwt','wertw','0','1','1378481411','1378481411');
INSERT INTO `Array` VALUES('31','1','','rgwergw','regsergew','rodeyluo@gmail.com','rgwe','rgwe','0','1','1378481414','1378481414');
INSERT INTO `Array` VALUES('32','1','','sgssrgsdgs','erwergwer','rodeyluo@gmail.com','ger','gsdf','0','1','1378481419','1378481419');
INSERT INTO `Array` VALUES('33','1','','twertwertwer','aergwergwe','rodeyluo@gmail.com','rwer','rodeyluo@gmail.com','0','1','1378481424','1378481424');
INSERT INTO `Array` VALUES('34','1','','rttert','trertye','rodeyluo@gmail.com','erty','ertyer','0','1','1378481429','1378481429');
INSERT INTO `Array` VALUES('35','1','','ertyertyertyert','ter','rodeyluo@gmail.com','yety','erty','0','1','1378481433','1378481433');
INSERT INTO `Array` VALUES('36','1','','fasdfas','asfasf','rodeyluo@gmail.com','dfasf','asfas','0','1','1378555849','1378555849');
INSERT INTO `Array` VALUES('37','1','','E途商城维护','罗勇','info@szhff.com','13723722479','香港华锋实业有限公司','0','1','1378555935','1378555935');
INSERT INTO `Array` VALUES('38','1','','期待合作 -> 提交您的需求给我们，我们会以最快速度回复您！','LuoYong','453474593@qq.com','13723722479','盛艺设计','0','1','1378556923','1378556923');
INSERT INTO `Array` VALUES('39','1','','做一个官方网站需要多少费用？另外还需要准备什么资料呢？','李海燕','rodeyluo@gmail.com','15813704141','蓝海之燕','1','1','1378564281','1378564450');
INSERT INTO `Array` VALUES('8','4','rodey(管理员)','回复内容','1','1378468371');
INSERT INTO `Array` VALUES('7','4','rodey(管理员)','回复内容','1','1378468339');
INSERT INTO `Array` VALUES('6','4','rodey(管理员)','回复内容','1','1378468234');
INSERT INTO `Array` VALUES('9','4','rodey(管理员)','回复内容','1','1378468418');
INSERT INTO `Array` VALUES('10','4','rodey(管理员)','回复内容','1','1378468458');
INSERT INTO `Array` VALUES('11','4','rodey(管理员)','回复内容','1','1378468584');
INSERT INTO `Array` VALUES('12','1','rodey(管理员)','回复内容','1','1378468692');
INSERT INTO `Array` VALUES('13','4','rodey(管理员)','来看啊','1','1378474767');
INSERT INTO `Array` VALUES('20','39','rodey(管理员)','您好！做一个通用版本的官方网站需要5000元，你需要准备域名和空间，如果没有准备，我们也提供的业务！','1','1378564414');
INSERT INTO `Array` VALUES('21','39','rodey(管理员)','哦，好的，我们先准备域名和空间','1','1378564450');
INSERT INTO `Array` VALUES('22','1','rodey(管理员)','98拳皇好玩哦! 我喜欢玩的','1','1378668026');
INSERT INTO `Array` VALUES('23','1','rodey(管理员)','回复内容2','1','1378668061');
INSERT INTO `` VALUES();
INSERT INTO `Array` VALUES('3','工作ing','1363596523');
INSERT INTO `Array` VALUES('4','生活ing','1363596523');
INSERT INTO `Array` VALUES('5','编程ing','1363596523');
INSERT INTO `Array` VALUES('7','购物ing','1363596811');
INSERT INTO `Array` VALUES('8','体育','1363596811');
INSERT INTO `Array` VALUES('9','新闻','1363596811');
INSERT INTO `Array` VALUES('10','两会','1363596811');
INSERT INTO `Array` VALUES('11','健康','1363596811');
INSERT INTO `Array` VALUES('12','汽车','1363596811');
INSERT INTO `Array` VALUES('13','IT','1363596811');
INSERT INTO `Array` VALUES('15','美女','1365743238');
INSERT INTO `Array` VALUES('16','汽车','1365743238');
INSERT INTO `Array` VALUES('17','体育','1365743238');
INSERT INTO `Array` VALUES('18','健美','1365743238');
INSERT INTO `Array` VALUES('19','健康','1365743238');
INSERT INTO `Array` VALUES('20','医疗','1365743238');
INSERT INTO `Array` VALUES('21','设计','1365743238');
INSERT INTO `Array` VALUES('22','开发','1365743238');
INSERT INTO `Array` VALUES('23','军事','1365743238');
INSERT INTO `Array` VALUES('24','新闻','1365743238');
INSERT INTO `Array` VALUES('25','海报','1365743238');
INSERT INTO `Array` VALUES('26','生活','1365743238');
INSERT INTO `Array` VALUES('27','感情','1365743238');
INSERT INTO `Array` VALUES('1','游客','0');
INSERT INTO `Array` VALUES('2','初级会员','1');
INSERT INTO `Array` VALUES('3','中级会员','2');
INSERT INTO `Array` VALUES('7','VIP会员','4');
INSERT INTO `Array` VALUES('6','高级会员','3');
INSERT INTO `Array` VALUES('1','后台登录','退出','退出成功！','1','','127.0.0.1','2','1372449926');
INSERT INTO `Array` VALUES('2','后台登录','登录','登录成功！','1','','127.0.0.1','2','1372494778');
INSERT INTO `Array` VALUES('3','后台登录','退出','退出成功！','1','','127.0.0.1','2','1372499957');
INSERT INTO `Array` VALUES('4','后台登录','登录','登录成功！','1','','127.0.0.1','2','1372499973');
INSERT INTO `Array` VALUES('5','后台登录','登录','登录成功！','1','','127.0.0.1','2','1372567100');
INSERT INTO `Array` VALUES('6','后台登录','退出','退出成功！','1','','127.0.0.1','2','1372595336');
INSERT INTO `Array` VALUES('7','后台登录','登录','登录成功！','1','','127.0.0.1','2','1372595356');
INSERT INTO `Array` VALUES('8','后台登录','退出','退出成功！','1','','127.0.0.1','2','1372595411');
INSERT INTO `Array` VALUES('9','后台登录','登录','登录成功！','1','','127.0.0.1','2','1372595428');
INSERT INTO `Array` VALUES('10','系统配置','生成配置文件','生成配置文件成功','2','','127.0.0.1','2','1372609874');
INSERT INTO `Array` VALUES('11','后台登录','登录','登录成功！','1','','127.0.0.1','2','1372691867');
INSERT INTO `Array` VALUES('12','后台登录','登录','登录成功！','1','','127.0.0.1','2','1373459769');
INSERT INTO `Array` VALUES('13','后台登录','退出','退出成功！','1','','127.0.0.1','2','1373465664');
INSERT INTO `Array` VALUES('14','后台登录','登录','登录成功！','1','','127.0.0.1','2','1373465687');
INSERT INTO `Array` VALUES('15','后台登录','登录','登录成功！','1','','127.0.0.1','2','1373547903');
INSERT INTO `Array` VALUES('16','后台登录','登录','登录成功！','1','','127.0.0.1','2','1375541753');
INSERT INTO `Array` VALUES('17','后台登录','登录','登录成功！','1','','127.0.0.1','2','1375713926');
INSERT INTO `Array` VALUES('18','后台登录','退出','退出成功！','1','','127.0.0.1','2','1375714748');
INSERT INTO `Array` VALUES('19','后台登录','登录','登录成功！','1','','127.0.0.1','2','1375714775');
INSERT INTO `Array` VALUES('20','后台登录','登录','登录成功！','1','','127.0.0.1','2','1376232511');
INSERT INTO `Array` VALUES('21','后台登录','登录','登录成功！','1','','127.0.0.1','2','1377093965');
INSERT INTO `Array` VALUES('22','后台登录','退出','退出成功！','1','','127.0.0.1','2','1377094153');
INSERT INTO `Array` VALUES('23','后台登录','登录','登录成功！','1','','127.0.0.1','2','1377342867');
INSERT INTO `Array` VALUES('24','后台登录','登录','登录成功！','1','','127.0.0.1','2','1377843792');
INSERT INTO `Array` VALUES('25','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378095634');
INSERT INTO `Array` VALUES('26','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378111077');
INSERT INTO `Array` VALUES('27','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378117628');
INSERT INTO `Array` VALUES('28','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378228180');
INSERT INTO `Array` VALUES('29','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378309973');
INSERT INTO `Array` VALUES('30','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378310184');
INSERT INTO `Array` VALUES('31','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378362586');
INSERT INTO `Array` VALUES('32','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378362599');
INSERT INTO `Array` VALUES('33','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378364876');
INSERT INTO `Array` VALUES('34','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378368641');
INSERT INTO `Array` VALUES('35','后台登录','登录','登录失败！','0','','127.0.0.1','0','1378368659');
INSERT INTO `Array` VALUES('36','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378369148');
INSERT INTO `Array` VALUES('37','后台登录','登录','登录失败！','0','','127.0.0.1','2','1378371576');
INSERT INTO `Array` VALUES('38','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378371619');
INSERT INTO `Array` VALUES('39','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378371643');
INSERT INTO `Array` VALUES('40','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378372211');
INSERT INTO `Array` VALUES('41','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378372347');
INSERT INTO `Array` VALUES('42','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378372352');
INSERT INTO `Array` VALUES('43','后台登录','登录','登录失败！','0','','127.0.0.1','0','1378372392');
INSERT INTO `Array` VALUES('44','后台登录','登录','登录失败！','0','','127.0.0.1','0','1378373469');
INSERT INTO `Array` VALUES('45','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378373478');
INSERT INTO `Array` VALUES('46','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378373481');
INSERT INTO `Array` VALUES('47','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378375722');
INSERT INTO `Array` VALUES('48','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378375727');
INSERT INTO `Array` VALUES('49','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378378256');
INSERT INTO `Array` VALUES('50','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378378259');
INSERT INTO `Array` VALUES('51','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378381738');
INSERT INTO `Array` VALUES('52','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378390481');
INSERT INTO `Array` VALUES('53','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378390503');
INSERT INTO `Array` VALUES('54','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378390587');
INSERT INTO `Array` VALUES('55','后台登录','登录','登录失败！','0','','127.0.0.1','0','1378390739');
INSERT INTO `Array` VALUES('56','后台登录','登录','登录失败！','0','','127.0.0.1','0','1378390746');
INSERT INTO `Array` VALUES('57','后台登录','登录','登录失败！','0','','127.0.0.1','0','1378391234');
INSERT INTO `Array` VALUES('58','后台登录','登录','登录失败！','0','','127.0.0.1','0','1378391257');
INSERT INTO `Array` VALUES('59','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378391264');
INSERT INTO `Array` VALUES('60','系统配置','生成配置文件','生成配置文件成功','2','','127.0.0.1','2','1378394550');
INSERT INTO `Array` VALUES('61','系统配置','生成配置文件','生成配置文件成功','2','','127.0.0.1','2','1378394648');
INSERT INTO `Array` VALUES('62','系统配置','生成配置文件','生成配置文件成功','2','','127.0.0.1','2','1378396102');
INSERT INTO `Array` VALUES('63','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378463082');
INSERT INTO `Array` VALUES('64','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378555456');
INSERT INTO `Array` VALUES('65','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378644885');
INSERT INTO `Array` VALUES('66','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378665141');
INSERT INTO `Array` VALUES('67','后台登录','退出','退出成功！','1','','127.0.0.1','2','1378675786');
INSERT INTO `Array` VALUES('68','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378675818');
INSERT INTO `Array` VALUES('69','后台登录','登录','登录成功！','1','','127.0.0.1','2','1378715826');
INSERT INTO `Array` VALUES('70','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378725840');
INSERT INTO `Array` VALUES('71','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378726592');
INSERT INTO `Array` VALUES('72','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378726641');
INSERT INTO `Array` VALUES('73','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378727093');
INSERT INTO `Array` VALUES('74','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378727193');
INSERT INTO `Array` VALUES('75','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378727283');
INSERT INTO `Array` VALUES('76','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378727466');
INSERT INTO `Array` VALUES('77','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378728402');
INSERT INTO `Array` VALUES('78','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378728567');
INSERT INTO `Array` VALUES('79','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378728682');
INSERT INTO `Array` VALUES('80','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378728684');
INSERT INTO `Array` VALUES('81','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378728751');
INSERT INTO `Array` VALUES('82','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378730749');
INSERT INTO `Array` VALUES('83','数据库','备份数据库','备份数据库成功','2','','127.0.0.1','2','1378730874');
INSERT INTO `` VALUES();
INSERT INTO `Array` VALUES('1','平安保险护航  华锋E路航&E途金牌品质','<p>平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质</p>','rodey','1','1387795200','1387968000','1363934753','1363948826');
INSERT INTO `Array` VALUES('2','地方斯蒂芬','<p>对斯蒂芬啊是发放</p>','rodey','0','1363948375','1364293800','1372448027','1372448027');
INSERT INTO `Array` VALUES('1','0','中国','0','0');
INSERT INTO `Array` VALUES('2','1','北京','1','0');
INSERT INTO `Array` VALUES('3','1','安徽','1','0');
INSERT INTO `Array` VALUES('4','1','福建','1','0');
INSERT INTO `Array` VALUES('5','1','甘肃','1','0');
INSERT INTO `Array` VALUES('6','1','广东','1','0');
INSERT INTO `Array` VALUES('7','1','广西','1','0');
INSERT INTO `Array` VALUES('8','1','贵州','1','0');
INSERT INTO `Array` VALUES('9','1','海南','1','0');
INSERT INTO `Array` VALUES('10','1','河北','1','0');
INSERT INTO `Array` VALUES('11','1','河南','1','0');
INSERT INTO `Array` VALUES('12','1','黑龙江','1','0');
INSERT INTO `Array` VALUES('13','1','湖北','1','0');
INSERT INTO `Array` VALUES('14','1','湖南','1','0');
INSERT INTO `Array` VALUES('15','1','吉林','1','0');
INSERT INTO `Array` VALUES('16','1','江苏','1','0');
INSERT INTO `Array` VALUES('17','1','江西','1','0');
INSERT INTO `Array` VALUES('18','1','辽宁','1','0');
INSERT INTO `Array` VALUES('19','1','内蒙古','1','0');
INSERT INTO `Array` VALUES('20','1','宁夏','1','0');
INSERT INTO `Array` VALUES('21','1','青海','1','0');
INSERT INTO `Array` VALUES('22','1','山东','1','0');
INSERT INTO `Array` VALUES('23','1','山西','1','0');
INSERT INTO `Array` VALUES('24','1','陕西','1','0');
INSERT INTO `Array` VALUES('25','1','上海','1','0');
INSERT INTO `Array` VALUES('26','1','四川','1','0');
INSERT INTO `Array` VALUES('27','1','天津','1','0');
INSERT INTO `Array` VALUES('28','1','西藏','1','0');
INSERT INTO `Array` VALUES('29','1','新疆','1','0');
INSERT INTO `Array` VALUES('30','1','云南','1','0');
INSERT INTO `Array` VALUES('31','1','浙江','1','0');
INSERT INTO `Array` VALUES('32','1','重庆','1','0');
INSERT INTO `Array` VALUES('33','1','香港','1','0');
INSERT INTO `Array` VALUES('34','1','澳门','1','0');
INSERT INTO `Array` VALUES('35','1','台湾','1','0');
INSERT INTO `Array` VALUES('36','3','安庆','2','0');
INSERT INTO `Array` VALUES('37','3','蚌埠','2','0');
INSERT INTO `Array` VALUES('38','3','巢湖','2','0');
INSERT INTO `Array` VALUES('39','3','池州','2','0');
INSERT INTO `Array` VALUES('40','3','滁州','2','0');
INSERT INTO `Array` VALUES('41','3','阜阳','2','0');
INSERT INTO `Array` VALUES('42','3','淮北','2','0');
INSERT INTO `Array` VALUES('43','3','淮南','2','0');
INSERT INTO `Array` VALUES('44','3','黄山','2','0');
INSERT INTO `Array` VALUES('45','3','六安','2','0');
INSERT INTO `Array` VALUES('46','3','马鞍山','2','0');
INSERT INTO `Array` VALUES('47','3','宿州','2','0');
INSERT INTO `Array` VALUES('48','3','铜陵','2','0');
INSERT INTO `Array` VALUES('49','3','芜湖','2','0');
INSERT INTO `Array` VALUES('50','3','宣城','2','0');
INSERT INTO `Array` VALUES('51','3','亳州','2','0');
INSERT INTO `Array` VALUES('52','2','北京','2','0');
INSERT INTO `Array` VALUES('53','4','福州','2','0');
INSERT INTO `Array` VALUES('54','4','龙岩','2','0');
INSERT INTO `Array` VALUES('55','4','南平','2','0');
INSERT INTO `Array` VALUES('56','4','宁德','2','0');
INSERT INTO `Array` VALUES('57','4','莆田','2','0');
INSERT INTO `Array` VALUES('58','4','泉州','2','0');
INSERT INTO `Array` VALUES('59','4','三明','2','0');
INSERT INTO `Array` VALUES('60','4','厦门','2','0');
INSERT INTO `Array` VALUES('61','4','漳州','2','0');
INSERT INTO `Array` VALUES('62','5','兰州','2','0');
INSERT INTO `Array` VALUES('63','5','白银','2','0');
INSERT INTO `Array` VALUES('64','5','定西','2','0');
INSERT INTO `Array` VALUES('65','5','甘南','2','0');
INSERT INTO `Array` VALUES('66','5','嘉峪关','2','0');
INSERT INTO `Array` VALUES('67','5','金昌','2','0');
INSERT INTO `Array` VALUES('68','5','酒泉','2','0');
INSERT INTO `Array` VALUES('69','5','临夏','2','0');
INSERT INTO `Array` VALUES('70','5','陇南','2','0');
INSERT INTO `Array` VALUES('71','5','平凉','2','0');
INSERT INTO `Array` VALUES('72','5','庆阳','2','0');
INSERT INTO `Array` VALUES('73','5','天水','2','0');
INSERT INTO `Array` VALUES('74','5','武威','2','0');
INSERT INTO `Array` VALUES('75','5','张掖','2','0');
INSERT INTO `Array` VALUES('76','6','广州','2','0');
INSERT INTO `Array` VALUES('77','6','深圳','2','0');
INSERT INTO `Array` VALUES('78','6','潮州','2','0');
INSERT INTO `Array` VALUES('79','6','东莞','2','0');
INSERT INTO `Array` VALUES('80','6','佛山','2','0');
INSERT INTO `Array` VALUES('81','6','河源','2','0');
INSERT INTO `Array` VALUES('82','6','惠州','2','0');
INSERT INTO `Array` VALUES('83','6','江门','2','0');
INSERT INTO `Array` VALUES('84','6','揭阳','2','0');
INSERT INTO `Array` VALUES('85','6','茂名','2','0');
INSERT INTO `Array` VALUES('86','6','梅州','2','0');
INSERT INTO `Array` VALUES('87','6','清远','2','0');
INSERT INTO `Array` VALUES('88','6','汕头','2','0');
INSERT INTO `Array` VALUES('89','6','汕尾','2','0');
INSERT INTO `Array` VALUES('90','6','韶关','2','0');
INSERT INTO `Array` VALUES('91','6','阳江','2','0');
INSERT INTO `Array` VALUES('92','6','云浮','2','0');
INSERT INTO `Array` VALUES('93','6','湛江','2','0');
INSERT INTO `Array` VALUES('94','6','肇庆','2','0');
INSERT INTO `Array` VALUES('95','6','中山','2','0');
INSERT INTO `Array` VALUES('96','6','珠海','2','0');
INSERT INTO `Array` VALUES('97','7','南宁','2','0');
INSERT INTO `Array` VALUES('98','7','桂林','2','0');
INSERT INTO `Array` VALUES('99','7','百色','2','0');
INSERT INTO `Array` VALUES('100','7','北海','2','0');
INSERT INTO `Array` VALUES('101','7','崇左','2','0');
INSERT INTO `Array` VALUES('102','7','防城港','2','0');
INSERT INTO `Array` VALUES('103','7','贵港','2','0');
INSERT INTO `Array` VALUES('104','7','河池','2','0');
INSERT INTO `Array` VALUES('105','7','贺州','2','0');
INSERT INTO `Array` VALUES('106','7','来宾','2','0');
INSERT INTO `Array` VALUES('107','7','柳州','2','0');
INSERT INTO `Array` VALUES('108','7','钦州','2','0');
INSERT INTO `Array` VALUES('109','7','梧州','2','0');
INSERT INTO `Array` VALUES('110','7','玉林','2','0');
INSERT INTO `Array` VALUES('111','8','贵阳','2','0');
INSERT INTO `Array` VALUES('112','8','安顺','2','0');
INSERT INTO `Array` VALUES('113','8','毕节','2','0');
INSERT INTO `Array` VALUES('114','8','六盘水','2','0');
INSERT INTO `Array` VALUES('115','8','黔东南','2','0');
INSERT INTO `Array` VALUES('116','8','黔南','2','0');
INSERT INTO `Array` VALUES('117','8','黔西南','2','0');
INSERT INTO `Array` VALUES('118','8','铜仁','2','0');
INSERT INTO `Array` VALUES('119','8','遵义','2','0');
INSERT INTO `Array` VALUES('120','9','海口','2','0');
INSERT INTO `Array` VALUES('121','9','三亚','2','0');
INSERT INTO `Array` VALUES('122','9','白沙','2','0');
INSERT INTO `Array` VALUES('123','9','保亭','2','0');
INSERT INTO `Array` VALUES('124','9','昌江','2','0');
INSERT INTO `Array` VALUES('125','9','澄迈县','2','0');
INSERT INTO `Array` VALUES('126','9','定安县','2','0');
INSERT INTO `Array` VALUES('127','9','东方','2','0');
INSERT INTO `Array` VALUES('128','9','乐东','2','0');
INSERT INTO `Array` VALUES('129','9','临高县','2','0');
INSERT INTO `Array` VALUES('130','9','陵水','2','0');
INSERT INTO `Array` VALUES('131','9','琼海','2','0');
INSERT INTO `Array` VALUES('132','9','琼中','2','0');
INSERT INTO `Array` VALUES('133','9','屯昌县','2','0');
INSERT INTO `Array` VALUES('134','9','万宁','2','0');
INSERT INTO `Array` VALUES('135','9','文昌','2','0');
INSERT INTO `Array` VALUES('136','9','五指山','2','0');
INSERT INTO `Array` VALUES('137','9','儋州','2','0');
INSERT INTO `Array` VALUES('138','10','石家庄','2','0');
INSERT INTO `Array` VALUES('139','10','保定','2','0');
INSERT INTO `Array` VALUES('140','10','沧州','2','0');
INSERT INTO `Array` VALUES('141','10','承德','2','0');
INSERT INTO `Array` VALUES('142','10','邯郸','2','0');
INSERT INTO `Array` VALUES('143','10','衡水','2','0');
INSERT INTO `Array` VALUES('144','10','廊坊','2','0');
INSERT INTO `Array` VALUES('145','10','秦皇岛','2','0');
INSERT INTO `Array` VALUES('146','10','唐山','2','0');
INSERT INTO `Array` VALUES('147','10','邢台','2','0');
INSERT INTO `Array` VALUES('148','10','张家口','2','0');
INSERT INTO `Array` VALUES('149','11','郑州','2','0');
INSERT INTO `Array` VALUES('150','11','洛阳','2','0');
INSERT INTO `Array` VALUES('151','11','开封','2','0');
INSERT INTO `Array` VALUES('152','11','安阳','2','0');
INSERT INTO `Array` VALUES('153','11','鹤壁','2','0');
INSERT INTO `Array` VALUES('154','11','济源','2','0');
INSERT INTO `Array` VALUES('155','11','焦作','2','0');
INSERT INTO `Array` VALUES('156','11','南阳','2','0');
INSERT INTO `Array` VALUES('157','11','平顶山','2','0');
INSERT INTO `Array` VALUES('158','11','三门峡','2','0');
INSERT INTO `Array` VALUES('159','11','商丘','2','0');
INSERT INTO `Array` VALUES('160','11','新乡','2','0');
INSERT INTO `Array` VALUES('161','11','信阳','2','0');
INSERT INTO `Array` VALUES('162','11','许昌','2','0');
INSERT INTO `Array` VALUES('163','11','周口','2','0');
INSERT INTO `Array` VALUES('164','11','驻马店','2','0');
INSERT INTO `Array` VALUES('165','11','漯河','2','0');
INSERT INTO `Array` VALUES('166','11','濮阳','2','0');
INSERT INTO `Array` VALUES('167','12','哈尔滨','2','0');
INSERT INTO `Array` VALUES('168','12','大庆','2','0');
INSERT INTO `Array` VALUES('169','12','大兴安岭','2','0');
INSERT INTO `Array` VALUES('170','12','鹤岗','2','0');
INSERT INTO `Array` VALUES('171','12','黑河','2','0');
INSERT INTO `Array` VALUES('172','12','鸡西','2','0');
INSERT INTO `Array` VALUES('173','12','佳木斯','2','0');
INSERT INTO `Array` VALUES('174','12','牡丹江','2','0');
INSERT INTO `Array` VALUES('175','12','七台河','2','0');
INSERT INTO `Array` VALUES('176','12','齐齐哈尔','2','0');
INSERT INTO `Array` VALUES('177','12','双鸭山','2','0');
INSERT INTO `Array` VALUES('178','12','绥化','2','0');
INSERT INTO `Array` VALUES('179','12','伊春','2','0');
INSERT INTO `Array` VALUES('180','13','武汉','2','0');
INSERT INTO `Array` VALUES('181','13','仙桃','2','0');
INSERT INTO `Array` VALUES('182','13','鄂州','2','0');
INSERT INTO `Array` VALUES('183','13','黄冈','2','0');
INSERT INTO `Array` VALUES('184','13','黄石','2','0');
INSERT INTO `Array` VALUES('185','13','荆门','2','0');
INSERT INTO `Array` VALUES('186','13','荆州','2','0');
INSERT INTO `Array` VALUES('187','13','潜江','2','0');
INSERT INTO `Array` VALUES('188','13','神农架林区','2','0');
INSERT INTO `Array` VALUES('189','13','十堰','2','0');
INSERT INTO `Array` VALUES('190','13','随州','2','0');
INSERT INTO `Array` VALUES('191','13','天门','2','0');
INSERT INTO `Array` VALUES('192','13','咸宁','2','0');
INSERT INTO `Array` VALUES('193','13','襄樊','2','0');
INSERT INTO `Array` VALUES('194','13','孝感','2','0');
INSERT INTO `Array` VALUES('195','13','宜昌','2','0');
INSERT INTO `Array` VALUES('196','13','恩施','2','0');
INSERT INTO `Array` VALUES('197','14','长沙','2','0');
INSERT INTO `Array` VALUES('198','14','张家界','2','0');
INSERT INTO `Array` VALUES('199','14','常德','2','0');
INSERT INTO `Array` VALUES('200','14','郴州','2','0');
INSERT INTO `Array` VALUES('201','14','衡阳','2','0');
INSERT INTO `Array` VALUES('202','14','怀化','2','0');
INSERT INTO `Array` VALUES('203','14','娄底','2','0');
INSERT INTO `Array` VALUES('204','14','邵阳','2','0');
INSERT INTO `Array` VALUES('205','14','湘潭','2','0');
INSERT INTO `Array` VALUES('206','14','湘西','2','0');
INSERT INTO `Array` VALUES('207','14','益阳','2','0');
INSERT INTO `Array` VALUES('208','14','永州','2','0');
INSERT INTO `Array` VALUES('209','14','岳阳','2','0');
INSERT INTO `Array` VALUES('210','14','株洲','2','0');
INSERT INTO `Array` VALUES('211','15','长春','2','0');
INSERT INTO `Array` VALUES('212','15','吉林','2','0');
INSERT INTO `Array` VALUES('213','15','白城','2','0');
INSERT INTO `Array` VALUES('214','15','白山','2','0');
INSERT INTO `Array` VALUES('215','15','辽源','2','0');
INSERT INTO `Array` VALUES('216','15','四平','2','0');
INSERT INTO `Array` VALUES('217','15','松原','2','0');
INSERT INTO `Array` VALUES('218','15','通化','2','0');
INSERT INTO `Array` VALUES('219','15','延边','2','0');
INSERT INTO `Array` VALUES('220','16','南京','2','0');
INSERT INTO `Array` VALUES('221','16','苏州','2','0');
INSERT INTO `Array` VALUES('222','16','无锡','2','0');
INSERT INTO `Array` VALUES('223','16','常州','2','0');
INSERT INTO `Array` VALUES('224','16','淮安','2','0');
INSERT INTO `Array` VALUES('225','16','连云港','2','0');
INSERT INTO `Array` VALUES('226','16','南通','2','0');
INSERT INTO `Array` VALUES('227','16','宿迁','2','0');
INSERT INTO `Array` VALUES('228','16','泰州','2','0');
INSERT INTO `Array` VALUES('229','16','徐州','2','0');
INSERT INTO `Array` VALUES('230','16','盐城','2','0');
INSERT INTO `Array` VALUES('231','16','扬州','2','0');
INSERT INTO `Array` VALUES('232','16','镇江','2','0');
INSERT INTO `Array` VALUES('233','17','南昌','2','0');
INSERT INTO `Array` VALUES('234','17','抚州','2','0');
INSERT INTO `Array` VALUES('235','17','赣州','2','0');
INSERT INTO `Array` VALUES('236','17','吉安','2','0');
INSERT INTO `Array` VALUES('237','17','景德镇','2','0');
INSERT INTO `Array` VALUES('238','17','九江','2','0');
INSERT INTO `Array` VALUES('239','17','萍乡','2','0');
INSERT INTO `Array` VALUES('240','17','上饶','2','0');
INSERT INTO `Array` VALUES('241','17','新余','2','0');
INSERT INTO `Array` VALUES('242','17','宜春','2','0');
INSERT INTO `Array` VALUES('243','17','鹰潭','2','0');
INSERT INTO `Array` VALUES('244','18','沈阳','2','0');
INSERT INTO `Array` VALUES('245','18','大连','2','0');
INSERT INTO `Array` VALUES('246','18','鞍山','2','0');
INSERT INTO `Array` VALUES('247','18','本溪','2','0');
INSERT INTO `Array` VALUES('248','18','朝阳','2','0');
INSERT INTO `Array` VALUES('249','18','丹东','2','0');
INSERT INTO `Array` VALUES('250','18','抚顺','2','0');
INSERT INTO `Array` VALUES('251','18','阜新','2','0');
INSERT INTO `Array` VALUES('252','18','葫芦岛','2','0');
INSERT INTO `Array` VALUES('253','18','锦州','2','0');
INSERT INTO `Array` VALUES('254','18','辽阳','2','0');
INSERT INTO `Array` VALUES('255','18','盘锦','2','0');
INSERT INTO `Array` VALUES('256','18','铁岭','2','0');
INSERT INTO `Array` VALUES('257','18','营口','2','0');
INSERT INTO `Array` VALUES('258','19','呼和浩特','2','0');
INSERT INTO `Array` VALUES('259','19','阿拉善盟','2','0');
INSERT INTO `Array` VALUES('260','19','巴彦淖尔盟','2','0');
INSERT INTO `Array` VALUES('261','19','包头','2','0');
INSERT INTO `Array` VALUES('262','19','赤峰','2','0');
INSERT INTO `Array` VALUES('263','19','鄂尔多斯','2','0');
INSERT INTO `Array` VALUES('264','19','呼伦贝尔','2','0');
INSERT INTO `Array` VALUES('265','19','通辽','2','0');
INSERT INTO `Array` VALUES('266','19','乌海','2','0');
INSERT INTO `Array` VALUES('267','19','乌兰察布市','2','0');
INSERT INTO `Array` VALUES('268','19','锡林郭勒盟','2','0');
INSERT INTO `Array` VALUES('269','19','兴安盟','2','0');
INSERT INTO `Array` VALUES('270','20','银川','2','0');
INSERT INTO `Array` VALUES('271','20','固原','2','0');
INSERT INTO `Array` VALUES('272','20','石嘴山','2','0');
INSERT INTO `Array` VALUES('273','20','吴忠','2','0');
INSERT INTO `Array` VALUES('274','20','中卫','2','0');
INSERT INTO `Array` VALUES('275','21','西宁','2','0');
INSERT INTO `Array` VALUES('276','21','果洛','2','0');
INSERT INTO `Array` VALUES('277','21','海北','2','0');
INSERT INTO `Array` VALUES('278','21','海东','2','0');
INSERT INTO `Array` VALUES('279','21','海南','2','0');
INSERT INTO `Array` VALUES('280','21','海西','2','0');
INSERT INTO `Array` VALUES('281','21','黄南','2','0');
INSERT INTO `Array` VALUES('282','21','玉树','2','0');
INSERT INTO `Array` VALUES('283','22','济南','2','0');
INSERT INTO `Array` VALUES('284','22','青岛','2','0');
INSERT INTO `Array` VALUES('285','22','滨州','2','0');
INSERT INTO `Array` VALUES('286','22','德州','2','0');
INSERT INTO `Array` VALUES('287','22','东营','2','0');
INSERT INTO `Array` VALUES('288','22','菏泽','2','0');
INSERT INTO `Array` VALUES('289','22','济宁','2','0');
INSERT INTO `Array` VALUES('290','22','莱芜','2','0');
INSERT INTO `Array` VALUES('291','22','聊城','2','0');
INSERT INTO `Array` VALUES('292','22','临沂','2','0');
INSERT INTO `Array` VALUES('293','22','日照','2','0');
INSERT INTO `Array` VALUES('294','22','泰安','2','0');
INSERT INTO `Array` VALUES('295','22','威海','2','0');
INSERT INTO `Array` VALUES('296','22','潍坊','2','0');
INSERT INTO `Array` VALUES('297','22','烟台','2','0');
INSERT INTO `Array` VALUES('298','22','枣庄','2','0');
INSERT INTO `Array` VALUES('299','22','淄博','2','0');
INSERT INTO `Array` VALUES('300','23','太原','2','0');
INSERT INTO `Array` VALUES('301','23','长治','2','0');
INSERT INTO `Array` VALUES('302','23','大同','2','0');
INSERT INTO `Array` VALUES('303','23','晋城','2','0');
INSERT INTO `Array` VALUES('304','23','晋中','2','0');
INSERT INTO `Array` VALUES('305','23','临汾','2','0');
INSERT INTO `Array` VALUES('306','23','吕梁','2','0');
INSERT INTO `Array` VALUES('307','23','朔州','2','0');
INSERT INTO `Array` VALUES('308','23','忻州','2','0');
INSERT INTO `Array` VALUES('309','23','阳泉','2','0');
INSERT INTO `Array` VALUES('310','23','运城','2','0');
INSERT INTO `Array` VALUES('311','24','西安','2','0');
INSERT INTO `Array` VALUES('312','24','安康','2','0');
INSERT INTO `Array` VALUES('313','24','宝鸡','2','0');
INSERT INTO `Array` VALUES('314','24','汉中','2','0');
INSERT INTO `Array` VALUES('315','24','商洛','2','0');
INSERT INTO `Array` VALUES('316','24','铜川','2','0');
INSERT INTO `Array` VALUES('317','24','渭南','2','0');
INSERT INTO `Array` VALUES('318','24','咸阳','2','0');
INSERT INTO `Array` VALUES('319','24','延安','2','0');
INSERT INTO `Array` VALUES('320','24','榆林','2','0');
INSERT INTO `Array` VALUES('321','25','上海','2','0');
INSERT INTO `Array` VALUES('322','26','成都','2','0');
INSERT INTO `Array` VALUES('323','26','绵阳','2','0');
INSERT INTO `Array` VALUES('324','26','阿坝','2','0');
INSERT INTO `Array` VALUES('325','26','巴中','2','0');
INSERT INTO `Array` VALUES('326','26','达州','2','0');
INSERT INTO `Array` VALUES('327','26','德阳','2','0');
INSERT INTO `Array` VALUES('328','26','甘孜','2','0');
INSERT INTO `Array` VALUES('329','26','广安','2','0');
INSERT INTO `Array` VALUES('330','26','广元','2','0');
INSERT INTO `Array` VALUES('331','26','乐山','2','0');
INSERT INTO `Array` VALUES('332','26','凉山','2','0');
INSERT INTO `Array` VALUES('333','26','眉山','2','0');
INSERT INTO `Array` VALUES('334','26','南充','2','0');
INSERT INTO `Array` VALUES('335','26','内江','2','0');
INSERT INTO `Array` VALUES('336','26','攀枝花','2','0');
INSERT INTO `Array` VALUES('337','26','遂宁','2','0');
INSERT INTO `Array` VALUES('338','26','雅安','2','0');
INSERT INTO `Array` VALUES('339','26','宜宾','2','0');
INSERT INTO `Array` VALUES('340','26','资阳','2','0');
INSERT INTO `Array` VALUES('341','26','自贡','2','0');
INSERT INTO `Array` VALUES('342','26','泸州','2','0');
INSERT INTO `Array` VALUES('343','27','天津','2','0');
INSERT INTO `Array` VALUES('344','28','拉萨','2','0');
INSERT INTO `Array` VALUES('345','28','阿里','2','0');
INSERT INTO `Array` VALUES('346','28','昌都','2','0');
INSERT INTO `Array` VALUES('347','28','林芝','2','0');
INSERT INTO `Array` VALUES('348','28','那曲','2','0');
INSERT INTO `Array` VALUES('349','28','日喀则','2','0');
INSERT INTO `Array` VALUES('350','28','山南','2','0');
INSERT INTO `Array` VALUES('351','29','乌鲁木齐','2','0');
INSERT INTO `Array` VALUES('352','29','阿克苏','2','0');
INSERT INTO `Array` VALUES('353','29','阿拉尔','2','0');
INSERT INTO `Array` VALUES('354','29','巴音郭楞','2','0');
INSERT INTO `Array` VALUES('355','29','博尔塔拉','2','0');
INSERT INTO `Array` VALUES('356','29','昌吉','2','0');
INSERT INTO `Array` VALUES('357','29','哈密','2','0');
INSERT INTO `Array` VALUES('358','29','和田','2','0');
INSERT INTO `Array` VALUES('359','29','喀什','2','0');
INSERT INTO `Array` VALUES('360','29','克拉玛依','2','0');
INSERT INTO `Array` VALUES('361','29','克孜勒苏','2','0');
INSERT INTO `Array` VALUES('362','29','石河子','2','0');
INSERT INTO `Array` VALUES('363','29','图木舒克','2','0');
INSERT INTO `Array` VALUES('364','29','吐鲁番','2','0');
INSERT INTO `Array` VALUES('365','29','五家渠','2','0');
INSERT INTO `Array` VALUES('366','29','伊犁','2','0');
INSERT INTO `Array` VALUES('367','30','昆明','2','0');
INSERT INTO `Array` VALUES('368','30','怒江','2','0');
INSERT INTO `Array` VALUES('369','30','普洱','2','0');
INSERT INTO `Array` VALUES('370','30','丽江','2','0');
INSERT INTO `Array` VALUES('371','30','保山','2','0');
INSERT INTO `Array` VALUES('372','30','楚雄','2','0');
INSERT INTO `Array` VALUES('373','30','大理','2','0');
INSERT INTO `Array` VALUES('374','30','德宏','2','0');
INSERT INTO `Array` VALUES('375','30','迪庆','2','0');
INSERT INTO `Array` VALUES('376','30','红河','2','0');
INSERT INTO `Array` VALUES('377','30','临沧','2','0');
INSERT INTO `Array` VALUES('378','30','曲靖','2','0');
INSERT INTO `Array` VALUES('379','30','文山','2','0');
INSERT INTO `Array` VALUES('380','30','西双版纳','2','0');
INSERT INTO `Array` VALUES('381','30','玉溪','2','0');
INSERT INTO `Array` VALUES('382','30','昭通','2','0');
INSERT INTO `Array` VALUES('383','31','杭州','2','0');
INSERT INTO `Array` VALUES('384','31','湖州','2','0');
INSERT INTO `Array` VALUES('385','31','嘉兴','2','0');
INSERT INTO `Array` VALUES('386','31','金华','2','0');
INSERT INTO `Array` VALUES('387','31','丽水','2','0');
INSERT INTO `Array` VALUES('388','31','宁波','2','0');
INSERT INTO `Array` VALUES('389','31','绍兴','2','0');
INSERT INTO `Array` VALUES('390','31','台州','2','0');
INSERT INTO `Array` VALUES('391','31','温州','2','0');
INSERT INTO `Array` VALUES('392','31','舟山','2','0');
INSERT INTO `Array` VALUES('393','31','衢州','2','0');
INSERT INTO `Array` VALUES('394','32','重庆','2','0');
INSERT INTO `Array` VALUES('395','33','香港','2','0');
INSERT INTO `Array` VALUES('396','34','澳门','2','0');
INSERT INTO `Array` VALUES('397','35','台湾','2','0');
INSERT INTO `Array` VALUES('398','36','迎江区','3','0');
INSERT INTO `Array` VALUES('399','36','大观区','3','0');
INSERT INTO `Array` VALUES('400','36','宜秀区','3','0');
INSERT INTO `Array` VALUES('401','36','桐城市','3','0');
INSERT INTO `Array` VALUES('402','36','怀宁县','3','0');
INSERT INTO `Array` VALUES('403','36','枞阳县','3','0');
INSERT INTO `Array` VALUES('404','36','潜山县','3','0');
INSERT INTO `Array` VALUES('405','36','太湖县','3','0');
INSERT INTO `Array` VALUES('406','36','宿松县','3','0');
INSERT INTO `Array` VALUES('407','36','望江县','3','0');
INSERT INTO `Array` VALUES('408','36','岳西县','3','0');
INSERT INTO `Array` VALUES('409','37','中市区','3','0');
INSERT INTO `Array` VALUES('410','37','东市区','3','0');
INSERT INTO `Array` VALUES('411','37','西市区','3','0');
INSERT INTO `Array` VALUES('412','37','郊区','3','0');
INSERT INTO `Array` VALUES('413','37','怀远县','3','0');
INSERT INTO `Array` VALUES('414','37','五河县','3','0');
INSERT INTO `Array` VALUES('415','37','固镇县','3','0');
INSERT INTO `Array` VALUES('416','38','居巢区','3','0');
INSERT INTO `Array` VALUES('417','38','庐江县','3','0');
INSERT INTO `Array` VALUES('418','38','无为县','3','0');
INSERT INTO `Array` VALUES('419','38','含山县','3','0');
INSERT INTO `Array` VALUES('420','38','和县','3','0');
INSERT INTO `Array` VALUES('421','39','贵池区','3','0');
INSERT INTO `Array` VALUES('422','39','东至县','3','0');
INSERT INTO `Array` VALUES('423','39','石台县','3','0');
INSERT INTO `Array` VALUES('424','39','青阳县','3','0');
INSERT INTO `Array` VALUES('425','40','琅琊区','3','0');
INSERT INTO `Array` VALUES('426','40','南谯区','3','0');
INSERT INTO `Array` VALUES('427','40','天长市','3','0');
INSERT INTO `Array` VALUES('428','40','明光市','3','0');
INSERT INTO `Array` VALUES('429','40','来安县','3','0');
INSERT INTO `Array` VALUES('430','40','全椒县','3','0');
INSERT INTO `Array` VALUES('431','40','定远县','3','0');
INSERT INTO `Array` VALUES('432','40','凤阳县','3','0');
INSERT INTO `Array` VALUES('433','41','蚌山区','3','0');
INSERT INTO `Array` VALUES('434','41','龙子湖区','3','0');
INSERT INTO `Array` VALUES('435','41','禹会区','3','0');
INSERT INTO `Array` VALUES('436','41','淮上区','3','0');
INSERT INTO `Array` VALUES('437','41','颍州区','3','0');
INSERT INTO `Array` VALUES('438','41','颍东区','3','0');
INSERT INTO `Array` VALUES('439','41','颍泉区','3','0');
INSERT INTO `Array` VALUES('440','41','界首市','3','0');
INSERT INTO `Array` VALUES('441','41','临泉县','3','0');
INSERT INTO `Array` VALUES('442','41','太和县','3','0');
INSERT INTO `Array` VALUES('443','41','阜南县','3','0');
INSERT INTO `Array` VALUES('444','41','颖上县','3','0');
INSERT INTO `Array` VALUES('445','42','相山区','3','0');
INSERT INTO `Array` VALUES('446','42','杜集区','3','0');
INSERT INTO `Array` VALUES('447','42','烈山区','3','0');
INSERT INTO `Array` VALUES('448','42','濉溪县','3','0');
INSERT INTO `Array` VALUES('449','43','田家庵区','3','0');
INSERT INTO `Array` VALUES('450','43','大通区','3','0');
INSERT INTO `Array` VALUES('451','43','谢家集区','3','0');
INSERT INTO `Array` VALUES('452','43','八公山区','3','0');
INSERT INTO `Array` VALUES('453','43','潘集区','3','0');
INSERT INTO `Array` VALUES('454','43','凤台县','3','0');
INSERT INTO `Array` VALUES('455','44','屯溪区','3','0');
INSERT INTO `Array` VALUES('456','44','黄山区','3','0');
INSERT INTO `Array` VALUES('457','44','徽州区','3','0');
INSERT INTO `Array` VALUES('458','44','歙县','3','0');
INSERT INTO `Array` VALUES('459','44','休宁县','3','0');
INSERT INTO `Array` VALUES('460','44','黟县','3','0');
INSERT INTO `Array` VALUES('461','44','祁门县','3','0');
INSERT INTO `Array` VALUES('462','45','金安区','3','0');
INSERT INTO `Array` VALUES('463','45','裕安区','3','0');
INSERT INTO `Array` VALUES('464','45','寿县','3','0');
INSERT INTO `Array` VALUES('465','45','霍邱县','3','0');
INSERT INTO `Array` VALUES('466','45','舒城县','3','0');
INSERT INTO `Array` VALUES('467','45','金寨县','3','0');
INSERT INTO `Array` VALUES('468','45','霍山县','3','0');
INSERT INTO `Array` VALUES('469','46','雨山区','3','0');
INSERT INTO `Array` VALUES('470','46','花山区','3','0');
INSERT INTO `Array` VALUES('471','46','金家庄区','3','0');
INSERT INTO `Array` VALUES('472','46','当涂县','3','0');
INSERT INTO `Array` VALUES('473','47','埇桥区','3','0');
INSERT INTO `Array` VALUES('474','47','砀山县','3','0');
INSERT INTO `Array` VALUES('475','47','萧县','3','0');
INSERT INTO `Array` VALUES('476','47','灵璧县','3','0');
INSERT INTO `Array` VALUES('477','47','泗县','3','0');
INSERT INTO `Array` VALUES('478','48','铜官山区','3','0');
INSERT INTO `Array` VALUES('479','48','狮子山区','3','0');
INSERT INTO `Array` VALUES('480','48','郊区','3','0');
INSERT INTO `Array` VALUES('481','48','铜陵县','3','0');
INSERT INTO `Array` VALUES('482','49','镜湖区','3','0');
INSERT INTO `Array` VALUES('483','49','弋江区','3','0');
INSERT INTO `Array` VALUES('484','49','鸠江区','3','0');
INSERT INTO `Array` VALUES('485','49','三山区','3','0');
INSERT INTO `Array` VALUES('486','49','芜湖县','3','0');
INSERT INTO `Array` VALUES('487','49','繁昌县','3','0');
INSERT INTO `Array` VALUES('488','49','南陵县','3','0');
INSERT INTO `Array` VALUES('489','50','宣州区','3','0');
INSERT INTO `Array` VALUES('490','50','宁国市','3','0');
INSERT INTO `Array` VALUES('491','50','郎溪县','3','0');
INSERT INTO `Array` VALUES('492','50','广德县','3','0');
INSERT INTO `Array` VALUES('493','50','泾县','3','0');
INSERT INTO `Array` VALUES('494','50','绩溪县','3','0');
INSERT INTO `Array` VALUES('495','50','旌德县','3','0');
INSERT INTO `Array` VALUES('496','51','涡阳县','3','0');
INSERT INTO `Array` VALUES('497','51','蒙城县','3','0');
INSERT INTO `Array` VALUES('498','51','利辛县','3','0');
INSERT INTO `Array` VALUES('499','51','谯城区','3','0');
INSERT INTO `Array` VALUES('500','52','东城区','3','0');
INSERT INTO `Array` VALUES('501','52','西城区','3','0');
INSERT INTO `Array` VALUES('502','52','海淀区','3','0');
INSERT INTO `Array` VALUES('503','52','朝阳区','3','0');
INSERT INTO `Array` VALUES('504','52','崇文区','3','0');
INSERT INTO `Array` VALUES('505','52','宣武区','3','0');
INSERT INTO `Array` VALUES('506','52','丰台区','3','0');
INSERT INTO `Array` VALUES('507','52','石景山区','3','0');
INSERT INTO `Array` VALUES('508','52','房山区','3','0');
INSERT INTO `Array` VALUES('509','52','门头沟区','3','0');
INSERT INTO `Array` VALUES('510','52','通州区','3','0');
INSERT INTO `Array` VALUES('511','52','顺义区','3','0');
INSERT INTO `Array` VALUES('512','52','昌平区','3','0');
INSERT INTO `Array` VALUES('513','52','怀柔区','3','0');
INSERT INTO `Array` VALUES('514','52','平谷区','3','0');
INSERT INTO `Array` VALUES('515','52','大兴区','3','0');
INSERT INTO `Array` VALUES('516','52','密云县','3','0');
INSERT INTO `Array` VALUES('517','52','延庆县','3','0');
INSERT INTO `Array` VALUES('518','53','鼓楼区','3','0');
INSERT INTO `Array` VALUES('519','53','台江区','3','0');
INSERT INTO `Array` VALUES('520','53','仓山区','3','0');
INSERT INTO `Array` VALUES('521','53','马尾区','3','0');
INSERT INTO `Array` VALUES('522','53','晋安区','3','0');
INSERT INTO `Array` VALUES('523','53','福清市','3','0');
INSERT INTO `Array` VALUES('524','53','长乐市','3','0');
INSERT INTO `Array` VALUES('525','53','闽侯县','3','0');
INSERT INTO `Array` VALUES('526','53','连江县','3','0');
INSERT INTO `Array` VALUES('527','53','罗源县','3','0');
INSERT INTO `Array` VALUES('528','53','闽清县','3','0');
INSERT INTO `Array` VALUES('529','53','永泰县','3','0');
INSERT INTO `Array` VALUES('530','53','平潭县','3','0');
INSERT INTO `Array` VALUES('531','54','新罗区','3','0');
INSERT INTO `Array` VALUES('532','54','漳平市','3','0');
INSERT INTO `Array` VALUES('533','54','长汀县','3','0');
INSERT INTO `Array` VALUES('534','54','永定县','3','0');
INSERT INTO `Array` VALUES('535','54','上杭县','3','0');
INSERT INTO `Array` VALUES('536','54','武平县','3','0');
INSERT INTO `Array` VALUES('537','54','连城县','3','0');
INSERT INTO `Array` VALUES('538','55','延平区','3','0');
INSERT INTO `Array` VALUES('539','55','邵武市','3','0');
INSERT INTO `Array` VALUES('540','55','武夷山市','3','0');
INSERT INTO `Array` VALUES('541','55','建瓯市','3','0');
INSERT INTO `Array` VALUES('542','55','建阳市','3','0');
INSERT INTO `Array` VALUES('543','55','顺昌县','3','0');
INSERT INTO `Array` VALUES('544','55','浦城县','3','0');
INSERT INTO `Array` VALUES('545','55','光泽县','3','0');
INSERT INTO `Array` VALUES('546','55','松溪县','3','0');
INSERT INTO `Array` VALUES('547','55','政和县','3','0');
INSERT INTO `Array` VALUES('548','56','蕉城区','3','0');
INSERT INTO `Array` VALUES('549','56','福安市','3','0');
INSERT INTO `Array` VALUES('550','56','福鼎市','3','0');
INSERT INTO `Array` VALUES('551','56','霞浦县','3','0');
INSERT INTO `Array` VALUES('552','56','古田县','3','0');
INSERT INTO `Array` VALUES('553','56','屏南县','3','0');
INSERT INTO `Array` VALUES('554','56','寿宁县','3','0');
INSERT INTO `Array` VALUES('555','56','周宁县','3','0');
INSERT INTO `Array` VALUES('556','56','柘荣县','3','0');
INSERT INTO `Array` VALUES('557','57','城厢区','3','0');
INSERT INTO `Array` VALUES('558','57','涵江区','3','0');
INSERT INTO `Array` VALUES('559','57','荔城区','3','0');
INSERT INTO `Array` VALUES('560','57','秀屿区','3','0');
INSERT INTO `Array` VALUES('561','57','仙游县','3','0');
INSERT INTO `Array` VALUES('562','58','鲤城区','3','0');
INSERT INTO `Array` VALUES('563','58','丰泽区','3','0');
INSERT INTO `Array` VALUES('564','58','洛江区','3','0');
INSERT INTO `Array` VALUES('565','58','清濛开发区','3','0');
INSERT INTO `Array` VALUES('566','58','泉港区','3','0');
INSERT INTO `Array` VALUES('567','58','石狮市','3','0');
INSERT INTO `Array` VALUES('568','58','晋江市','3','0');
INSERT INTO `Array` VALUES('569','58','南安市','3','0');
INSERT INTO `Array` VALUES('570','58','惠安县','3','0');
INSERT INTO `Array` VALUES('571','58','安溪县','3','0');
INSERT INTO `Array` VALUES('572','58','永春县','3','0');
INSERT INTO `Array` VALUES('573','58','德化县','3','0');
INSERT INTO `Array` VALUES('574','58','金门县','3','0');
INSERT INTO `Array` VALUES('575','59','梅列区','3','0');
INSERT INTO `Array` VALUES('576','59','三元区','3','0');
INSERT INTO `Array` VALUES('577','59','永安市','3','0');
INSERT INTO `Array` VALUES('578','59','明溪县','3','0');
INSERT INTO `Array` VALUES('579','59','清流县','3','0');
INSERT INTO `Array` VALUES('580','59','宁化县','3','0');
INSERT INTO `Array` VALUES('581','59','大田县','3','0');
INSERT INTO `Array` VALUES('582','59','尤溪县','3','0');
INSERT INTO `Array` VALUES('583','59','沙县','3','0');
INSERT INTO `Array` VALUES('584','59','将乐县','3','0');
INSERT INTO `Array` VALUES('585','59','泰宁县','3','0');
INSERT INTO `Array` VALUES('586','59','建宁县','3','0');
INSERT INTO `Array` VALUES('587','60','思明区','3','0');
INSERT INTO `Array` VALUES('588','60','海沧区','3','0');
INSERT INTO `Array` VALUES('589','60','湖里区','3','0');
INSERT INTO `Array` VALUES('590','60','集美区','3','0');
INSERT INTO `Array` VALUES('591','60','同安区','3','0');
INSERT INTO `Array` VALUES('592','60','翔安区','3','0');
INSERT INTO `Array` VALUES('593','61','芗城区','3','0');
INSERT INTO `Array` VALUES('594','61','龙文区','3','0');
INSERT INTO `Array` VALUES('595','61','龙海市','3','0');
INSERT INTO `Array` VALUES('596','61','云霄县','3','0');
INSERT INTO `Array` VALUES('597','61','漳浦县','3','0');
INSERT INTO `Array` VALUES('598','61','诏安县','3','0');
INSERT INTO `Array` VALUES('599','61','长泰县','3','0');
INSERT INTO `Array` VALUES('600','61','东山县','3','0');
INSERT INTO `Array` VALUES('601','61','南靖县','3','0');
INSERT INTO `Array` VALUES('602','61','平和县','3','0');
INSERT INTO `Array` VALUES('603','61','华安县','3','0');
INSERT INTO `Array` VALUES('604','62','皋兰县','3','0');
INSERT INTO `Array` VALUES('605','62','城关区','3','0');
INSERT INTO `Array` VALUES('606','62','七里河区','3','0');
INSERT INTO `Array` VALUES('607','62','西固区','3','0');
INSERT INTO `Array` VALUES('608','62','安宁区','3','0');
INSERT INTO `Array` VALUES('609','62','红古区','3','0');
INSERT INTO `Array` VALUES('610','62','永登县','3','0');
INSERT INTO `Array` VALUES('611','62','榆中县','3','0');
INSERT INTO `Array` VALUES('612','63','白银区','3','0');
INSERT INTO `Array` VALUES('613','63','平川区','3','0');
INSERT INTO `Array` VALUES('614','63','会宁县','3','0');
INSERT INTO `Array` VALUES('615','63','景泰县','3','0');
INSERT INTO `Array` VALUES('616','63','靖远县','3','0');
INSERT INTO `Array` VALUES('617','64','临洮县','3','0');
INSERT INTO `Array` VALUES('618','64','陇西县','3','0');
INSERT INTO `Array` VALUES('619','64','通渭县','3','0');
INSERT INTO `Array` VALUES('620','64','渭源县','3','0');
INSERT INTO `Array` VALUES('621','64','漳县','3','0');
INSERT INTO `Array` VALUES('622','64','岷县','3','0');
INSERT INTO `Array` VALUES('623','64','安定区','3','0');
INSERT INTO `Array` VALUES('624','64','安定区','3','0');
INSERT INTO `Array` VALUES('625','65','合作市','3','0');
INSERT INTO `Array` VALUES('626','65','临潭县','3','0');
INSERT INTO `Array` VALUES('627','65','卓尼县','3','0');
INSERT INTO `Array` VALUES('628','65','舟曲县','3','0');
INSERT INTO `Array` VALUES('629','65','迭部县','3','0');
INSERT INTO `Array` VALUES('630','65','玛曲县','3','0');
INSERT INTO `Array` VALUES('631','65','碌曲县','3','0');
INSERT INTO `Array` VALUES('632','65','夏河县','3','0');
INSERT INTO `Array` VALUES('633','66','嘉峪关市','3','0');
INSERT INTO `Array` VALUES('634','67','金川区','3','0');
INSERT INTO `Array` VALUES('635','67','永昌县','3','0');
INSERT INTO `Array` VALUES('636','68','肃州区','3','0');
INSERT INTO `Array` VALUES('637','68','玉门市','3','0');
INSERT INTO `Array` VALUES('638','68','敦煌市','3','0');
INSERT INTO `Array` VALUES('639','68','金塔县','3','0');
INSERT INTO `Array` VALUES('640','68','瓜州县','3','0');
INSERT INTO `Array` VALUES('641','68','肃北','3','0');
INSERT INTO `Array` VALUES('642','68','阿克塞','3','0');
INSERT INTO `Array` VALUES('643','69','临夏市','3','0');
INSERT INTO `Array` VALUES('644','69','临夏县','3','0');
INSERT INTO `Array` VALUES('645','69','康乐县','3','0');
INSERT INTO `Array` VALUES('646','69','永靖县','3','0');
INSERT INTO `Array` VALUES('647','69','广河县','3','0');
INSERT INTO `Array` VALUES('648','69','和政县','3','0');
INSERT INTO `Array` VALUES('649','69','东乡族自治县','3','0');
INSERT INTO `Array` VALUES('650','69','积石山','3','0');
INSERT INTO `Array` VALUES('651','70','成县','3','0');
INSERT INTO `Array` VALUES('652','70','徽县','3','0');
INSERT INTO `Array` VALUES('653','70','康县','3','0');
INSERT INTO `Array` VALUES('654','70','礼县','3','0');
INSERT INTO `Array` VALUES('655','70','两当县','3','0');
INSERT INTO `Array` VALUES('656','70','文县','3','0');
INSERT INTO `Array` VALUES('657','70','西和县','3','0');
INSERT INTO `Array` VALUES('658','70','宕昌县','3','0');
INSERT INTO `Array` VALUES('659','70','武都区','3','0');
INSERT INTO `Array` VALUES('660','71','崇信县','3','0');
INSERT INTO `Array` VALUES('661','71','华亭县','3','0');
INSERT INTO `Array` VALUES('662','71','静宁县','3','0');
INSERT INTO `Array` VALUES('663','71','灵台县','3','0');
INSERT INTO `Array` VALUES('664','71','崆峒区','3','0');
INSERT INTO `Array` VALUES('665','71','庄浪县','3','0');
INSERT INTO `Array` VALUES('666','71','泾川县','3','0');
INSERT INTO `Array` VALUES('667','72','合水县','3','0');
INSERT INTO `Array` VALUES('668','72','华池县','3','0');
INSERT INTO `Array` VALUES('669','72','环县','3','0');
INSERT INTO `Array` VALUES('670','72','宁县','3','0');
INSERT INTO `Array` VALUES('671','72','庆城县','3','0');
INSERT INTO `Array` VALUES('672','72','西峰区','3','0');
INSERT INTO `Array` VALUES('673','72','镇原县','3','0');
INSERT INTO `Array` VALUES('674','72','正宁县','3','0');
INSERT INTO `Array` VALUES('675','73','甘谷县','3','0');
INSERT INTO `Array` VALUES('676','73','秦安县','3','0');
INSERT INTO `Array` VALUES('677','73','清水县','3','0');
INSERT INTO `Array` VALUES('678','73','秦州区','3','0');
INSERT INTO `Array` VALUES('679','73','麦积区','3','0');
INSERT INTO `Array` VALUES('680','73','武山县','3','0');
INSERT INTO `Array` VALUES('681','73','张家川','3','0');
INSERT INTO `Array` VALUES('682','74','古浪县','3','0');
INSERT INTO `Array` VALUES('683','74','民勤县','3','0');
INSERT INTO `Array` VALUES('684','74','天祝','3','0');
INSERT INTO `Array` VALUES('685','74','凉州区','3','0');
INSERT INTO `Array` VALUES('686','75','高台县','3','0');
INSERT INTO `Array` VALUES('687','75','临泽县','3','0');
INSERT INTO `Array` VALUES('688','75','民乐县','3','0');
INSERT INTO `Array` VALUES('689','75','山丹县','3','0');
INSERT INTO `Array` VALUES('690','75','肃南','3','0');
INSERT INTO `Array` VALUES('691','75','甘州区','3','0');
INSERT INTO `Array` VALUES('692','76','从化市','3','0');
INSERT INTO `Array` VALUES('693','76','天河区','3','0');
INSERT INTO `Array` VALUES('694','76','东山区','3','0');
INSERT INTO `Array` VALUES('695','76','白云区','3','0');
INSERT INTO `Array` VALUES('696','76','海珠区','3','0');
INSERT INTO `Array` VALUES('697','76','荔湾区','3','0');
INSERT INTO `Array` VALUES('698','76','越秀区','3','0');
INSERT INTO `Array` VALUES('699','76','黄埔区','3','0');
INSERT INTO `Array` VALUES('700','76','番禺区','3','0');
INSERT INTO `Array` VALUES('701','76','花都区','3','0');
INSERT INTO `Array` VALUES('702','76','增城区','3','0');
INSERT INTO `Array` VALUES('703','76','从化区','3','0');
INSERT INTO `Array` VALUES('704','76','市郊','3','0');
INSERT INTO `Array` VALUES('705','77','福田区','3','0');
INSERT INTO `Array` VALUES('706','77','罗湖区','3','0');
INSERT INTO `Array` VALUES('707','77','南山区','3','0');
INSERT INTO `Array` VALUES('708','77','宝安区','3','0');
INSERT INTO `Array` VALUES('709','77','龙岗区','3','0');
INSERT INTO `Array` VALUES('710','77','盐田区','3','0');
INSERT INTO `Array` VALUES('711','78','湘桥区','3','0');
INSERT INTO `Array` VALUES('712','78','潮安县','3','0');
INSERT INTO `Array` VALUES('713','78','饶平县','3','0');
INSERT INTO `Array` VALUES('714','79','南城区','3','0');
INSERT INTO `Array` VALUES('715','79','东城区','3','0');
INSERT INTO `Array` VALUES('716','79','万江区','3','0');
INSERT INTO `Array` VALUES('717','79','莞城区','3','0');
INSERT INTO `Array` VALUES('718','79','石龙镇','3','0');
INSERT INTO `Array` VALUES('719','79','虎门镇','3','0');
INSERT INTO `Array` VALUES('720','79','麻涌镇','3','0');
INSERT INTO `Array` VALUES('721','79','道滘镇','3','0');
INSERT INTO `Array` VALUES('722','79','石碣镇','3','0');
INSERT INTO `Array` VALUES('723','79','沙田镇','3','0');
INSERT INTO `Array` VALUES('724','79','望牛墩镇','3','0');
INSERT INTO `Array` VALUES('725','79','洪梅镇','3','0');
INSERT INTO `Array` VALUES('726','79','茶山镇','3','0');
INSERT INTO `Array` VALUES('727','79','寮步镇','3','0');
INSERT INTO `Array` VALUES('728','79','大岭山镇','3','0');
INSERT INTO `Array` VALUES('729','79','大朗镇','3','0');
INSERT INTO `Array` VALUES('730','79','黄江镇','3','0');
INSERT INTO `Array` VALUES('731','79','樟木头','3','0');
INSERT INTO `Array` VALUES('732','79','凤岗镇','3','0');
INSERT INTO `Array` VALUES('733','79','塘厦镇','3','0');
INSERT INTO `Array` VALUES('734','79','谢岗镇','3','0');
INSERT INTO `Array` VALUES('735','79','厚街镇','3','0');
INSERT INTO `Array` VALUES('736','79','清溪镇','3','0');
INSERT INTO `Array` VALUES('737','79','常平镇','3','0');
INSERT INTO `Array` VALUES('738','79','桥头镇','3','0');
INSERT INTO `Array` VALUES('739','79','横沥镇','3','0');
INSERT INTO `Array` VALUES('740','79','东坑镇','3','0');
INSERT INTO `Array` VALUES('741','79','企石镇','3','0');
INSERT INTO `Array` VALUES('742','79','石排镇','3','0');
INSERT INTO `Array` VALUES('743','79','长安镇','3','0');
INSERT INTO `Array` VALUES('744','79','中堂镇','3','0');
INSERT INTO `Array` VALUES('745','79','高埗镇','3','0');
INSERT INTO `Array` VALUES('746','80','禅城区','3','0');
INSERT INTO `Array` VALUES('747','80','南海区','3','0');
INSERT INTO `Array` VALUES('748','80','顺德区','3','0');
INSERT INTO `Array` VALUES('749','80','三水区','3','0');
INSERT INTO `Array` VALUES('750','80','高明区','3','0');
INSERT INTO `Array` VALUES('751','81','东源县','3','0');
INSERT INTO `Array` VALUES('752','81','和平县','3','0');
INSERT INTO `Array` VALUES('753','81','源城区','3','0');
INSERT INTO `Array` VALUES('754','81','连平县','3','0');
INSERT INTO `Array` VALUES('755','81','龙川县','3','0');
INSERT INTO `Array` VALUES('756','81','紫金县','3','0');
INSERT INTO `Array` VALUES('757','82','惠阳区','3','0');
INSERT INTO `Array` VALUES('758','82','惠城区','3','0');
INSERT INTO `Array` VALUES('759','82','大亚湾','3','0');
INSERT INTO `Array` VALUES('760','82','博罗县','3','0');
INSERT INTO `Array` VALUES('761','82','惠东县','3','0');
INSERT INTO `Array` VALUES('762','82','龙门县','3','0');
INSERT INTO `Array` VALUES('763','83','江海区','3','0');
INSERT INTO `Array` VALUES('764','83','蓬江区','3','0');
INSERT INTO `Array` VALUES('765','83','新会区','3','0');
INSERT INTO `Array` VALUES('766','83','台山市','3','0');
INSERT INTO `Array` VALUES('767','83','开平市','3','0');
INSERT INTO `Array` VALUES('768','83','鹤山市','3','0');
INSERT INTO `Array` VALUES('769','83','恩平市','3','0');
INSERT INTO `Array` VALUES('770','84','榕城区','3','0');
INSERT INTO `Array` VALUES('771','84','普宁市','3','0');
INSERT INTO `Array` VALUES('772','84','揭东县','3','0');
INSERT INTO `Array` VALUES('773','84','揭西县','3','0');
INSERT INTO `Array` VALUES('774','84','惠来县','3','0');
INSERT INTO `Array` VALUES('775','85','茂南区','3','0');
INSERT INTO `Array` VALUES('776','85','茂港区','3','0');
INSERT INTO `Array` VALUES('777','85','高州市','3','0');
INSERT INTO `Array` VALUES('778','85','化州市','3','0');
INSERT INTO `Array` VALUES('779','85','信宜市','3','0');
INSERT INTO `Array` VALUES('780','85','电白县','3','0');
INSERT INTO `Array` VALUES('781','86','梅县','3','0');
INSERT INTO `Array` VALUES('782','86','梅江区','3','0');
INSERT INTO `Array` VALUES('783','86','兴宁市','3','0');
INSERT INTO `Array` VALUES('784','86','大埔县','3','0');
INSERT INTO `Array` VALUES('785','86','丰顺县','3','0');
INSERT INTO `Array` VALUES('786','86','五华县','3','0');
INSERT INTO `Array` VALUES('787','86','平远县','3','0');
INSERT INTO `Array` VALUES('788','86','蕉岭县','3','0');
INSERT INTO `Array` VALUES('789','87','清城区','3','0');
INSERT INTO `Array` VALUES('790','87','英德市','3','0');
INSERT INTO `Array` VALUES('791','87','连州市','3','0');
INSERT INTO `Array` VALUES('792','87','佛冈县','3','0');
INSERT INTO `Array` VALUES('793','87','阳山县','3','0');
INSERT INTO `Array` VALUES('794','87','清新县','3','0');
INSERT INTO `Array` VALUES('795','87','连山','3','0');
INSERT INTO `Array` VALUES('796','87','连南','3','0');
INSERT INTO `Array` VALUES('797','88','南澳县','3','0');
INSERT INTO `Array` VALUES('798','88','潮阳区','3','0');
INSERT INTO `Array` VALUES('799','88','澄海区','3','0');
INSERT INTO `Array` VALUES('800','88','龙湖区','3','0');
INSERT INTO `Array` VALUES('801','88','金平区','3','0');
INSERT INTO `Array` VALUES('802','88','濠江区','3','0');
INSERT INTO `Array` VALUES('803','88','潮南区','3','0');
INSERT INTO `Array` VALUES('804','89','城区','3','0');
INSERT INTO `Array` VALUES('805','89','陆丰市','3','0');
INSERT INTO `Array` VALUES('806','89','海丰县','3','0');
INSERT INTO `Array` VALUES('807','89','陆河县','3','0');
INSERT INTO `Array` VALUES('808','90','曲江县','3','0');
INSERT INTO `Array` VALUES('809','90','浈江区','3','0');
INSERT INTO `Array` VALUES('810','90','武江区','3','0');
INSERT INTO `Array` VALUES('811','90','曲江区','3','0');
INSERT INTO `Array` VALUES('812','90','乐昌市','3','0');
INSERT INTO `Array` VALUES('813','90','南雄市','3','0');
INSERT INTO `Array` VALUES('814','90','始兴县','3','0');
INSERT INTO `Array` VALUES('815','90','仁化县','3','0');
INSERT INTO `Array` VALUES('816','90','翁源县','3','0');
INSERT INTO `Array` VALUES('817','90','新丰县','3','0');
INSERT INTO `Array` VALUES('818','90','乳源','3','0');
INSERT INTO `Array` VALUES('819','91','江城区','3','0');
INSERT INTO `Array` VALUES('820','91','阳春市','3','0');
INSERT INTO `Array` VALUES('821','91','阳西县','3','0');
INSERT INTO `Array` VALUES('822','91','阳东县','3','0');
INSERT INTO `Array` VALUES('823','92','云城区','3','0');
INSERT INTO `Array` VALUES('824','92','罗定市','3','0');
INSERT INTO `Array` VALUES('825','92','新兴县','3','0');
INSERT INTO `Array` VALUES('826','92','郁南县','3','0');
INSERT INTO `Array` VALUES('827','92','云安县','3','0');
INSERT INTO `Array` VALUES('828','93','赤坎区','3','0');
INSERT INTO `Array` VALUES('829','93','霞山区','3','0');
INSERT INTO `Array` VALUES('830','93','坡头区','3','0');
INSERT INTO `Array` VALUES('831','93','麻章区','3','0');
INSERT INTO `Array` VALUES('832','93','廉江市','3','0');
INSERT INTO `Array` VALUES('833','93','雷州市','3','0');
INSERT INTO `Array` VALUES('834','93','吴川市','3','0');
INSERT INTO `Array` VALUES('835','93','遂溪县','3','0');
INSERT INTO `Array` VALUES('836','93','徐闻县','3','0');
INSERT INTO `Array` VALUES('837','94','肇庆市','3','0');
INSERT INTO `Array` VALUES('838','94','高要市','3','0');
INSERT INTO `Array` VALUES('839','94','四会市','3','0');
INSERT INTO `Array` VALUES('840','94','广宁县','3','0');
INSERT INTO `Array` VALUES('841','94','怀集县','3','0');
INSERT INTO `Array` VALUES('842','94','封开县','3','0');
INSERT INTO `Array` VALUES('843','94','德庆县','3','0');
INSERT INTO `Array` VALUES('844','95','石岐街道','3','0');
INSERT INTO `Array` VALUES('845','95','东区街道','3','0');
INSERT INTO `Array` VALUES('846','95','西区街道','3','0');
INSERT INTO `Array` VALUES('847','95','环城街道','3','0');
INSERT INTO `Array` VALUES('848','95','中山港街道','3','0');
INSERT INTO `Array` VALUES('849','95','五桂山街道','3','0');
INSERT INTO `Array` VALUES('850','96','香洲区','3','0');
INSERT INTO `Array` VALUES('851','96','斗门区','3','0');
INSERT INTO `Array` VALUES('852','96','金湾区','3','0');
INSERT INTO `Array` VALUES('853','97','邕宁区','3','0');
INSERT INTO `Array` VALUES('854','97','青秀区','3','0');
INSERT INTO `Array` VALUES('855','97','兴宁区','3','0');
INSERT INTO `Array` VALUES('856','97','良庆区','3','0');
INSERT INTO `Array` VALUES('857','97','西乡塘区','3','0');
INSERT INTO `Array` VALUES('858','97','江南区','3','0');
INSERT INTO `Array` VALUES('859','97','武鸣县','3','0');
INSERT INTO `Array` VALUES('860','97','隆安县','3','0');
INSERT INTO `Array` VALUES('861','97','马山县','3','0');
INSERT INTO `Array` VALUES('862','97','上林县','3','0');
INSERT INTO `Array` VALUES('863','97','宾阳县','3','0');
INSERT INTO `Array` VALUES('864','97','横县','3','0');
INSERT INTO `Array` VALUES('865','98','秀峰区','3','0');
INSERT INTO `Array` VALUES('866','98','叠彩区','3','0');
INSERT INTO `Array` VALUES('867','98','象山区','3','0');
INSERT INTO `Array` VALUES('868','98','七星区','3','0');
INSERT INTO `Array` VALUES('869','98','雁山区','3','0');
INSERT INTO `Array` VALUES('870','98','阳朔县','3','0');
INSERT INTO `Array` VALUES('871','98','临桂县','3','0');
INSERT INTO `Array` VALUES('872','98','灵川县','3','0');
INSERT INTO `Array` VALUES('873','98','全州县','3','0');
INSERT INTO `Array` VALUES('874','98','平乐县','3','0');
INSERT INTO `Array` VALUES('875','98','兴安县','3','0');
INSERT INTO `Array` VALUES('876','98','灌阳县','3','0');
INSERT INTO `Array` VALUES('877','98','荔浦县','3','0');
INSERT INTO `Array` VALUES('878','98','资源县','3','0');
INSERT INTO `Array` VALUES('879','98','永福县','3','0');
INSERT INTO `Array` VALUES('880','98','龙胜','3','0');
INSERT INTO `Array` VALUES('881','98','恭城','3','0');
INSERT INTO `Array` VALUES('882','99','右江区','3','0');
INSERT INTO `Array` VALUES('883','99','凌云县','3','0');
INSERT INTO `Array` VALUES('884','99','平果县','3','0');
INSERT INTO `Array` VALUES('885','99','西林县','3','0');
INSERT INTO `Array` VALUES('886','99','乐业县','3','0');
INSERT INTO `Array` VALUES('887','99','德保县','3','0');
INSERT INTO `Array` VALUES('888','99','田林县','3','0');
INSERT INTO `Array` VALUES('889','99','田阳县','3','0');
INSERT INTO `Array` VALUES('890','99','靖西县','3','0');
INSERT INTO `Array` VALUES('891','99','田东县','3','0');
INSERT INTO `Array` VALUES('892','99','那坡县','3','0');
INSERT INTO `Array` VALUES('893','99','隆林','3','0');
INSERT INTO `Array` VALUES('894','100','海城区','3','0');
INSERT INTO `Array` VALUES('895','100','银海区','3','0');
INSERT INTO `Array` VALUES('896','100','铁山港区','3','0');
INSERT INTO `Array` VALUES('897','100','合浦县','3','0');
INSERT INTO `Array` VALUES('898','101','江州区','3','0');
INSERT INTO `Array` VALUES('899','101','凭祥市','3','0');
INSERT INTO `Array` VALUES('900','101','宁明县','3','0');
INSERT INTO `Array` VALUES('901','101','扶绥县','3','0');
INSERT INTO `Array` VALUES('902','101','龙州县','3','0');
INSERT INTO `Array` VALUES('903','101','大新县','3','0');
INSERT INTO `Array` VALUES('904','101','天等县','3','0');
INSERT INTO `Array` VALUES('905','102','港口区','3','0');
INSERT INTO `Array` VALUES('906','102','防城区','3','0');
INSERT INTO `Array` VALUES('907','102','东兴市','3','0');
INSERT INTO `Array` VALUES('908','102','上思县','3','0');
INSERT INTO `Array` VALUES('909','103','港北区','3','0');
INSERT INTO `Array` VALUES('910','103','港南区','3','0');
INSERT INTO `Array` VALUES('911','103','覃塘区','3','0');
INSERT INTO `Array` VALUES('912','103','桂平市','3','0');
INSERT INTO `Array` VALUES('913','103','平南县','3','0');
INSERT INTO `Array` VALUES('914','104','金城江区','3','0');
INSERT INTO `Array` VALUES('915','104','宜州市','3','0');
INSERT INTO `Array` VALUES('916','104','天峨县','3','0');
INSERT INTO `Array` VALUES('917','104','凤山县','3','0');
INSERT INTO `Array` VALUES('918','104','南丹县','3','0');
INSERT INTO `Array` VALUES('919','104','东兰县','3','0');
INSERT INTO `Array` VALUES('920','104','都安','3','0');
INSERT INTO `Array` VALUES('921','104','罗城','3','0');
INSERT INTO `Array` VALUES('922','104','巴马','3','0');
INSERT INTO `Array` VALUES('923','104','环江','3','0');
INSERT INTO `Array` VALUES('924','104','大化','3','0');
INSERT INTO `Array` VALUES('925','105','八步区','3','0');
INSERT INTO `Array` VALUES('926','105','钟山县','3','0');
INSERT INTO `Array` VALUES('927','105','昭平县','3','0');
INSERT INTO `Array` VALUES('928','105','富川','3','0');
INSERT INTO `Array` VALUES('929','106','兴宾区','3','0');
INSERT INTO `Array` VALUES('930','106','合山市','3','0');
INSERT INTO `Array` VALUES('931','106','象州县','3','0');
INSERT INTO `Array` VALUES('932','106','武宣县','3','0');
INSERT INTO `Array` VALUES('933','106','忻城县','3','0');
INSERT INTO `Array` VALUES('934','106','金秀','3','0');
INSERT INTO `Array` VALUES('935','107','城中区','3','0');
INSERT INTO `Array` VALUES('936','107','鱼峰区','3','0');
INSERT INTO `Array` VALUES('937','107','柳北区','3','0');
INSERT INTO `Array` VALUES('938','107','柳南区','3','0');
INSERT INTO `Array` VALUES('939','107','柳江县','3','0');
INSERT INTO `Array` VALUES('940','107','柳城县','3','0');
INSERT INTO `Array` VALUES('941','107','鹿寨县','3','0');
INSERT INTO `Array` VALUES('942','107','融安县','3','0');
INSERT INTO `Array` VALUES('943','107','融水','3','0');
INSERT INTO `Array` VALUES('944','107','三江','3','0');
INSERT INTO `Array` VALUES('945','108','钦南区','3','0');
INSERT INTO `Array` VALUES('946','108','钦北区','3','0');
INSERT INTO `Array` VALUES('947','108','灵山县','3','0');
INSERT INTO `Array` VALUES('948','108','浦北县','3','0');
INSERT INTO `Array` VALUES('949','109','万秀区','3','0');
INSERT INTO `Array` VALUES('950','109','蝶山区','3','0');
INSERT INTO `Array` VALUES('951','109','长洲区','3','0');
INSERT INTO `Array` VALUES('952','109','岑溪市','3','0');
INSERT INTO `Array` VALUES('953','109','苍梧县','3','0');
INSERT INTO `Array` VALUES('954','109','藤县','3','0');
INSERT INTO `Array` VALUES('955','109','蒙山县','3','0');
INSERT INTO `Array` VALUES('956','110','玉州区','3','0');
INSERT INTO `Array` VALUES('957','110','北流市','3','0');
INSERT INTO `Array` VALUES('958','110','容县','3','0');
INSERT INTO `Array` VALUES('959','110','陆川县','3','0');
INSERT INTO `Array` VALUES('960','110','博白县','3','0');
INSERT INTO `Array` VALUES('961','110','兴业县','3','0');
INSERT INTO `Array` VALUES('962','111','南明区','3','0');
INSERT INTO `Array` VALUES('963','111','云岩区','3','0');
INSERT INTO `Array` VALUES('964','111','花溪区','3','0');
INSERT INTO `Array` VALUES('965','111','乌当区','3','0');
INSERT INTO `Array` VALUES('966','111','白云区','3','0');
INSERT INTO `Array` VALUES('967','111','小河区','3','0');
INSERT INTO `Array` VALUES('968','111','金阳新区','3','0');
INSERT INTO `Array` VALUES('969','111','新天园区','3','0');
INSERT INTO `Array` VALUES('970','111','清镇市','3','0');
INSERT INTO `Array` VALUES('971','111','开阳县','3','0');
INSERT INTO `Array` VALUES('972','111','修文县','3','0');
INSERT INTO `Array` VALUES('973','111','息烽县','3','0');
INSERT INTO `Array` VALUES('974','112','西秀区','3','0');
INSERT INTO `Array` VALUES('975','112','关岭','3','0');
INSERT INTO `Array` VALUES('976','112','镇宁','3','0');
INSERT INTO `Array` VALUES('977','112','紫云','3','0');
INSERT INTO `Array` VALUES('978','112','平坝县','3','0');
INSERT INTO `Array` VALUES('979','112','普定县','3','0');
INSERT INTO `Array` VALUES('980','113','毕节市','3','0');
INSERT INTO `Array` VALUES('981','113','大方县','3','0');
INSERT INTO `Array` VALUES('982','113','黔西县','3','0');
INSERT INTO `Array` VALUES('983','113','金沙县','3','0');
INSERT INTO `Array` VALUES('984','113','织金县','3','0');
INSERT INTO `Array` VALUES('985','113','纳雍县','3','0');
INSERT INTO `Array` VALUES('986','113','赫章县','3','0');
INSERT INTO `Array` VALUES('987','113','威宁','3','0');
INSERT INTO `Array` VALUES('988','114','钟山区','3','0');
INSERT INTO `Array` VALUES('989','114','六枝特区','3','0');
INSERT INTO `Array` VALUES('990','114','水城县','3','0');
INSERT INTO `Array` VALUES('991','114','盘县','3','0');
INSERT INTO `Array` VALUES('992','115','凯里市','3','0');
INSERT INTO `Array` VALUES('993','115','黄平县','3','0');
INSERT INTO `Array` VALUES('994','115','施秉县','3','0');
INSERT INTO `Array` VALUES('995','115','三穗县','3','0');
INSERT INTO `Array` VALUES('996','115','镇远县','3','0');
INSERT INTO `Array` VALUES('997','115','岑巩县','3','0');
INSERT INTO `Array` VALUES('998','115','天柱县','3','0');
INSERT INTO `Array` VALUES('999','115','锦屏县','3','0');
INSERT INTO `Array` VALUES('1000','115','剑河县','3','0');
INSERT INTO `Array` VALUES('1001','115','台江县','3','0');
INSERT INTO `Array` VALUES('1002','115','黎平县','3','0');
INSERT INTO `Array` VALUES('1003','115','榕江县','3','0');
INSERT INTO `Array` VALUES('1004','115','从江县','3','0');
INSERT INTO `Array` VALUES('1005','115','雷山县','3','0');
INSERT INTO `Array` VALUES('1006','115','麻江县','3','0');
INSERT INTO `Array` VALUES('1007','115','丹寨县','3','0');
INSERT INTO `Array` VALUES('1008','116','都匀市','3','0');
INSERT INTO `Array` VALUES('1009','116','福泉市','3','0');
INSERT INTO `Array` VALUES('1010','116','荔波县','3','0');
INSERT INTO `Array` VALUES('1011','116','贵定县','3','0');
INSERT INTO `Array` VALUES('1012','116','瓮安县','3','0');
INSERT INTO `Array` VALUES('1013','116','独山县','3','0');
INSERT INTO `Array` VALUES('1014','116','平塘县','3','0');
INSERT INTO `Array` VALUES('1015','116','罗甸县','3','0');
INSERT INTO `Array` VALUES('1016','116','长顺县','3','0');
INSERT INTO `Array` VALUES('1017','116','龙里县','3','0');
INSERT INTO `Array` VALUES('1018','116','惠水县','3','0');
INSERT INTO `Array` VALUES('1019','116','三都','3','0');
INSERT INTO `Array` VALUES('1020','117','兴义市','3','0');
INSERT INTO `Array` VALUES('1021','117','兴仁县','3','0');
INSERT INTO `Array` VALUES('1022','117','普安县','3','0');
INSERT INTO `Array` VALUES('1023','117','晴隆县','3','0');
INSERT INTO `Array` VALUES('1024','117','贞丰县','3','0');
INSERT INTO `Array` VALUES('1025','117','望谟县','3','0');
INSERT INTO `Array` VALUES('1026','117','册亨县','3','0');
INSERT INTO `Array` VALUES('1027','117','安龙县','3','0');
INSERT INTO `Array` VALUES('1028','118','铜仁市','3','0');
INSERT INTO `Array` VALUES('1029','118','江口县','3','0');
INSERT INTO `Array` VALUES('1030','118','石阡县','3','0');
INSERT INTO `Array` VALUES('1031','118','思南县','3','0');
INSERT INTO `Array` VALUES('1032','118','德江县','3','0');
INSERT INTO `Array` VALUES('1033','118','玉屏','3','0');
INSERT INTO `Array` VALUES('1034','118','印江','3','0');
INSERT INTO `Array` VALUES('1035','118','沿河','3','0');
INSERT INTO `Array` VALUES('1036','118','松桃','3','0');
INSERT INTO `Array` VALUES('1037','118','万山特区','3','0');
INSERT INTO `Array` VALUES('1038','119','红花岗区','3','0');
INSERT INTO `Array` VALUES('1039','119','务川县','3','0');
INSERT INTO `Array` VALUES('1040','119','道真县','3','0');
INSERT INTO `Array` VALUES('1041','119','汇川区','3','0');
INSERT INTO `Array` VALUES('1042','119','赤水市','3','0');
INSERT INTO `Array` VALUES('1043','119','仁怀市','3','0');
INSERT INTO `Array` VALUES('1044','119','遵义县','3','0');
INSERT INTO `Array` VALUES('1045','119','桐梓县','3','0');
INSERT INTO `Array` VALUES('1046','119','绥阳县','3','0');
INSERT INTO `Array` VALUES('1047','119','正安县','3','0');
INSERT INTO `Array` VALUES('1048','119','凤冈县','3','0');
INSERT INTO `Array` VALUES('1049','119','湄潭县','3','0');
INSERT INTO `Array` VALUES('1050','119','余庆县','3','0');
INSERT INTO `Array` VALUES('1051','119','习水县','3','0');
INSERT INTO `Array` VALUES('1052','119','道真','3','0');
INSERT INTO `Array` VALUES('1053','119','务川','3','0');
INSERT INTO `Array` VALUES('1054','120','秀英区','3','0');
INSERT INTO `Array` VALUES('1055','120','龙华区','3','0');
INSERT INTO `Array` VALUES('1056','120','琼山区','3','0');
INSERT INTO `Array` VALUES('1057','120','美兰区','3','0');
INSERT INTO `Array` VALUES('1058','137','市区','3','0');
INSERT INTO `Array` VALUES('1059','137','洋浦开发区','3','0');
INSERT INTO `Array` VALUES('1060','137','那大镇','3','0');
INSERT INTO `Array` VALUES('1061','137','王五镇','3','0');
INSERT INTO `Array` VALUES('1062','137','雅星镇','3','0');
INSERT INTO `Array` VALUES('1063','137','大成镇','3','0');
INSERT INTO `Array` VALUES('1064','137','中和镇','3','0');
INSERT INTO `Array` VALUES('1065','137','峨蔓镇','3','0');
INSERT INTO `Array` VALUES('1066','137','南丰镇','3','0');
INSERT INTO `Array` VALUES('1067','137','白马井镇','3','0');
INSERT INTO `Array` VALUES('1068','137','兰洋镇','3','0');
INSERT INTO `Array` VALUES('1069','137','和庆镇','3','0');
INSERT INTO `Array` VALUES('1070','137','海头镇','3','0');
INSERT INTO `Array` VALUES('1071','137','排浦镇','3','0');
INSERT INTO `Array` VALUES('1072','137','东成镇','3','0');
INSERT INTO `Array` VALUES('1073','137','光村镇','3','0');
INSERT INTO `Array` VALUES('1074','137','木棠镇','3','0');
INSERT INTO `Array` VALUES('1075','137','新州镇','3','0');
INSERT INTO `Array` VALUES('1076','137','三都镇','3','0');
INSERT INTO `Array` VALUES('1077','137','其他','3','0');
INSERT INTO `Array` VALUES('1078','138','长安区','3','0');
INSERT INTO `Array` VALUES('1079','138','桥东区','3','0');
INSERT INTO `Array` VALUES('1080','138','桥西区','3','0');
INSERT INTO `Array` VALUES('1081','138','新华区','3','0');
INSERT INTO `Array` VALUES('1082','138','裕华区','3','0');
INSERT INTO `Array` VALUES('1083','138','井陉矿区','3','0');
INSERT INTO `Array` VALUES('1084','138','高新区','3','0');
INSERT INTO `Array` VALUES('1085','138','辛集市','3','0');
INSERT INTO `Array` VALUES('1086','138','藁城市','3','0');
INSERT INTO `Array` VALUES('1087','138','晋州市','3','0');
INSERT INTO `Array` VALUES('1088','138','新乐市','3','0');
INSERT INTO `Array` VALUES('1089','138','鹿泉市','3','0');
INSERT INTO `Array` VALUES('1090','138','井陉县','3','0');
INSERT INTO `Array` VALUES('1091','138','正定县','3','0');
INSERT INTO `Array` VALUES('1092','138','栾城县','3','0');
INSERT INTO `Array` VALUES('1093','138','行唐县','3','0');
INSERT INTO `Array` VALUES('1094','138','灵寿县','3','0');
INSERT INTO `Array` VALUES('1095','138','高邑县','3','0');
INSERT INTO `Array` VALUES('1096','138','深泽县','3','0');
INSERT INTO `Array` VALUES('1097','138','赞皇县','3','0');
INSERT INTO `Array` VALUES('1098','138','无极县','3','0');
INSERT INTO `Array` VALUES('1099','138','平山县','3','0');
INSERT INTO `Array` VALUES('1100','138','元氏县','3','0');
INSERT INTO `Array` VALUES('1101','138','赵县','3','0');
INSERT INTO `Array` VALUES('1102','139','新市区','3','0');
INSERT INTO `Array` VALUES('1103','139','南市区','3','0');
INSERT INTO `Array` VALUES('1104','139','北市区','3','0');
INSERT INTO `Array` VALUES('1105','139','涿州市','3','0');
INSERT INTO `Array` VALUES('1106','139','定州市','3','0');
INSERT INTO `Array` VALUES('1107','139','安国市','3','0');
INSERT INTO `Array` VALUES('1108','139','高碑店市','3','0');
INSERT INTO `Array` VALUES('1109','139','满城县','3','0');
INSERT INTO `Array` VALUES('1110','139','清苑县','3','0');
INSERT INTO `Array` VALUES('1111','139','涞水县','3','0');
INSERT INTO `Array` VALUES('1112','139','阜平县','3','0');
INSERT INTO `Array` VALUES('1113','139','徐水县','3','0');
INSERT INTO `Array` VALUES('1114','139','定兴县','3','0');
INSERT INTO `Array` VALUES('1115','139','唐县','3','0');
INSERT INTO `Array` VALUES('1116','139','高阳县','3','0');
INSERT INTO `Array` VALUES('1117','139','容城县','3','0');
INSERT INTO `Array` VALUES('1118','139','涞源县','3','0');
INSERT INTO `Array` VALUES('1119','139','望都县','3','0');
INSERT INTO `Array` VALUES('1120','139','安新县','3','0');
INSERT INTO `Array` VALUES('1121','139','易县','3','0');
INSERT INTO `Array` VALUES('1122','139','曲阳县','3','0');
INSERT INTO `Array` VALUES('1123','139','蠡县','3','0');
INSERT INTO `Array` VALUES('1124','139','顺平县','3','0');
INSERT INTO `Array` VALUES('1125','139','博野县','3','0');
INSERT INTO `Array` VALUES('1126','139','雄县','3','0');
INSERT INTO `Array` VALUES('1127','140','运河区','3','0');
INSERT INTO `Array` VALUES('1128','140','新华区','3','0');
INSERT INTO `Array` VALUES('1129','140','泊头市','3','0');
INSERT INTO `Array` VALUES('1130','140','任丘市','3','0');
INSERT INTO `Array` VALUES('1131','140','黄骅市','3','0');
INSERT INTO `Array` VALUES('1132','140','河间市','3','0');
INSERT INTO `Array` VALUES('1133','140','沧县','3','0');
INSERT INTO `Array` VALUES('1134','140','青县','3','0');
INSERT INTO `Array` VALUES('1135','140','东光县','3','0');
INSERT INTO `Array` VALUES('1136','140','海兴县','3','0');
INSERT INTO `Array` VALUES('1137','140','盐山县','3','0');
INSERT INTO `Array` VALUES('1138','140','肃宁县','3','0');
INSERT INTO `Array` VALUES('1139','140','南皮县','3','0');
INSERT INTO `Array` VALUES('1140','140','吴桥县','3','0');
INSERT INTO `Array` VALUES('1141','140','献县','3','0');
INSERT INTO `Array` VALUES('1142','140','孟村','3','0');
INSERT INTO `Array` VALUES('1143','141','双桥区','3','0');
INSERT INTO `Array` VALUES('1144','141','双滦区','3','0');
INSERT INTO `Array` VALUES('1145','141','鹰手营子矿区','3','0');
INSERT INTO `Array` VALUES('1146','141','承德县','3','0');
INSERT INTO `Array` VALUES('1147','141','兴隆县','3','0');
INSERT INTO `Array` VALUES('1148','141','平泉县','3','0');
INSERT INTO `Array` VALUES('1149','141','滦平县','3','0');
INSERT INTO `Array` VALUES('1150','141','隆化县','3','0');
INSERT INTO `Array` VALUES('1151','141','丰宁','3','0');
INSERT INTO `Array` VALUES('1152','141','宽城','3','0');
INSERT INTO `Array` VALUES('1153','141','围场','3','0');
INSERT INTO `Array` VALUES('1154','142','从台区','3','0');
INSERT INTO `Array` VALUES('1155','142','复兴区','3','0');
INSERT INTO `Array` VALUES('1156','142','邯山区','3','0');
INSERT INTO `Array` VALUES('1157','142','峰峰矿区','3','0');
INSERT INTO `Array` VALUES('1158','142','武安市','3','0');
INSERT INTO `Array` VALUES('1159','142','邯郸县','3','0');
INSERT INTO `Array` VALUES('1160','142','临漳县','3','0');
INSERT INTO `Array` VALUES('1161','142','成安县','3','0');
INSERT INTO `Array` VALUES('1162','142','大名县','3','0');
INSERT INTO `Array` VALUES('1163','142','涉县','3','0');
INSERT INTO `Array` VALUES('1164','142','磁县','3','0');
INSERT INTO `Array` VALUES('1165','142','肥乡县','3','0');
INSERT INTO `Array` VALUES('1166','142','永年县','3','0');
INSERT INTO `Array` VALUES('1167','142','邱县','3','0');
INSERT INTO `Array` VALUES('1168','142','鸡泽县','3','0');
INSERT INTO `Array` VALUES('1169','142','广平县','3','0');
INSERT INTO `Array` VALUES('1170','142','馆陶县','3','0');
INSERT INTO `Array` VALUES('1171','142','魏县','3','0');
INSERT INTO `Array` VALUES('1172','142','曲周县','3','0');
INSERT INTO `Array` VALUES('1173','143','桃城区','3','0');
INSERT INTO `Array` VALUES('1174','143','冀州市','3','0');
INSERT INTO `Array` VALUES('1175','143','深州市','3','0');
INSERT INTO `Array` VALUES('1176','143','枣强县','3','0');
INSERT INTO `Array` VALUES('1177','143','武邑县','3','0');
INSERT INTO `Array` VALUES('1178','143','武强县','3','0');
INSERT INTO `Array` VALUES('1179','143','饶阳县','3','0');
INSERT INTO `Array` VALUES('1180','143','安平县','3','0');
INSERT INTO `Array` VALUES('1181','143','故城县','3','0');
INSERT INTO `Array` VALUES('1182','143','景县','3','0');
INSERT INTO `Array` VALUES('1183','143','阜城县','3','0');
INSERT INTO `Array` VALUES('1184','144','安次区','3','0');
INSERT INTO `Array` VALUES('1185','144','广阳区','3','0');
INSERT INTO `Array` VALUES('1186','144','霸州市','3','0');
INSERT INTO `Array` VALUES('1187','144','三河市','3','0');
INSERT INTO `Array` VALUES('1188','144','固安县','3','0');
INSERT INTO `Array` VALUES('1189','144','永清县','3','0');
INSERT INTO `Array` VALUES('1190','144','香河县','3','0');
INSERT INTO `Array` VALUES('1191','144','大城县','3','0');
INSERT INTO `Array` VALUES('1192','144','文安县','3','0');
INSERT INTO `Array` VALUES('1193','144','大厂','3','0');
INSERT INTO `Array` VALUES('1194','145','海港区','3','0');
INSERT INTO `Array` VALUES('1195','145','山海关区','3','0');
INSERT INTO `Array` VALUES('1196','145','北戴河区','3','0');
INSERT INTO `Array` VALUES('1197','145','昌黎县','3','0');
INSERT INTO `Array` VALUES('1198','145','抚宁县','3','0');
INSERT INTO `Array` VALUES('1199','145','卢龙县','3','0');
INSERT INTO `Array` VALUES('1200','145','青龙','3','0');
INSERT INTO `Array` VALUES('1201','146','路北区','3','0');
INSERT INTO `Array` VALUES('1202','146','路南区','3','0');
INSERT INTO `Array` VALUES('1203','146','古冶区','3','0');
INSERT INTO `Array` VALUES('1204','146','开平区','3','0');
INSERT INTO `Array` VALUES('1205','146','丰南区','3','0');
INSERT INTO `Array` VALUES('1206','146','丰润区','3','0');
INSERT INTO `Array` VALUES('1207','146','遵化市','3','0');
INSERT INTO `Array` VALUES('1208','146','迁安市','3','0');
INSERT INTO `Array` VALUES('1209','146','滦县','3','0');
INSERT INTO `Array` VALUES('1210','146','滦南县','3','0');
INSERT INTO `Array` VALUES('1211','146','乐亭县','3','0');
INSERT INTO `Array` VALUES('1212','146','迁西县','3','0');
INSERT INTO `Array` VALUES('1213','146','玉田县','3','0');
INSERT INTO `Array` VALUES('1214','146','唐海县','3','0');
INSERT INTO `Array` VALUES('1215','147','桥东区','3','0');
INSERT INTO `Array` VALUES('1216','147','桥西区','3','0');
INSERT INTO `Array` VALUES('1217','147','南宫市','3','0');
INSERT INTO `Array` VALUES('1218','147','沙河市','3','0');
INSERT INTO `Array` VALUES('1219','147','邢台县','3','0');
INSERT INTO `Array` VALUES('1220','147','临城县','3','0');
INSERT INTO `Array` VALUES('1221','147','内丘县','3','0');
INSERT INTO `Array` VALUES('1222','147','柏乡县','3','0');
INSERT INTO `Array` VALUES('1223','147','隆尧县','3','0');
INSERT INTO `Array` VALUES('1224','147','任县','3','0');
INSERT INTO `Array` VALUES('1225','147','南和县','3','0');
INSERT INTO `Array` VALUES('1226','147','宁晋县','3','0');
INSERT INTO `Array` VALUES('1227','147','巨鹿县','3','0');
INSERT INTO `Array` VALUES('1228','147','新河县','3','0');
INSERT INTO `Array` VALUES('1229','147','广宗县','3','0');
INSERT INTO `Array` VALUES('1230','147','平乡县','3','0');
INSERT INTO `Array` VALUES('1231','147','威县','3','0');
INSERT INTO `Array` VALUES('1232','147','清河县','3','0');
INSERT INTO `Array` VALUES('1233','147','临西县','3','0');
INSERT INTO `Array` VALUES('1234','148','桥西区','3','0');
INSERT INTO `Array` VALUES('1235','148','桥东区','3','0');
INSERT INTO `Array` VALUES('1236','148','宣化区','3','0');
INSERT INTO `Array` VALUES('1237','148','下花园区','3','0');
INSERT INTO `Array` VALUES('1238','148','宣化县','3','0');
INSERT INTO `Array` VALUES('1239','148','张北县','3','0');
INSERT INTO `Array` VALUES('1240','148','康保县','3','0');
INSERT INTO `Array` VALUES('1241','148','沽源县','3','0');
INSERT INTO `Array` VALUES('1242','148','尚义县','3','0');
INSERT INTO `Array` VALUES('1243','148','蔚县','3','0');
INSERT INTO `Array` VALUES('1244','148','阳原县','3','0');
INSERT INTO `Array` VALUES('1245','148','怀安县','3','0');
INSERT INTO `Array` VALUES('1246','148','万全县','3','0');
INSERT INTO `Array` VALUES('1247','148','怀来县','3','0');
INSERT INTO `Array` VALUES('1248','148','涿鹿县','3','0');
INSERT INTO `Array` VALUES('1249','148','赤城县','3','0');
INSERT INTO `Array` VALUES('1250','148','崇礼县','3','0');
INSERT INTO `Array` VALUES('1251','149','金水区','3','0');
INSERT INTO `Array` VALUES('1252','149','邙山区','3','0');
INSERT INTO `Array` VALUES('1253','149','二七区','3','0');
INSERT INTO `Array` VALUES('1254','149','管城区','3','0');
INSERT INTO `Array` VALUES('1255','149','中原区','3','0');
INSERT INTO `Array` VALUES('1256','149','上街区','3','0');
INSERT INTO `Array` VALUES('1257','149','惠济区','3','0');
INSERT INTO `Array` VALUES('1258','149','郑东新区','3','0');
INSERT INTO `Array` VALUES('1259','149','经济技术开发区','3','0');
INSERT INTO `Array` VALUES('1260','149','高新开发区','3','0');
INSERT INTO `Array` VALUES('1261','149','出口加工区','3','0');
INSERT INTO `Array` VALUES('1262','149','巩义市','3','0');
INSERT INTO `Array` VALUES('1263','149','荥阳市','3','0');
INSERT INTO `Array` VALUES('1264','149','新密市','3','0');
INSERT INTO `Array` VALUES('1265','149','新郑市','3','0');
INSERT INTO `Array` VALUES('1266','149','登封市','3','0');
INSERT INTO `Array` VALUES('1267','149','中牟县','3','0');
INSERT INTO `Array` VALUES('1268','150','西工区','3','0');
INSERT INTO `Array` VALUES('1269','150','老城区','3','0');
INSERT INTO `Array` VALUES('1270','150','涧西区','3','0');
INSERT INTO `Array` VALUES('1271','150','瀍河回族区','3','0');
INSERT INTO `Array` VALUES('1272','150','洛龙区','3','0');
INSERT INTO `Array` VALUES('1273','150','吉利区','3','0');
INSERT INTO `Array` VALUES('1274','150','偃师市','3','0');
INSERT INTO `Array` VALUES('1275','150','孟津县','3','0');
INSERT INTO `Array` VALUES('1276','150','新安县','3','0');
INSERT INTO `Array` VALUES('1277','150','栾川县','3','0');
INSERT INTO `Array` VALUES('1278','150','嵩县','3','0');
INSERT INTO `Array` VALUES('1279','150','汝阳县','3','0');
INSERT INTO `Array` VALUES('1280','150','宜阳县','3','0');
INSERT INTO `Array` VALUES('1281','150','洛宁县','3','0');
INSERT INTO `Array` VALUES('1282','150','伊川县','3','0');
INSERT INTO `Array` VALUES('1283','151','鼓楼区','3','0');
INSERT INTO `Array` VALUES('1284','151','龙亭区','3','0');
INSERT INTO `Array` VALUES('1285','151','顺河回族区','3','0');
INSERT INTO `Array` VALUES('1286','151','金明区','3','0');
INSERT INTO `Array` VALUES('1287','151','禹王台区','3','0');
INSERT INTO `Array` VALUES('1288','151','杞县','3','0');
INSERT INTO `Array` VALUES('1289','151','通许县','3','0');
INSERT INTO `Array` VALUES('1290','151','尉氏县','3','0');
INSERT INTO `Array` VALUES('1291','151','开封县','3','0');
INSERT INTO `Array` VALUES('1292','151','兰考县','3','0');
INSERT INTO `Array` VALUES('1293','152','北关区','3','0');
INSERT INTO `Array` VALUES('1294','152','文峰区','3','0');
INSERT INTO `Array` VALUES('1295','152','殷都区','3','0');
INSERT INTO `Array` VALUES('1296','152','龙安区','3','0');
INSERT INTO `Array` VALUES('1297','152','林州市','3','0');
INSERT INTO `Array` VALUES('1298','152','安阳县','3','0');
INSERT INTO `Array` VALUES('1299','152','汤阴县','3','0');
INSERT INTO `Array` VALUES('1300','152','滑县','3','0');
INSERT INTO `Array` VALUES('1301','152','内黄县','3','0');
INSERT INTO `Array` VALUES('1302','153','淇滨区','3','0');
INSERT INTO `Array` VALUES('1303','153','山城区','3','0');
INSERT INTO `Array` VALUES('1304','153','鹤山区','3','0');
INSERT INTO `Array` VALUES('1305','153','浚县','3','0');
INSERT INTO `Array` VALUES('1306','153','淇县','3','0');
INSERT INTO `Array` VALUES('1307','154','济源市','3','0');
INSERT INTO `Array` VALUES('1308','155','解放区','3','0');
INSERT INTO `Array` VALUES('1309','155','中站区','3','0');
INSERT INTO `Array` VALUES('1310','155','马村区','3','0');
INSERT INTO `Array` VALUES('1311','155','山阳区','3','0');
INSERT INTO `Array` VALUES('1312','155','沁阳市','3','0');
INSERT INTO `Array` VALUES('1313','155','孟州市','3','0');
INSERT INTO `Array` VALUES('1314','155','修武县','3','0');
INSERT INTO `Array` VALUES('1315','155','博爱县','3','0');
INSERT INTO `Array` VALUES('1316','155','武陟县','3','0');
INSERT INTO `Array` VALUES('1317','155','温县','3','0');
INSERT INTO `Array` VALUES('1318','156','卧龙区','3','0');
INSERT INTO `Array` VALUES('1319','156','宛城区','3','0');
INSERT INTO `Array` VALUES('1320','156','邓州市','3','0');
INSERT INTO `Array` VALUES('1321','156','南召县','3','0');
INSERT INTO `Array` VALUES('1322','156','方城县','3','0');
INSERT INTO `Array` VALUES('1323','156','西峡县','3','0');
INSERT INTO `Array` VALUES('1324','156','镇平县','3','0');
INSERT INTO `Array` VALUES('1325','156','内乡县','3','0');
INSERT INTO `Array` VALUES('1326','156','淅川县','3','0');
INSERT INTO `Array` VALUES('1327','156','社旗县','3','0');
INSERT INTO `Array` VALUES('1328','156','唐河县','3','0');
INSERT INTO `Array` VALUES('1329','156','新野县','3','0');
INSERT INTO `Array` VALUES('1330','156','桐柏县','3','0');
INSERT INTO `Array` VALUES('1331','157','新华区','3','0');
INSERT INTO `Array` VALUES('1332','157','卫东区','3','0');
INSERT INTO `Array` VALUES('1333','157','湛河区','3','0');
INSERT INTO `Array` VALUES('1334','157','石龙区','3','0');
INSERT INTO `Array` VALUES('1335','157','舞钢市','3','0');
INSERT INTO `Array` VALUES('1336','157','汝州市','3','0');
INSERT INTO `Array` VALUES('1337','157','宝丰县','3','0');
INSERT INTO `Array` VALUES('1338','157','叶县','3','0');
INSERT INTO `Array` VALUES('1339','157','鲁山县','3','0');
INSERT INTO `Array` VALUES('1340','157','郏县','3','0');
INSERT INTO `Array` VALUES('1341','158','湖滨区','3','0');
INSERT INTO `Array` VALUES('1342','158','义马市','3','0');
INSERT INTO `Array` VALUES('1343','158','灵宝市','3','0');
INSERT INTO `Array` VALUES('1344','158','渑池县','3','0');
INSERT INTO `Array` VALUES('1345','158','陕县','3','0');
INSERT INTO `Array` VALUES('1346','158','卢氏县','3','0');
INSERT INTO `Array` VALUES('1347','159','梁园区','3','0');
INSERT INTO `Array` VALUES('1348','159','睢阳区','3','0');
INSERT INTO `Array` VALUES('1349','159','永城市','3','0');
INSERT INTO `Array` VALUES('1350','159','民权县','3','0');
INSERT INTO `Array` VALUES('1351','159','睢县','3','0');
INSERT INTO `Array` VALUES('1352','159','宁陵县','3','0');
INSERT INTO `Array` VALUES('1353','159','虞城县','3','0');
INSERT INTO `Array` VALUES('1354','159','柘城县','3','0');
INSERT INTO `Array` VALUES('1355','159','夏邑县','3','0');
INSERT INTO `Array` VALUES('1356','160','卫滨区','3','0');
INSERT INTO `Array` VALUES('1357','160','红旗区','3','0');
INSERT INTO `Array` VALUES('1358','160','凤泉区','3','0');
INSERT INTO `Array` VALUES('1359','160','牧野区','3','0');
INSERT INTO `Array` VALUES('1360','160','卫辉市','3','0');
INSERT INTO `Array` VALUES('1361','160','辉县市','3','0');
INSERT INTO `Array` VALUES('1362','160','新乡县','3','0');
INSERT INTO `Array` VALUES('1363','160','获嘉县','3','0');
INSERT INTO `Array` VALUES('1364','160','原阳县','3','0');
INSERT INTO `Array` VALUES('1365','160','延津县','3','0');
INSERT INTO `Array` VALUES('1366','160','封丘县','3','0');
INSERT INTO `Array` VALUES('1367','160','长垣县','3','0');
INSERT INTO `Array` VALUES('1368','161','浉河区','3','0');
INSERT INTO `Array` VALUES('1369','161','平桥区','3','0');
INSERT INTO `Array` VALUES('1370','161','罗山县','3','0');
INSERT INTO `Array` VALUES('1371','161','光山县','3','0');
INSERT INTO `Array` VALUES('1372','161','新县','3','0');
INSERT INTO `Array` VALUES('1373','161','商城县','3','0');
INSERT INTO `Array` VALUES('1374','161','固始县','3','0');
INSERT INTO `Array` VALUES('1375','161','潢川县','3','0');
INSERT INTO `Array` VALUES('1376','161','淮滨县','3','0');
INSERT INTO `Array` VALUES('1377','161','息县','3','0');
INSERT INTO `Array` VALUES('1378','162','魏都区','3','0');
INSERT INTO `Array` VALUES('1379','162','禹州市','3','0');
INSERT INTO `Array` VALUES('1380','162','长葛市','3','0');
INSERT INTO `Array` VALUES('1381','162','许昌县','3','0');
INSERT INTO `Array` VALUES('1382','162','鄢陵县','3','0');
INSERT INTO `Array` VALUES('1383','162','襄城县','3','0');
INSERT INTO `Array` VALUES('1384','163','川汇区','3','0');
INSERT INTO `Array` VALUES('1385','163','项城市','3','0');
INSERT INTO `Array` VALUES('1386','163','扶沟县','3','0');
INSERT INTO `Array` VALUES('1387','163','西华县','3','0');
INSERT INTO `Array` VALUES('1388','163','商水县','3','0');
INSERT INTO `Array` VALUES('1389','163','沈丘县','3','0');
INSERT INTO `Array` VALUES('1390','163','郸城县','3','0');
INSERT INTO `Array` VALUES('1391','163','淮阳县','3','0');
INSERT INTO `Array` VALUES('1392','163','太康县','3','0');
INSERT INTO `Array` VALUES('1393','163','鹿邑县','3','0');
INSERT INTO `Array` VALUES('1394','164','驿城区','3','0');
INSERT INTO `Array` VALUES('1395','164','西平县','3','0');
INSERT INTO `Array` VALUES('1396','164','上蔡县','3','0');
INSERT INTO `Array` VALUES('1397','164','平舆县','3','0');
INSERT INTO `Array` VALUES('1398','164','正阳县','3','0');
INSERT INTO `Array` VALUES('1399','164','确山县','3','0');
INSERT INTO `Array` VALUES('1400','164','泌阳县','3','0');
INSERT INTO `Array` VALUES('1401','164','汝南县','3','0');
INSERT INTO `Array` VALUES('1402','164','遂平县','3','0');
INSERT INTO `Array` VALUES('1403','164','新蔡县','3','0');
INSERT INTO `Array` VALUES('1404','165','郾城区','3','0');
INSERT INTO `Array` VALUES('1405','165','源汇区','3','0');
INSERT INTO `Array` VALUES('1406','165','召陵区','3','0');
INSERT INTO `Array` VALUES('1407','165','舞阳县','3','0');
INSERT INTO `Array` VALUES('1408','165','临颍县','3','0');
INSERT INTO `Array` VALUES('1409','166','华龙区','3','0');
INSERT INTO `Array` VALUES('1410','166','清丰县','3','0');
INSERT INTO `Array` VALUES('1411','166','南乐县','3','0');
INSERT INTO `Array` VALUES('1412','166','范县','3','0');
INSERT INTO `Array` VALUES('1413','166','台前县','3','0');
INSERT INTO `Array` VALUES('1414','166','濮阳县','3','0');
INSERT INTO `Array` VALUES('1415','167','道里区','3','0');
INSERT INTO `Array` VALUES('1416','167','南岗区','3','0');
INSERT INTO `Array` VALUES('1417','167','动力区','3','0');
INSERT INTO `Array` VALUES('1418','167','平房区','3','0');
INSERT INTO `Array` VALUES('1419','167','香坊区','3','0');
INSERT INTO `Array` VALUES('1420','167','太平区','3','0');
INSERT INTO `Array` VALUES('1421','167','道外区','3','0');
INSERT INTO `Array` VALUES('1422','167','阿城区','3','0');
INSERT INTO `Array` VALUES('1423','167','呼兰区','3','0');
INSERT INTO `Array` VALUES('1424','167','松北区','3','0');
INSERT INTO `Array` VALUES('1425','167','尚志市','3','0');
INSERT INTO `Array` VALUES('1426','167','双城市','3','0');
INSERT INTO `Array` VALUES('1427','167','五常市','3','0');
INSERT INTO `Array` VALUES('1428','167','方正县','3','0');
INSERT INTO `Array` VALUES('1429','167','宾县','3','0');
INSERT INTO `Array` VALUES('1430','167','依兰县','3','0');
INSERT INTO `Array` VALUES('1431','167','巴彦县','3','0');
INSERT INTO `Array` VALUES('1432','167','通河县','3','0');
INSERT INTO `Array` VALUES('1433','167','木兰县','3','0');
INSERT INTO `Array` VALUES('1434','167','延寿县','3','0');
INSERT INTO `Array` VALUES('1435','168','萨尔图区','3','0');
INSERT INTO `Array` VALUES('1436','168','红岗区','3','0');
INSERT INTO `Array` VALUES('1437','168','龙凤区','3','0');
INSERT INTO `Array` VALUES('1438','168','让胡路区','3','0');
INSERT INTO `Array` VALUES('1439','168','大同区','3','0');
INSERT INTO `Array` VALUES('1440','168','肇州县','3','0');
INSERT INTO `Array` VALUES('1441','168','肇源县','3','0');
INSERT INTO `Array` VALUES('1442','168','林甸县','3','0');
INSERT INTO `Array` VALUES('1443','168','杜尔伯特','3','0');
INSERT INTO `Array` VALUES('1444','169','呼玛县','3','0');
INSERT INTO `Array` VALUES('1445','169','漠河县','3','0');
INSERT INTO `Array` VALUES('1446','169','塔河县','3','0');
INSERT INTO `Array` VALUES('1447','170','兴山区','3','0');
INSERT INTO `Array` VALUES('1448','170','工农区','3','0');
INSERT INTO `Array` VALUES('1449','170','南山区','3','0');
INSERT INTO `Array` VALUES('1450','170','兴安区','3','0');
INSERT INTO `Array` VALUES('1451','170','向阳区','3','0');
INSERT INTO `Array` VALUES('1452','170','东山区','3','0');
INSERT INTO `Array` VALUES('1453','170','萝北县','3','0');
INSERT INTO `Array` VALUES('1454','170','绥滨县','3','0');
INSERT INTO `Array` VALUES('1455','171','爱辉区','3','0');
INSERT INTO `Array` VALUES('1456','171','五大连池市','3','0');
INSERT INTO `Array` VALUES('1457','171','北安市','3','0');
INSERT INTO `Array` VALUES('1458','171','嫩江县','3','0');
INSERT INTO `Array` VALUES('1459','171','逊克县','3','0');
INSERT INTO `Array` VALUES('1460','171','孙吴县','3','0');
INSERT INTO `Array` VALUES('1461','172','鸡冠区','3','0');
INSERT INTO `Array` VALUES('1462','172','恒山区','3','0');
INSERT INTO `Array` VALUES('1463','172','城子河区','3','0');
INSERT INTO `Array` VALUES('1464','172','滴道区','3','0');
INSERT INTO `Array` VALUES('1465','172','梨树区','3','0');
INSERT INTO `Array` VALUES('1466','172','虎林市','3','0');
INSERT INTO `Array` VALUES('1467','172','密山市','3','0');
INSERT INTO `Array` VALUES('1468','172','鸡东县','3','0');
INSERT INTO `Array` VALUES('1469','173','前进区','3','0');
INSERT INTO `Array` VALUES('1470','173','郊区','3','0');
INSERT INTO `Array` VALUES('1471','173','向阳区','3','0');
INSERT INTO `Array` VALUES('1472','173','东风区','3','0');
INSERT INTO `Array` VALUES('1473','173','同江市','3','0');
INSERT INTO `Array` VALUES('1474','173','富锦市','3','0');
INSERT INTO `Array` VALUES('1475','173','桦南县','3','0');
INSERT INTO `Array` VALUES('1476','173','桦川县','3','0');
INSERT INTO `Array` VALUES('1477','173','汤原县','3','0');
INSERT INTO `Array` VALUES('1478','173','抚远县','3','0');
INSERT INTO `Array` VALUES('1479','174','爱民区','3','0');
INSERT INTO `Array` VALUES('1480','174','东安区','3','0');
INSERT INTO `Array` VALUES('1481','174','阳明区','3','0');
INSERT INTO `Array` VALUES('1482','174','西安区','3','0');
INSERT INTO `Array` VALUES('1483','174','绥芬河市','3','0');
INSERT INTO `Array` VALUES('1484','174','海林市','3','0');
INSERT INTO `Array` VALUES('1485','174','宁安市','3','0');
INSERT INTO `Array` VALUES('1486','174','穆棱市','3','0');
INSERT INTO `Array` VALUES('1487','174','东宁县','3','0');
INSERT INTO `Array` VALUES('1488','174','林口县','3','0');
INSERT INTO `Array` VALUES('1489','175','桃山区','3','0');
INSERT INTO `Array` VALUES('1490','175','新兴区','3','0');
INSERT INTO `Array` VALUES('1491','175','茄子河区','3','0');
INSERT INTO `Array` VALUES('1492','175','勃利县','3','0');
INSERT INTO `Array` VALUES('1493','176','龙沙区','3','0');
INSERT INTO `Array` VALUES('1494','176','昂昂溪区','3','0');
INSERT INTO `Array` VALUES('1495','176','铁峰区','3','0');
INSERT INTO `Array` VALUES('1496','176','建华区','3','0');
INSERT INTO `Array` VALUES('1497','176','富拉尔基区','3','0');
INSERT INTO `Array` VALUES('1498','176','碾子山区','3','0');
INSERT INTO `Array` VALUES('1499','176','梅里斯达斡尔区','3','0');
INSERT INTO `Array` VALUES('1500','176','讷河市','3','0');
INSERT INTO `Array` VALUES('1501','176','龙江县','3','0');
INSERT INTO `Array` VALUES('1502','176','依安县','3','0');
INSERT INTO `Array` VALUES('1503','176','泰来县','3','0');
INSERT INTO `Array` VALUES('1504','176','甘南县','3','0');
INSERT INTO `Array` VALUES('1505','176','富裕县','3','0');
INSERT INTO `Array` VALUES('1506','176','克山县','3','0');
INSERT INTO `Array` VALUES('1507','176','克东县','3','0');
INSERT INTO `Array` VALUES('1508','176','拜泉县','3','0');
INSERT INTO `Array` VALUES('1509','177','尖山区','3','0');
INSERT INTO `Array` VALUES('1510','177','岭东区','3','0');
INSERT INTO `Array` VALUES('1511','177','四方台区','3','0');
INSERT INTO `Array` VALUES('1512','177','宝山区','3','0');
INSERT INTO `Array` VALUES('1513','177','集贤县','3','0');
INSERT INTO `Array` VALUES('1514','177','友谊县','3','0');
INSERT INTO `Array` VALUES('1515','177','宝清县','3','0');
INSERT INTO `Array` VALUES('1516','177','饶河县','3','0');
INSERT INTO `Array` VALUES('1517','178','北林区','3','0');
INSERT INTO `Array` VALUES('1518','178','安达市','3','0');
INSERT INTO `Array` VALUES('1519','178','肇东市','3','0');
INSERT INTO `Array` VALUES('1520','178','海伦市','3','0');
INSERT INTO `Array` VALUES('1521','178','望奎县','3','0');
INSERT INTO `Array` VALUES('1522','178','兰西县','3','0');
INSERT INTO `Array` VALUES('1523','178','青冈县','3','0');
INSERT INTO `Array` VALUES('1524','178','庆安县','3','0');
INSERT INTO `Array` VALUES('1525','178','明水县','3','0');
INSERT INTO `Array` VALUES('1526','178','绥棱县','3','0');
INSERT INTO `Array` VALUES('1527','179','伊春区','3','0');
INSERT INTO `Array` VALUES('1528','179','带岭区','3','0');
INSERT INTO `Array` VALUES('1529','179','南岔区','3','0');
INSERT INTO `Array` VALUES('1530','179','金山屯区','3','0');
INSERT INTO `Array` VALUES('1531','179','西林区','3','0');
INSERT INTO `Array` VALUES('1532','179','美溪区','3','0');
INSERT INTO `Array` VALUES('1533','179','乌马河区','3','0');
INSERT INTO `Array` VALUES('1534','179','翠峦区','3','0');
INSERT INTO `Array` VALUES('1535','179','友好区','3','0');
INSERT INTO `Array` VALUES('1536','179','上甘岭区','3','0');
INSERT INTO `Array` VALUES('1537','179','五营区','3','0');
INSERT INTO `Array` VALUES('1538','179','红星区','3','0');
INSERT INTO `Array` VALUES('1539','179','新青区','3','0');
INSERT INTO `Array` VALUES('1540','179','汤旺河区','3','0');
INSERT INTO `Array` VALUES('1541','179','乌伊岭区','3','0');
INSERT INTO `Array` VALUES('1542','179','铁力市','3','0');
INSERT INTO `Array` VALUES('1543','179','嘉荫县','3','0');
INSERT INTO `Array` VALUES('1544','180','江岸区','3','0');
INSERT INTO `Array` VALUES('1545','180','武昌区','3','0');
INSERT INTO `Array` VALUES('1546','180','江汉区','3','0');
INSERT INTO `Array` VALUES('1547','180','硚口区','3','0');
INSERT INTO `Array` VALUES('1548','180','汉阳区','3','0');
INSERT INTO `Array` VALUES('1549','180','青山区','3','0');
INSERT INTO `Array` VALUES('1550','180','洪山区','3','0');
INSERT INTO `Array` VALUES('1551','180','东西湖区','3','0');
INSERT INTO `Array` VALUES('1552','180','汉南区','3','0');
INSERT INTO `Array` VALUES('1553','180','蔡甸区','3','0');
INSERT INTO `Array` VALUES('1554','180','江夏区','3','0');
INSERT INTO `Array` VALUES('1555','180','黄陂区','3','0');
INSERT INTO `Array` VALUES('1556','180','新洲区','3','0');
INSERT INTO `Array` VALUES('1557','180','经济开发区','3','0');
INSERT INTO `Array` VALUES('1558','181','仙桃市','3','0');
INSERT INTO `Array` VALUES('1559','182','鄂城区','3','0');
INSERT INTO `Array` VALUES('1560','182','华容区','3','0');
INSERT INTO `Array` VALUES('1561','182','梁子湖区','3','0');
INSERT INTO `Array` VALUES('1562','183','黄州区','3','0');
INSERT INTO `Array` VALUES('1563','183','麻城市','3','0');
INSERT INTO `Array` VALUES('1564','183','武穴市','3','0');
INSERT INTO `Array` VALUES('1565','183','团风县','3','0');
INSERT INTO `Array` VALUES('1566','183','红安县','3','0');
INSERT INTO `Array` VALUES('1567','183','罗田县','3','0');
INSERT INTO `Array` VALUES('1568','183','英山县','3','0');
INSERT INTO `Array` VALUES('1569','183','浠水县','3','0');
INSERT INTO `Array` VALUES('1570','183','蕲春县','3','0');
INSERT INTO `Array` VALUES('1571','183','黄梅县','3','0');
INSERT INTO `Array` VALUES('1572','184','黄石港区','3','0');
INSERT INTO `Array` VALUES('1573','184','西塞山区','3','0');
INSERT INTO `Array` VALUES('1574','184','下陆区','3','0');
INSERT INTO `Array` VALUES('1575','184','铁山区','3','0');
INSERT INTO `Array` VALUES('1576','184','大冶市','3','0');
INSERT INTO `Array` VALUES('1577','184','阳新县','3','0');
INSERT INTO `Array` VALUES('1578','185','东宝区','3','0');
INSERT INTO `Array` VALUES('1579','185','掇刀区','3','0');
INSERT INTO `Array` VALUES('1580','185','钟祥市','3','0');
INSERT INTO `Array` VALUES('1581','185','京山县','3','0');
INSERT INTO `Array` VALUES('1582','185','沙洋县','3','0');
INSERT INTO `Array` VALUES('1583','186','沙市区','3','0');
INSERT INTO `Array` VALUES('1584','186','荆州区','3','0');
INSERT INTO `Array` VALUES('1585','186','石首市','3','0');
INSERT INTO `Array` VALUES('1586','186','洪湖市','3','0');
INSERT INTO `Array` VALUES('1587','186','松滋市','3','0');
INSERT INTO `Array` VALUES('1588','186','公安县','3','0');
INSERT INTO `Array` VALUES('1589','186','监利县','3','0');
INSERT INTO `Array` VALUES('1590','186','江陵县','3','0');
INSERT INTO `Array` VALUES('1591','187','潜江市','3','0');
INSERT INTO `Array` VALUES('1592','188','神农架林区','3','0');
INSERT INTO `Array` VALUES('1593','189','张湾区','3','0');
INSERT INTO `Array` VALUES('1594','189','茅箭区','3','0');
INSERT INTO `Array` VALUES('1595','189','丹江口市','3','0');
INSERT INTO `Array` VALUES('1596','189','郧县','3','0');
INSERT INTO `Array` VALUES('1597','189','郧西县','3','0');
INSERT INTO `Array` VALUES('1598','189','竹山县','3','0');
INSERT INTO `Array` VALUES('1599','189','竹溪县','3','0');
INSERT INTO `Array` VALUES('1600','189','房县','3','0');
INSERT INTO `Array` VALUES('1601','190','曾都区','3','0');
INSERT INTO `Array` VALUES('1602','190','广水市','3','0');
INSERT INTO `Array` VALUES('1603','191','天门市','3','0');
INSERT INTO `Array` VALUES('1604','192','咸安区','3','0');
INSERT INTO `Array` VALUES('1605','192','赤壁市','3','0');
INSERT INTO `Array` VALUES('1606','192','嘉鱼县','3','0');
INSERT INTO `Array` VALUES('1607','192','通城县','3','0');
INSERT INTO `Array` VALUES('1608','192','崇阳县','3','0');
INSERT INTO `Array` VALUES('1609','192','通山县','3','0');
INSERT INTO `Array` VALUES('1610','193','襄城区','3','0');
INSERT INTO `Array` VALUES('1611','193','樊城区','3','0');
INSERT INTO `Array` VALUES('1612','193','襄阳区','3','0');
INSERT INTO `Array` VALUES('1613','193','老河口市','3','0');
INSERT INTO `Array` VALUES('1614','193','枣阳市','3','0');
INSERT INTO `Array` VALUES('1615','193','宜城市','3','0');
INSERT INTO `Array` VALUES('1616','193','南漳县','3','0');
INSERT INTO `Array` VALUES('1617','193','谷城县','3','0');
INSERT INTO `Array` VALUES('1618','193','保康县','3','0');
INSERT INTO `Array` VALUES('1619','194','孝南区','3','0');
INSERT INTO `Array` VALUES('1620','194','应城市','3','0');
INSERT INTO `Array` VALUES('1621','194','安陆市','3','0');
INSERT INTO `Array` VALUES('1622','194','汉川市','3','0');
INSERT INTO `Array` VALUES('1623','194','孝昌县','3','0');
INSERT INTO `Array` VALUES('1624','194','大悟县','3','0');
INSERT INTO `Array` VALUES('1625','194','云梦县','3','0');
INSERT INTO `Array` VALUES('1626','195','长阳','3','0');
INSERT INTO `Array` VALUES('1627','195','五峰','3','0');
INSERT INTO `Array` VALUES('1628','195','西陵区','3','0');
INSERT INTO `Array` VALUES('1629','195','伍家岗区','3','0');
INSERT INTO `Array` VALUES('1630','195','点军区','3','0');
INSERT INTO `Array` VALUES('1631','195','猇亭区','3','0');
INSERT INTO `Array` VALUES('1632','195','夷陵区','3','0');
INSERT INTO `Array` VALUES('1633','195','宜都市','3','0');
INSERT INTO `Array` VALUES('1634','195','当阳市','3','0');
INSERT INTO `Array` VALUES('1635','195','枝江市','3','0');
INSERT INTO `Array` VALUES('1636','195','远安县','3','0');
INSERT INTO `Array` VALUES('1637','195','兴山县','3','0');
INSERT INTO `Array` VALUES('1638','195','秭归县','3','0');
INSERT INTO `Array` VALUES('1639','196','恩施市','3','0');
INSERT INTO `Array` VALUES('1640','196','利川市','3','0');
INSERT INTO `Array` VALUES('1641','196','建始县','3','0');
INSERT INTO `Array` VALUES('1642','196','巴东县','3','0');
INSERT INTO `Array` VALUES('1643','196','宣恩县','3','0');
INSERT INTO `Array` VALUES('1644','196','咸丰县','3','0');
INSERT INTO `Array` VALUES('1645','196','来凤县','3','0');
INSERT INTO `Array` VALUES('1646','196','鹤峰县','3','0');
INSERT INTO `Array` VALUES('1647','197','岳麓区','3','0');
INSERT INTO `Array` VALUES('1648','197','芙蓉区','3','0');
INSERT INTO `Array` VALUES('1649','197','天心区','3','0');
INSERT INTO `Array` VALUES('1650','197','开福区','3','0');
INSERT INTO `Array` VALUES('1651','197','雨花区','3','0');
INSERT INTO `Array` VALUES('1652','197','开发区','3','0');
INSERT INTO `Array` VALUES('1653','197','浏阳市','3','0');
INSERT INTO `Array` VALUES('1654','197','长沙县','3','0');
INSERT INTO `Array` VALUES('1655','197','望城县','3','0');
INSERT INTO `Array` VALUES('1656','197','宁乡县','3','0');
INSERT INTO `Array` VALUES('1657','198','永定区','3','0');
INSERT INTO `Array` VALUES('1658','198','武陵源区','3','0');
INSERT INTO `Array` VALUES('1659','198','慈利县','3','0');
INSERT INTO `Array` VALUES('1660','198','桑植县','3','0');
INSERT INTO `Array` VALUES('1661','199','武陵区','3','0');
INSERT INTO `Array` VALUES('1662','199','鼎城区','3','0');
INSERT INTO `Array` VALUES('1663','199','津市市','3','0');
INSERT INTO `Array` VALUES('1664','199','安乡县','3','0');
INSERT INTO `Array` VALUES('1665','199','汉寿县','3','0');
INSERT INTO `Array` VALUES('1666','199','澧县','3','0');
INSERT INTO `Array` VALUES('1667','199','临澧县','3','0');
INSERT INTO `Array` VALUES('1668','199','桃源县','3','0');
INSERT INTO `Array` VALUES('1669','199','石门县','3','0');
INSERT INTO `Array` VALUES('1670','200','北湖区','3','0');
INSERT INTO `Array` VALUES('1671','200','苏仙区','3','0');
INSERT INTO `Array` VALUES('1672','200','资兴市','3','0');
INSERT INTO `Array` VALUES('1673','200','桂阳县','3','0');
INSERT INTO `Array` VALUES('1674','200','宜章县','3','0');
INSERT INTO `Array` VALUES('1675','200','永兴县','3','0');
INSERT INTO `Array` VALUES('1676','200','嘉禾县','3','0');
INSERT INTO `Array` VALUES('1677','200','临武县','3','0');
INSERT INTO `Array` VALUES('1678','200','汝城县','3','0');
INSERT INTO `Array` VALUES('1679','200','桂东县','3','0');
INSERT INTO `Array` VALUES('1680','200','安仁县','3','0');
INSERT INTO `Array` VALUES('1681','201','雁峰区','3','0');
INSERT INTO `Array` VALUES('1682','201','珠晖区','3','0');
INSERT INTO `Array` VALUES('1683','201','石鼓区','3','0');
INSERT INTO `Array` VALUES('1684','201','蒸湘区','3','0');
INSERT INTO `Array` VALUES('1685','201','南岳区','3','0');
INSERT INTO `Array` VALUES('1686','201','耒阳市','3','0');
INSERT INTO `Array` VALUES('1687','201','常宁市','3','0');
INSERT INTO `Array` VALUES('1688','201','衡阳县','3','0');
INSERT INTO `Array` VALUES('1689','201','衡南县','3','0');
INSERT INTO `Array` VALUES('1690','201','衡山县','3','0');
INSERT INTO `Array` VALUES('1691','201','衡东县','3','0');
INSERT INTO `Array` VALUES('1692','201','祁东县','3','0');
INSERT INTO `Array` VALUES('1693','202','鹤城区','3','0');
INSERT INTO `Array` VALUES('1694','202','靖州','3','0');
INSERT INTO `Array` VALUES('1695','202','麻阳','3','0');
INSERT INTO `Array` VALUES('1696','202','通道','3','0');
INSERT INTO `Array` VALUES('1697','202','新晃','3','0');
INSERT INTO `Array` VALUES('1698','202','芷江','3','0');
INSERT INTO `Array` VALUES('1699','202','沅陵县','3','0');
INSERT INTO `Array` VALUES('1700','202','辰溪县','3','0');
INSERT INTO `Array` VALUES('1701','202','溆浦县','3','0');
INSERT INTO `Array` VALUES('1702','202','中方县','3','0');
INSERT INTO `Array` VALUES('1703','202','会同县','3','0');
INSERT INTO `Array` VALUES('1704','202','洪江市','3','0');
INSERT INTO `Array` VALUES('1705','203','娄星区','3','0');
INSERT INTO `Array` VALUES('1706','203','冷水江市','3','0');
INSERT INTO `Array` VALUES('1707','203','涟源市','3','0');
INSERT INTO `Array` VALUES('1708','203','双峰县','3','0');
INSERT INTO `Array` VALUES('1709','203','新化县','3','0');
INSERT INTO `Array` VALUES('1710','204','城步','3','0');
INSERT INTO `Array` VALUES('1711','204','双清区','3','0');
INSERT INTO `Array` VALUES('1712','204','大祥区','3','0');
INSERT INTO `Array` VALUES('1713','204','北塔区','3','0');
INSERT INTO `Array` VALUES('1714','204','武冈市','3','0');
INSERT INTO `Array` VALUES('1715','204','邵东县','3','0');
INSERT INTO `Array` VALUES('1716','204','新邵县','3','0');
INSERT INTO `Array` VALUES('1717','204','邵阳县','3','0');
INSERT INTO `Array` VALUES('1718','204','隆回县','3','0');
INSERT INTO `Array` VALUES('1719','204','洞口县','3','0');
INSERT INTO `Array` VALUES('1720','204','绥宁县','3','0');
INSERT INTO `Array` VALUES('1721','204','新宁县','3','0');
INSERT INTO `Array` VALUES('1722','205','岳塘区','3','0');
INSERT INTO `Array` VALUES('1723','205','雨湖区','3','0');
INSERT INTO `Array` VALUES('1724','205','湘乡市','3','0');
INSERT INTO `Array` VALUES('1725','205','韶山市','3','0');
INSERT INTO `Array` VALUES('1726','205','湘潭县','3','0');
INSERT INTO `Array` VALUES('1727','206','吉首市','3','0');
INSERT INTO `Array` VALUES('1728','206','泸溪县','3','0');
INSERT INTO `Array` VALUES('1729','206','凤凰县','3','0');
INSERT INTO `Array` VALUES('1730','206','花垣县','3','0');
INSERT INTO `Array` VALUES('1731','206','保靖县','3','0');
INSERT INTO `Array` VALUES('1732','206','古丈县','3','0');
INSERT INTO `Array` VALUES('1733','206','永顺县','3','0');
INSERT INTO `Array` VALUES('1734','206','龙山县','3','0');
INSERT INTO `Array` VALUES('1735','207','赫山区','3','0');
INSERT INTO `Array` VALUES('1736','207','资阳区','3','0');
INSERT INTO `Array` VALUES('1737','207','沅江市','3','0');
INSERT INTO `Array` VALUES('1738','207','南县','3','0');
INSERT INTO `Array` VALUES('1739','207','桃江县','3','0');
INSERT INTO `Array` VALUES('1740','207','安化县','3','0');
INSERT INTO `Array` VALUES('1741','208','江华','3','0');
INSERT INTO `Array` VALUES('1742','208','冷水滩区','3','0');
INSERT INTO `Array` VALUES('1743','208','零陵区','3','0');
INSERT INTO `Array` VALUES('1744','208','祁阳县','3','0');
INSERT INTO `Array` VALUES('1745','208','东安县','3','0');
INSERT INTO `Array` VALUES('1746','208','双牌县','3','0');
INSERT INTO `Array` VALUES('1747','208','道县','3','0');
INSERT INTO `Array` VALUES('1748','208','江永县','3','0');
INSERT INTO `Array` VALUES('1749','208','宁远县','3','0');
INSERT INTO `Array` VALUES('1750','208','蓝山县','3','0');
INSERT INTO `Array` VALUES('1751','208','新田县','3','0');
INSERT INTO `Array` VALUES('1752','209','岳阳楼区','3','0');
INSERT INTO `Array` VALUES('1753','209','君山区','3','0');
INSERT INTO `Array` VALUES('1754','209','云溪区','3','0');
INSERT INTO `Array` VALUES('1755','209','汨罗市','3','0');
INSERT INTO `Array` VALUES('1756','209','临湘市','3','0');
INSERT INTO `Array` VALUES('1757','209','岳阳县','3','0');
INSERT INTO `Array` VALUES('1758','209','华容县','3','0');
INSERT INTO `Array` VALUES('1759','209','湘阴县','3','0');
INSERT INTO `Array` VALUES('1760','209','平江县','3','0');
INSERT INTO `Array` VALUES('1761','210','天元区','3','0');
INSERT INTO `Array` VALUES('1762','210','荷塘区','3','0');
INSERT INTO `Array` VALUES('1763','210','芦淞区','3','0');
INSERT INTO `Array` VALUES('1764','210','石峰区','3','0');
INSERT INTO `Array` VALUES('1765','210','醴陵市','3','0');
INSERT INTO `Array` VALUES('1766','210','株洲县','3','0');
INSERT INTO `Array` VALUES('1767','210','攸县','3','0');
INSERT INTO `Array` VALUES('1768','210','茶陵县','3','0');
INSERT INTO `Array` VALUES('1769','210','炎陵县','3','0');
INSERT INTO `Array` VALUES('1770','211','朝阳区','3','0');
INSERT INTO `Array` VALUES('1771','211','宽城区','3','0');
INSERT INTO `Array` VALUES('1772','211','二道区','3','0');
INSERT INTO `Array` VALUES('1773','211','南关区','3','0');
INSERT INTO `Array` VALUES('1774','211','绿园区','3','0');
INSERT INTO `Array` VALUES('1775','211','双阳区','3','0');
INSERT INTO `Array` VALUES('1776','211','净月潭开发区','3','0');
INSERT INTO `Array` VALUES('1777','211','高新技术开发区','3','0');
INSERT INTO `Array` VALUES('1778','211','经济技术开发区','3','0');
INSERT INTO `Array` VALUES('1779','211','汽车产业开发区','3','0');
INSERT INTO `Array` VALUES('1780','211','德惠市','3','0');
INSERT INTO `Array` VALUES('1781','211','九台市','3','0');
INSERT INTO `Array` VALUES('1782','211','榆树市','3','0');
INSERT INTO `Array` VALUES('1783','211','农安县','3','0');
INSERT INTO `Array` VALUES('1784','212','船营区','3','0');
INSERT INTO `Array` VALUES('1785','212','昌邑区','3','0');
INSERT INTO `Array` VALUES('1786','212','龙潭区','3','0');
INSERT INTO `Array` VALUES('1787','212','丰满区','3','0');
INSERT INTO `Array` VALUES('1788','212','蛟河市','3','0');
INSERT INTO `Array` VALUES('1789','212','桦甸市','3','0');
INSERT INTO `Array` VALUES('1790','212','舒兰市','3','0');
INSERT INTO `Array` VALUES('1791','212','磐石市','3','0');
INSERT INTO `Array` VALUES('1792','212','永吉县','3','0');
INSERT INTO `Array` VALUES('1793','213','洮北区','3','0');
INSERT INTO `Array` VALUES('1794','213','洮南市','3','0');
INSERT INTO `Array` VALUES('1795','213','大安市','3','0');
INSERT INTO `Array` VALUES('1796','213','镇赉县','3','0');
INSERT INTO `Array` VALUES('1797','213','通榆县','3','0');
INSERT INTO `Array` VALUES('1798','214','江源区','3','0');
INSERT INTO `Array` VALUES('1799','214','八道江区','3','0');
INSERT INTO `Array` VALUES('1800','214','长白','3','0');
INSERT INTO `Array` VALUES('1801','214','临江市','3','0');
INSERT INTO `Array` VALUES('1802','214','抚松县','3','0');
INSERT INTO `Array` VALUES('1803','214','靖宇县','3','0');
INSERT INTO `Array` VALUES('1804','215','龙山区','3','0');
INSERT INTO `Array` VALUES('1805','215','西安区','3','0');
INSERT INTO `Array` VALUES('1806','215','东丰县','3','0');
INSERT INTO `Array` VALUES('1807','215','东辽县','3','0');
INSERT INTO `Array` VALUES('1808','216','铁西区','3','0');
INSERT INTO `Array` VALUES('1809','216','铁东区','3','0');
INSERT INTO `Array` VALUES('1810','216','伊通','3','0');
INSERT INTO `Array` VALUES('1811','216','公主岭市','3','0');
INSERT INTO `Array` VALUES('1812','216','双辽市','3','0');
INSERT INTO `Array` VALUES('1813','216','梨树县','3','0');
INSERT INTO `Array` VALUES('1814','217','前郭尔罗斯','3','0');
INSERT INTO `Array` VALUES('1815','217','宁江区','3','0');
INSERT INTO `Array` VALUES('1816','217','长岭县','3','0');
INSERT INTO `Array` VALUES('1817','217','乾安县','3','0');
INSERT INTO `Array` VALUES('1818','217','扶余县','3','0');
INSERT INTO `Array` VALUES('1819','218','东昌区','3','0');
INSERT INTO `Array` VALUES('1820','218','二道江区','3','0');
INSERT INTO `Array` VALUES('1821','218','梅河口市','3','0');
INSERT INTO `Array` VALUES('1822','218','集安市','3','0');
INSERT INTO `Array` VALUES('1823','218','通化县','3','0');
INSERT INTO `Array` VALUES('1824','218','辉南县','3','0');
INSERT INTO `Array` VALUES('1825','218','柳河县','3','0');
INSERT INTO `Array` VALUES('1826','219','延吉市','3','0');
INSERT INTO `Array` VALUES('1827','219','图们市','3','0');
INSERT INTO `Array` VALUES('1828','219','敦化市','3','0');
INSERT INTO `Array` VALUES('1829','219','珲春市','3','0');
INSERT INTO `Array` VALUES('1830','219','龙井市','3','0');
INSERT INTO `Array` VALUES('1831','219','和龙市','3','0');
INSERT INTO `Array` VALUES('1832','219','安图县','3','0');
INSERT INTO `Array` VALUES('1833','219','汪清县','3','0');
INSERT INTO `Array` VALUES('1834','220','玄武区','3','0');
INSERT INTO `Array` VALUES('1835','220','鼓楼区','3','0');
INSERT INTO `Array` VALUES('1836','220','白下区','3','0');
INSERT INTO `Array` VALUES('1837','220','建邺区','3','0');
INSERT INTO `Array` VALUES('1838','220','秦淮区','3','0');
INSERT INTO `Array` VALUES('1839','220','雨花台区','3','0');
INSERT INTO `Array` VALUES('1840','220','下关区','3','0');
INSERT INTO `Array` VALUES('1841','220','栖霞区','3','0');
INSERT INTO `Array` VALUES('1842','220','浦口区','3','0');
INSERT INTO `Array` VALUES('1843','220','江宁区','3','0');
INSERT INTO `Array` VALUES('1844','220','六合区','3','0');
INSERT INTO `Array` VALUES('1845','220','溧水县','3','0');
INSERT INTO `Array` VALUES('1846','220','高淳县','3','0');
INSERT INTO `Array` VALUES('1847','221','沧浪区','3','0');
INSERT INTO `Array` VALUES('1848','221','金阊区','3','0');
INSERT INTO `Array` VALUES('1849','221','平江区','3','0');
INSERT INTO `Array` VALUES('1850','221','虎丘区','3','0');
INSERT INTO `Array` VALUES('1851','221','吴中区','3','0');
INSERT INTO `Array` VALUES('1852','221','相城区','3','0');
INSERT INTO `Array` VALUES('1853','221','园区','3','0');
INSERT INTO `Array` VALUES('1854','221','新区','3','0');
INSERT INTO `Array` VALUES('1855','221','常熟市','3','0');
INSERT INTO `Array` VALUES('1856','221','张家港市','3','0');
INSERT INTO `Array` VALUES('1857','221','玉山镇','3','0');
INSERT INTO `Array` VALUES('1858','221','巴城镇','3','0');
INSERT INTO `Array` VALUES('1859','221','周市镇','3','0');
INSERT INTO `Array` VALUES('1860','221','陆家镇','3','0');
INSERT INTO `Array` VALUES('1861','221','花桥镇','3','0');
INSERT INTO `Array` VALUES('1862','221','淀山湖镇','3','0');
INSERT INTO `Array` VALUES('1863','221','张浦镇','3','0');
INSERT INTO `Array` VALUES('1864','221','周庄镇','3','0');
INSERT INTO `Array` VALUES('1865','221','千灯镇','3','0');
INSERT INTO `Array` VALUES('1866','221','锦溪镇','3','0');
INSERT INTO `Array` VALUES('1867','221','开发区','3','0');
INSERT INTO `Array` VALUES('1868','221','吴江市','3','0');
INSERT INTO `Array` VALUES('1869','221','太仓市','3','0');
INSERT INTO `Array` VALUES('1870','222','崇安区','3','0');
INSERT INTO `Array` VALUES('1871','222','北塘区','3','0');
INSERT INTO `Array` VALUES('1872','222','南长区','3','0');
INSERT INTO `Array` VALUES('1873','222','锡山区','3','0');
INSERT INTO `Array` VALUES('1874','222','惠山区','3','0');
INSERT INTO `Array` VALUES('1875','222','滨湖区','3','0');
INSERT INTO `Array` VALUES('1876','222','新区','3','0');
INSERT INTO `Array` VALUES('1877','222','江阴市','3','0');
INSERT INTO `Array` VALUES('1878','222','宜兴市','3','0');
INSERT INTO `Array` VALUES('1879','223','天宁区','3','0');
INSERT INTO `Array` VALUES('1880','223','钟楼区','3','0');
INSERT INTO `Array` VALUES('1881','223','戚墅堰区','3','0');
INSERT INTO `Array` VALUES('1882','223','郊区','3','0');
INSERT INTO `Array` VALUES('1883','223','新北区','3','0');
INSERT INTO `Array` VALUES('1884','223','武进区','3','0');
INSERT INTO `Array` VALUES('1885','223','溧阳市','3','0');
INSERT INTO `Array` VALUES('1886','223','金坛市','3','0');
INSERT INTO `Array` VALUES('1887','224','清河区','3','0');
INSERT INTO `Array` VALUES('1888','224','清浦区','3','0');
INSERT INTO `Array` VALUES('1889','224','楚州区','3','0');
INSERT INTO `Array` VALUES('1890','224','淮阴区','3','0');
INSERT INTO `Array` VALUES('1891','224','涟水县','3','0');
INSERT INTO `Array` VALUES('1892','224','洪泽县','3','0');
INSERT INTO `Array` VALUES('1893','224','盱眙县','3','0');
INSERT INTO `Array` VALUES('1894','224','金湖县','3','0');
INSERT INTO `Array` VALUES('1895','225','新浦区','3','0');
INSERT INTO `Array` VALUES('1896','225','连云区','3','0');
INSERT INTO `Array` VALUES('1897','225','海州区','3','0');
INSERT INTO `Array` VALUES('1898','225','赣榆县','3','0');
INSERT INTO `Array` VALUES('1899','225','东海县','3','0');
INSERT INTO `Array` VALUES('1900','225','灌云县','3','0');
INSERT INTO `Array` VALUES('1901','225','灌南县','3','0');
INSERT INTO `Array` VALUES('1902','226','崇川区','3','0');
INSERT INTO `Array` VALUES('1903','226','港闸区','3','0');
INSERT INTO `Array` VALUES('1904','226','经济开发区','3','0');
INSERT INTO `Array` VALUES('1905','226','启东市','3','0');
INSERT INTO `Array` VALUES('1906','226','如皋市','3','0');
INSERT INTO `Array` VALUES('1907','226','通州市','3','0');
INSERT INTO `Array` VALUES('1908','226','海门市','3','0');
INSERT INTO `Array` VALUES('1909','226','海安县','3','0');
INSERT INTO `Array` VALUES('1910','226','如东县','3','0');
INSERT INTO `Array` VALUES('1911','227','宿城区','3','0');
INSERT INTO `Array` VALUES('1912','227','宿豫区','3','0');
INSERT INTO `Array` VALUES('1913','227','宿豫县','3','0');
INSERT INTO `Array` VALUES('1914','227','沭阳县','3','0');
INSERT INTO `Array` VALUES('1915','227','泗阳县','3','0');
INSERT INTO `Array` VALUES('1916','227','泗洪县','3','0');
INSERT INTO `Array` VALUES('1917','228','海陵区','3','0');
INSERT INTO `Array` VALUES('1918','228','高港区','3','0');
INSERT INTO `Array` VALUES('1919','228','兴化市','3','0');
INSERT INTO `Array` VALUES('1920','228','靖江市','3','0');
INSERT INTO `Array` VALUES('1921','228','泰兴市','3','0');
INSERT INTO `Array` VALUES('1922','228','姜堰市','3','0');
INSERT INTO `Array` VALUES('1923','229','云龙区','3','0');
INSERT INTO `Array` VALUES('1924','229','鼓楼区','3','0');
INSERT INTO `Array` VALUES('1925','229','九里区','3','0');
INSERT INTO `Array` VALUES('1926','229','贾汪区','3','0');
INSERT INTO `Array` VALUES('1927','229','泉山区','3','0');
INSERT INTO `Array` VALUES('1928','229','新沂市','3','0');
INSERT INTO `Array` VALUES('1929','229','邳州市','3','0');
INSERT INTO `Array` VALUES('1930','229','丰县','3','0');
INSERT INTO `Array` VALUES('1931','229','沛县','3','0');
INSERT INTO `Array` VALUES('1932','229','铜山县','3','0');
INSERT INTO `Array` VALUES('1933','229','睢宁县','3','0');
INSERT INTO `Array` VALUES('1934','230','城区','3','0');
INSERT INTO `Array` VALUES('1935','230','亭湖区','3','0');
INSERT INTO `Array` VALUES('1936','230','盐都区','3','0');
INSERT INTO `Array` VALUES('1937','230','盐都县','3','0');
INSERT INTO `Array` VALUES('1938','230','东台市','3','0');
INSERT INTO `Array` VALUES('1939','230','大丰市','3','0');
INSERT INTO `Array` VALUES('1940','230','响水县','3','0');
INSERT INTO `Array` VALUES('1941','230','滨海县','3','0');
INSERT INTO `Array` VALUES('1942','230','阜宁县','3','0');
INSERT INTO `Array` VALUES('1943','230','射阳县','3','0');
INSERT INTO `Array` VALUES('1944','230','建湖县','3','0');
INSERT INTO `Array` VALUES('1945','231','广陵区','3','0');
INSERT INTO `Array` VALUES('1946','231','维扬区','3','0');
INSERT INTO `Array` VALUES('1947','231','邗江区','3','0');
INSERT INTO `Array` VALUES('1948','231','仪征市','3','0');
INSERT INTO `Array` VALUES('1949','231','高邮市','3','0');
INSERT INTO `Array` VALUES('1950','231','江都市','3','0');
INSERT INTO `Array` VALUES('1951','231','宝应县','3','0');
INSERT INTO `Array` VALUES('1952','232','京口区','3','0');
INSERT INTO `Array` VALUES('1953','232','润州区','3','0');
INSERT INTO `Array` VALUES('1954','232','丹徒区','3','0');
INSERT INTO `Array` VALUES('1955','232','丹阳市','3','0');
INSERT INTO `Array` VALUES('1956','232','扬中市','3','0');
INSERT INTO `Array` VALUES('1957','232','句容市','3','0');
INSERT INTO `Array` VALUES('1958','233','东湖区','3','0');
INSERT INTO `Array` VALUES('1959','233','西湖区','3','0');
INSERT INTO `Array` VALUES('1960','233','青云谱区','3','0');
INSERT INTO `Array` VALUES('1961','233','湾里区','3','0');
INSERT INTO `Array` VALUES('1962','233','青山湖区','3','0');
INSERT INTO `Array` VALUES('1963','233','红谷滩新区','3','0');
INSERT INTO `Array` VALUES('1964','233','昌北区','3','0');
INSERT INTO `Array` VALUES('1965','233','高新区','3','0');
INSERT INTO `Array` VALUES('1966','233','南昌县','3','0');
INSERT INTO `Array` VALUES('1967','233','新建县','3','0');
INSERT INTO `Array` VALUES('1968','233','安义县','3','0');
INSERT INTO `Array` VALUES('1969','233','进贤县','3','0');
INSERT INTO `Array` VALUES('1970','234','临川区','3','0');
INSERT INTO `Array` VALUES('1971','234','南城县','3','0');
INSERT INTO `Array` VALUES('1972','234','黎川县','3','0');
INSERT INTO `Array` VALUES('1973','234','南丰县','3','0');
INSERT INTO `Array` VALUES('1974','234','崇仁县','3','0');
INSERT INTO `Array` VALUES('1975','234','乐安县','3','0');
INSERT INTO `Array` VALUES('1976','234','宜黄县','3','0');
INSERT INTO `Array` VALUES('1977','234','金溪县','3','0');
INSERT INTO `Array` VALUES('1978','234','资溪县','3','0');
INSERT INTO `Array` VALUES('1979','234','东乡县','3','0');
INSERT INTO `Array` VALUES('1980','234','广昌县','3','0');
INSERT INTO `Array` VALUES('1981','235','章贡区','3','0');
INSERT INTO `Array` VALUES('1982','235','于都县','3','0');
INSERT INTO `Array` VALUES('1983','235','瑞金市','3','0');
INSERT INTO `Array` VALUES('1984','235','南康市','3','0');
INSERT INTO `Array` VALUES('1985','235','赣县','3','0');
INSERT INTO `Array` VALUES('1986','235','信丰县','3','0');
INSERT INTO `Array` VALUES('1987','235','大余县','3','0');
INSERT INTO `Array` VALUES('1988','235','上犹县','3','0');
INSERT INTO `Array` VALUES('1989','235','崇义县','3','0');
INSERT INTO `Array` VALUES('1990','235','安远县','3','0');
INSERT INTO `Array` VALUES('1991','235','龙南县','3','0');
INSERT INTO `Array` VALUES('1992','235','定南县','3','0');
INSERT INTO `Array` VALUES('1993','235','全南县','3','0');
INSERT INTO `Array` VALUES('1994','235','宁都县','3','0');
INSERT INTO `Array` VALUES('1995','235','兴国县','3','0');
INSERT INTO `Array` VALUES('1996','235','会昌县','3','0');
INSERT INTO `Array` VALUES('1997','235','寻乌县','3','0');
INSERT INTO `Array` VALUES('1998','235','石城县','3','0');
INSERT INTO `Array` VALUES('1999','236','安福县','3','0');
INSERT INTO `Array` VALUES('2000','236','吉州区','3','0');
INSERT INTO `Array` VALUES('2001','236','青原区','3','0');
INSERT INTO `Array` VALUES('2002','236','井冈山市','3','0');
INSERT INTO `Array` VALUES('2003','236','吉安县','3','0');
INSERT INTO `Array` VALUES('2004','236','吉水县','3','0');
INSERT INTO `Array` VALUES('2005','236','峡江县','3','0');
INSERT INTO `Array` VALUES('2006','236','新干县','3','0');
INSERT INTO `Array` VALUES('2007','236','永丰县','3','0');
INSERT INTO `Array` VALUES('2008','236','泰和县','3','0');
INSERT INTO `Array` VALUES('2009','236','遂川县','3','0');
INSERT INTO `Array` VALUES('2010','236','万安县','3','0');
INSERT INTO `Array` VALUES('2011','236','永新县','3','0');
INSERT INTO `Array` VALUES('2012','237','珠山区','3','0');
INSERT INTO `Array` VALUES('2013','237','昌江区','3','0');
INSERT INTO `Array` VALUES('2014','237','乐平市','3','0');
INSERT INTO `Array` VALUES('2015','237','浮梁县','3','0');
INSERT INTO `Array` VALUES('2016','238','浔阳区','3','0');
INSERT INTO `Array` VALUES('2017','238','庐山区','3','0');
INSERT INTO `Array` VALUES('2018','238','瑞昌市','3','0');
INSERT INTO `Array` VALUES('2019','238','九江县','3','0');
INSERT INTO `Array` VALUES('2020','238','武宁县','3','0');
INSERT INTO `Array` VALUES('2021','238','修水县','3','0');
INSERT INTO `Array` VALUES('2022','238','永修县','3','0');
INSERT INTO `Array` VALUES('2023','238','德安县','3','0');
INSERT INTO `Array` VALUES('2024','238','星子县','3','0');
INSERT INTO `Array` VALUES('2025','238','都昌县','3','0');
INSERT INTO `Array` VALUES('2026','238','湖口县','3','0');
INSERT INTO `Array` VALUES('2027','238','彭泽县','3','0');
INSERT INTO `Array` VALUES('2028','239','安源区','3','0');
INSERT INTO `Array` VALUES('2029','239','湘东区','3','0');
INSERT INTO `Array` VALUES('2030','239','莲花县','3','0');
INSERT INTO `Array` VALUES('2031','239','芦溪县','3','0');
INSERT INTO `Array` VALUES('2032','239','上栗县','3','0');
INSERT INTO `Array` VALUES('2033','240','信州区','3','0');
INSERT INTO `Array` VALUES('2034','240','德兴市','3','0');
INSERT INTO `Array` VALUES('2035','240','上饶县','3','0');
INSERT INTO `Array` VALUES('2036','240','广丰县','3','0');
INSERT INTO `Array` VALUES('2037','240','玉山县','3','0');
INSERT INTO `Array` VALUES('2038','240','铅山县','3','0');
INSERT INTO `Array` VALUES('2039','240','横峰县','3','0');
INSERT INTO `Array` VALUES('2040','240','弋阳县','3','0');
INSERT INTO `Array` VALUES('2041','240','余干县','3','0');
INSERT INTO `Array` VALUES('2042','240','波阳县','3','0');
INSERT INTO `Array` VALUES('2043','240','万年县','3','0');
INSERT INTO `Array` VALUES('2044','240','婺源县','3','0');
INSERT INTO `Array` VALUES('2045','241','渝水区','3','0');
INSERT INTO `Array` VALUES('2046','241','分宜县','3','0');
INSERT INTO `Array` VALUES('2047','242','袁州区','3','0');
INSERT INTO `Array` VALUES('2048','242','丰城市','3','0');
INSERT INTO `Array` VALUES('2049','242','樟树市','3','0');
INSERT INTO `Array` VALUES('2050','242','高安市','3','0');
INSERT INTO `Array` VALUES('2051','242','奉新县','3','0');
INSERT INTO `Array` VALUES('2052','242','万载县','3','0');
INSERT INTO `Array` VALUES('2053','242','上高县','3','0');
INSERT INTO `Array` VALUES('2054','242','宜丰县','3','0');
INSERT INTO `Array` VALUES('2055','242','靖安县','3','0');
INSERT INTO `Array` VALUES('2056','242','铜鼓县','3','0');
INSERT INTO `Array` VALUES('2057','243','月湖区','3','0');
INSERT INTO `Array` VALUES('2058','243','贵溪市','3','0');
INSERT INTO `Array` VALUES('2059','243','余江县','3','0');
INSERT INTO `Array` VALUES('2060','244','沈河区','3','0');
INSERT INTO `Array` VALUES('2061','244','皇姑区','3','0');
INSERT INTO `Array` VALUES('2062','244','和平区','3','0');
INSERT INTO `Array` VALUES('2063','244','大东区','3','0');
INSERT INTO `Array` VALUES('2064','244','铁西区','3','0');
INSERT INTO `Array` VALUES('2065','244','苏家屯区','3','0');
INSERT INTO `Array` VALUES('2066','244','东陵区','3','0');
INSERT INTO `Array` VALUES('2067','244','沈北新区','3','0');
INSERT INTO `Array` VALUES('2068','244','于洪区','3','0');
INSERT INTO `Array` VALUES('2069','244','浑南新区','3','0');
INSERT INTO `Array` VALUES('2070','244','新民市','3','0');
INSERT INTO `Array` VALUES('2071','244','辽中县','3','0');
INSERT INTO `Array` VALUES('2072','244','康平县','3','0');
INSERT INTO `Array` VALUES('2073','244','法库县','3','0');
INSERT INTO `Array` VALUES('2074','245','西岗区','3','0');
INSERT INTO `Array` VALUES('2075','245','中山区','3','0');
INSERT INTO `Array` VALUES('2076','245','沙河口区','3','0');
INSERT INTO `Array` VALUES('2077','245','甘井子区','3','0');
INSERT INTO `Array` VALUES('2078','245','旅顺口区','3','0');
INSERT INTO `Array` VALUES('2079','245','金州区','3','0');
INSERT INTO `Array` VALUES('2080','245','开发区','3','0');
INSERT INTO `Array` VALUES('2081','245','瓦房店市','3','0');
INSERT INTO `Array` VALUES('2082','245','普兰店市','3','0');
INSERT INTO `Array` VALUES('2083','245','庄河市','3','0');
INSERT INTO `Array` VALUES('2084','245','长海县','3','0');
INSERT INTO `Array` VALUES('2085','246','铁东区','3','0');
INSERT INTO `Array` VALUES('2086','246','铁西区','3','0');
INSERT INTO `Array` VALUES('2087','246','立山区','3','0');
INSERT INTO `Array` VALUES('2088','246','千山区','3','0');
INSERT INTO `Array` VALUES('2089','246','岫岩','3','0');
INSERT INTO `Array` VALUES('2090','246','海城市','3','0');
INSERT INTO `Array` VALUES('2091','246','台安县','3','0');
INSERT INTO `Array` VALUES('2092','247','本溪','3','0');
INSERT INTO `Array` VALUES('2093','247','平山区','3','0');
INSERT INTO `Array` VALUES('2094','247','明山区','3','0');
INSERT INTO `Array` VALUES('2095','247','溪湖区','3','0');
INSERT INTO `Array` VALUES('2096','247','南芬区','3','0');
INSERT INTO `Array` VALUES('2097','247','桓仁','3','0');
INSERT INTO `Array` VALUES('2098','248','双塔区','3','0');
INSERT INTO `Array` VALUES('2099','248','龙城区','3','0');
INSERT INTO `Array` VALUES('2100','248','喀喇沁左翼蒙古族自治县','3','0');
INSERT INTO `Array` VALUES('2101','248','北票市','3','0');
INSERT INTO `Array` VALUES('2102','248','凌源市','3','0');
INSERT INTO `Array` VALUES('2103','248','朝阳县','3','0');
INSERT INTO `Array` VALUES('2104','248','建平县','3','0');
INSERT INTO `Array` VALUES('2105','249','振兴区','3','0');
INSERT INTO `Array` VALUES('2106','249','元宝区','3','0');
INSERT INTO `Array` VALUES('2107','249','振安区','3','0');
INSERT INTO `Array` VALUES('2108','249','宽甸','3','0');
INSERT INTO `Array` VALUES('2109','249','东港市','3','0');
INSERT INTO `Array` VALUES('2110','249','凤城市','3','0');
INSERT INTO `Array` VALUES('2111','250','顺城区','3','0');
INSERT INTO `Array` VALUES('2112','250','新抚区','3','0');
INSERT INTO `Array` VALUES('2113','250','东洲区','3','0');
INSERT INTO `Array` VALUES('2114','250','望花区','3','0');
INSERT INTO `Array` VALUES('2115','250','清原','3','0');
INSERT INTO `Array` VALUES('2116','250','新宾','3','0');
INSERT INTO `Array` VALUES('2117','250','抚顺县','3','0');
INSERT INTO `Array` VALUES('2118','251','阜新','3','0');
INSERT INTO `Array` VALUES('2119','251','海州区','3','0');
INSERT INTO `Array` VALUES('2120','251','新邱区','3','0');
INSERT INTO `Array` VALUES('2121','251','太平区','3','0');
INSERT INTO `Array` VALUES('2122','251','清河门区','3','0');
INSERT INTO `Array` VALUES('2123','251','细河区','3','0');
INSERT INTO `Array` VALUES('2124','251','彰武县','3','0');
INSERT INTO `Array` VALUES('2125','252','龙港区','3','0');
INSERT INTO `Array` VALUES('2126','252','南票区','3','0');
INSERT INTO `Array` VALUES('2127','252','连山区','3','0');
INSERT INTO `Array` VALUES('2128','252','兴城市','3','0');
INSERT INTO `Array` VALUES('2129','252','绥中县','3','0');
INSERT INTO `Array` VALUES('2130','252','建昌县','3','0');
INSERT INTO `Array` VALUES('2131','253','太和区','3','0');
INSERT INTO `Array` VALUES('2132','253','古塔区','3','0');
INSERT INTO `Array` VALUES('2133','253','凌河区','3','0');
INSERT INTO `Array` VALUES('2134','253','凌海市','3','0');
INSERT INTO `Array` VALUES('2135','253','北镇市','3','0');
INSERT INTO `Array` VALUES('2136','253','黑山县','3','0');
INSERT INTO `Array` VALUES('2137','253','义县','3','0');
INSERT INTO `Array` VALUES('2138','254','白塔区','3','0');
INSERT INTO `Array` VALUES('2139','254','文圣区','3','0');
INSERT INTO `Array` VALUES('2140','254','宏伟区','3','0');
INSERT INTO `Array` VALUES('2141','254','太子河区','3','0');
INSERT INTO `Array` VALUES('2142','254','弓长岭区','3','0');
INSERT INTO `Array` VALUES('2143','254','灯塔市','3','0');
INSERT INTO `Array` VALUES('2144','254','辽阳县','3','0');
INSERT INTO `Array` VALUES('2145','255','双台子区','3','0');
INSERT INTO `Array` VALUES('2146','255','兴隆台区','3','0');
INSERT INTO `Array` VALUES('2147','255','大洼县','3','0');
INSERT INTO `Array` VALUES('2148','255','盘山县','3','0');
INSERT INTO `Array` VALUES('2149','256','银州区','3','0');
INSERT INTO `Array` VALUES('2150','256','清河区','3','0');
INSERT INTO `Array` VALUES('2151','256','调兵山市','3','0');
INSERT INTO `Array` VALUES('2152','256','开原市','3','0');
INSERT INTO `Array` VALUES('2153','256','铁岭县','3','0');
INSERT INTO `Array` VALUES('2154','256','西丰县','3','0');
INSERT INTO `Array` VALUES('2155','256','昌图县','3','0');
INSERT INTO `Array` VALUES('2156','257','站前区','3','0');
INSERT INTO `Array` VALUES('2157','257','西市区','3','0');
INSERT INTO `Array` VALUES('2158','257','鲅鱼圈区','3','0');
INSERT INTO `Array` VALUES('2159','257','老边区','3','0');
INSERT INTO `Array` VALUES('2160','257','盖州市','3','0');
INSERT INTO `Array` VALUES('2161','257','大石桥市','3','0');
INSERT INTO `Array` VALUES('2162','258','回民区','3','0');
INSERT INTO `Array` VALUES('2163','258','玉泉区','3','0');
INSERT INTO `Array` VALUES('2164','258','新城区','3','0');
INSERT INTO `Array` VALUES('2165','258','赛罕区','3','0');
INSERT INTO `Array` VALUES('2166','258','清水河县','3','0');
INSERT INTO `Array` VALUES('2167','258','土默特左旗','3','0');
INSERT INTO `Array` VALUES('2168','258','托克托县','3','0');
INSERT INTO `Array` VALUES('2169','258','和林格尔县','3','0');
INSERT INTO `Array` VALUES('2170','258','武川县','3','0');
INSERT INTO `Array` VALUES('2171','259','阿拉善左旗','3','0');
INSERT INTO `Array` VALUES('2172','259','阿拉善右旗','3','0');
INSERT INTO `Array` VALUES('2173','259','额济纳旗','3','0');
INSERT INTO `Array` VALUES('2174','260','临河区','3','0');
INSERT INTO `Array` VALUES('2175','260','五原县','3','0');
INSERT INTO `Array` VALUES('2176','260','磴口县','3','0');
INSERT INTO `Array` VALUES('2177','260','乌拉特前旗','3','0');
INSERT INTO `Array` VALUES('2178','260','乌拉特中旗','3','0');
INSERT INTO `Array` VALUES('2179','260','乌拉特后旗','3','0');
INSERT INTO `Array` VALUES('2180','260','杭锦后旗','3','0');
INSERT INTO `Array` VALUES('2181','261','昆都仑区','3','0');
INSERT INTO `Array` VALUES('2182','261','青山区','3','0');
INSERT INTO `Array` VALUES('2183','261','东河区','3','0');
INSERT INTO `Array` VALUES('2184','261','九原区','3','0');
INSERT INTO `Array` VALUES('2185','261','石拐区','3','0');
INSERT INTO `Array` VALUES('2186','261','白云矿区','3','0');
INSERT INTO `Array` VALUES('2187','261','土默特右旗','3','0');
INSERT INTO `Array` VALUES('2188','261','固阳县','3','0');
INSERT INTO `Array` VALUES('2189','261','达尔罕茂明安联合旗','3','0');
INSERT INTO `Array` VALUES('2190','262','红山区','3','0');
INSERT INTO `Array` VALUES('2191','262','元宝山区','3','0');
INSERT INTO `Array` VALUES('2192','262','松山区','3','0');
INSERT INTO `Array` VALUES('2193','262','阿鲁科尔沁旗','3','0');
INSERT INTO `Array` VALUES('2194','262','巴林左旗','3','0');
INSERT INTO `Array` VALUES('2195','262','巴林右旗','3','0');
INSERT INTO `Array` VALUES('2196','262','林西县','3','0');
INSERT INTO `Array` VALUES('2197','262','克什克腾旗','3','0');
INSERT INTO `Array` VALUES('2198','262','翁牛特旗','3','0');
INSERT INTO `Array` VALUES('2199','262','喀喇沁旗','3','0');
INSERT INTO `Array` VALUES('2200','262','宁城县','3','0');
INSERT INTO `Array` VALUES('2201','262','敖汉旗','3','0');
INSERT INTO `Array` VALUES('2202','263','东胜区','3','0');
INSERT INTO `Array` VALUES('2203','263','达拉特旗','3','0');
INSERT INTO `Array` VALUES('2204','263','准格尔旗','3','0');
INSERT INTO `Array` VALUES('2205','263','鄂托克前旗','3','0');
INSERT INTO `Array` VALUES('2206','263','鄂托克旗','3','0');
INSERT INTO `Array` VALUES('2207','263','杭锦旗','3','0');
INSERT INTO `Array` VALUES('2208','263','乌审旗','3','0');
INSERT INTO `Array` VALUES('2209','263','伊金霍洛旗','3','0');
INSERT INTO `Array` VALUES('2210','264','海拉尔区','3','0');
INSERT INTO `Array` VALUES('2211','264','莫力达瓦','3','0');
INSERT INTO `Array` VALUES('2212','264','满洲里市','3','0');
INSERT INTO `Array` VALUES('2213','264','牙克石市','3','0');
INSERT INTO `Array` VALUES('2214','264','扎兰屯市','3','0');
INSERT INTO `Array` VALUES('2215','264','额尔古纳市','3','0');
INSERT INTO `Array` VALUES('2216','264','根河市','3','0');
INSERT INTO `Array` VALUES('2217','264','阿荣旗','3','0');
INSERT INTO `Array` VALUES('2218','264','鄂伦春自治旗','3','0');
INSERT INTO `Array` VALUES('2219','264','鄂温克族自治旗','3','0');
INSERT INTO `Array` VALUES('2220','264','陈巴尔虎旗','3','0');
INSERT INTO `Array` VALUES('2221','264','新巴尔虎左旗','3','0');
INSERT INTO `Array` VALUES('2222','264','新巴尔虎右旗','3','0');
INSERT INTO `Array` VALUES('2223','265','科尔沁区','3','0');
INSERT INTO `Array` VALUES('2224','265','霍林郭勒市','3','0');
INSERT INTO `Array` VALUES('2225','265','科尔沁左翼中旗','3','0');
INSERT INTO `Array` VALUES('2226','265','科尔沁左翼后旗','3','0');
INSERT INTO `Array` VALUES('2227','265','开鲁县','3','0');
INSERT INTO `Array` VALUES('2228','265','库伦旗','3','0');
INSERT INTO `Array` VALUES('2229','265','奈曼旗','3','0');
INSERT INTO `Array` VALUES('2230','265','扎鲁特旗','3','0');
INSERT INTO `Array` VALUES('2231','266','海勃湾区','3','0');
INSERT INTO `Array` VALUES('2232','266','乌达区','3','0');
INSERT INTO `Array` VALUES('2233','266','海南区','3','0');
INSERT INTO `Array` VALUES('2234','267','化德县','3','0');
INSERT INTO `Array` VALUES('2235','267','集宁区','3','0');
INSERT INTO `Array` VALUES('2236','267','丰镇市','3','0');
INSERT INTO `Array` VALUES('2237','267','卓资县','3','0');
INSERT INTO `Array` VALUES('2238','267','商都县','3','0');
INSERT INTO `Array` VALUES('2239','267','兴和县','3','0');
INSERT INTO `Array` VALUES('2240','267','凉城县','3','0');
INSERT INTO `Array` VALUES('2241','267','察哈尔右翼前旗','3','0');
INSERT INTO `Array` VALUES('2242','267','察哈尔右翼中旗','3','0');
INSERT INTO `Array` VALUES('2243','267','察哈尔右翼后旗','3','0');
INSERT INTO `Array` VALUES('2244','267','四子王旗','3','0');
INSERT INTO `Array` VALUES('2245','268','二连浩特市','3','0');
INSERT INTO `Array` VALUES('2246','268','锡林浩特市','3','0');
INSERT INTO `Array` VALUES('2247','268','阿巴嘎旗','3','0');
INSERT INTO `Array` VALUES('2248','268','苏尼特左旗','3','0');
INSERT INTO `Array` VALUES('2249','268','苏尼特右旗','3','0');
INSERT INTO `Array` VALUES('2250','268','东乌珠穆沁旗','3','0');
INSERT INTO `Array` VALUES('2251','268','西乌珠穆沁旗','3','0');
INSERT INTO `Array` VALUES('2252','268','太仆寺旗','3','0');
INSERT INTO `Array` VALUES('2253','268','镶黄旗','3','0');
INSERT INTO `Array` VALUES('2254','268','正镶白旗','3','0');
INSERT INTO `Array` VALUES('2255','268','正蓝旗','3','0');
INSERT INTO `Array` VALUES('2256','268','多伦县','3','0');
INSERT INTO `Array` VALUES('2257','269','乌兰浩特市','3','0');
INSERT INTO `Array` VALUES('2258','269','阿尔山市','3','0');
INSERT INTO `Array` VALUES('2259','269','科尔沁右翼前旗','3','0');
INSERT INTO `Array` VALUES('2260','269','科尔沁右翼中旗','3','0');
INSERT INTO `Array` VALUES('2261','269','扎赉特旗','3','0');
INSERT INTO `Array` VALUES('2262','269','突泉县','3','0');
INSERT INTO `Array` VALUES('2263','270','西夏区','3','0');
INSERT INTO `Array` VALUES('2264','270','金凤区','3','0');
INSERT INTO `Array` VALUES('2265','270','兴庆区','3','0');
INSERT INTO `Array` VALUES('2266','270','灵武市','3','0');
INSERT INTO `Array` VALUES('2267','270','永宁县','3','0');
INSERT INTO `Array` VALUES('2268','270','贺兰县','3','0');
INSERT INTO `Array` VALUES('2269','271','原州区','3','0');
INSERT INTO `Array` VALUES('2270','271','海原县','3','0');
INSERT INTO `Array` VALUES('2271','271','西吉县','3','0');
INSERT INTO `Array` VALUES('2272','271','隆德县','3','0');
INSERT INTO `Array` VALUES('2273','271','泾源县','3','0');
INSERT INTO `Array` VALUES('2274','271','彭阳县','3','0');
INSERT INTO `Array` VALUES('2275','272','惠农县','3','0');
INSERT INTO `Array` VALUES('2276','272','大武口区','3','0');
INSERT INTO `Array` VALUES('2277','272','惠农区','3','0');
INSERT INTO `Array` VALUES('2278','272','陶乐县','3','0');
INSERT INTO `Array` VALUES('2279','272','平罗县','3','0');
INSERT INTO `Array` VALUES('2280','273','利通区','3','0');
INSERT INTO `Array` VALUES('2281','273','中卫县','3','0');
INSERT INTO `Array` VALUES('2282','273','青铜峡市','3','0');
INSERT INTO `Array` VALUES('2283','273','中宁县','3','0');
INSERT INTO `Array` VALUES('2284','273','盐池县','3','0');
INSERT INTO `Array` VALUES('2285','273','同心县','3','0');
INSERT INTO `Array` VALUES('2286','274','沙坡头区','3','0');
INSERT INTO `Array` VALUES('2287','274','海原县','3','0');
INSERT INTO `Array` VALUES('2288','274','中宁县','3','0');
INSERT INTO `Array` VALUES('2289','275','城中区','3','0');
INSERT INTO `Array` VALUES('2290','275','城东区','3','0');
INSERT INTO `Array` VALUES('2291','275','城西区','3','0');
INSERT INTO `Array` VALUES('2292','275','城北区','3','0');
INSERT INTO `Array` VALUES('2293','275','湟中县','3','0');
INSERT INTO `Array` VALUES('2294','275','湟源县','3','0');
INSERT INTO `Array` VALUES('2295','275','大通','3','0');
INSERT INTO `Array` VALUES('2296','276','玛沁县','3','0');
INSERT INTO `Array` VALUES('2297','276','班玛县','3','0');
INSERT INTO `Array` VALUES('2298','276','甘德县','3','0');
INSERT INTO `Array` VALUES('2299','276','达日县','3','0');
INSERT INTO `Array` VALUES('2300','276','久治县','3','0');
INSERT INTO `Array` VALUES('2301','276','玛多县','3','0');
INSERT INTO `Array` VALUES('2302','277','海晏县','3','0');
INSERT INTO `Array` VALUES('2303','277','祁连县','3','0');
INSERT INTO `Array` VALUES('2304','277','刚察县','3','0');
INSERT INTO `Array` VALUES('2305','277','门源','3','0');
INSERT INTO `Array` VALUES('2306','278','平安县','3','0');
INSERT INTO `Array` VALUES('2307','278','乐都县','3','0');
INSERT INTO `Array` VALUES('2308','278','民和','3','0');
INSERT INTO `Array` VALUES('2309','278','互助','3','0');
INSERT INTO `Array` VALUES('2310','278','化隆','3','0');
INSERT INTO `Array` VALUES('2311','278','循化','3','0');
INSERT INTO `Array` VALUES('2312','279','共和县','3','0');
INSERT INTO `Array` VALUES('2313','279','同德县','3','0');
INSERT INTO `Array` VALUES('2314','279','贵德县','3','0');
INSERT INTO `Array` VALUES('2315','279','兴海县','3','0');
INSERT INTO `Array` VALUES('2316','279','贵南县','3','0');
INSERT INTO `Array` VALUES('2317','280','德令哈市','3','0');
INSERT INTO `Array` VALUES('2318','280','格尔木市','3','0');
INSERT INTO `Array` VALUES('2319','280','乌兰县','3','0');
INSERT INTO `Array` VALUES('2320','280','都兰县','3','0');
INSERT INTO `Array` VALUES('2321','280','天峻县','3','0');
INSERT INTO `Array` VALUES('2322','281','同仁县','3','0');
INSERT INTO `Array` VALUES('2323','281','尖扎县','3','0');
INSERT INTO `Array` VALUES('2324','281','泽库县','3','0');
INSERT INTO `Array` VALUES('2325','281','河南蒙古族自治县','3','0');
INSERT INTO `Array` VALUES('2326','282','玉树县','3','0');
INSERT INTO `Array` VALUES('2327','282','杂多县','3','0');
INSERT INTO `Array` VALUES('2328','282','称多县','3','0');
INSERT INTO `Array` VALUES('2329','282','治多县','3','0');
INSERT INTO `Array` VALUES('2330','282','囊谦县','3','0');
INSERT INTO `Array` VALUES('2331','282','曲麻莱县','3','0');
INSERT INTO `Array` VALUES('2332','283','市中区','3','0');
INSERT INTO `Array` VALUES('2333','283','历下区','3','0');
INSERT INTO `Array` VALUES('2334','283','天桥区','3','0');
INSERT INTO `Array` VALUES('2335','283','槐荫区','3','0');
INSERT INTO `Array` VALUES('2336','283','历城区','3','0');
INSERT INTO `Array` VALUES('2337','283','长清区','3','0');
INSERT INTO `Array` VALUES('2338','283','章丘市','3','0');
INSERT INTO `Array` VALUES('2339','283','平阴县','3','0');
INSERT INTO `Array` VALUES('2340','283','济阳县','3','0');
INSERT INTO `Array` VALUES('2341','283','商河县','3','0');
INSERT INTO `Array` VALUES('2342','284','市南区','3','0');
INSERT INTO `Array` VALUES('2343','284','市北区','3','0');
INSERT INTO `Array` VALUES('2344','284','城阳区','3','0');
INSERT INTO `Array` VALUES('2345','284','四方区','3','0');
INSERT INTO `Array` VALUES('2346','284','李沧区','3','0');
INSERT INTO `Array` VALUES('2347','284','黄岛区','3','0');
INSERT INTO `Array` VALUES('2348','284','崂山区','3','0');
INSERT INTO `Array` VALUES('2349','284','胶州市','3','0');
INSERT INTO `Array` VALUES('2350','284','即墨市','3','0');
INSERT INTO `Array` VALUES('2351','284','平度市','3','0');
INSERT INTO `Array` VALUES('2352','284','胶南市','3','0');
INSERT INTO `Array` VALUES('2353','284','莱西市','3','0');
INSERT INTO `Array` VALUES('2354','285','滨城区','3','0');
INSERT INTO `Array` VALUES('2355','285','惠民县','3','0');
INSERT INTO `Array` VALUES('2356','285','阳信县','3','0');
INSERT INTO `Array` VALUES('2357','285','无棣县','3','0');
INSERT INTO `Array` VALUES('2358','285','沾化县','3','0');
INSERT INTO `Array` VALUES('2359','285','博兴县','3','0');
INSERT INTO `Array` VALUES('2360','285','邹平县','3','0');
INSERT INTO `Array` VALUES('2361','286','德城区','3','0');
INSERT INTO `Array` VALUES('2362','286','陵县','3','0');
INSERT INTO `Array` VALUES('2363','286','乐陵市','3','0');
INSERT INTO `Array` VALUES('2364','286','禹城市','3','0');
INSERT INTO `Array` VALUES('2365','286','宁津县','3','0');
INSERT INTO `Array` VALUES('2366','286','庆云县','3','0');
INSERT INTO `Array` VALUES('2367','286','临邑县','3','0');
INSERT INTO `Array` VALUES('2368','286','齐河县','3','0');
INSERT INTO `Array` VALUES('2369','286','平原县','3','0');
INSERT INTO `Array` VALUES('2370','286','夏津县','3','0');
INSERT INTO `Array` VALUES('2371','286','武城县','3','0');
INSERT INTO `Array` VALUES('2372','287','东营区','3','0');
INSERT INTO `Array` VALUES('2373','287','河口区','3','0');
INSERT INTO `Array` VALUES('2374','287','垦利县','3','0');
INSERT INTO `Array` VALUES('2375','287','利津县','3','0');
INSERT INTO `Array` VALUES('2376','287','广饶县','3','0');
INSERT INTO `Array` VALUES('2377','288','牡丹区','3','0');
INSERT INTO `Array` VALUES('2378','288','曹县','3','0');
INSERT INTO `Array` VALUES('2379','288','单县','3','0');
INSERT INTO `Array` VALUES('2380','288','成武县','3','0');
INSERT INTO `Array` VALUES('2381','288','巨野县','3','0');
INSERT INTO `Array` VALUES('2382','288','郓城县','3','0');
INSERT INTO `Array` VALUES('2383','288','鄄城县','3','0');
INSERT INTO `Array` VALUES('2384','288','定陶县','3','0');
INSERT INTO `Array` VALUES('2385','288','东明县','3','0');
INSERT INTO `Array` VALUES('2386','289','市中区','3','0');
INSERT INTO `Array` VALUES('2387','289','任城区','3','0');
INSERT INTO `Array` VALUES('2388','289','曲阜市','3','0');
INSERT INTO `Array` VALUES('2389','289','兖州市','3','0');
INSERT INTO `Array` VALUES('2390','289','邹城市','3','0');
INSERT INTO `Array` VALUES('2391','289','微山县','3','0');
INSERT INTO `Array` VALUES('2392','289','鱼台县','3','0');
INSERT INTO `Array` VALUES('2393','289','金乡县','3','0');
INSERT INTO `Array` VALUES('2394','289','嘉祥县','3','0');
INSERT INTO `Array` VALUES('2395','289','汶上县','3','0');
INSERT INTO `Array` VALUES('2396','289','泗水县','3','0');
INSERT INTO `Array` VALUES('2397','289','梁山县','3','0');
INSERT INTO `Array` VALUES('2398','290','莱城区','3','0');
INSERT INTO `Array` VALUES('2399','290','钢城区','3','0');
INSERT INTO `Array` VALUES('2400','291','东昌府区','3','0');
INSERT INTO `Array` VALUES('2401','291','临清市','3','0');
INSERT INTO `Array` VALUES('2402','291','阳谷县','3','0');
INSERT INTO `Array` VALUES('2403','291','莘县','3','0');
INSERT INTO `Array` VALUES('2404','291','茌平县','3','0');
INSERT INTO `Array` VALUES('2405','291','东阿县','3','0');
INSERT INTO `Array` VALUES('2406','291','冠县','3','0');
INSERT INTO `Array` VALUES('2407','291','高唐县','3','0');
INSERT INTO `Array` VALUES('2408','292','兰山区','3','0');
INSERT INTO `Array` VALUES('2409','292','罗庄区','3','0');
INSERT INTO `Array` VALUES('2410','292','河东区','3','0');
INSERT INTO `Array` VALUES('2411','292','沂南县','3','0');
INSERT INTO `Array` VALUES('2412','292','郯城县','3','0');
INSERT INTO `Array` VALUES('2413','292','沂水县','3','0');
INSERT INTO `Array` VALUES('2414','292','苍山县','3','0');
INSERT INTO `Array` VALUES('2415','292','费县','3','0');
INSERT INTO `Array` VALUES('2416','292','平邑县','3','0');
INSERT INTO `Array` VALUES('2417','292','莒南县','3','0');
INSERT INTO `Array` VALUES('2418','292','蒙阴县','3','0');
INSERT INTO `Array` VALUES('2419','292','临沭县','3','0');
INSERT INTO `Array` VALUES('2420','293','东港区','3','0');
INSERT INTO `Array` VALUES('2421','293','岚山区','3','0');
INSERT INTO `Array` VALUES('2422','293','五莲县','3','0');
INSERT INTO `Array` VALUES('2423','293','莒县','3','0');
INSERT INTO `Array` VALUES('2424','294','泰山区','3','0');
INSERT INTO `Array` VALUES('2425','294','岱岳区','3','0');
INSERT INTO `Array` VALUES('2426','294','新泰市','3','0');
INSERT INTO `Array` VALUES('2427','294','肥城市','3','0');
INSERT INTO `Array` VALUES('2428','294','宁阳县','3','0');
INSERT INTO `Array` VALUES('2429','294','东平县','3','0');
INSERT INTO `Array` VALUES('2430','295','荣成市','3','0');
INSERT INTO `Array` VALUES('2431','295','乳山市','3','0');
INSERT INTO `Array` VALUES('2432','295','环翠区','3','0');
INSERT INTO `Array` VALUES('2433','295','文登市','3','0');
INSERT INTO `Array` VALUES('2434','296','潍城区','3','0');
INSERT INTO `Array` VALUES('2435','296','寒亭区','3','0');
INSERT INTO `Array` VALUES('2436','296','坊子区','3','0');
INSERT INTO `Array` VALUES('2437','296','奎文区','3','0');
INSERT INTO `Array` VALUES('2438','296','青州市','3','0');
INSERT INTO `Array` VALUES('2439','296','诸城市','3','0');
INSERT INTO `Array` VALUES('2440','296','寿光市','3','0');
INSERT INTO `Array` VALUES('2441','296','安丘市','3','0');
INSERT INTO `Array` VALUES('2442','296','高密市','3','0');
INSERT INTO `Array` VALUES('2443','296','昌邑市','3','0');
INSERT INTO `Array` VALUES('2444','296','临朐县','3','0');
INSERT INTO `Array` VALUES('2445','296','昌乐县','3','0');
INSERT INTO `Array` VALUES('2446','297','芝罘区','3','0');
INSERT INTO `Array` VALUES('2447','297','福山区','3','0');
INSERT INTO `Array` VALUES('2448','297','牟平区','3','0');
INSERT INTO `Array` VALUES('2449','297','莱山区','3','0');
INSERT INTO `Array` VALUES('2450','297','开发区','3','0');
INSERT INTO `Array` VALUES('2451','297','龙口市','3','0');
INSERT INTO `Array` VALUES('2452','297','莱阳市','3','0');
INSERT INTO `Array` VALUES('2453','297','莱州市','3','0');
INSERT INTO `Array` VALUES('2454','297','蓬莱市','3','0');
INSERT INTO `Array` VALUES('2455','297','招远市','3','0');
INSERT INTO `Array` VALUES('2456','297','栖霞市','3','0');
INSERT INTO `Array` VALUES('2457','297','海阳市','3','0');
INSERT INTO `Array` VALUES('2458','297','长岛县','3','0');
INSERT INTO `Array` VALUES('2459','298','市中区','3','0');
INSERT INTO `Array` VALUES('2460','298','山亭区','3','0');
INSERT INTO `Array` VALUES('2461','298','峄城区','3','0');
INSERT INTO `Array` VALUES('2462','298','台儿庄区','3','0');
INSERT INTO `Array` VALUES('2463','298','薛城区','3','0');
INSERT INTO `Array` VALUES('2464','298','滕州市','3','0');
INSERT INTO `Array` VALUES('2465','299','张店区','3','0');
INSERT INTO `Array` VALUES('2466','299','临淄区','3','0');
INSERT INTO `Array` VALUES('2467','299','淄川区','3','0');
INSERT INTO `Array` VALUES('2468','299','博山区','3','0');
INSERT INTO `Array` VALUES('2469','299','周村区','3','0');
INSERT INTO `Array` VALUES('2470','299','桓台县','3','0');
INSERT INTO `Array` VALUES('2471','299','高青县','3','0');
INSERT INTO `Array` VALUES('2472','299','沂源县','3','0');
INSERT INTO `Array` VALUES('2473','300','杏花岭区','3','0');
INSERT INTO `Array` VALUES('2474','300','小店区','3','0');
INSERT INTO `Array` VALUES('2475','300','迎泽区','3','0');
INSERT INTO `Array` VALUES('2476','300','尖草坪区','3','0');
INSERT INTO `Array` VALUES('2477','300','万柏林区','3','0');
INSERT INTO `Array` VALUES('2478','300','晋源区','3','0');
INSERT INTO `Array` VALUES('2479','300','高新开发区','3','0');
INSERT INTO `Array` VALUES('2480','300','民营经济开发区','3','0');
INSERT INTO `Array` VALUES('2481','300','经济技术开发区','3','0');
INSERT INTO `Array` VALUES('2482','300','清徐县','3','0');
INSERT INTO `Array` VALUES('2483','300','阳曲县','3','0');
INSERT INTO `Array` VALUES('2484','300','娄烦县','3','0');
INSERT INTO `Array` VALUES('2485','300','古交市','3','0');
INSERT INTO `Array` VALUES('2486','301','城区','3','0');
INSERT INTO `Array` VALUES('2487','301','郊区','3','0');
INSERT INTO `Array` VALUES('2488','301','沁县','3','0');
INSERT INTO `Array` VALUES('2489','301','潞城市','3','0');
INSERT INTO `Array` VALUES('2490','301','长治县','3','0');
INSERT INTO `Array` VALUES('2491','301','襄垣县','3','0');
INSERT INTO `Array` VALUES('2492','301','屯留县','3','0');
INSERT INTO `Array` VALUES('2493','301','平顺县','3','0');
INSERT INTO `Array` VALUES('2494','301','黎城县','3','0');
INSERT INTO `Array` VALUES('2495','301','壶关县','3','0');
INSERT INTO `Array` VALUES('2496','301','长子县','3','0');
INSERT INTO `Array` VALUES('2497','301','武乡县','3','0');
INSERT INTO `Array` VALUES('2498','301','沁源县','3','0');
INSERT INTO `Array` VALUES('2499','302','城区','3','0');
INSERT INTO `Array` VALUES('2500','302','矿区','3','0');
INSERT INTO `Array` VALUES('2501','302','南郊区','3','0');
INSERT INTO `Array` VALUES('2502','302','新荣区','3','0');
INSERT INTO `Array` VALUES('2503','302','阳高县','3','0');
INSERT INTO `Array` VALUES('2504','302','天镇县','3','0');
INSERT INTO `Array` VALUES('2505','302','广灵县','3','0');
INSERT INTO `Array` VALUES('2506','302','灵丘县','3','0');
INSERT INTO `Array` VALUES('2507','302','浑源县','3','0');
INSERT INTO `Array` VALUES('2508','302','左云县','3','0');
INSERT INTO `Array` VALUES('2509','302','大同县','3','0');
INSERT INTO `Array` VALUES('2510','303','城区','3','0');
INSERT INTO `Array` VALUES('2511','303','高平市','3','0');
INSERT INTO `Array` VALUES('2512','303','沁水县','3','0');
INSERT INTO `Array` VALUES('2513','303','阳城县','3','0');
INSERT INTO `Array` VALUES('2514','303','陵川县','3','0');
INSERT INTO `Array` VALUES('2515','303','泽州县','3','0');
INSERT INTO `Array` VALUES('2516','304','榆次区','3','0');
INSERT INTO `Array` VALUES('2517','304','介休市','3','0');
INSERT INTO `Array` VALUES('2518','304','榆社县','3','0');
INSERT INTO `Array` VALUES('2519','304','左权县','3','0');
INSERT INTO `Array` VALUES('2520','304','和顺县','3','0');
INSERT INTO `Array` VALUES('2521','304','昔阳县','3','0');
INSERT INTO `Array` VALUES('2522','304','寿阳县','3','0');
INSERT INTO `Array` VALUES('2523','304','太谷县','3','0');
INSERT INTO `Array` VALUES('2524','304','祁县','3','0');
INSERT INTO `Array` VALUES('2525','304','平遥县','3','0');
INSERT INTO `Array` VALUES('2526','304','灵石县','3','0');
INSERT INTO `Array` VALUES('2527','305','尧都区','3','0');
INSERT INTO `Array` VALUES('2528','305','侯马市','3','0');
INSERT INTO `Array` VALUES('2529','305','霍州市','3','0');
INSERT INTO `Array` VALUES('2530','305','曲沃县','3','0');
INSERT INTO `Array` VALUES('2531','305','翼城县','3','0');
INSERT INTO `Array` VALUES('2532','305','襄汾县','3','0');
INSERT INTO `Array` VALUES('2533','305','洪洞县','3','0');
INSERT INTO `Array` VALUES('2534','305','吉县','3','0');
INSERT INTO `Array` VALUES('2535','305','安泽县','3','0');
INSERT INTO `Array` VALUES('2536','305','浮山县','3','0');
INSERT INTO `Array` VALUES('2537','305','古县','3','0');
INSERT INTO `Array` VALUES('2538','305','乡宁县','3','0');
INSERT INTO `Array` VALUES('2539','305','大宁县','3','0');
INSERT INTO `Array` VALUES('2540','305','隰县','3','0');
INSERT INTO `Array` VALUES('2541','305','永和县','3','0');
INSERT INTO `Array` VALUES('2542','305','蒲县','3','0');
INSERT INTO `Array` VALUES('2543','305','汾西县','3','0');
INSERT INTO `Array` VALUES('2544','306','离石市','3','0');
INSERT INTO `Array` VALUES('2545','306','离石区','3','0');
INSERT INTO `Array` VALUES('2546','306','孝义市','3','0');
INSERT INTO `Array` VALUES('2547','306','汾阳市','3','0');
INSERT INTO `Array` VALUES('2548','306','文水县','3','0');
INSERT INTO `Array` VALUES('2549','306','交城县','3','0');
INSERT INTO `Array` VALUES('2550','306','兴县','3','0');
INSERT INTO `Array` VALUES('2551','306','临县','3','0');
INSERT INTO `Array` VALUES('2552','306','柳林县','3','0');
INSERT INTO `Array` VALUES('2553','306','石楼县','3','0');
INSERT INTO `Array` VALUES('2554','306','岚县','3','0');
INSERT INTO `Array` VALUES('2555','306','方山县','3','0');
INSERT INTO `Array` VALUES('2556','306','中阳县','3','0');
INSERT INTO `Array` VALUES('2557','306','交口县','3','0');
INSERT INTO `Array` VALUES('2558','307','朔城区','3','0');
INSERT INTO `Array` VALUES('2559','307','平鲁区','3','0');
INSERT INTO `Array` VALUES('2560','307','山阴县','3','0');
INSERT INTO `Array` VALUES('2561','307','应县','3','0');
INSERT INTO `Array` VALUES('2562','307','右玉县','3','0');
INSERT INTO `Array` VALUES('2563','307','怀仁县','3','0');
INSERT INTO `Array` VALUES('2564','308','忻府区','3','0');
INSERT INTO `Array` VALUES('2565','308','原平市','3','0');
INSERT INTO `Array` VALUES('2566','308','定襄县','3','0');
INSERT INTO `Array` VALUES('2567','308','五台县','3','0');
INSERT INTO `Array` VALUES('2568','308','代县','3','0');
INSERT INTO `Array` VALUES('2569','308','繁峙县','3','0');
INSERT INTO `Array` VALUES('2570','308','宁武县','3','0');
INSERT INTO `Array` VALUES('2571','308','静乐县','3','0');
INSERT INTO `Array` VALUES('2572','308','神池县','3','0');
INSERT INTO `Array` VALUES('2573','308','五寨县','3','0');
INSERT INTO `Array` VALUES('2574','308','岢岚县','3','0');
INSERT INTO `Array` VALUES('2575','308','河曲县','3','0');
INSERT INTO `Array` VALUES('2576','308','保德县','3','0');
INSERT INTO `Array` VALUES('2577','308','偏关县','3','0');
INSERT INTO `Array` VALUES('2578','309','城区','3','0');
INSERT INTO `Array` VALUES('2579','309','矿区','3','0');
INSERT INTO `Array` VALUES('2580','309','郊区','3','0');
INSERT INTO `Array` VALUES('2581','309','平定县','3','0');
INSERT INTO `Array` VALUES('2582','309','盂县','3','0');
INSERT INTO `Array` VALUES('2583','310','盐湖区','3','0');
INSERT INTO `Array` VALUES('2584','310','永济市','3','0');
INSERT INTO `Array` VALUES('2585','310','河津市','3','0');
INSERT INTO `Array` VALUES('2586','310','临猗县','3','0');
INSERT INTO `Array` VALUES('2587','310','万荣县','3','0');
INSERT INTO `Array` VALUES('2588','310','闻喜县','3','0');
INSERT INTO `Array` VALUES('2589','310','稷山县','3','0');
INSERT INTO `Array` VALUES('2590','310','新绛县','3','0');
INSERT INTO `Array` VALUES('2591','310','绛县','3','0');
INSERT INTO `Array` VALUES('2592','310','垣曲县','3','0');
INSERT INTO `Array` VALUES('2593','310','夏县','3','0');
INSERT INTO `Array` VALUES('2594','310','平陆县','3','0');
INSERT INTO `Array` VALUES('2595','310','芮城县','3','0');
INSERT INTO `Array` VALUES('2596','311','莲湖区','3','0');
INSERT INTO `Array` VALUES('2597','311','新城区','3','0');
INSERT INTO `Array` VALUES('2598','311','碑林区','3','0');
INSERT INTO `Array` VALUES('2599','311','雁塔区','3','0');
INSERT INTO `Array` VALUES('2600','311','灞桥区','3','0');
INSERT INTO `Array` VALUES('2601','311','未央区','3','0');
INSERT INTO `Array` VALUES('2602','311','阎良区','3','0');
INSERT INTO `Array` VALUES('2603','311','临潼区','3','0');
INSERT INTO `Array` VALUES('2604','311','长安区','3','0');
INSERT INTO `Array` VALUES('2605','311','蓝田县','3','0');
INSERT INTO `Array` VALUES('2606','311','周至县','3','0');
INSERT INTO `Array` VALUES('2607','311','户县','3','0');
INSERT INTO `Array` VALUES('2608','311','高陵县','3','0');
INSERT INTO `Array` VALUES('2609','312','汉滨区','3','0');
INSERT INTO `Array` VALUES('2610','312','汉阴县','3','0');
INSERT INTO `Array` VALUES('2611','312','石泉县','3','0');
INSERT INTO `Array` VALUES('2612','312','宁陕县','3','0');
INSERT INTO `Array` VALUES('2613','312','紫阳县','3','0');
INSERT INTO `Array` VALUES('2614','312','岚皋县','3','0');
INSERT INTO `Array` VALUES('2615','312','平利县','3','0');
INSERT INTO `Array` VALUES('2616','312','镇坪县','3','0');
INSERT INTO `Array` VALUES('2617','312','旬阳县','3','0');
INSERT INTO `Array` VALUES('2618','312','白河县','3','0');
INSERT INTO `Array` VALUES('2619','313','陈仓区','3','0');
INSERT INTO `Array` VALUES('2620','313','渭滨区','3','0');
INSERT INTO `Array` VALUES('2621','313','金台区','3','0');
INSERT INTO `Array` VALUES('2622','313','凤翔县','3','0');
INSERT INTO `Array` VALUES('2623','313','岐山县','3','0');
INSERT INTO `Array` VALUES('2624','313','扶风县','3','0');
INSERT INTO `Array` VALUES('2625','313','眉县','3','0');
INSERT INTO `Array` VALUES('2626','313','陇县','3','0');
INSERT INTO `Array` VALUES('2627','313','千阳县','3','0');
INSERT INTO `Array` VALUES('2628','313','麟游县','3','0');
INSERT INTO `Array` VALUES('2629','313','凤县','3','0');
INSERT INTO `Array` VALUES('2630','313','太白县','3','0');
INSERT INTO `Array` VALUES('2631','314','汉台区','3','0');
INSERT INTO `Array` VALUES('2632','314','南郑县','3','0');
INSERT INTO `Array` VALUES('2633','314','城固县','3','0');
INSERT INTO `Array` VALUES('2634','314','洋县','3','0');
INSERT INTO `Array` VALUES('2635','314','西乡县','3','0');
INSERT INTO `Array` VALUES('2636','314','勉县','3','0');
INSERT INTO `Array` VALUES('2637','314','宁强县','3','0');
INSERT INTO `Array` VALUES('2638','314','略阳县','3','0');
INSERT INTO `Array` VALUES('2639','314','镇巴县','3','0');
INSERT INTO `Array` VALUES('2640','314','留坝县','3','0');
INSERT INTO `Array` VALUES('2641','314','佛坪县','3','0');
INSERT INTO `Array` VALUES('2642','315','商州区','3','0');
INSERT INTO `Array` VALUES('2643','315','洛南县','3','0');
INSERT INTO `Array` VALUES('2644','315','丹凤县','3','0');
INSERT INTO `Array` VALUES('2645','315','商南县','3','0');
INSERT INTO `Array` VALUES('2646','315','山阳县','3','0');
INSERT INTO `Array` VALUES('2647','315','镇安县','3','0');
INSERT INTO `Array` VALUES('2648','315','柞水县','3','0');
INSERT INTO `Array` VALUES('2649','316','耀州区','3','0');
INSERT INTO `Array` VALUES('2650','316','王益区','3','0');
INSERT INTO `Array` VALUES('2651','316','印台区','3','0');
INSERT INTO `Array` VALUES('2652','316','宜君县','3','0');
INSERT INTO `Array` VALUES('2653','317','临渭区','3','0');
INSERT INTO `Array` VALUES('2654','317','韩城市','3','0');
INSERT INTO `Array` VALUES('2655','317','华阴市','3','0');
INSERT INTO `Array` VALUES('2656','317','华县','3','0');
INSERT INTO `Array` VALUES('2657','317','潼关县','3','0');
INSERT INTO `Array` VALUES('2658','317','大荔县','3','0');
INSERT INTO `Array` VALUES('2659','317','合阳县','3','0');
INSERT INTO `Array` VALUES('2660','317','澄城县','3','0');
INSERT INTO `Array` VALUES('2661','317','蒲城县','3','0');
INSERT INTO `Array` VALUES('2662','317','白水县','3','0');
INSERT INTO `Array` VALUES('2663','317','富平县','3','0');
INSERT INTO `Array` VALUES('2664','318','秦都区','3','0');
INSERT INTO `Array` VALUES('2665','318','渭城区','3','0');
INSERT INTO `Array` VALUES('2666','318','杨陵区','3','0');
INSERT INTO `Array` VALUES('2667','318','兴平市','3','0');
INSERT INTO `Array` VALUES('2668','318','三原县','3','0');
INSERT INTO `Array` VALUES('2669','318','泾阳县','3','0');
INSERT INTO `Array` VALUES('2670','318','乾县','3','0');
INSERT INTO `Array` VALUES('2671','318','礼泉县','3','0');
INSERT INTO `Array` VALUES('2672','318','永寿县','3','0');
INSERT INTO `Array` VALUES('2673','318','彬县','3','0');
INSERT INTO `Array` VALUES('2674','318','长武县','3','0');
INSERT INTO `Array` VALUES('2675','318','旬邑县','3','0');
INSERT INTO `Array` VALUES('2676','318','淳化县','3','0');
INSERT INTO `Array` VALUES('2677','318','武功县','3','0');
INSERT INTO `Array` VALUES('2678','319','吴起县','3','0');
INSERT INTO `Array` VALUES('2679','319','宝塔区','3','0');
INSERT INTO `Array` VALUES('2680','319','延长县','3','0');
INSERT INTO `Array` VALUES('2681','319','延川县','3','0');
INSERT INTO `Array` VALUES('2682','319','子长县','3','0');
INSERT INTO `Array` VALUES('2683','319','安塞县','3','0');
INSERT INTO `Array` VALUES('2684','319','志丹县','3','0');
INSERT INTO `Array` VALUES('2685','319','甘泉县','3','0');
INSERT INTO `Array` VALUES('2686','319','富县','3','0');
INSERT INTO `Array` VALUES('2687','319','洛川县','3','0');
INSERT INTO `Array` VALUES('2688','319','宜川县','3','0');
INSERT INTO `Array` VALUES('2689','319','黄龙县','3','0');
INSERT INTO `Array` VALUES('2690','319','黄陵县','3','0');
INSERT INTO `Array` VALUES('2691','320','榆阳区','3','0');
INSERT INTO `Array` VALUES('2692','320','神木县','3','0');
INSERT INTO `Array` VALUES('2693','320','府谷县','3','0');
INSERT INTO `Array` VALUES('2694','320','横山县','3','0');
INSERT INTO `Array` VALUES('2695','320','靖边县','3','0');
INSERT INTO `Array` VALUES('2696','320','定边县','3','0');
INSERT INTO `Array` VALUES('2697','320','绥德县','3','0');
INSERT INTO `Array` VALUES('2698','320','米脂县','3','0');
INSERT INTO `Array` VALUES('2699','320','佳县','3','0');
INSERT INTO `Array` VALUES('2700','320','吴堡县','3','0');
INSERT INTO `Array` VALUES('2701','320','清涧县','3','0');
INSERT INTO `Array` VALUES('2702','320','子洲县','3','0');
INSERT INTO `Array` VALUES('2703','321','长宁区','3','0');
INSERT INTO `Array` VALUES('2704','321','闸北区','3','0');
INSERT INTO `Array` VALUES('2705','321','闵行区','3','0');
INSERT INTO `Array` VALUES('2706','321','徐汇区','3','0');
INSERT INTO `Array` VALUES('2707','321','浦东新区','3','0');
INSERT INTO `Array` VALUES('2708','321','杨浦区','3','0');
INSERT INTO `Array` VALUES('2709','321','普陀区','3','0');
INSERT INTO `Array` VALUES('2710','321','静安区','3','0');
INSERT INTO `Array` VALUES('2711','321','卢湾区','3','0');
INSERT INTO `Array` VALUES('2712','321','虹口区','3','0');
INSERT INTO `Array` VALUES('2713','321','黄浦区','3','0');
INSERT INTO `Array` VALUES('2714','321','南汇区','3','0');
INSERT INTO `Array` VALUES('2715','321','松江区','3','0');
INSERT INTO `Array` VALUES('2716','321','嘉定区','3','0');
INSERT INTO `Array` VALUES('2717','321','宝山区','3','0');
INSERT INTO `Array` VALUES('2718','321','青浦区','3','0');
INSERT INTO `Array` VALUES('2719','321','金山区','3','0');
INSERT INTO `Array` VALUES('2720','321','奉贤区','3','0');
INSERT INTO `Array` VALUES('2721','321','崇明县','3','0');
INSERT INTO `Array` VALUES('2722','322','青羊区','3','0');
INSERT INTO `Array` VALUES('2723','322','锦江区','3','0');
INSERT INTO `Array` VALUES('2724','322','金牛区','3','0');
INSERT INTO `Array` VALUES('2725','322','武侯区','3','0');
INSERT INTO `Array` VALUES('2726','322','成华区','3','0');
INSERT INTO `Array` VALUES('2727','322','龙泉驿区','3','0');
INSERT INTO `Array` VALUES('2728','322','青白江区','3','0');
INSERT INTO `Array` VALUES('2729','322','新都区','3','0');
INSERT INTO `Array` VALUES('2730','322','温江区','3','0');
INSERT INTO `Array` VALUES('2731','322','高新区','3','0');
INSERT INTO `Array` VALUES('2732','322','高新西区','3','0');
INSERT INTO `Array` VALUES('2733','322','都江堰市','3','0');
INSERT INTO `Array` VALUES('2734','322','彭州市','3','0');
INSERT INTO `Array` VALUES('2735','322','邛崃市','3','0');
INSERT INTO `Array` VALUES('2736','322','崇州市','3','0');
INSERT INTO `Array` VALUES('2737','322','金堂县','3','0');
INSERT INTO `Array` VALUES('2738','322','双流县','3','0');
INSERT INTO `Array` VALUES('2739','322','郫县','3','0');
INSERT INTO `Array` VALUES('2740','322','大邑县','3','0');
INSERT INTO `Array` VALUES('2741','322','蒲江县','3','0');
INSERT INTO `Array` VALUES('2742','322','新津县','3','0');
INSERT INTO `Array` VALUES('2743','322','都江堰市','3','0');
INSERT INTO `Array` VALUES('2744','322','彭州市','3','0');
INSERT INTO `Array` VALUES('2745','322','邛崃市','3','0');
INSERT INTO `Array` VALUES('2746','322','崇州市','3','0');
INSERT INTO `Array` VALUES('2747','322','金堂县','3','0');
INSERT INTO `Array` VALUES('2748','322','双流县','3','0');
INSERT INTO `Array` VALUES('2749','322','郫县','3','0');
INSERT INTO `Array` VALUES('2750','322','大邑县','3','0');
INSERT INTO `Array` VALUES('2751','322','蒲江县','3','0');
INSERT INTO `Array` VALUES('2752','322','新津县','3','0');
INSERT INTO `Array` VALUES('2753','323','涪城区','3','0');
INSERT INTO `Array` VALUES('2754','323','游仙区','3','0');
INSERT INTO `Array` VALUES('2755','323','江油市','3','0');
INSERT INTO `Array` VALUES('2756','323','盐亭县','3','0');
INSERT INTO `Array` VALUES('2757','323','三台县','3','0');
INSERT INTO `Array` VALUES('2758','323','平武县','3','0');
INSERT INTO `Array` VALUES('2759','323','安县','3','0');
INSERT INTO `Array` VALUES('2760','323','梓潼县','3','0');
INSERT INTO `Array` VALUES('2761','323','北川县','3','0');
INSERT INTO `Array` VALUES('2762','324','马尔康县','3','0');
INSERT INTO `Array` VALUES('2763','324','汶川县','3','0');
INSERT INTO `Array` VALUES('2764','324','理县','3','0');
INSERT INTO `Array` VALUES('2765','324','茂县','3','0');
INSERT INTO `Array` VALUES('2766','324','松潘县','3','0');
INSERT INTO `Array` VALUES('2767','324','九寨沟县','3','0');
INSERT INTO `Array` VALUES('2768','324','金川县','3','0');
INSERT INTO `Array` VALUES('2769','324','小金县','3','0');
INSERT INTO `Array` VALUES('2770','324','黑水县','3','0');
INSERT INTO `Array` VALUES('2771','324','壤塘县','3','0');
INSERT INTO `Array` VALUES('2772','324','阿坝县','3','0');
INSERT INTO `Array` VALUES('2773','324','若尔盖县','3','0');
INSERT INTO `Array` VALUES('2774','324','红原县','3','0');
INSERT INTO `Array` VALUES('2775','325','巴州区','3','0');
INSERT INTO `Array` VALUES('2776','325','通江县','3','0');
INSERT INTO `Array` VALUES('2777','325','南江县','3','0');
INSERT INTO `Array` VALUES('2778','325','平昌县','3','0');
INSERT INTO `Array` VALUES('2779','326','通川区','3','0');
INSERT INTO `Array` VALUES('2780','326','万源市','3','0');
INSERT INTO `Array` VALUES('2781','326','达县','3','0');
INSERT INTO `Array` VALUES('2782','326','宣汉县','3','0');
INSERT INTO `Array` VALUES('2783','326','开江县','3','0');
INSERT INTO `Array` VALUES('2784','326','大竹县','3','0');
INSERT INTO `Array` VALUES('2785','326','渠县','3','0');
INSERT INTO `Array` VALUES('2786','327','旌阳区','3','0');
INSERT INTO `Array` VALUES('2787','327','广汉市','3','0');
INSERT INTO `Array` VALUES('2788','327','什邡市','3','0');
INSERT INTO `Array` VALUES('2789','327','绵竹市','3','0');
INSERT INTO `Array` VALUES('2790','327','罗江县','3','0');
INSERT INTO `Array` VALUES('2791','327','中江县','3','0');
INSERT INTO `Array` VALUES('2792','328','康定县','3','0');
INSERT INTO `Array` VALUES('2793','328','丹巴县','3','0');
INSERT INTO `Array` VALUES('2794','328','泸定县','3','0');
INSERT INTO `Array` VALUES('2795','328','炉霍县','3','0');
INSERT INTO `Array` VALUES('2796','328','九龙县','3','0');
INSERT INTO `Array` VALUES('2797','328','甘孜县','3','0');
INSERT INTO `Array` VALUES('2798','328','雅江县','3','0');
INSERT INTO `Array` VALUES('2799','328','新龙县','3','0');
INSERT INTO `Array` VALUES('2800','328','道孚县','3','0');
INSERT INTO `Array` VALUES('2801','328','白玉县','3','0');
INSERT INTO `Array` VALUES('2802','328','理塘县','3','0');
INSERT INTO `Array` VALUES('2803','328','德格县','3','0');
INSERT INTO `Array` VALUES('2804','328','乡城县','3','0');
INSERT INTO `Array` VALUES('2805','328','石渠县','3','0');
INSERT INTO `Array` VALUES('2806','328','稻城县','3','0');
INSERT INTO `Array` VALUES('2807','328','色达县','3','0');
INSERT INTO `Array` VALUES('2808','328','巴塘县','3','0');
INSERT INTO `Array` VALUES('2809','328','得荣县','3','0');
INSERT INTO `Array` VALUES('2810','329','广安区','3','0');
INSERT INTO `Array` VALUES('2811','329','华蓥市','3','0');
INSERT INTO `Array` VALUES('2812','329','岳池县','3','0');
INSERT INTO `Array` VALUES('2813','329','武胜县','3','0');
INSERT INTO `Array` VALUES('2814','329','邻水县','3','0');
INSERT INTO `Array` VALUES('2815','330','利州区','3','0');
INSERT INTO `Array` VALUES('2816','330','元坝区','3','0');
INSERT INTO `Array` VALUES('2817','330','朝天区','3','0');
INSERT INTO `Array` VALUES('2818','330','旺苍县','3','0');
INSERT INTO `Array` VALUES('2819','330','青川县','3','0');
INSERT INTO `Array` VALUES('2820','330','剑阁县','3','0');
INSERT INTO `Array` VALUES('2821','330','苍溪县','3','0');
INSERT INTO `Array` VALUES('2822','331','峨眉山市','3','0');
INSERT INTO `Array` VALUES('2823','331','乐山市','3','0');
INSERT INTO `Array` VALUES('2824','331','犍为县','3','0');
INSERT INTO `Array` VALUES('2825','331','井研县','3','0');
INSERT INTO `Array` VALUES('2826','331','夹江县','3','0');
INSERT INTO `Array` VALUES('2827','331','沐川县','3','0');
INSERT INTO `Array` VALUES('2828','331','峨边','3','0');
INSERT INTO `Array` VALUES('2829','331','马边','3','0');
INSERT INTO `Array` VALUES('2830','332','西昌市','3','0');
INSERT INTO `Array` VALUES('2831','332','盐源县','3','0');
INSERT INTO `Array` VALUES('2832','332','德昌县','3','0');
INSERT INTO `Array` VALUES('2833','332','会理县','3','0');
INSERT INTO `Array` VALUES('2834','332','会东县','3','0');
INSERT INTO `Array` VALUES('2835','332','宁南县','3','0');
INSERT INTO `Array` VALUES('2836','332','普格县','3','0');
INSERT INTO `Array` VALUES('2837','332','布拖县','3','0');
INSERT INTO `Array` VALUES('2838','332','金阳县','3','0');
INSERT INTO `Array` VALUES('2839','332','昭觉县','3','0');
INSERT INTO `Array` VALUES('2840','332','喜德县','3','0');
INSERT INTO `Array` VALUES('2841','332','冕宁县','3','0');
INSERT INTO `Array` VALUES('2842','332','越西县','3','0');
INSERT INTO `Array` VALUES('2843','332','甘洛县','3','0');
INSERT INTO `Array` VALUES('2844','332','美姑县','3','0');
INSERT INTO `Array` VALUES('2845','332','雷波县','3','0');
INSERT INTO `Array` VALUES('2846','332','木里','3','0');
INSERT INTO `Array` VALUES('2847','333','东坡区','3','0');
INSERT INTO `Array` VALUES('2848','333','仁寿县','3','0');
INSERT INTO `Array` VALUES('2849','333','彭山县','3','0');
INSERT INTO `Array` VALUES('2850','333','洪雅县','3','0');
INSERT INTO `Array` VALUES('2851','333','丹棱县','3','0');
INSERT INTO `Array` VALUES('2852','333','青神县','3','0');
INSERT INTO `Array` VALUES('2853','334','阆中市','3','0');
INSERT INTO `Array` VALUES('2854','334','南部县','3','0');
INSERT INTO `Array` VALUES('2855','334','营山县','3','0');
INSERT INTO `Array` VALUES('2856','334','蓬安县','3','0');
INSERT INTO `Array` VALUES('2857','334','仪陇县','3','0');
INSERT INTO `Array` VALUES('2858','334','顺庆区','3','0');
INSERT INTO `Array` VALUES('2859','334','高坪区','3','0');
INSERT INTO `Array` VALUES('2860','334','嘉陵区','3','0');
INSERT INTO `Array` VALUES('2861','334','西充县','3','0');
INSERT INTO `Array` VALUES('2862','335','市中区','3','0');
INSERT INTO `Array` VALUES('2863','335','东兴区','3','0');
INSERT INTO `Array` VALUES('2864','335','威远县','3','0');
INSERT INTO `Array` VALUES('2865','335','资中县','3','0');
INSERT INTO `Array` VALUES('2866','335','隆昌县','3','0');
INSERT INTO `Array` VALUES('2867','336','东  区','3','0');
INSERT INTO `Array` VALUES('2868','336','西  区','3','0');
INSERT INTO `Array` VALUES('2869','336','仁和区','3','0');
INSERT INTO `Array` VALUES('2870','336','米易县','3','0');
INSERT INTO `Array` VALUES('2871','336','盐边县','3','0');
INSERT INTO `Array` VALUES('2872','337','船山区','3','0');
INSERT INTO `Array` VALUES('2873','337','安居区','3','0');
INSERT INTO `Array` VALUES('2874','337','蓬溪县','3','0');
INSERT INTO `Array` VALUES('2875','337','射洪县','3','0');
INSERT INTO `Array` VALUES('2876','337','大英县','3','0');
INSERT INTO `Array` VALUES('2877','338','雨城区','3','0');
INSERT INTO `Array` VALUES('2878','338','名山县','3','0');
INSERT INTO `Array` VALUES('2879','338','荥经县','3','0');
INSERT INTO `Array` VALUES('2880','338','汉源县','3','0');
INSERT INTO `Array` VALUES('2881','338','石棉县','3','0');
INSERT INTO `Array` VALUES('2882','338','天全县','3','0');
INSERT INTO `Array` VALUES('2883','338','芦山县','3','0');
INSERT INTO `Array` VALUES('2884','338','宝兴县','3','0');
INSERT INTO `Array` VALUES('2885','339','翠屏区','3','0');
INSERT INTO `Array` VALUES('2886','339','宜宾县','3','0');
INSERT INTO `Array` VALUES('2887','339','南溪县','3','0');
INSERT INTO `Array` VALUES('2888','339','江安县','3','0');
INSERT INTO `Array` VALUES('2889','339','长宁县','3','0');
INSERT INTO `Array` VALUES('2890','339','高县','3','0');
INSERT INTO `Array` VALUES('2891','339','珙县','3','0');
INSERT INTO `Array` VALUES('2892','339','筠连县','3','0');
INSERT INTO `Array` VALUES('2893','339','兴文县','3','0');
INSERT INTO `Array` VALUES('2894','339','屏山县','3','0');
INSERT INTO `Array` VALUES('2895','340','雁江区','3','0');
INSERT INTO `Array` VALUES('2896','340','简阳市','3','0');
INSERT INTO `Array` VALUES('2897','340','安岳县','3','0');
INSERT INTO `Array` VALUES('2898','340','乐至县','3','0');
INSERT INTO `Array` VALUES('2899','341','大安区','3','0');
INSERT INTO `Array` VALUES('2900','341','自流井区','3','0');
INSERT INTO `Array` VALUES('2901','341','贡井区','3','0');
INSERT INTO `Array` VALUES('2902','341','沿滩区','3','0');
INSERT INTO `Array` VALUES('2903','341','荣县','3','0');
INSERT INTO `Array` VALUES('2904','341','富顺县','3','0');
INSERT INTO `Array` VALUES('2905','342','江阳区','3','0');
INSERT INTO `Array` VALUES('2906','342','纳溪区','3','0');
INSERT INTO `Array` VALUES('2907','342','龙马潭区','3','0');
INSERT INTO `Array` VALUES('2908','342','泸县','3','0');
INSERT INTO `Array` VALUES('2909','342','合江县','3','0');
INSERT INTO `Array` VALUES('2910','342','叙永县','3','0');
INSERT INTO `Array` VALUES('2911','342','古蔺县','3','0');
INSERT INTO `Array` VALUES('2912','343','和平区','3','0');
INSERT INTO `Array` VALUES('2913','343','河西区','3','0');
INSERT INTO `Array` VALUES('2914','343','南开区','3','0');
INSERT INTO `Array` VALUES('2915','343','河北区','3','0');
INSERT INTO `Array` VALUES('2916','343','河东区','3','0');
INSERT INTO `Array` VALUES('2917','343','红桥区','3','0');
INSERT INTO `Array` VALUES('2918','343','东丽区','3','0');
INSERT INTO `Array` VALUES('2919','343','津南区','3','0');
INSERT INTO `Array` VALUES('2920','343','西青区','3','0');
INSERT INTO `Array` VALUES('2921','343','北辰区','3','0');
INSERT INTO `Array` VALUES('2922','343','塘沽区','3','0');
INSERT INTO `Array` VALUES('2923','343','汉沽区','3','0');
INSERT INTO `Array` VALUES('2924','343','大港区','3','0');
INSERT INTO `Array` VALUES('2925','343','武清区','3','0');
INSERT INTO `Array` VALUES('2926','343','宝坻区','3','0');
INSERT INTO `Array` VALUES('2927','343','经济开发区','3','0');
INSERT INTO `Array` VALUES('2928','343','宁河县','3','0');
INSERT INTO `Array` VALUES('2929','343','静海县','3','0');
INSERT INTO `Array` VALUES('2930','343','蓟县','3','0');
INSERT INTO `Array` VALUES('2931','344','城关区','3','0');
INSERT INTO `Array` VALUES('2932','344','林周县','3','0');
INSERT INTO `Array` VALUES('2933','344','当雄县','3','0');
INSERT INTO `Array` VALUES('2934','344','尼木县','3','0');
INSERT INTO `Array` VALUES('2935','344','曲水县','3','0');
INSERT INTO `Array` VALUES('2936','344','堆龙德庆县','3','0');
INSERT INTO `Array` VALUES('2937','344','达孜县','3','0');
INSERT INTO `Array` VALUES('2938','344','墨竹工卡县','3','0');
INSERT INTO `Array` VALUES('2939','345','噶尔县','3','0');
INSERT INTO `Array` VALUES('2940','345','普兰县','3','0');
INSERT INTO `Array` VALUES('2941','345','札达县','3','0');
INSERT INTO `Array` VALUES('2942','345','日土县','3','0');
INSERT INTO `Array` VALUES('2943','345','革吉县','3','0');
INSERT INTO `Array` VALUES('2944','345','改则县','3','0');
INSERT INTO `Array` VALUES('2945','345','措勤县','3','0');
INSERT INTO `Array` VALUES('2946','346','昌都县','3','0');
INSERT INTO `Array` VALUES('2947','346','江达县','3','0');
INSERT INTO `Array` VALUES('2948','346','贡觉县','3','0');
INSERT INTO `Array` VALUES('2949','346','类乌齐县','3','0');
INSERT INTO `Array` VALUES('2950','346','丁青县','3','0');
INSERT INTO `Array` VALUES('2951','346','察雅县','3','0');
INSERT INTO `Array` VALUES('2952','346','八宿县','3','0');
INSERT INTO `Array` VALUES('2953','346','左贡县','3','0');
INSERT INTO `Array` VALUES('2954','346','芒康县','3','0');
INSERT INTO `Array` VALUES('2955','346','洛隆县','3','0');
INSERT INTO `Array` VALUES('2956','346','边坝县','3','0');
INSERT INTO `Array` VALUES('2957','347','林芝县','3','0');
INSERT INTO `Array` VALUES('2958','347','工布江达县','3','0');
INSERT INTO `Array` VALUES('2959','347','米林县','3','0');
INSERT INTO `Array` VALUES('2960','347','墨脱县','3','0');
INSERT INTO `Array` VALUES('2961','347','波密县','3','0');
INSERT INTO `Array` VALUES('2962','347','察隅县','3','0');
INSERT INTO `Array` VALUES('2963','347','朗县','3','0');
INSERT INTO `Array` VALUES('2964','348','那曲县','3','0');
INSERT INTO `Array` VALUES('2965','348','嘉黎县','3','0');
INSERT INTO `Array` VALUES('2966','348','比如县','3','0');
INSERT INTO `Array` VALUES('2967','348','聂荣县','3','0');
INSERT INTO `Array` VALUES('2968','348','安多县','3','0');
INSERT INTO `Array` VALUES('2969','348','申扎县','3','0');
INSERT INTO `Array` VALUES('2970','348','索县','3','0');
INSERT INTO `Array` VALUES('2971','348','班戈县','3','0');
INSERT INTO `Array` VALUES('2972','348','巴青县','3','0');
INSERT INTO `Array` VALUES('2973','348','尼玛县','3','0');
INSERT INTO `Array` VALUES('2974','349','日喀则市','3','0');
INSERT INTO `Array` VALUES('2975','349','南木林县','3','0');
INSERT INTO `Array` VALUES('2976','349','江孜县','3','0');
INSERT INTO `Array` VALUES('2977','349','定日县','3','0');
INSERT INTO `Array` VALUES('2978','349','萨迦县','3','0');
INSERT INTO `Array` VALUES('2979','349','拉孜县','3','0');
INSERT INTO `Array` VALUES('2980','349','昂仁县','3','0');
INSERT INTO `Array` VALUES('2981','349','谢通门县','3','0');
INSERT INTO `Array` VALUES('2982','349','白朗县','3','0');
INSERT INTO `Array` VALUES('2983','349','仁布县','3','0');
INSERT INTO `Array` VALUES('2984','349','康马县','3','0');
INSERT INTO `Array` VALUES('2985','349','定结县','3','0');
INSERT INTO `Array` VALUES('2986','349','仲巴县','3','0');
INSERT INTO `Array` VALUES('2987','349','亚东县','3','0');
INSERT INTO `Array` VALUES('2988','349','吉隆县','3','0');
INSERT INTO `Array` VALUES('2989','349','聂拉木县','3','0');
INSERT INTO `Array` VALUES('2990','349','萨嘎县','3','0');
INSERT INTO `Array` VALUES('2991','349','岗巴县','3','0');
INSERT INTO `Array` VALUES('2992','350','乃东县','3','0');
INSERT INTO `Array` VALUES('2993','350','扎囊县','3','0');
INSERT INTO `Array` VALUES('2994','350','贡嘎县','3','0');
INSERT INTO `Array` VALUES('2995','350','桑日县','3','0');
INSERT INTO `Array` VALUES('2996','350','琼结县','3','0');
INSERT INTO `Array` VALUES('2997','350','曲松县','3','0');
INSERT INTO `Array` VALUES('2998','350','措美县','3','0');
INSERT INTO `Array` VALUES('2999','350','洛扎县','3','0');
INSERT INTO `Array` VALUES('3000','350','加查县','3','0');
INSERT INTO `Array` VALUES('3001','350','隆子县','3','0');
INSERT INTO `Array` VALUES('3002','350','错那县','3','0');
INSERT INTO `Array` VALUES('3003','350','浪卡子县','3','0');
INSERT INTO `Array` VALUES('3004','351','天山区','3','0');
INSERT INTO `Array` VALUES('3005','351','沙依巴克区','3','0');
INSERT INTO `Array` VALUES('3006','351','新市区','3','0');
INSERT INTO `Array` VALUES('3007','351','水磨沟区','3','0');
INSERT INTO `Array` VALUES('3008','351','头屯河区','3','0');
INSERT INTO `Array` VALUES('3009','351','达坂城区','3','0');
INSERT INTO `Array` VALUES('3010','351','米东区','3','0');
INSERT INTO `Array` VALUES('3011','351','乌鲁木齐县','3','0');
INSERT INTO `Array` VALUES('3012','352','阿克苏市','3','0');
INSERT INTO `Array` VALUES('3013','352','温宿县','3','0');
INSERT INTO `Array` VALUES('3014','352','库车县','3','0');
INSERT INTO `Array` VALUES('3015','352','沙雅县','3','0');
INSERT INTO `Array` VALUES('3016','352','新和县','3','0');
INSERT INTO `Array` VALUES('3017','352','拜城县','3','0');
INSERT INTO `Array` VALUES('3018','352','乌什县','3','0');
INSERT INTO `Array` VALUES('3019','352','阿瓦提县','3','0');
INSERT INTO `Array` VALUES('3020','352','柯坪县','3','0');
INSERT INTO `Array` VALUES('3021','353','阿拉尔市','3','0');
INSERT INTO `Array` VALUES('3022','354','库尔勒市','3','0');
INSERT INTO `Array` VALUES('3023','354','轮台县','3','0');
INSERT INTO `Array` VALUES('3024','354','尉犁县','3','0');
INSERT INTO `Array` VALUES('3025','354','若羌县','3','0');
INSERT INTO `Array` VALUES('3026','354','且末县','3','0');
INSERT INTO `Array` VALUES('3027','354','焉耆','3','0');
INSERT INTO `Array` VALUES('3028','354','和静县','3','0');
INSERT INTO `Array` VALUES('3029','354','和硕县','3','0');
INSERT INTO `Array` VALUES('3030','354','博湖县','3','0');
INSERT INTO `Array` VALUES('3031','355','博乐市','3','0');
INSERT INTO `Array` VALUES('3032','355','精河县','3','0');
INSERT INTO `Array` VALUES('3033','355','温泉县','3','0');
INSERT INTO `Array` VALUES('3034','356','呼图壁县','3','0');
INSERT INTO `Array` VALUES('3035','356','米泉市','3','0');
INSERT INTO `Array` VALUES('3036','356','昌吉市','3','0');
INSERT INTO `Array` VALUES('3037','356','阜康市','3','0');
INSERT INTO `Array` VALUES('3038','356','玛纳斯县','3','0');
INSERT INTO `Array` VALUES('3039','356','奇台县','3','0');
INSERT INTO `Array` VALUES('3040','356','吉木萨尔县','3','0');
INSERT INTO `Array` VALUES('3041','356','木垒','3','0');
INSERT INTO `Array` VALUES('3042','357','哈密市','3','0');
INSERT INTO `Array` VALUES('3043','357','伊吾县','3','0');
INSERT INTO `Array` VALUES('3044','357','巴里坤','3','0');
INSERT INTO `Array` VALUES('3045','358','和田市','3','0');
INSERT INTO `Array` VALUES('3046','358','和田县','3','0');
INSERT INTO `Array` VALUES('3047','358','墨玉县','3','0');
INSERT INTO `Array` VALUES('3048','358','皮山县','3','0');
INSERT INTO `Array` VALUES('3049','358','洛浦县','3','0');
INSERT INTO `Array` VALUES('3050','358','策勒县','3','0');
INSERT INTO `Array` VALUES('3051','358','于田县','3','0');
INSERT INTO `Array` VALUES('3052','358','民丰县','3','0');
INSERT INTO `Array` VALUES('3053','359','喀什市','3','0');
INSERT INTO `Array` VALUES('3054','359','疏附县','3','0');
INSERT INTO `Array` VALUES('3055','359','疏勒县','3','0');
INSERT INTO `Array` VALUES('3056','359','英吉沙县','3','0');
INSERT INTO `Array` VALUES('3057','359','泽普县','3','0');
INSERT INTO `Array` VALUES('3058','359','莎车县','3','0');
INSERT INTO `Array` VALUES('3059','359','叶城县','3','0');
INSERT INTO `Array` VALUES('3060','359','麦盖提县','3','0');
INSERT INTO `Array` VALUES('3061','359','岳普湖县','3','0');
INSERT INTO `Array` VALUES('3062','359','伽师县','3','0');
INSERT INTO `Array` VALUES('3063','359','巴楚县','3','0');
INSERT INTO `Array` VALUES('3064','359','塔什库尔干','3','0');
INSERT INTO `Array` VALUES('3065','360','克拉玛依市','3','0');
INSERT INTO `Array` VALUES('3066','361','阿图什市','3','0');
INSERT INTO `Array` VALUES('3067','361','阿克陶县','3','0');
INSERT INTO `Array` VALUES('3068','361','阿合奇县','3','0');
INSERT INTO `Array` VALUES('3069','361','乌恰县','3','0');
INSERT INTO `Array` VALUES('3070','362','石河子市','3','0');
INSERT INTO `Array` VALUES('3071','363','图木舒克市','3','0');
INSERT INTO `Array` VALUES('3072','364','吐鲁番市','3','0');
INSERT INTO `Array` VALUES('3073','364','鄯善县','3','0');
INSERT INTO `Array` VALUES('3074','364','托克逊县','3','0');
INSERT INTO `Array` VALUES('3075','365','五家渠市','3','0');
INSERT INTO `Array` VALUES('3076','366','阿勒泰市','3','0');
INSERT INTO `Array` VALUES('3077','366','布克赛尔','3','0');
INSERT INTO `Array` VALUES('3078','366','伊宁市','3','0');
INSERT INTO `Array` VALUES('3079','366','布尔津县','3','0');
INSERT INTO `Array` VALUES('3080','366','奎屯市','3','0');
INSERT INTO `Array` VALUES('3081','366','乌苏市','3','0');
INSERT INTO `Array` VALUES('3082','366','额敏县','3','0');
INSERT INTO `Array` VALUES('3083','366','富蕴县','3','0');
INSERT INTO `Array` VALUES('3084','366','伊宁县','3','0');
INSERT INTO `Array` VALUES('3085','366','福海县','3','0');
INSERT INTO `Array` VALUES('3086','366','霍城县','3','0');
INSERT INTO `Array` VALUES('3087','366','沙湾县','3','0');
INSERT INTO `Array` VALUES('3088','366','巩留县','3','0');
INSERT INTO `Array` VALUES('3089','366','哈巴河县','3','0');
INSERT INTO `Array` VALUES('3090','366','托里县','3','0');
INSERT INTO `Array` VALUES('3091','366','青河县','3','0');
INSERT INTO `Array` VALUES('3092','366','新源县','3','0');
INSERT INTO `Array` VALUES('3093','366','裕民县','3','0');
INSERT INTO `Array` VALUES('3094','366','和布克赛尔','3','0');
INSERT INTO `Array` VALUES('3095','366','吉木乃县','3','0');
INSERT INTO `Array` VALUES('3096','366','昭苏县','3','0');
INSERT INTO `Array` VALUES('3097','366','特克斯县','3','0');
INSERT INTO `Array` VALUES('3098','366','尼勒克县','3','0');
INSERT INTO `Array` VALUES('3099','366','察布查尔','3','0');
INSERT INTO `Array` VALUES('3100','367','盘龙区','3','0');
INSERT INTO `Array` VALUES('3101','367','五华区','3','0');
INSERT INTO `Array` VALUES('3102','367','官渡区','3','0');
INSERT INTO `Array` VALUES('3103','367','西山区','3','0');
INSERT INTO `Array` VALUES('3104','367','东川区','3','0');
INSERT INTO `Array` VALUES('3105','367','安宁市','3','0');
INSERT INTO `Array` VALUES('3106','367','呈贡县','3','0');
INSERT INTO `Array` VALUES('3107','367','晋宁县','3','0');
INSERT INTO `Array` VALUES('3108','367','富民县','3','0');
INSERT INTO `Array` VALUES('3109','367','宜良县','3','0');
INSERT INTO `Array` VALUES('3110','367','嵩明县','3','0');
INSERT INTO `Array` VALUES('3111','367','石林县','3','0');
INSERT INTO `Array` VALUES('3112','367','禄劝','3','0');
INSERT INTO `Array` VALUES('3113','367','寻甸','3','0');
INSERT INTO `Array` VALUES('3114','368','兰坪','3','0');
INSERT INTO `Array` VALUES('3115','368','泸水县','3','0');
INSERT INTO `Array` VALUES('3116','368','福贡县','3','0');
INSERT INTO `Array` VALUES('3117','368','贡山','3','0');
INSERT INTO `Array` VALUES('3118','369','宁洱','3','0');
INSERT INTO `Array` VALUES('3119','369','思茅区','3','0');
INSERT INTO `Array` VALUES('3120','369','墨江','3','0');
INSERT INTO `Array` VALUES('3121','369','景东','3','0');
INSERT INTO `Array` VALUES('3122','369','景谷','3','0');
INSERT INTO `Array` VALUES('3123','369','镇沅','3','0');
INSERT INTO `Array` VALUES('3124','369','江城','3','0');
INSERT INTO `Array` VALUES('3125','369','孟连','3','0');
INSERT INTO `Array` VALUES('3126','369','澜沧','3','0');
INSERT INTO `Array` VALUES('3127','369','西盟','3','0');
INSERT INTO `Array` VALUES('3128','370','古城区','3','0');
INSERT INTO `Array` VALUES('3129','370','宁蒗','3','0');
INSERT INTO `Array` VALUES('3130','370','玉龙','3','0');
INSERT INTO `Array` VALUES('3131','370','永胜县','3','0');
INSERT INTO `Array` VALUES('3132','370','华坪县','3','0');
INSERT INTO `Array` VALUES('3133','371','隆阳区','3','0');
INSERT INTO `Array` VALUES('3134','371','施甸县','3','0');
INSERT INTO `Array` VALUES('3135','371','腾冲县','3','0');
INSERT INTO `Array` VALUES('3136','371','龙陵县','3','0');
INSERT INTO `Array` VALUES('3137','371','昌宁县','3','0');
INSERT INTO `Array` VALUES('3138','372','楚雄市','3','0');
INSERT INTO `Array` VALUES('3139','372','双柏县','3','0');
INSERT INTO `Array` VALUES('3140','372','牟定县','3','0');
INSERT INTO `Array` VALUES('3141','372','南华县','3','0');
INSERT INTO `Array` VALUES('3142','372','姚安县','3','0');
INSERT INTO `Array` VALUES('3143','372','大姚县','3','0');
INSERT INTO `Array` VALUES('3144','372','永仁县','3','0');
INSERT INTO `Array` VALUES('3145','372','元谋县','3','0');
INSERT INTO `Array` VALUES('3146','372','武定县','3','0');
INSERT INTO `Array` VALUES('3147','372','禄丰县','3','0');
INSERT INTO `Array` VALUES('3148','373','大理市','3','0');
INSERT INTO `Array` VALUES('3149','373','祥云县','3','0');
INSERT INTO `Array` VALUES('3150','373','宾川县','3','0');
INSERT INTO `Array` VALUES('3151','373','弥渡县','3','0');
INSERT INTO `Array` VALUES('3152','373','永平县','3','0');
INSERT INTO `Array` VALUES('3153','373','云龙县','3','0');
INSERT INTO `Array` VALUES('3154','373','洱源县','3','0');
INSERT INTO `Array` VALUES('3155','373','剑川县','3','0');
INSERT INTO `Array` VALUES('3156','373','鹤庆县','3','0');
INSERT INTO `Array` VALUES('3157','373','漾濞','3','0');
INSERT INTO `Array` VALUES('3158','373','南涧','3','0');
INSERT INTO `Array` VALUES('3159','373','巍山','3','0');
INSERT INTO `Array` VALUES('3160','374','潞西市','3','0');
INSERT INTO `Array` VALUES('3161','374','瑞丽市','3','0');
INSERT INTO `Array` VALUES('3162','374','梁河县','3','0');
INSERT INTO `Array` VALUES('3163','374','盈江县','3','0');
INSERT INTO `Array` VALUES('3164','374','陇川县','3','0');
INSERT INTO `Array` VALUES('3165','375','香格里拉县','3','0');
INSERT INTO `Array` VALUES('3166','375','德钦县','3','0');
INSERT INTO `Array` VALUES('3167','375','维西','3','0');
INSERT INTO `Array` VALUES('3168','376','泸西县','3','0');
INSERT INTO `Array` VALUES('3169','376','蒙自县','3','0');
INSERT INTO `Array` VALUES('3170','376','个旧市','3','0');
INSERT INTO `Array` VALUES('3171','376','开远市','3','0');
INSERT INTO `Array` VALUES('3172','376','绿春县','3','0');
INSERT INTO `Array` VALUES('3173','376','建水县','3','0');
INSERT INTO `Array` VALUES('3174','376','石屏县','3','0');
INSERT INTO `Array` VALUES('3175','376','弥勒县','3','0');
INSERT INTO `Array` VALUES('3176','376','元阳县','3','0');
INSERT INTO `Array` VALUES('3177','376','红河县','3','0');
INSERT INTO `Array` VALUES('3178','376','金平','3','0');
INSERT INTO `Array` VALUES('3179','376','河口','3','0');
INSERT INTO `Array` VALUES('3180','376','屏边','3','0');
INSERT INTO `Array` VALUES('3181','377','临翔区','3','0');
INSERT INTO `Array` VALUES('3182','377','凤庆县','3','0');
INSERT INTO `Array` VALUES('3183','377','云县','3','0');
INSERT INTO `Array` VALUES('3184','377','永德县','3','0');
INSERT INTO `Array` VALUES('3185','377','镇康县','3','0');
INSERT INTO `Array` VALUES('3186','377','双江','3','0');
INSERT INTO `Array` VALUES('3187','377','耿马','3','0');
INSERT INTO `Array` VALUES('3188','377','沧源','3','0');
INSERT INTO `Array` VALUES('3189','378','麒麟区','3','0');
INSERT INTO `Array` VALUES('3190','378','宣威市','3','0');
INSERT INTO `Array` VALUES('3191','378','马龙县','3','0');
INSERT INTO `Array` VALUES('3192','378','陆良县','3','0');
INSERT INTO `Array` VALUES('3193','378','师宗县','3','0');
INSERT INTO `Array` VALUES('3194','378','罗平县','3','0');
INSERT INTO `Array` VALUES('3195','378','富源县','3','0');
INSERT INTO `Array` VALUES('3196','378','会泽县','3','0');
INSERT INTO `Array` VALUES('3197','378','沾益县','3','0');
INSERT INTO `Array` VALUES('3198','379','文山县','3','0');
INSERT INTO `Array` VALUES('3199','379','砚山县','3','0');
INSERT INTO `Array` VALUES('3200','379','西畴县','3','0');
INSERT INTO `Array` VALUES('3201','379','麻栗坡县','3','0');
INSERT INTO `Array` VALUES('3202','379','马关县','3','0');
INSERT INTO `Array` VALUES('3203','379','丘北县','3','0');
INSERT INTO `Array` VALUES('3204','379','广南县','3','0');
INSERT INTO `Array` VALUES('3205','379','富宁县','3','0');
INSERT INTO `Array` VALUES('3206','380','景洪市','3','0');
INSERT INTO `Array` VALUES('3207','380','勐海县','3','0');
INSERT INTO `Array` VALUES('3208','380','勐腊县','3','0');
INSERT INTO `Array` VALUES('3209','381','红塔区','3','0');
INSERT INTO `Array` VALUES('3210','381','江川县','3','0');
INSERT INTO `Array` VALUES('3211','381','澄江县','3','0');
INSERT INTO `Array` VALUES('3212','381','通海县','3','0');
INSERT INTO `Array` VALUES('3213','381','华宁县','3','0');
INSERT INTO `Array` VALUES('3214','381','易门县','3','0');
INSERT INTO `Array` VALUES('3215','381','峨山','3','0');
INSERT INTO `Array` VALUES('3216','381','新平','3','0');
INSERT INTO `Array` VALUES('3217','381','元江','3','0');
INSERT INTO `Array` VALUES('3218','382','昭阳区','3','0');
INSERT INTO `Array` VALUES('3219','382','鲁甸县','3','0');
INSERT INTO `Array` VALUES('3220','382','巧家县','3','0');
INSERT INTO `Array` VALUES('3221','382','盐津县','3','0');
INSERT INTO `Array` VALUES('3222','382','大关县','3','0');
INSERT INTO `Array` VALUES('3223','382','永善县','3','0');
INSERT INTO `Array` VALUES('3224','382','绥江县','3','0');
INSERT INTO `Array` VALUES('3225','382','镇雄县','3','0');
INSERT INTO `Array` VALUES('3226','382','彝良县','3','0');
INSERT INTO `Array` VALUES('3227','382','威信县','3','0');
INSERT INTO `Array` VALUES('3228','382','水富县','3','0');
INSERT INTO `Array` VALUES('3229','383','西湖区','3','0');
INSERT INTO `Array` VALUES('3230','383','上城区','3','0');
INSERT INTO `Array` VALUES('3231','383','下城区','3','0');
INSERT INTO `Array` VALUES('3232','383','拱墅区','3','0');
INSERT INTO `Array` VALUES('3233','383','滨江区','3','0');
INSERT INTO `Array` VALUES('3234','383','江干区','3','0');
INSERT INTO `Array` VALUES('3235','383','萧山区','3','0');
INSERT INTO `Array` VALUES('3236','383','余杭区','3','0');
INSERT INTO `Array` VALUES('3237','383','市郊','3','0');
INSERT INTO `Array` VALUES('3238','383','建德市','3','0');
INSERT INTO `Array` VALUES('3239','383','富阳市','3','0');
INSERT INTO `Array` VALUES('3240','383','临安市','3','0');
INSERT INTO `Array` VALUES('3241','383','桐庐县','3','0');
INSERT INTO `Array` VALUES('3242','383','淳安县','3','0');
INSERT INTO `Array` VALUES('3243','384','吴兴区','3','0');
INSERT INTO `Array` VALUES('3244','384','南浔区','3','0');
INSERT INTO `Array` VALUES('3245','384','德清县','3','0');
INSERT INTO `Array` VALUES('3246','384','长兴县','3','0');
INSERT INTO `Array` VALUES('3247','384','安吉县','3','0');
INSERT INTO `Array` VALUES('3248','385','南湖区','3','0');
INSERT INTO `Array` VALUES('3249','385','秀洲区','3','0');
INSERT INTO `Array` VALUES('3250','385','海宁市','3','0');
INSERT INTO `Array` VALUES('3251','385','嘉善县','3','0');
INSERT INTO `Array` VALUES('3252','385','平湖市','3','0');
INSERT INTO `Array` VALUES('3253','385','桐乡市','3','0');
INSERT INTO `Array` VALUES('3254','385','海盐县','3','0');
INSERT INTO `Array` VALUES('3255','386','婺城区','3','0');
INSERT INTO `Array` VALUES('3256','386','金东区','3','0');
INSERT INTO `Array` VALUES('3257','386','兰溪市','3','0');
INSERT INTO `Array` VALUES('3258','386','市区','3','0');
INSERT INTO `Array` VALUES('3259','386','佛堂镇','3','0');
INSERT INTO `Array` VALUES('3260','386','上溪镇','3','0');
INSERT INTO `Array` VALUES('3261','386','义亭镇','3','0');
INSERT INTO `Array` VALUES('3262','386','大陈镇','3','0');
INSERT INTO `Array` VALUES('3263','386','苏溪镇','3','0');
INSERT INTO `Array` VALUES('3264','386','赤岸镇','3','0');
INSERT INTO `Array` VALUES('3265','386','东阳市','3','0');
INSERT INTO `Array` VALUES('3266','386','永康市','3','0');
INSERT INTO `Array` VALUES('3267','386','武义县','3','0');
INSERT INTO `Array` VALUES('3268','386','浦江县','3','0');
INSERT INTO `Array` VALUES('3269','386','磐安县','3','0');
INSERT INTO `Array` VALUES('3270','387','莲都区','3','0');
INSERT INTO `Array` VALUES('3271','387','龙泉市','3','0');
INSERT INTO `Array` VALUES('3272','387','青田县','3','0');
INSERT INTO `Array` VALUES('3273','387','缙云县','3','0');
INSERT INTO `Array` VALUES('3274','387','遂昌县','3','0');
INSERT INTO `Array` VALUES('3275','387','松阳县','3','0');
INSERT INTO `Array` VALUES('3276','387','云和县','3','0');
INSERT INTO `Array` VALUES('3277','387','庆元县','3','0');
INSERT INTO `Array` VALUES('3278','387','景宁','3','0');
INSERT INTO `Array` VALUES('3279','388','海曙区','3','0');
INSERT INTO `Array` VALUES('3280','388','江东区','3','0');
INSERT INTO `Array` VALUES('3281','388','江北区','3','0');
INSERT INTO `Array` VALUES('3282','388','镇海区','3','0');
INSERT INTO `Array` VALUES('3283','388','北仑区','3','0');
INSERT INTO `Array` VALUES('3284','388','鄞州区','3','0');
INSERT INTO `Array` VALUES('3285','388','余姚市','3','0');
INSERT INTO `Array` VALUES('3286','388','慈溪市','3','0');
INSERT INTO `Array` VALUES('3287','388','奉化市','3','0');
INSERT INTO `Array` VALUES('3288','388','象山县','3','0');
INSERT INTO `Array` VALUES('3289','388','宁海县','3','0');
INSERT INTO `Array` VALUES('3290','389','越城区','3','0');
INSERT INTO `Array` VALUES('3291','389','上虞市','3','0');
INSERT INTO `Array` VALUES('3292','389','嵊州市','3','0');
INSERT INTO `Array` VALUES('3293','389','绍兴县','3','0');
INSERT INTO `Array` VALUES('3294','389','新昌县','3','0');
INSERT INTO `Array` VALUES('3295','389','诸暨市','3','0');
INSERT INTO `Array` VALUES('3296','390','椒江区','3','0');
INSERT INTO `Array` VALUES('3297','390','黄岩区','3','0');
INSERT INTO `Array` VALUES('3298','390','路桥区','3','0');
INSERT INTO `Array` VALUES('3299','390','温岭市','3','0');
INSERT INTO `Array` VALUES('3300','390','临海市','3','0');
INSERT INTO `Array` VALUES('3301','390','玉环县','3','0');
INSERT INTO `Array` VALUES('3302','390','三门县','3','0');
INSERT INTO `Array` VALUES('3303','390','天台县','3','0');
INSERT INTO `Array` VALUES('3304','390','仙居县','3','0');
INSERT INTO `Array` VALUES('3305','391','鹿城区','3','0');
INSERT INTO `Array` VALUES('3306','391','龙湾区','3','0');
INSERT INTO `Array` VALUES('3307','391','瓯海区','3','0');
INSERT INTO `Array` VALUES('3308','391','瑞安市','3','0');
INSERT INTO `Array` VALUES('3309','391','乐清市','3','0');
INSERT INTO `Array` VALUES('3310','391','洞头县','3','0');
INSERT INTO `Array` VALUES('3311','391','永嘉县','3','0');
INSERT INTO `Array` VALUES('3312','391','平阳县','3','0');
INSERT INTO `Array` VALUES('3313','391','苍南县','3','0');
INSERT INTO `Array` VALUES('3314','391','文成县','3','0');
INSERT INTO `Array` VALUES('3315','391','泰顺县','3','0');
INSERT INTO `Array` VALUES('3316','392','定海区','3','0');
INSERT INTO `Array` VALUES('3317','392','普陀区','3','0');
INSERT INTO `Array` VALUES('3318','392','岱山县','3','0');
INSERT INTO `Array` VALUES('3319','392','嵊泗县','3','0');
INSERT INTO `Array` VALUES('3320','393','衢州市','3','0');
INSERT INTO `Array` VALUES('3321','393','江山市','3','0');
INSERT INTO `Array` VALUES('3322','393','常山县','3','0');
INSERT INTO `Array` VALUES('3323','393','开化县','3','0');
INSERT INTO `Array` VALUES('3324','393','龙游县','3','0');
INSERT INTO `Array` VALUES('3325','394','合川区','3','0');
INSERT INTO `Array` VALUES('3326','394','江津区','3','0');
INSERT INTO `Array` VALUES('3327','394','南川区','3','0');
INSERT INTO `Array` VALUES('3328','394','永川区','3','0');
INSERT INTO `Array` VALUES('3329','394','南岸区','3','0');
INSERT INTO `Array` VALUES('3330','394','渝北区','3','0');
INSERT INTO `Array` VALUES('3331','394','万盛区','3','0');
INSERT INTO `Array` VALUES('3332','394','大渡口区','3','0');
INSERT INTO `Array` VALUES('3333','394','万州区','3','0');
INSERT INTO `Array` VALUES('3334','394','北碚区','3','0');
INSERT INTO `Array` VALUES('3335','394','沙坪坝区','3','0');
INSERT INTO `Array` VALUES('3336','394','巴南区','3','0');
INSERT INTO `Array` VALUES('3337','394','涪陵区','3','0');
INSERT INTO `Array` VALUES('3338','394','江北区','3','0');
INSERT INTO `Array` VALUES('3339','394','九龙坡区','3','0');
INSERT INTO `Array` VALUES('3340','394','渝中区','3','0');
INSERT INTO `Array` VALUES('3341','394','黔江开发区','3','0');
INSERT INTO `Array` VALUES('3342','394','长寿区','3','0');
INSERT INTO `Array` VALUES('3343','394','双桥区','3','0');
INSERT INTO `Array` VALUES('3344','394','綦江县','3','0');
INSERT INTO `Array` VALUES('3345','394','潼南县','3','0');
INSERT INTO `Array` VALUES('3346','394','铜梁县','3','0');
INSERT INTO `Array` VALUES('3347','394','大足县','3','0');
INSERT INTO `Array` VALUES('3348','394','荣昌县','3','0');
INSERT INTO `Array` VALUES('3349','394','璧山县','3','0');
INSERT INTO `Array` VALUES('3350','394','垫江县','3','0');
INSERT INTO `Array` VALUES('3351','394','武隆县','3','0');
INSERT INTO `Array` VALUES('3352','394','丰都县','3','0');
INSERT INTO `Array` VALUES('3353','394','城口县','3','0');
INSERT INTO `Array` VALUES('3354','394','梁平县','3','0');
INSERT INTO `Array` VALUES('3355','394','开县','3','0');
INSERT INTO `Array` VALUES('3356','394','巫溪县','3','0');
INSERT INTO `Array` VALUES('3357','394','巫山县','3','0');
INSERT INTO `Array` VALUES('3358','394','奉节县','3','0');
INSERT INTO `Array` VALUES('3359','394','云阳县','3','0');
INSERT INTO `Array` VALUES('3360','394','忠县','3','0');
INSERT INTO `Array` VALUES('3361','394','石柱','3','0');
INSERT INTO `Array` VALUES('3362','394','彭水','3','0');
INSERT INTO `Array` VALUES('3363','394','酉阳','3','0');
INSERT INTO `Array` VALUES('3364','394','秀山','3','0');
INSERT INTO `Array` VALUES('3365','395','沙田区','3','0');
INSERT INTO `Array` VALUES('3366','395','东区','3','0');
INSERT INTO `Array` VALUES('3367','395','观塘区','3','0');
INSERT INTO `Array` VALUES('3368','395','黄大仙区','3','0');
INSERT INTO `Array` VALUES('3369','395','九龙城区','3','0');
INSERT INTO `Array` VALUES('3370','395','屯门区','3','0');
INSERT INTO `Array` VALUES('3371','395','葵青区','3','0');
INSERT INTO `Array` VALUES('3372','395','元朗区','3','0');
INSERT INTO `Array` VALUES('3373','395','深水埗区','3','0');
INSERT INTO `Array` VALUES('3374','395','西贡区','3','0');
INSERT INTO `Array` VALUES('3375','395','大埔区','3','0');
INSERT INTO `Array` VALUES('3376','395','湾仔区','3','0');
INSERT INTO `Array` VALUES('3377','395','油尖旺区','3','0');
INSERT INTO `Array` VALUES('3378','395','北区','3','0');
INSERT INTO `Array` VALUES('3379','395','南区','3','0');
INSERT INTO `Array` VALUES('3380','395','荃湾区','3','0');
INSERT INTO `Array` VALUES('3381','395','中西区','3','0');
INSERT INTO `Array` VALUES('3382','395','离岛区','3','0');
INSERT INTO `Array` VALUES('3383','396','澳门','3','0');
INSERT INTO `Array` VALUES('3384','397','台北','3','0');
INSERT INTO `Array` VALUES('3385','397','高雄','3','0');
INSERT INTO `Array` VALUES('3386','397','基隆','3','0');
INSERT INTO `Array` VALUES('3387','397','台中','3','0');
INSERT INTO `Array` VALUES('3388','397','台南','3','0');
INSERT INTO `Array` VALUES('3389','397','新竹','3','0');
INSERT INTO `Array` VALUES('3390','397','嘉义','3','0');
INSERT INTO `Array` VALUES('3391','397','宜兰县','3','0');
INSERT INTO `Array` VALUES('3392','397','桃园县','3','0');
INSERT INTO `Array` VALUES('3393','397','苗栗县','3','0');
INSERT INTO `Array` VALUES('3394','397','彰化县','3','0');
INSERT INTO `Array` VALUES('3395','397','南投县','3','0');
INSERT INTO `Array` VALUES('3396','397','云林县','3','0');
INSERT INTO `Array` VALUES('3397','397','屏东县','3','0');
INSERT INTO `Array` VALUES('3398','397','台东县','3','0');
INSERT INTO `Array` VALUES('3399','397','花莲县','3','0');
INSERT INTO `Array` VALUES('3400','397','澎湖县','3','0');
INSERT INTO `Array` VALUES('3401','3','合肥','2','0');
INSERT INTO `Array` VALUES('3402','3401','庐阳区','3','0');
INSERT INTO `Array` VALUES('3403','3401','瑶海区','3','0');
INSERT INTO `Array` VALUES('3404','3401','蜀山区','3','0');
INSERT INTO `Array` VALUES('3405','3401','包河区','3','0');
INSERT INTO `Array` VALUES('3406','3401','长丰县','3','0');
INSERT INTO `Array` VALUES('3407','3401','肥东县','3','0');
INSERT INTO `Array` VALUES('3408','3401','肥西县','3','0');
INSERT INTO `Array` VALUES('1','1','香港华锋实业有限公司','深圳市南山区科技园南区德赛科技大厦10楼','0755-68089456','孙金华','13631634475','11395448','2253934','0','6','','<p>请编写内容！</p>','1','rodey','1367629674','1367629674');
INSERT INTO `Array` VALUES('2','1','北京顺通天下商贸有限公司 版权所有','北京市丰台区西三环丰益桥西国贸汽配基地A1-2062','0755-68089456','李锋刚','','11631446','3985562','0','2','','','1','rodey','1367630008','1367630008');
INSERT INTO `Array` VALUES('3','1','盛网科技','深圳市南山区科技园南区德赛科技大厦10楼','0755-21671712','罗勇','13723722479','11395455','2253937','1','6','http://systacm.com/uploadfile/slider/1364572800/banner_13645728001800.jpg','<p>深圳市盛艺网络科技有限公司</p>','1','rodey','1367639873','1367639873');
INSERT INTO `Array` VALUES('1','总代理商','1367614469');
INSERT INTO `Array` VALUES('2','一级代理','1367614469');
INSERT INTO `Array` VALUES('3','二级代理','1367614469');
INSERT INTO `Array` VALUES('4','三级代理','1367614469');
INSERT INTO `Array` VALUES('5','地区代理','1367614469');
INSERT INTO `Array` VALUES('6','省级代理','1367614469');
INSERT INTO `Array` VALUES('7','市级代理','1367614469');
INSERT INTO `Array` VALUES('8','代理商','1367614469');
INSERT INTO `Array` VALUES('9','分销商','1367614469');
INSERT INTO `Array` VALUES('10','加盟商','1367614469');
INSERT INTO `Array` VALUES('11','合作商','1367614469');
INSERT INTO `Array` VALUES('12','专卖店','1367614469');
INSERT INTO `Array` VALUES('13','旗舰店','1367614469');
INSERT INTO `Array` VALUES('14','网销商','1367614469');
INSERT INTO `Array` VALUES('1','超级管理员','1','all','c,u,r,d','1','0');
INSERT INTO `Array` VALUES('4','站点管理员','2','user,catgory,news,archive,notice','c,u,r,d','1','0');
INSERT INTO `Array` VALUES('3','用户管理','3','user,user_group','c,u,r,d','1','0');
INSERT INTO `Array` VALUES('5','内容管理','4','archive','c,u,r,d','1','0');
INSERT INTO `Array` VALUES('11','商城管理','5','user,order,archive,goods,union,active,note','c,u,r,d','1','0');
INSERT INTO `Array` VALUES('12','订单管理','5','goods,order','c,u,r,d','1','0');
INSERT INTO `Array` VALUES('13','文章管理','6','archive','c,u,r,d','1','0');
INSERT INTO `Array` VALUES('14','焦点图管理','7','banner','c,u,r,d','0','1378396599');
INSERT INTO `Array` VALUES('2','列兵','1','0','1364584540');
INSERT INTO `Array` VALUES('3','班长','2','1000','1364584540');
INSERT INTO `Array` VALUES('4','少尉','3','2000','1364584540');
INSERT INTO `Array` VALUES('5','中尉','4','3000','1364584540');
INSERT INTO `Array` VALUES('6','上尉','5','4000','1364584540');
INSERT INTO `Array` VALUES('7','少校','6','5000','1364584540');
INSERT INTO `Array` VALUES('8','中校','7','6000','1364584540');
INSERT INTO `Array` VALUES('9','上校','8','9000','1364584540');
INSERT INTO `Array` VALUES('10','少将','9','14000','1364584540');
INSERT INTO `Array` VALUES('11','中将','10','19000','1364584540');
INSERT INTO `Array` VALUES('12','上将','11','24000','1364584540');
INSERT INTO `Array` VALUES('15','大将','12','29000','1364584540');
INSERT INTO `Array` VALUES('2','1','2','35','dfgsdfg','dfgsdfgsdfgsdfgsdf','1','0');
INSERT INTO `Array` VALUES('3','1','2','69','呃呃呃','adfadsfasdfasdf','1','1365528307');
INSERT INTO `Array` VALUES('4','2','2','68','是的发生地方','阿斯多夫阿斯多夫','1','1365535344');
INSERT INTO `Array` VALUES('6','3','2','15','啊的说法是地方','阿斯多夫啊','1','1365536067');
INSERT INTO `Array` VALUES('7','4','2','67','阿萨德发放','规范的规范化东莞','1','0');
INSERT INTO `Array` VALUES('10','5','2','67','的发丝得法','阿斯顿法','1','0');
INSERT INTO `Array` VALUES('54','1','2','15','盛艺ACM系统（SYSTacm）','开源ACM系统 盛艺ACM（SYSTacm）系统今天发布了！','1','1372514642');
INSERT INTO `Array` VALUES('55','1','2','33','盛艺ACM系统（SYSTacm）','开源ACM系统 盛艺ACM（SYSTacm）系统今天发布了！','1','1372514642');
INSERT INTO `Array` VALUES('49','1','2','2','sdasdf','asdfasdfasd','2','1365609291');
INSERT INTO `Array` VALUES('56','3','2','2','送积分了','凡新手上路会员都将免费获得20积分，请查看自己的积分数，如有问题请联系客服！','2','1372515138');
INSERT INTO `Array` VALUES('74','3','2','15','后台充值','后台送20积分，请你到系统个人中心查看！','1','1372533105');
INSERT INTO `Array` VALUES('73','3','2','2','后台充值','后台送20积分，请你到系统个人中心查看！','1','1372533105');
INSERT INTO `Array` VALUES('1','通知','','4','0','1372517808');
INSERT INTO `Array` VALUES('2','警告','','1','0','1372512594');
INSERT INTO `Array` VALUES('3','加积分','','1','0','1372512650');
INSERT INTO `Array` VALUES('4','加金额','','1','0','1372512667');
INSERT INTO `Array` VALUES('5','送礼','','1','0','1372513076');
INSERT INTO `Array` VALUES('7','发奖品','','0','0','1372518921');
INSERT INTO `Array` VALUES('8','直线','','0','1','1372520855');
INSERT INTO `Array` VALUES('13','官方','1365743409');
INSERT INTO `Array` VALUES('14','会更好','1365743409');
INSERT INTO `Array` VALUES('15','问问','1365743409');
INSERT INTO `Array` VALUES('16','菜单','1365743409');
INSERT INTO `Array` VALUES('17','搞好','1365743409');
INSERT INTO `Array` VALUES('18','为的','1365743409');
INSERT INTO `Array` VALUES('19','一天','1365743409');
INSERT INTO `Array` VALUES('20','进空间','1365743409');
INSERT INTO `Array` VALUES('21','啊啊','1365743409');
INSERT INTO `Array` VALUES('22','相册陈','1365743409');
INSERT INTO `Array` VALUES('24','希望','1365743409');
INSERT INTO `Array` VALUES('25','不过','1365743409');
INSERT INTO `Array` VALUES('26','您好','1365743409');
INSERT INTO `Array` VALUES('27','满级','1365743409');
INSERT INTO `Array` VALUES('28','而都','1365743409');
INSERT INTO `Array` VALUES('29','提供','1365743409');
INSERT INTO `Array` VALUES('30','以后','1365743409');
INSERT INTO `Array` VALUES('31','我给','1365743409');
INSERT INTO `Array` VALUES('32','东莞','1365743409');
INSERT INTO `Array` VALUES('33','群发','1365743409');
INSERT INTO `Array` VALUES('34','哈根','1365743409');
INSERT INTO `Array` VALUES('35','觉得','1365743409');
INSERT INTO `Array` VALUES('36','看到','1365743409');
INSERT INTO `Array` VALUES('37','速读法','1365743530');
INSERT INTO `Array` VALUES('2','rodey','5aa26937a3b0a86999868d8b28508aee','rodeyluo@gmail.com','天蝎飞碟','罗勇','1','1361980800','深圳市罗湖区泥岗西村','13723722479','0755-21671712','来自江西吉安盘谷镇坛山园村5566','像风一样自由！','uploadfile/users/headport/100/user_13724352004357.png','5','1258','1552.00','0','0','127.0.0.1','4','1','1362044903','1378715826','127.0.0.1','1378715826');
INSERT INTO `Array` VALUES('37','Luo1','92faf1e066218c71c780ea2240d17bec','looyoohoo@gmail.com','蓝海之燕','李海燕','2','687369600','深圳市罗湖区泥岗西村5栋701室','13723722479','0755-21671712','来自江西吉安盘谷镇官家村','像风一样自由！','','1','5000','375.08','0','0','','4','0','','','','1372532907');
INSERT INTO `Array` VALUES('33','Luo2','c78b6663d47cfbdb4d65ea51c104044e','luoy@szhff.com','子艺书怀','罗子艺','1','1363276800','深圳市罗湖区泥岗西村','13723722479','0755-21671712','','','','1','400','72.08','0','0','','4','1','','','','1372532907');
INSERT INTO `Array` VALUES('36','Luo3','0144712dd81be0c3d9724f5e56ce6685','90809df@qq.com','','','0','','','','','','','uploadfile/users/headport/100/user_13633632007237.gif','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('34','Luo4','098765','90809df@qq.com','','','0','','','','','','','uploadfile/users/headport/100/user_13633632009725.gif','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('35','Luo5','0144712dd81be0c3d9724f5e56ce6685','90809df@qq.com','','','0','','','','','','','uploadfile/users/headport/100/user_13633632003420.png','1','0','0.00','0','0','','0','1','','','','1372445299');
INSERT INTO `Array` VALUES('30','LiHY1','123456','li@3434.com','','','0','','','','','','','uploadfile/users/headport/100/user_13633632006818.gif','1','0','0.00','0','0','','0','0','','','','');
INSERT INTO `Array` VALUES('27','LiHY2','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('13','rodey1','1b08a4fe8ab0b8cb04b676f892964375','soo_oo@yahoo.cn','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('15','LuoYong','723fe959c3e96e188c4d613842d6f918','453474593@qq.com','蓝海之燕','','0','1363276800','','13723722479','','','','uploadfile/users/headport/100/user_13633632006024.png','1','168','300.05','0','0','','0','1','','','','1372533105');
INSERT INTO `Array` VALUES('16','rodey3','1b08a4fe8ab0b8cb04b676f892964375','soo_oo@yahoo.cn','','','0','25','','','','','','','1','100','200.05','0','0','','0','1','','','','1372503827');
INSERT INTO `Array` VALUES('21','rodey4','828972916','soo_oo@yahoo.cn','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('22','rodey5','828972916','soo_oo@yahoo.cn','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('23','rodey6','828972916','soo_oo@yahoo.cn','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('24','rodey7','828972916','soo_oo@yahoo.cn','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('25','rodey8','828972916','soo_oo@yahoo.cn','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('38','Luo6','098765','90809df@qq.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('39','Luo7','098765','90809df@qq.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('40','Luo8','098765','90809df@qq.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('41','Luo9','098765','90809df@qq.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('42','Luo10','098765','90809df@qq.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('43','Yong','438955454','84dfasdf@gmail.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('44','Luo11','098765','90809df@qq.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('45','Yong1','438955454','84dfasdf@gmail.com','','','0','25','','12723722479','','My name is Rodey!','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('49','李海燕','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('48','李海燕1','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('50','李海燕2','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('51','李海燕3','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('52','李海燕4','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('53','李海燕5','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('54','李海燕6','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('55','李海燕7','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('56','李海燕8','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('57','李海燕9','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('60','李海燕10','123456','li@3434.com','','','0','','','','','','','','1','0','0.00','0','0','','0','1','','','','');
INSERT INTO `Array` VALUES('68','香港华锋','d8406e8445cc99a16ab984cc28f6931615c766fc','info@szhff.com','香港华锋','香港华锋','1','-28800','深圳市南山区科技园德赛科技大厦','13723722479','0755-21671712','香港华锋实业有限公司','GPS品牌','uploadfile/users/headport/100/user_13633632006735.gif','1','0','36.08','0','','127.0.0.1','4','1','1363247924','','','1372538110');
INSERT INTO `Array` VALUES('69','e途商城','d8406e8445cc99a16ab984cc28f6931615c766fc','rodey@etu100.com','e途商城','e途商城','2','2013','深圳市南山区科技园德赛科技大厦','13723722479','0755-21671712','e途商城','e途商城','','1','0','24.08','0','','127.0.0.1','4','1','1363248622','','','1372531263');
INSERT INTO `Array` VALUES('71','SYSTacm','68b86699d948788eed191c8ea622c175a91fda92','rodeyluo@gmail.com','盛艺','盛艺','0','1987','深圳市罗湖区泥岗西村','13723722479','0755-21671712','开源的ACM系统','像风一样自由！','uploadfile/users/headport/100/user_13725216009514.png','11','1000000','999999.99','0','','127.0.0.1','4','1','1372535615','','','1372535615');
INSERT INTO `Array` VALUES('2','新手上路','1','20','0','','1','0');
INSERT INTO `Array` VALUES('3','初级会员','2','50','0','','1','0');
INSERT INTO `Array` VALUES('4','中级会员','3','100','0','','1','0');
INSERT INTO `Array` VALUES('5','高级会员','4','150','0','','1','0');
INSERT INTO `Array` VALUES('7','手机认证','6','150','0','','1','0');
INSERT INTO `Array` VALUES('8','社区绑定','7','150','0','','1','0');
INSERT INTO `Array` VALUES('9','禁止访问','0','-50','0','','0','1372534330');
INSERT INTO `Array` VALUES('10','天外飞仙','8','2000','0','','1','1372534341');
INSERT INTO `Array` VALUES('11','仁者无敌','9','1000','0','','1','1372534351');
