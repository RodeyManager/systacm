-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 04 月 14 日 16:34
-- 服务器版本: 5.0.90-community-nt
-- PHP 版本: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `systacm`
--

-- --------------------------------------------------------

--
-- 表的结构 `syst_archive`
--

CREATE TABLE IF NOT EXISTS `syst_archive` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编码',
  `cat_id` int(11) NOT NULL COMMENT '栏目ID',
  `type_id` int(11) NOT NULL COMMENT '类型ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `sub_title` varchar(200) NOT NULL COMMENT '副标题',
  `intro` varchar(200) NOT NULL COMMENT '内容简介',
  `content` text NOT NULL COMMENT '内容',
  `tag` varchar(200) NOT NULL COMMENT '标签',
  `view` int(11) NOT NULL default '0' COMMENT '浏览次数',
  `source` varchar(255) NOT NULL COMMENT '来源',
  `linkto` varchar(255) NOT NULL COMMENT '连接地址',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `pics` varchar(255) NOT NULL COMMENT '展示图',
  `grade` varchar(11) NOT NULL COMMENT '评分',
  `comment_num` int(11) NOT NULL COMMENT '评论数',
  `sort` int(11) NOT NULL default '0' COMMENT '排序',
  `is_html` int(11) NOT NULL default '0' COMMENT '是否生成静态HTML, 0:不生成;1生成',
  `seo_title` varchar(255) NOT NULL COMMENT '页面标题',
  `seo_keyword` varchar(255) NOT NULL COMMENT '关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT '页面描述',
  `url_rule` varchar(255) NOT NULL COMMENT 'URL规则',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `verify` int(11) NOT NULL default '1' COMMENT '审核，0：未审核；1：已审核；2：审核通过；3：未通过',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章信息表' AUTO_INCREMENT=59 ;

--
-- 转存表中的数据 `syst_archive`
--

INSERT INTO `syst_archive` (`id`, `cat_id`, `type_id`, `title`, `sub_title`, `intro`, `content`, `tag`, `view`, `source`, `linkto`, `thumb`, `pics`, `grade`, `comment_num`, `sort`, `is_html`, `seo_title`, `seo_keyword`, `seo_desc`, `url_rule`, `author`, `verify`, `add_time`, `update_time`) VALUES
(2, 0, 0, 'V50地图拷贝工具', '地图拷贝工具', '', 'E途V50地图拷贝工具', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 1363670642, 1363670642),
(26, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(27, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(28, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(29, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(30, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(31, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(58, 3, 0, 'mysql修改表名，列名，列类型，添加表列，删除表列', 'mysql SQL操作', 'mysql修改表名，列名，列类型，添加表列，删除表列', '<p><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test rename test1; --修改表名</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test add &nbsp;column name varchar(10); --添加表列</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test drop &nbsp;column name; --删除表列</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test modify address char(10) --修改表列类型</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">||alter table test change address address &nbsp;char(40)</span><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><br style="word-break:break-all;font-family:arial, helvetica, sans-serif;font-size:12px;background-color:#edebda;" /><span style="font-family:arial, helvetica, sans-serif;font-size:12px;line-height:21.600000381469727px;background-color:#edebda;">alter table test change &nbsp;column address address1 varchar(30)--修改表列名</span></p>', 'mysql,SQL', 0, '', '', '', '', '', 0, 0, 1, 'mysql修改表名，列名，列类型，添加表列，删除表列', 'MySQL,SQL', '', '', 'rodey', 1, 1363714526, 1363716251),
(38, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '<p>深圳市华利隆汽车电子技术有限公司</p>', '华锋,E路航,E途', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 1363707797),
(56, 0, 0, '平安保险护航  华锋E路航&E途金牌品质', '平安保险护航  华锋E路航&E途金牌品质', '平安保险护航  华锋E路航&E途金牌品质', '<p>平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质rrrrrrrrrrrrrrrrrrrr777777777777</p>', 'E路航', 0, '', '', '', '', '', 0, 0, 0, '平安保险护航  华锋E路航&E途金牌品质', '平安保险护航  华锋E路航&E途金牌品质', '平安保险护航  华锋E路航&E途金牌品质', '', 'rodey', 1, 1363703312, 1363705916),
(40, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(41, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(42, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(43, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(44, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(45, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(46, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(47, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(48, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(49, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(50, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(51, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(52, 0, 0, '华锋实业', '香港华锋实业有限公司', '', '深圳市华利隆汽车电子技术有限公司', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 0, 0),
(54, 0, 0, '完整版的部署与体验', '', '', '', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 1363675872, 1363675872),
(55, 0, 0, 'jQuery Form与Uediter数据同步', '', '', '<p><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">$(&#39;#formPost&#39;).submit(function() {</span><br style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;" /><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">editor.sync();</span><br style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;" /><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">$(this).ajaxSubmit(options);</span><br style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;" /><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">return false;</span><br style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;" /><span style="color:#333333;font-family:arial, helvetica, sans-serif;line-height:20px;background-color:#ffffff;">});</span></p>', '0', 0, '0', '0', '0', '0', '0', 0, 0, 0, '', '', '', '', 'rodey', 1, 1363681398, 1363681398),
(57, 0, 0, '前后端数据交互', '前后端数据交互', '前后端数据交互', '<p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong style="line-height:1.75em;"><span style="font-size:14px;">一、富文本内容交互</span></strong><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;color:black;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;color:black;font-size:14px;">、</span></strong><span style="font-family:宋体;color:black;font-size:14px;">编辑器内容初始化（即往编辑器中设置富文本）</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;">场景一：写新文章，编辑器中预置提示、问候等内容。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;">在editor_config.js文件中找到initialContent参数，设置其值为需要的提示或者问候语即可，如initialContent:’欢迎使用UEditor!’。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;">场景二：编辑旧文章，从数据库中取出富文本放置到编辑器中。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;color:black;font-size:14px;">显然，编辑文章时需要从后台数据库中取出大段富文本，如果仍然采用场景一中的方式去设置初始值的话，必然会带来诸如引号匹配被截断等问题，因此需要采用另外一种方式去设置，如下代码所示：</span></p><pre class="brush:as3;toolbar:false;">&lt;script type="text/plain"id="editor"&gt;\n//从数据库中取出文章内容打印到此处\n&lt;/script&gt;</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">此处采用了script标签作为编辑器容器对象，并设置了其类型是纯文本，从而在避免了标签内部JS代码执行的同时解决了部分同学在使用传统的textarea标签作为容器所带来的一次额外转码问题。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">提交编辑器内容至后端</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">场景一：在编辑器所在的Form中存在提交按钮，提交动作由点击此按钮完成。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">该场景适用于最普通的场合，没有太大问题需要注意，仅三点说明：</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">1) </span><span style="font-size:14px;">默认情况下提交到后台的表单名称是 “editorValue”，在editor_config.js中可以配置，参数名为textarea。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">2) </span><span style="font-size:14px;">可以在容器标签（即script标签）上设置name属性，以覆盖editor_config.js中的默认配置。实例代码如下，此处的myContent将成为新的提交表单名称：</span></p><pre class="brush:as3;toolbar:false;">&lt;form action=""method="post"&gt;\n&lt;script type="text/plain"id="editor"name="myContent"&gt;\n&lt;/script&gt;\n&lt;input type="submit"name="submit"value="提交"&gt;\n&lt;/form&gt;</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-size:14px;">3）后端接收程序可以通过如下几种方式来获取编辑器中的富文本内容。</span></p><pre class="brush:as3;toolbar:false;">//PHP获取：\n$_POST["myContent"]\n//JSP获取：\nrequest.getParameter("myContent");\n//ASP获取：\nrequest("myContent");\n//NET获取:\ncontext.Request.Form["myContent"];</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;"><span style="font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;"><span style="font-size:14px;">场景二：编辑器所在的Form中不存在提交按钮，提交动作由外部事件触发。</span><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><span style="font-size:14px;">该场景适用于站点前端交互较多的场合，需要注意的事项主要是在触发form提交动作之前执行编辑器内容同步操作。一般的代码模式如下所示：</span><span style="font-size:14px;"></span></p><pre class="brush:as3;toolbar:false;">//满足提交条件时同步内容并提交，此处editor为编辑器实例\nif(editor.hasContents()){ //此处以非空为例\neditor.sync();       //同步内容\nsomeForm.submit();   //提交Form\n}</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><strong>如果使用的是jquery validation可以参考如下代码</strong></p><pre class="brush:js;toolbar:false;">$(function(){\nvareditor = newUE.ui.Editor();\neditor.render(''content'');\neditor.addListener(''contentchange'',function(){\nthis.sync();\n//1.2.4+以后可以直接给textarea的id名字就行了\n$(''textarea'').valid();\n});\nvarvalidator = $("#myform").submit(function() {\neditor.sync();\n}).validate({\nignore: "",\nrules: {\ntitle: "required",\ncontent: "required"\n},\nerrorPlacement: function(label, element) {\n// position error label after generated textarea\nif(element.is("textarea")) {\nlabel.insertAfter(element.next());\n} else{\nlabel.insertAfter(element)\n}\n}\n});\nvalidator.focusInvalid = function() {\n// put focus on tinymce on submit validation\nif( this.settings.focusInvalid ) {\ntry{\nvartoFocus = $(this.findLastActive() ||this.errorList.length &amp;&amp; this.errorList[0].element || []);\nif(toFocus.is("textarea")) {\neditor.focus()\n} else{\ntoFocus.filter(":visible").focus();\n}\n} catch(e) {\n// ignore IE throwing errors when focusing hidden elements\n}\n}\n}\n})</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;line-height:24px;text-indent:24px;background-color:#ffffff;margin-top:0px;margin-bottom:0px;"><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;background-color:#ffffff;line-height:1.5em;text-indent:-28px;margin-right:0cm;margin-left:28px;"><span style="font-size:14px;">此处editor是编辑器实例对象。</span><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;background-color:#ffffff;line-height:1.5em;text-indent:-28px;margin-right:0cm;margin-left:28px;"><span style="font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">场景三：编辑器不在任何Form中，提交动作由外部事件触发。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">该场景使用不多，但特殊时候可能需要。UEditor也提供了对应的处理方案，基本逻辑跟场景二一样，只是在执行同步操作的时候需要传入提交form的id，如editor.sync(myFormID)即可。其他同场景二。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">二、图片上传交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">传统图片上传</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">传统图片上传涉及到的前后端交互主要涉及“上传提交路径”以及“图片保存路径”两个参数，后台保存路径以任何形式（绝对或者相对）、在任何页面展示跟前台无关。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">Flash</span><span style="font-family:宋体;font-size:14px;">图片上传</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">Flahs</span><span style="font-family:宋体;font-size:14px;">图片上传和传统图片上传存在一个很大的区别：它需要服务器端实时返回“图片保存路径”用于在前台的即时展示。具体到编辑器，就是需要将返回的路径插入到编辑器中。由此会引出除传统图片上传中提到的两个参数之外的第三个参数：“前后端修正路径”。如果后台返回的保存路径是绝对路径（指以http开头的路径，以根目录开始的路径也可勉强归入其中），那么前台无须做任何修正，否则用户必须十分清楚自己当前的目录结构并据此修正这个前后端相对路径之间的差异。因此，UEditor极力推荐由服务器端返回以根目录开始的相对路径。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">3</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">UEditor</span><span style="font-family:宋体;font-size:14px;">中的上传实践及注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">在UEditor中，“上传提交路径”和“前后端修正路径”的配置位于editor_config.js中。其中，imageUrl参数对应着“上传提交路径”，imagePath参数对应着“前后端修正路径”。而“图片保存路径”则需要在server/upload/php目录下的imageUp文件中配置。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">路径配置完成之后，还需要配置imageFieldName参数作为文件表单的表单名，后台可以据此获取文件句柄。该参数同样位于editor_config.js中。</span></p><pre class="brush:js;toolbar:false;">//图片上传提交地址\nimageUrl:URL+"server/upload/php/imageUp.php",\n//图片修正地址，引用了fixedImagePath,如有特殊需求，可自行配置 \nimagePath:fixedImagePath,\n//图片描述的key             \nimageFieldName:"upFile",\n//等比压缩的基准，确定maxImageSideLength参数的参照对象.\n//0为按照最长边，1为按照宽度，2为按照高度                      \ncompressSide:0,   \n//上传图片最大允许的边长，超过会自动等比缩放,不缩放就设置一个比较大的值\n//更多设置在image.html中                          \nmaxImageSideLength:900</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;margin-top:0px;margin-bottom:0px;"><span style="font-size:14px;">完成上述配置之后，理论上后台应该可以接收到前台上传的图片文件了。在正确保存之后，传统图片上传至此就结束了。但是，在使用Flash上传的编辑器中，流程还远未结束。</span><br /></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">首先，后台需要计算得出图片文件存放的地址字符串。该字符串UEditor极力推荐使用从网站根目录开始算起，一直到图片名结束为止。如果不从网站根目录开始算起，后面需要考虑“前后端修正地址”参数。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">其次，后台返回一个json格式的字符串，格式具体要求如下：</span></p><pre class="brush:as3;toolbar:false;">{ "url":"图片地址", "title":"图片描述", "state":"上传状态"}</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">其中，url对应计算出的图片保存地址——再强调一遍，尽量构造出从网站根目录开始的地址字符串；title对应flash中的描述字段，在图片上将会被设置到title属性中；state对应服务器端返回的图片上传状态字符：除了上传成功返回“SUCCESS”之外，其他任何值都将被直接显示在返回的图片描述字段内。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">最后，UEditor会在返回的url地址前面增加“前后端修整路径”这个参数值作为最后插入编辑器中的图片地址。因此，如果服务器端返回的是从根目录开始的图片路径或者http开头的绝对路径，“前后端修正路径”必须留空。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;">举例来讲，如果服务器返回的路径是“/myProject/uploads/sun.jpg”,那么插入到编辑器中的路径会是“前后端修正路径 + &nbsp;/myProject/uploads/sun.jpg”。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">三、Word图片转存交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">图片转存原理</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">所谓word图片转存，是指UEditor为了解决用户从word中复制了一篇图文混排的文章粘贴到编辑器之后，word文章中的图片数据无法显示在编辑器中，也无法提交到服务器上的问题而开发的一个操作简便的图片转存方案。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">该功能的基本操作步骤：复制word文档——》粘贴到编辑器——》编辑器会将所有图片转换成一个占位图，同时在工具栏中高亮转存按钮——》点击转存按钮弹出图片上传框——》点击复制按钮复制图片目录地址——》点击“添加照片”按钮，在弹出的选择框中粘贴刚复制的图片目录地址——》点击打开按钮，选择目录下的所有图片文件，在此点击打开——》执行图片上传——》上传成功确认插入，UEditor将自动完成对应占位图的替换过程。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">配置要点及注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"> &nbsp; &nbsp;word</span><span style="font-family:宋体;font-size:14px;">图片转存跟普通图片上传的配置基本一样，所不同的仅仅是操作上的差异：前者需要首先获取临时图片文件存在的目录，后者直接选择自己指定的文件目录。PS：在部分操作系统的部分版本word中发现单张word图片会生成两张临时图片，且格式不一，清晰度各异，目前暂时未发现改进方法。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">四、远程图片抓取交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">远程抓取原理</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">图片远程抓取是指在插入本地域名之外的图片链接地址时，由服务器将这些外部图片抓取到本地服务器保存的一个功能。实现原理为在编辑器中向服务器发送包含所有外域图片地址的ajax请求，然后由服务器在后端抓取保存后返回图片地址给编辑器，再由编辑器完成外域地址和本地地址的替换工作。</span></p><pre class="brush:js;toolbar:false;">//是否开启远程图片抓取\ncatchRemoteImageEnable:true,\n//处理远程图片抓取的地址\ncatcherUrl:URL +"server/submit/php/getRemoteImage.php", \n//提交到后台远程图片uri合集的表单名\ncatchFieldName:"upFile",    \n//图片修正地址，同imagePath\ncatcherPath:fixedImagePath,\n//本地顶级域名，当开启远程图片抓取时，除此之外的所有其它域名下的\n//图片都将被抓取到本地                                  \nlocalDomain:["baidu.com","10.81.2.114"],</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">远程抓取功能是否开启可在edicot_config.js中通过配置catchRemoteImageEnable参数实现。与这个功能相关的配置还包括了远程抓取的处理程序地址，表单域名称，本地域和“前后端修正地址”。远程抓取处理程序实现了依据前端提交的地址列表（使用ue_separate_ue标示符进行分隔的字符串）进行图片抓取，然后返回地址列表给客户端的功能。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">前后台交互数据格式样例：（URL1，URL2，URL3，URL4）</span><span style="font-size:14px;"></span></p><pre class="brush:as3;toolbar:false;">URL1ue_separate_ueURL2ue_separate_ueURL3ue_separate_ueURL4</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">五、图片在线管理交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">图片在线管理介绍</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">图片在线管理是指通过读取服务器端的文件目录并将其展示到编辑器中的进行额外一些操作的功能。处于安全考虑，目前UEditor仅实现了图片二次插入操作，其他诸如删除、移动等操作将会在后续二次开发教程中陆续放出。</span></p><pre class="brush:as3;toolbar:false;">//图片在线管理的处理地址       \nimageManagerUrl:URL + "server/submit/php/imageManager.php",\n//图片修正地址，同imagePath       \nimageManagerPath:fixedImagePath</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">图片在线管理需要配置的参数跟远程图片抓取一致，两者不同的地方是图片在线管理中的图片数据是由服务器端指定某个目录，然后遍历其下的所有图片文件得到，然后将地址返回给编辑器，而远程图片抓取则是由编辑器提交图片地址，经过服务器端的抓取处理后返回新的地址给编辑器。两者的初始触发都需要ajax的介入。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">六、屏幕截图交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">屏幕截图介绍 </span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">使用了ActiveX控件，目前只支持IE浏览器。</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"><br /></span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">2</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">需要配置的参数除了跟图片上传一样的内容之外，还多出了服务器地址和端口的配置。具体使用时请根据自身服务器的特点做出适应修改。</span></p><pre class="brush:as3;toolbar:false;">//屏幕截图的server端文件所在的网站地址或者ip，请不要加http://\nsnapscreenHost: ''127.0.0.1'',    \n//屏幕截图的server端保存程序，UEditor的范例代码为“URL                             \nsnapscreenServerUrl: URL +"server/upload/php/snapImgUp.php", +"server/upload/php/snapImgUp.php"”\n//屏幕截图的server端端口\nsnapscreenServerPort: 80, \n//截图的图片默认的排版方式                                \nsnapscreenImgAlign: ''center'', \n//截图显示修正地址                             \nsnapscreenPath: fixedImagePath,</pre><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">七、附件上传交互</span></strong></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><strong><span style="font-family:宋体;font-size:14px;">1</span></strong><strong><span style="font-family:宋体;font-size:14px;">、</span></strong><span style="font-family:宋体;font-size:14px;">附件上传注意事项</span></p><p style="padding:0px;color:#454545;font-family:tahoma, helvetica, &#39;microsoft yahei&#39;, 微软雅黑, arial, stheiti;font-size:12px;text-indent:24px;background-color:#ffffff;line-height:1.75em;"><span style="font-family:宋体;font-size:14px;"></span><span style="font-family:宋体;font-size:14px;">附件上传的基本配置跟图片类似。另外，由于附件上传采用了相当成熟的swfupload开源框架，因此大部分的文档和资料尽可参考swfupload的官网教程。官网地址：<a href="http://www.swfupload.org/" target="_blank" title="swfupload" style="outline:none;font-size:16px;"><span style="font-size:14px;">http：//www.swfupload.org</span></a></span></p><p><br /></p>', 'Uediter', 0, '', '', '', '', '', 0, 0, 0, '前后端数据交互', '前后端数据交互', '前后端数据交互', '', 'rodey', 1, 1363706124, 1363706124);

-- --------------------------------------------------------

--
-- 表的结构 `syst_attachment`
--

CREATE TABLE IF NOT EXISTS `syst_attachment` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `file_module` char(10) NOT NULL COMMENT '所属模型',
  `file_name` char(150) NOT NULL COMMENT '文件名称',
  `file_size` int(10) NOT NULL COMMENT '文件大小',
  `file_ext` char(10) NOT NULL COMMENT '文件后缀',
  `file_path` varchar(255) NOT NULL COMMENT '文件路径',
  `is_image` tinyint(1) NOT NULL default '1' COMMENT '是否为图片；1：是;0：不是',
  `downloads` mediumint(10) NOT NULL default '0' COMMENT '下载次数',
  `author` char(50) NOT NULL COMMENT '上传者',
  `ddd` varchar(200) NOT NULL,
  `add_time` int(30) NOT NULL COMMENT '上传时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='附件信息表' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `syst_attachment`
--

INSERT INTO `syst_attachment` (`id`, `file_module`, `file_name`, `file_size`, `file_ext`, `file_path`, `is_image`, `downloads`, `author`, `ddd`, `add_time`) VALUES
(25, 'setting', 'slider_01.jpg', 2334, 'jpg', 'uploadfile/slider/1364572800/banner_13645728007794.jpg', 1, 0, 'rodey', '', 1364584536),
(28, 'setting', '03.jpg', 360212, 'jpg', 'uploadfile/slider/1364572800/banner_13645728001375.jpg', 1, 0, 'rodey', '', 1364585673),
(23, 'setting', 'slider_02.jpg', 2334, 'jpg', 'uploadfile/slider/1364572800/banner_13645728005058.jpg', 1, 0, 'rodey', '', 1364584482),
(22, 'setting', 'slider_03.jpg', 2332, 'jpg', 'uploadfile/slider/1364572800/banner_13645728001800.jpg', 1, 0, 'rodey', '', 1364584455),
(29, 'setting', 'QQ截图20130409104822.gif', 8464, 'gif', 'uploadfile/slider/1365436800/banner_13654368007084.gif', 1, 0, 'rodey', '', 1365475830);

-- --------------------------------------------------------

--
-- 表的结构 `syst_banner`
--

CREATE TABLE IF NOT EXISTS `syst_banner` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `type_id` int(10) unsigned NOT NULL COMMENT '类别ID',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `banner` varchar(200) NOT NULL COMMENT 'banner地址',
  `banner_width` smallint(5) NOT NULL COMMENT '高度',
  `banner_height` smallint(5) NOT NULL COMMENT '宽度',
  `linkto` varchar(255) NOT NULL COMMENT '连接地址',
  `sort` smallint(5) NOT NULL default '0' COMMENT '排序',
  `disabled` tinyint(1) NOT NULL default '1' COMMENT '是否禁用;1:启用;0:禁用',
  `author` varchar(100) NOT NULL COMMENT '添加者',
  `start_time` int(30) NOT NULL COMMENT '起始时间',
  `end_time` int(30) NOT NULL COMMENT '截止时间',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Banner信息表' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `syst_banner`
--

INSERT INTO `syst_banner` (`id`, `type_id`, `title`, `banner`, `banner_width`, `banner_height`, `linkto`, `sort`, `disabled`, `author`, `start_time`, `end_time`, `add_time`) VALUES
(12, 2, 'Blur', 'http://systacm.com/uploadfile/slider/1364572800/banner_13645728007794.jpg', 980, 200, 'http://www.eroda100.com', 0, 1, 'rodey', 1364584507, 1387480500, 1364584540),
(11, 2, 'Green', 'http://systacm.com/uploadfile/slider/1364572800/banner_13645728005058.jpg', 980, 200, 'http://systacm.com', 0, 1, 'rodey', 1364584469, 1376507400, 1364584503),
(15, 7, 'G7S', 'http://systacm.com/uploadfile/slider/1364572800/banner_13645728001375.jpg', 980, 200, 'http://systacm.com', 0, 1, 'rodey', 1364585644, 1388004000, 1364585676),
(10, 2, 'Red', 'http://systacm.com/uploadfile/slider/1364572800/banner_13645728001800.jpg', 980, 200, 'http://systacm.com', 0, 1, 'rodey', 1364584421, 1368126600, 1364584465),
(17, 3, 'Roadey', 'http://systacm.com/uploadfile/slider/1365436800/banner_13654368007084.gif', 980, 200, 'http://www.roadey.com', 0, 1, 'rodey', 1365475572, 1366857900, 1365475857);

-- --------------------------------------------------------

--
-- 表的结构 `syst_banner_type`
--

CREATE TABLE IF NOT EXISTS `syst_banner_type` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '自动编号',
  `name` char(30) default NULL COMMENT '类别名称',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='banner类别信息表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `syst_banner_type`
--

INSERT INTO `syst_banner_type` (`id`, `name`, `add_time`, `update_time`) VALUES
(2, '首页焦点', 1365474418, 1365474418),
(3, '列表页焦点', 1365474432, 1365474432),
(4, '图片页焦点', 1365474446, 1365474446),
(5, '视频页焦点', 1365474459, 1365474459),
(6, '下载页焦点', 1365474468, 1365474468),
(7, '产品页焦点', 1365474568, 1365474568);

-- --------------------------------------------------------

--
-- 表的结构 `syst_baword`
--

CREATE TABLE IF NOT EXISTS `syst_baword` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '自动编号',
  `baword` char(20) default NULL COMMENT '敏感词',
  `reword` char(20) NOT NULL COMMENT '替换词',
  `level` smallint(5) unsigned NOT NULL default '1' COMMENT '级别',
  `add_time` int(30) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='敏感词过滤信息表' AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `syst_baword`
--

INSERT INTO `syst_baword` (`id`, `baword`, `reword`, `level`, `add_time`) VALUES
(4, '枪', '*', 2, 1365564715),
(2, '色情', '**', 1, 1365561260),
(3, '毛泽东', '毛主席', 2, 1365561303),
(5, '黄色', '**', 2, 1365564741),
(25, '敏感词', '敏感词', 1, 1365579606),
(24, '\n敏感词b', '替换词', 1, 1365578134),
(23, '\n敏感词a', '替换词', 1, 1365578134),
(22, '\n敏感词4', '替换词4', 1, 1365577539),
(21, '\n敏感词3', '替换词3', 1, 1365577539),
(20, '\n敏感词2', '替换词2', 1, 1365577539),
(19, '\n敏感词1', '替换词1', 1, 1365577539),
(26, '爱爱', '**', 1, 1365739574),
(27, '火药', '**', 1, 1365739610),
(28, '弗格森', '', 1, 1365742296);

-- --------------------------------------------------------

--
-- 表的结构 `syst_category`
--

CREATE TABLE IF NOT EXISTS `syst_category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '类别名称',
  `ename` varchar(50) NOT NULL COMMENT '英文名称',
  `pid` int(11) NOT NULL default '0' COMMENT '父级分类索引',
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
  `is_show` tinyint(1) NOT NULL default '1' COMMENT '是否显示;0:不显示;1:显示',
  `is_html` tinyint(1) NOT NULL default '0' COMMENT '是否生成HTML;0:不生成;1生成',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keyword` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `link_to` varchar(255) NOT NULL COMMENT '外部连接',
  `page_type` tinyint(1) NOT NULL default '0' COMMENT '列表页分页模式；1:分页;0:单页',
  `page_size` smallint(5) NOT NULL COMMENT '列表页每页显示数',
  `add_time` int(30) default NULL,
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='类别表' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `syst_category`
--

INSERT INTO `syst_category` (`id`, `name`, `ename`, `pid`, `model_id`, `type_id`, `intro`, `content`, `banner`, `banner_width`, `banner_height`, `template`, `list_template`, `show_template`, `sort`, `author`, `is_show`, `is_html`, `seo_title`, `seo_keyword`, `seo_desc`, `link_to`, `page_type`, `page_size`, `add_time`, `update_time`) VALUES
(1, '关于我们', '', 0, 0, 0, '关于我们的企业，企业简介', '', '', 0, 0, '', '', '', 1, 'rodey', 1, 0, '', '', '', '', 0, 1, 2012, 0),
(2, '产品展示', '', 0, 0, 0, '我们的产品，一切以客户为中心，保证质量和服务一体化！', '', '', 0, 0, '', '', '', 2, 'rodey', 1, 0, '', '', '', '', 0, 1, 2012, 0),
(3, '新闻中心', '', 0, 0, 0, '每天都有我们的消息，我们每天都会有新的动态，请关注我们！', '', '', 0, 0, '', '', '', 3, 'rodey', 1, 0, '', '', '', '', 0, 1, 2012, 0),
(4, '服务支持', '', 0, 0, 0, '我们会用心服务，做到真正的为客服着想!', '', '', 0, 0, '', '', '', 4, 'rodey', 1, 0, '', '', '', '', 0, 1, 2012, 0),
(5, '联系我们', '', 0, 0, 0, '联系我们，联系方式：email->rodeyluo@gmail.com', '', '', 0, 0, '', '', '', 5, 'rodey', 1, 0, '', '', '', '', 0, 1, 2012, 0),
(6, '服务条款', '', 0, 0, 0, '', '', '', 0, 0, '', '', '', 0, '', 0, 0, '', '', '', '', 0, 1, 1363833813, 0),
(14, '企业文化', 'manual', 0, 0, 0, '企业文化企业文化企业文化', '<p>企业文化企业文化企业文化企业文化企业文化</p><p>企业文化企业文化企业文化</p><p>企业文化企业文化企业文化</p><p>企业文化企业文化</p><p>企业文化</p>', 'uploadfile/cat/banner/banner_13637952001545.jpg', 980, 300, '0', '3', '4', 0, 'rodey', 1, 0, '企业文化', '企业文化', '企业文化', 'www.etu100.com', 1, 20, 1363842580, 1363859503);

-- --------------------------------------------------------

--
-- 表的结构 `syst_catmodel`
--

CREATE TABLE IF NOT EXISTS `syst_catmodel` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `name` varchar(50) NOT NULL COMMENT '模型名称',
  `mtable` varchar(50) NOT NULL COMMENT '模型表名',
  `mintro` varchar(255) NOT NULL COMMENT '描述',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='数据模型信息表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `syst_catmodel`
--

INSERT INTO `syst_catmodel` (`id`, `name`, `mtable`, `mintro`, `add_time`, `update_time`) VALUES
(1, '文章模型', 'archive', '专门用于发布文章的数据模型', 1363881150, 1363881150),
(2, '下载模型', 'download', '专门用于发布下载资源的数据模型，如软件下载,技术支持,产品手册', 1363881332, 1363881332),
(3, '产品模型', 'product', '专门应用于上传和发布新产品的数据模型', 1363881473, 1363881473),
(4, '商品模型', 'goods', '专门用于发布商品销售的数据模型', 1363881535, 1363881535),
(5, '图片模型', 'picture', '专门用于发布图片组内容的数据模型', 1363881589, 1363881589),
(6, '视频模型', 'video', '专门用于上传和发布视频的数据模型', 1363881625, 1363881625);

-- --------------------------------------------------------

--
-- 表的结构 `syst_cattype`
--

CREATE TABLE IF NOT EXISTS `syst_cattype` (
  `id` int(11) NOT NULL COMMENT '自动编号',
  `ctname` int(100) NOT NULL COMMENT '分类模型名称',
  `ctindex` varchar(100) character set ucs2 NOT NULL COMMENT '分类模型索引文件',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类模型信息表';

-- --------------------------------------------------------

--
-- 表的结构 `syst_config`
--

CREATE TABLE IF NOT EXISTS `syst_config` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '自动编号',
  `group_id` smallint(3) unsigned default '1' COMMENT '分组ID',
  `var_name` char(30) default NULL COMMENT '变量名',
  `var_info` varchar(200) default NULL COMMENT '提示文',
  `var_value` varchar(255) NOT NULL COMMENT '变量值',
  `var_type` char(30) default 'string' COMMENT '变量类型',
  `var_rmark` varchar(255) NOT NULL COMMENT '变量备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统配置项信息表' AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `syst_config`
--

INSERT INTO `syst_config` (`id`, `group_id`, `var_name`, `var_info`, `var_value`, `var_type`, `var_rmark`) VALUES
(1, 1, 'site_url', '网站地址', 'http://systacm.com/', 'string', '尾部不带''/'''),
(2, 1, 'site_name', '网站名称', '盛艺网络科技有限公司', 'string', ''),
(3, 1, 'html_path', '文档HTML默认保存路径', '/html', 'string', ''),
(4, 1, 'upload_path', '图片/上传文件默认路径', '/uploadfile', 'string', ''),
(5, 1, 'default_theme', '模板默认风格', 'default', 'string', ''),
(6, 1, 'site_desc', '网站描述', '盛艺科技开发设计中心', 'bigstring', ''),
(7, 1, 'site_copyright', '网站版权信息', 'Copyright 盛艺网络科技有限公司  版权所有', 'string', ''),
(8, 1, 'site_icp', '网站备案号', '粤公网安备11010920225256 粤ICP备  粤ICP备10073791号-4', 'string', ''),
(9, 1, 'site_time', '服务器时区设置', '8', 'int', ''),
(10, 1, 'database_type', '数据库类型', 'mysql', 'string', ''),
(11, 1, 'page_size', '默认分页大小', '12', 'int', ''),
(12, 3, 'upload_imgtype', '允许上传的图片类型', 'jpg|gif|png', 'string', ''),
(13, 3, 'upload_softtype', '允许上传的软件类型', 'zip|gz|rar|iso|doc|xsl|ppt|wps', 'string', ''),
(14, 3, 'upload_mediatype', '允许上传的视频类型', 'swf|mpg|mp3|rm|rmvb|wmv|wma|wav|mid|mov', 'string', ''),
(15, 3, 'user_headport_size', '会员上传头像大小限制(单位：KB)', '50', 'int', ''),
(16, 1, 'cookie_code', 'cookie加密码', 'SDF90EF3OSDF', 'string', ''),
(17, 1, 'admin_email', '管理员邮箱', 'rodeyluo@gmail.com', 'string', ''),
(18, 2, 'water_masker_path', '水印文件地址', '/uploadfile/water_masker.png', 'string', ''),
(19, 2, 'water_masker_size', '水印文件大小', '100,50', 'string', '格式：宽度,高度'),
(20, 2, 'water_masker_pos', '水印位置', '3', 'int', '1：左上；2：右上；3：右下；4：左下；5：上中；6：右中；7：下中；8：左中；9：正中'),
(21, 4, 'email_host', '邮件服务器', 'smtp.qq.com', 'string', ''),
(22, 4, 'email_port', '邮件发送端口', '25', 'string', ''),
(23, 4, 'email_from_addr', '发件人邮箱', 'rodeyluo@gmail.com', 'string', '发件人邮箱地址'),
(24, 4, 'email_from_pass', '发送人密码', '8289732916!', 'string', '发送人邮箱密码'),
(25, 4, 'email_from_name', '发送人名称', 'Rodey', 'string', ''),
(26, 4, 'email_is_authlogin', '是否开启AUTH LOGIN验证', '1', 'bool', ''),
(31, 6, 'mb_open', '是否开启会员功能', '1', 'bool', ''),
(32, 6, 'mb_namin', '用户账号最小长度', '3', 'int', ''),
(33, 6, 'mb_pwmin', '用户密码最小长度', '6', 'int', ''),
(34, 6, 'mb_spacesta', '会员使用权限开通状态', '0', 'int', '1 邮件验证 2 手工审核, 0 没限制'),
(35, 6, 'mb_mail_require', '是否限制Email只能注册一个帐号', '1', 'string', '1:是;0:否'),
(36, 6, 'mb_reginfo', '注册是否需要完成详细资料的填写', '1', 'string', '1:是;0:否'),
(37, 6, 'mb_notallow', '不允许注册的会员账号名称', 'www,bbs,ftp,mail,user,users,admin,administrator', 'bigstring', ''),
(38, 1, 'site_lang', '网站语种', 'cn', 'string', ''),
(39, 8, 'is_log', '是否启用后台管理操作日志', '1', 'bool', '1:开启;0:关闭'),
(40, 8, 'log_path', '保存错误日志', '/data/logs', 'string', ''),
(41, 8, 'log_warm_size', '错误日志预警大小', '20', 'int', '单位( M )'),
(42, 8, 'admin_login_num', '后台最大登陆失败次数', '5', 'int', '防止攻击登录，限制重试登录次数'),
(43, 8, 'refresh_space', '连续两次刷新最短间隔', '2', 'int', '单位( 秒 )'),
(44, 8, 'is_debug', '是否开启调试模式', '0', 'bool', '1:开启;0:关闭'),
(45, 8, 'is_cache', '是否开启缓存', '1', 'bool', '1:开启;0:关闭'),
(46, 8, 'chace_path', '缓存文件路径', '/temps/cache', 'string', ''),
(47, 4, 'email_type', '邮件发送模式', '1', 'int', '1:SMTP 函数发送; 0:Mail模块发送'),
(50, 6, 'my_css', '新增测试', 'css', 'string', '');

-- --------------------------------------------------------

--
-- 表的结构 `syst_download`
--

CREATE TABLE IF NOT EXISTS `syst_download` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编码',
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
  `views` int(11) NOT NULL default '0' COMMENT '浏览次数',
  `totaldowns` int(11) NOT NULL default '0' COMMENT '总下载次数',
  `todaydowns` int(11) NOT NULL default '0' COMMENT '当天下载次数',
  `weekdowns` int(11) NOT NULL default '0' COMMENT '周下载次数',
  `monthdowns` int(11) NOT NULL default '0' COMMENT '月下载次数',
  `source` varchar(255) NOT NULL COMMENT '来源',
  `linkto` varchar(255) NOT NULL COMMENT '连接地址',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `pics` varchar(255) NOT NULL COMMENT '展示图',
  `grade` varchar(11) NOT NULL COMMENT '评分',
  `comments` int(11) NOT NULL COMMENT '评论数',
  `sort` int(11) NOT NULL default '0' COMMENT '排序',
  `is_html` int(11) NOT NULL COMMENT '是否生成静态HTML',
  `seo_title` varchar(255) NOT NULL COMMENT '页面标题',
  `seo_keyword` varchar(255) NOT NULL COMMENT '关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT '页面描述',
  `url_rule` varchar(255) NOT NULL COMMENT 'URL规则',
  `disabled` tinyint(1) unsigned default '1' COMMENT '状态；1：可用;0：不可用',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `my_ename9` char(30) NOT NULL COMMENT '英文名字',
  `my_ename8` int(20) NOT NULL default '1' COMMENT '英文名字',
  `my_ename4` char(30) NOT NULL COMMENT '英文名字',
  `my_ename2` int(20) NOT NULL default '1' COMMENT '英文名字',
  `verify` int(11) NOT NULL default '1' COMMENT '审核，0：未审核；1：已审核；2：审核通过；3：未通过',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `my_vesion` char(10) NOT NULL COMMENT '版本号',
  `my_classtype` char(30) NOT NULL COMMENT '软件类型',
  `my_lang` char(10) NOT NULL COMMENT '软件语言',
  `my_copytype` char(30) NOT NULL COMMENT '软件授权方式',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章信息表' AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- 表的结构 `syst_flinks`
--

CREATE TABLE IF NOT EXISTS `syst_flinks` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `link_title` char(100) NOT NULL COMMENT '站点名称',
  `link_logo` char(200) NOT NULL COMMENT '站点logo',
  `link_intro` char(200) NOT NULL COMMENT '站点简介',
  `linkto` char(200) NOT NULL COMMENT '站点地址',
  `disabled` tinyint(1) NOT NULL default '1' COMMENT '状态;1:显示;0:不显示',
  `sort` smallint(5) NOT NULL COMMENT '排序',
  `author` char(50) NOT NULL COMMENT '添加者',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情连接信息表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `syst_flinks`
--

INSERT INTO `syst_flinks` (`id`, `link_title`, `link_logo`, `link_intro`, `linkto`, `disabled`, `sort`, `author`, `add_time`) VALUES
(2, '华锋E路航', 'http://www.szhff.com/Images/szhff-logo.png', '', 'http://www.szhff.com', 1, 0, 'rodey', 1364629997),
(3, '华锋E途', 'http://www.etugps.com/upload/images/201208/13462329564438.png', '', 'http://www.etugps.com', 1, 0, 'rodey', 1364660774),
(4, 'E途商城', 'http://www.etu100.com/images/default/20130110/3b6b9489824a9ffb.png', '', 'http://www.etu100.com', 1, 0, 'rodey', 1364660920),
(5, 'E途分享站', 'http://bbs.etu100.com/static/image/common/elogo.png', '', 'http://bbs.etu100.com', 1, 0, 'rodey', 1364660987),
(7, 'PHP Class', 'http://files.phpclasses.org/graphics/phpclasses/logo-phpclasses.png', '', 'http://www.phpclasses.org', 0, 0, 'rodey', 1364661997);

-- --------------------------------------------------------

--
-- 表的结构 `syst_ips`
--

CREATE TABLE IF NOT EXISTS `syst_ips` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ip` char(15) default NULL COMMENT 'ip地址',
  `action` varchar(255) NOT NULL COMMENT '对应的操作',
  `disabled` tinyint(1) default '1' COMMENT '状态；1：启用；0：禁用',
  `add_time` int(30) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='IP地址管理信息表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `syst_keyword`
--

CREATE TABLE IF NOT EXISTS `syst_keyword` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `keyword_name` varchar(50) NOT NULL COMMENT '关键字名字',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='关键字信息表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `syst_keyword`
--

INSERT INTO `syst_keyword` (`id`, `keyword_name`, `add_time`) VALUES
(3, '工作ing', 1363596523),
(4, '生活ing', 1363596523),
(5, '编程ing', 1363596523),
(7, '购物ing', 1363596811),
(8, '体育', 1363596811),
(9, '新闻', 1363596811),
(10, '两会', 1363596811),
(11, '健康', 1363596811),
(12, '汽车', 1363596811),
(13, 'IT', 1363596811),
(15, '美女', 1365743238),
(16, '汽车', 1365743238),
(17, '体育', 1365743238),
(18, '健美', 1365743238),
(19, '健康', 1365743238),
(20, '医疗', 1365743238),
(21, '设计', 1365743238),
(22, '开发', 1365743238),
(23, '军事', 1365743238),
(24, '新闻', 1365743238),
(25, '海报', 1365743238),
(26, '生活', 1365743238),
(27, '感情', 1365743238);

-- --------------------------------------------------------

--
-- 表的结构 `syst_level`
--

CREATE TABLE IF NOT EXISTS `syst_level` (
  `id` int(11) NOT NULL auto_increment COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `value` tinyint(1) NOT NULL default '0' COMMENT '值 0:游客;1:初级会员;2:中级会员;3:高级会员;4:VIP会员',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户级别表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `syst_level`
--

INSERT INTO `syst_level` (`id`, `name`, `value`) VALUES
(1, '游客', 0),
(2, '初级会员', 1),
(3, '中级会员', 2),
(7, 'VIP会员', 4),
(6, '高级会员', 3);

-- --------------------------------------------------------

--
-- 表的结构 `syst_log`
--

CREATE TABLE IF NOT EXISTS `syst_log` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '自动编号',
  `module` char(15) default NULL COMMENT '所属模块',
  `action` char(15) default NULL COMMENT '操作名称',
  `massage` varchar(255) NOT NULL COMMENT '日志信息',
  `state` tinyint(1) unsigned NOT NULL default '1' COMMENT '日志状态; 0:错误;1:成功;2:警告;3:未知',
  `aclink` char(200) NOT NULL COMMENT '操作地址',
  `ip` char(15) NOT NULL COMMENT 'ip地址',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `add_time` int(20) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统日志信息表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `syst_log`
--

INSERT INTO `syst_log` (`id`, `module`, `action`, `massage`, `state`, `aclink`, `ip`, `user_id`, `add_time`) VALUES
(1, '系统配置', '生成配置文件', '生成配置文件成功', 1, '', '127.0.0.1', 2, 1365956825),
(2, '系统配置', '生成配置文件', '生成配置文件成功', 1, '', '127.0.0.1', 2, 1365957104);

-- --------------------------------------------------------

--
-- 表的结构 `syst_manager`
--

CREATE TABLE IF NOT EXISTS `syst_manager` (
  `id` int(11) NOT NULL auto_increment COMMENT '编号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `role` int(11) NOT NULL COMMENT '角色id',
  `aname` varchar(50) NOT NULL COMMENT '管理员名称',
  `apass` varchar(40) NOT NULL COMMENT '管理员密码',
  `disabled` tinyint(1) NOT NULL default '1' COMMENT '是否禁用',
  `last_login_time` int(30) NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(30) NOT NULL COMMENT '最后登录IP',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台管理员表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `syst_manager`
--

INSERT INTO `syst_manager` (`id`, `uid`, `role`, `aname`, `apass`, `disabled`, `last_login_time`, `last_login_ip`) VALUES
(1, 2, 1, 'rodey', 'b912c48273352ac2e82dee2c8f21863c', 1, 1362460566, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `syst_notice`
--

CREATE TABLE IF NOT EXISTS `syst_notice` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `title` varchar(150) NOT NULL COMMENT '公告标题',
  `content` text NOT NULL COMMENT '公告内容',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `disabled` tinyint(1) NOT NULL default '1' COMMENT '状态；1:显示；0:隐藏',
  `start_time` int(11) NOT NULL COMMENT '发布时间',
  `end_time` int(11) NOT NULL COMMENT '截至时间',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  `update_time` int(30) NOT NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='公告信息表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `syst_notice`
--

INSERT INTO `syst_notice` (`id`, `title`, `content`, `author`, `disabled`, `start_time`, `end_time`, `add_time`, `update_time`) VALUES
(1, '平安保险护航  华锋E路航&E途金牌品质', '<p>平安保险护航 &nbsp;华锋E路航&amp;E途金牌品质</p>', 'rodey', 1, 1387795200, 1387968000, 1363934753, 1363948826),
(2, '地方斯蒂芬', '<p>对斯蒂芬啊是发放</p>', 'rodey', 0, 1363948375, 1364293800, 1363948407, 0);

-- --------------------------------------------------------

--
-- 表的结构 `syst_role`
--

CREATE TABLE IF NOT EXISTS `syst_role` (
  `id` int(11) NOT NULL auto_increment COMMENT '编码',
  `name` varchar(30) NOT NULL COMMENT '角色名称',
  `level` varchar(30) NOT NULL COMMENT '角色级别',
  `module` varchar(255) NOT NULL COMMENT '模块权限',
  `method` varchar(200) NOT NULL COMMENT '权限',
  `disabled` tinyint(1) NOT NULL default '1' COMMENT '是否禁用',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `syst_role`
--

INSERT INTO `syst_role` (`id`, `name`, `level`, `module`, `method`, `disabled`, `add_time`) VALUES
(1, '超级管理员', '1', 'all', 'c,u,r,d', 1, 0),
(4, '站点管理员', '2', 'user,catgory,news,archive,notice', 'c,u,r,d', 1, 0),
(3, '用户管理', '3', 'user,user_group', 'c,u,r,d', 1, 0),
(5, '内容管理', '4', 'archive', 'c,u,r,d', 1, 0),
(11, '商城管理', '5', 'user,order,archive,goods,union,active,note', 'c,u,r,d', 1, 0),
(12, '订单管理', '5', 'goods,order', 'c,u,r,d', 1, 0),
(13, '文章管理', '6', 'archive', 'c,u,r,d', 1, 0),
(14, '焦点图管理', '7', 'banner', 'c,u,r', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `syst_scores`
--

CREATE TABLE IF NOT EXISTS `syst_scores` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `ranks` char(15) NOT NULL COMMENT '头衔级别',
  `stars` smallint(6) NOT NULL COMMENT '星星数',
  `points` int(10) NOT NULL COMMENT '积分数',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='积分头衔信息表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `syst_scores`
--

INSERT INTO `syst_scores` (`id`, `ranks`, `stars`, `points`, `add_time`) VALUES
(2, '列兵', 1, 0, 1364584540),
(3, '班长', 2, 1000, 1364584540),
(4, '少尉', 3, 2000, 1364584540),
(5, '中尉', 4, 3000, 1364584540),
(6, '上尉', 5, 4000, 1364584540),
(7, '少校', 6, 5000, 1364584540),
(8, '中校', 7, 6000, 1364584540),
(9, '上校', 8, 9000, 1364584540),
(10, '少将', 9, 14000, 1364584540),
(11, '中将', 10, 19000, 1364584540),
(12, '上将', 11, 24000, 1364584540),
(15, '大将', 12, 29000, 1364584540);

-- --------------------------------------------------------

--
-- 表的结构 `syst_sms`
--

CREATE TABLE IF NOT EXISTS `syst_sms` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '自动编号',
  `from_id` int(10) unsigned default NULL COMMENT '发送人',
  `to_id` int(10) unsigned default NULL COMMENT '接收人',
  `title` char(100) default NULL COMMENT '标题',
  `content` varchar(255) default NULL COMMENT '内容',
  `type` tinyint(1) unsigned default '1' COMMENT '类型;1:单条;2:群发',
  `add_time` int(30) unsigned NOT NULL COMMENT '发送时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='短消息信息表' AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `syst_sms`
--

INSERT INTO `syst_sms` (`id`, `from_id`, `to_id`, `title`, `content`, `type`, `add_time`) VALUES
(2, 2, 35, 'dfgsdfg', 'dfgsdfgsdfgsdfgsdf', 1, 0),
(3, 2, 69, '呃呃呃', 'adfadsfasdfasdf', 1, 1365528307),
(4, 2, 68, '是的发生地方', '阿斯多夫阿斯多夫', 1, 1365535344),
(6, 2, 15, '啊的说法是地方', '阿斯多夫啊', 1, 1365536067),
(7, 2, 67, '阿萨德发放', '规范的规范化东莞', 1, 0),
(10, 2, 67, '的发丝得法', '阿斯顿法', 1, 0),
(13, 2, 69, '啊多发', '但是', 1, 0),
(16, 2, 69, '速读法', '爱的色放啊', 1, 0),
(32, 2, 68, '广告歌', '广告歌', 1, 1365537710),
(31, 2, 67, '广告歌', '广告歌', 1, 1365537710),
(47, 2, 69, '群发的', '测试群发的', 1, 1365608033),
(48, 2, 68, '群发的', '测试群发的', 1, 1365608033),
(49, 2, 2, 'sdasdf', 'asdfasdfasd', 2, 1365609291);

-- --------------------------------------------------------

--
-- 表的结构 `syst_tag`
--

CREATE TABLE IF NOT EXISTS `syst_tag` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编码',
  `tag_name` varchar(50) NOT NULL COMMENT '标签名称',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='tag标签信息表' AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `syst_tag`
--

INSERT INTO `syst_tag` (`id`, `tag_name`, `add_time`) VALUES
(13, '官方', 1365743409),
(14, '会更好', 1365743409),
(15, '问问', 1365743409),
(16, '菜单', 1365743409),
(17, '搞好', 1365743409),
(18, '为的', 1365743409),
(19, '一天', 1365743409),
(20, '进空间', 1365743409),
(21, '啊啊', 1365743409),
(22, '相册陈', 1365743409),
(24, '希望', 1365743409),
(25, '不过', 1365743409),
(26, '您好', 1365743409),
(27, '满级', 1365743409),
(28, '而都', 1365743409),
(29, '提供', 1365743409),
(30, '以后', 1365743409),
(31, '我给', 1365743409),
(32, '东莞', 1365743409),
(33, '群发', 1365743409),
(34, '哈根', 1365743409),
(35, '觉得', 1365743409),
(36, '看到', 1365743409),
(37, '速读法', 1365743530);

-- --------------------------------------------------------

--
-- 表的结构 `syst_user`
--

CREATE TABLE IF NOT EXISTS `syst_user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '账号',
  `pass` varchar(128) NOT NULL COMMENT '密码',
  `email` varchar(100) default NULL COMMENT '邮箱',
  `nick_name` varchar(100) NOT NULL COMMENT '用户昵称',
  `true_name` varchar(30) NOT NULL COMMENT '真实姓名',
  `sex` tinyint(1) NOT NULL default '0' COMMENT '性别，0:保密;1:男;2:女',
  `birthday` int(30) default NULL COMMENT '生日',
  `address` varchar(200) default NULL COMMENT '联系地址',
  `phone` varchar(11) default NULL COMMENT '手机号码',
  `tel` varchar(20) default NULL COMMENT '电话号码',
  `intro` varchar(200) default NULL COMMENT '用户简介',
  `signa` varchar(200) default NULL COMMENT '用户签名',
  `headport` varchar(200) default NULL COMMENT '用户头像',
  `user_group` int(11) NOT NULL default '1' COMMENT '用户组',
  `point` int(11) NOT NULL default '0' COMMENT '积分',
  `money` decimal(8,2) NOT NULL COMMENT '金额',
  `activate` tinyint(1) NOT NULL default '0' COMMENT '是否激活，0：未激活；1已激活',
  `token` varchar(32) NOT NULL COMMENT '激活码',
  `ip` varchar(30) default NULL COMMENT '注册IP',
  `level` int(11) NOT NULL COMMENT '用户级别',
  `disabled` tinyint(1) NOT NULL default '1' COMMENT '是否禁用',
  `reg_time` int(30) default NULL COMMENT '注册时间',
  `last_login_time` int(30) default NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(30) NOT NULL COMMENT '上次登录IP',
  `update_time` int(30) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户会员信息表' AUTO_INCREMENT=70 ;

--
-- 转存表中的数据 `syst_user`
--

INSERT INTO `syst_user` (`id`, `name`, `pass`, `email`, `nick_name`, `true_name`, `sex`, `birthday`, `address`, `phone`, `tel`, `intro`, `signa`, `headport`, `user_group`, `point`, `money`, `activate`, `token`, `ip`, `level`, `disabled`, `reg_time`, `last_login_time`, `last_login_ip`, `update_time`) VALUES
(2, 'rodey', 'b912c48273352ac2e82dee2c8f21863c', 'rodeyluo@gmail.com', '天蝎飞碟', '罗勇', 1, 1361980800, '深圳市罗湖区泥岗西村', '13723722479', '0755-21671712', '来自江西吉安盘谷镇坛山园村5566', '像风一样自由！', 'uploadfile/users/headport/100/user_13633632008391.png', 5, 465, '1552.00', 0, '0', '127.0.0.1', 4, 1, 1362044903, 1365952405, '127.0.0.1', 1363381078),
(37, 'Luo', '92faf1e066218c71c780ea2240d17bec', 'looyoohoo@gmail.com', '蓝海之燕', '李海燕', 2, 687369600, '深圳市罗湖区泥岗西村5栋701室', '13723722479', '0755-21671712', '来自江西吉安盘谷镇官家村', '像风一样自由！', NULL, 1, 5000, '0.00', 0, '0', NULL, 4, 0, NULL, NULL, '', 1363256791),
(33, 'Luo', 'c78b6663d47cfbdb4d65ea51c104044e', 'luoy@szhff.com', '子艺书怀', '罗子艺', 1, 1363276800, '深圳市罗湖区泥岗西村', '13723722479', '0755-21671712', '', '', NULL, 1, 400, '0.00', 0, '0', NULL, 4, 1, NULL, NULL, '', 1363325352),
(36, 'Luo', '0144712dd81be0c3d9724f5e56ce6685', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'uploadfile/users/headport/100/user_13633632007237.gif', 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(34, 'Luo', '098765', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'uploadfile/users/headport/100/user_13633632009725.gif', 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(35, 'Luo', '0144712dd81be0c3d9724f5e56ce6685', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'uploadfile/users/headport/100/user_13633632003420.png', 1, 0, '0.00', 0, '0', NULL, 0, 0, NULL, NULL, '', NULL),
(30, 'LiHY', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'uploadfile/users/headport/100/user_13633632006818.gif', 1, 0, '0.00', 0, '0', NULL, 0, 0, NULL, NULL, '', NULL),
(27, 'LiHY', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(28, 'LiHY', 'b912c48273352ac2e82dee2c8f21863c', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'uploadfile/users/headport/100/user_13633632009324.png', 1, 0, '0.00', 0, '0', NULL, 0, 0, NULL, NULL, '', NULL),
(13, 'rodey', '1b08a4fe8ab0b8cb04b676f892964375', 'soo_oo@yahoo.cn', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(14, 'rodey', '828972916', 'soo_oo@yahoo.cn', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(15, 'LuoYong', '723fe959c3e96e188c4d613842d6f918', '453474593@qq.com', '蓝海之燕', '', 0, 1363276800, '', '13723722479', '', '', '', 'uploadfile/users/headport/100/user_13633632006024.png', 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', 1363418545),
(16, 'rodey', '1b08a4fe8ab0b8cb04b676f892964375', 'soo_oo@yahoo.cn', '', '', 0, 25, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(21, 'rodey', '828972916', 'soo_oo@yahoo.cn', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(22, 'rodey', '828972916', 'soo_oo@yahoo.cn', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(23, 'rodey', '828972916', 'soo_oo@yahoo.cn', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(24, 'rodey', '828972916', 'soo_oo@yahoo.cn', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(25, 'rodey', '828972916', 'soo_oo@yahoo.cn', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(38, 'Luo', '098765', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(39, 'Luo', '098765', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(40, 'Luo', '098765', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(41, 'Luo', '098765', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(42, 'Luo', '098765', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(43, 'Yong', '438955454', '84dfasdf@gmail.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(44, 'Luo', '098765', '90809df@qq.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(45, 'Yong', '438955454', '84dfasdf@gmail.com', '', '', 0, 25, NULL, '12723722479', NULL, 'My name is Rodey!', NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(49, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(48, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(50, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(51, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(52, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(53, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(54, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(55, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(56, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(57, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(60, '李海燕', '123456', 'li@3434.com', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '0.00', 0, '0', NULL, 0, 1, NULL, NULL, '', NULL),
(67, 'haiy', 'd8406e8445cc99a16ab984cc28f6931615c766fc', 'haiy@gmail.com', 'haiy', '', 2, NULL, '', '13723722479', '0755-21671712', '', '', NULL, 1, 0, '0.00', 0, '0', '127.0.0.1', 0, 1, 1363241108, NULL, '', NULL),
(68, '香港华锋', 'd8406e8445cc99a16ab984cc28f6931615c766fc', 'luoy@szhff.com', '香港华锋', '香港华锋', 1, 2009, '深圳市南山区科技园德赛科技大厦', '13723722479', '0755-21671712', '香港华锋实业有限公司', 'GPS品牌', 'uploadfile/users/headport/100/user_13633632006735.gif', 1, 0, '0.00', 0, '', '127.0.0.1', 4, 1, 1363247924, NULL, '', NULL),
(69, 'e途商城', 'd8406e8445cc99a16ab984cc28f6931615c766fc', 'rodey@etu100.com', 'e途商城', 'e途商城', 2, 2013, '深圳市南山区科技园德赛科技大厦', '13723722479', '0755-21671712', 'e途商城', 'e途商城', NULL, 1, 0, '0.00', 0, '', '127.0.0.1', 4, 1, 1363248622, NULL, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `syst_user_group`
--

CREATE TABLE IF NOT EXISTS `syst_user_group` (
  `id` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `name` varchar(100) NOT NULL COMMENT '用户组名称',
  `value` int(11) NOT NULL COMMENT '用户组值',
  `point` int(11) NOT NULL COMMENT '积分数',
  `sort` int(11) NOT NULL COMMENT '排序',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `disabled` tinyint(1) NOT NULL default '1' COMMENT '是否禁用，1：启用；0：禁用',
  `add_time` int(30) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户组信息表' AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `syst_user_group`
--

INSERT INTO `syst_user_group` (`id`, `name`, `value`, `point`, `sort`, `icon`, `disabled`, `add_time`) VALUES
(2, '新手上路', 1, 20, 0, '', 1, 0),
(3, '初级会员', 2, 50, 0, '', 1, 0),
(4, '中级会员', 3, 100, 0, '', 1, 0),
(5, '高级会员', 4, 150, 0, '', 1, 0),
(7, '手机认证', 6, 150, 0, '', 1, 0),
(8, '社区绑定', 7, 150, 0, '', 1, 0),
(9, '禁止访问', 8, -50, 0, '', 0, 0),
(10, '天外飞仙', 1, 2000, 0, '', 1, 0),
(11, '仁者无敌', 1, 1000, 0, '', 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
