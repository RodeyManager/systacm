<?php /* Smarty version Smarty-3.1.13, created on 2014-04-29 20:16:49
         compiled from "E:\Nupupw\htdocs\systacm\apps\default\views\footer.html" */ ?>
<?php /*%%SmartyHeaderCode:5483535f9831e1a824-57319064%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e5d4752d48880341c4a6601d5e641e82ea8a0dab' => 
    array (
      0 => 'E:\\Nupupw\\htdocs\\systacm\\apps\\default\\views\\footer.html',
      1 => 1379168982,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5483535f9831e1a824-57319064',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    '__CURL__' => 0,
    '__TOKEN__' => 0,
    '__UPLOAD__' => 0,
    '__AIMAGES__' => 0,
    '__BASE__' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_535f9831e584e8_85935807',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_535f9831e584e8_85935807')) {function content_535f9831e584e8_85935807($_smarty_tpl) {?><?php if (!is_callable('smarty_function_powerby')) include 'E:\\Nupupw\\htdocs\\systacm\\libs\\plugins\\smarty\\plugins\\function.powerby.php';
?>
	<!-- Footer Start -->
	<div class="footer" id="footer">
		<div class="footer-con">
			<div class="f-left-cominfo">
				<span><?php echo smarty_function_powerby(array('link'=>'copyright'),$_smarty_tpl);?>
<a href="http://www.miitbeian.gov.cn/" target="_blank"><?php echo smarty_function_powerby(array('link'=>'icp'),$_smarty_tpl);?>
</a></span>
			</div>
			<div class="f-right-u">
				<ul class="f-r-u-ul">
					<li class="f-blog"><a href="http://www.roadey.com" target="_blank" title="官方博客"></a></li>
					<li class="f-sina"><a href="http://weibo.com/systacm/profile" target="_blank" title="新浪微博"></a></li>
					<li class="f-qq"><a href="http://wpa.qq.com/msgrd?v=3&uin=453474593&site=qq&menu=yes" target="_blank" title="商务合作QQ"></a></li>
					<li class="f-dd"><a href="javascript:void(0);" target="_blank" title="点点"></a></li>
					<li class="f-guest"><a href="<?php echo $_smarty_tpl->tpl_vars['__CURL__']->value;?>
contact#pages-comment-div" title="留言给我们"></a></li>
					<li class="f-email"><a href="mailto:rodey@systacm.com?subject=写给盛艺" target="_blank" title="发邮件给我们"></a></li>
				</ul>
			</div>
			<a href="javascript:void(0);" id="go-home" title="返回首页">HOME</a>
			<a href="javascript:void(0);" id="open-footer" title="打开顶部">打开底部</a>
			<a href="javascript:void(0);" id="close-footer" title="关闭顶部">关闭底部</a>
		</div>
		<div class="f-gb-form" id="f-gb-form">
			<div class="f-gb-form-con">
				<div class="f-gb-form-left">
					<div class="f-gb-form-tab">
						<a href="javascript:void(0);" class="f-gb-form-tab-item1 se-on">加微信</a>
						<a href="javascript:void(0);" class="f-gb-form-tab-item2">打电话</a>
						<a href="javascript:void(0);" class="f-gb-form-tab-item3">发邮件</a>
					</div>
					<div class="f-gb-form-codes"></div>
					<span class="f-gb-form-cfo">扫描加微信</span>
				</div>
				<div class="f-gb-form-right">
					<div class="pages-comment-div" id="pages-comment-div">
						<h4 class="p-c-h4 p-c-h4-1">期待合作 -> 提交您的需求给我们，我们会以最快速度回复您！</h4>
						<form action="<?php echo $_smarty_tpl->tpl_vars['__CURL__']->value;?>
comment" onsubmit="return false;" method="POST" class="p-c-form">
							<input type="hidden" name="token" value="<?php echo $_smarty_tpl->tpl_vars['__TOKEN__']->value;?>
"/>
							<p class="subtip" id="subtip">提交您的需求给我们</p>
							<p>
								<input type="text" name="uname" id="uname" class="p-c-input p-c-in" placeholder="您的姓名（Name）*" />
								<input type="text" name="uemail" id="uemail" class="p-c-input p-c-in" placeholder="邮箱地址（Email）*" />
							</p>
							<p>
								<input type="text" name="uphone" id="uphone" class="p-c-input p-c-in" placeholder="电话（Tel Phone）*" />
								<input type="text" name="ucompany" id="ucompany" class="p-c-input p-c-in" placeholder="公司名称（Company）*" />
							</p>
							<p><textarea name="ucomment" id="ucomment" placeholder="您的需求描述？（Please fill in your demand description?）*" class="p-c-textarea p-c-in"></textarea></p>
							<p class="p-c-f-pl">
								<input type="submit" name="usubmit" id="usubmit" value="发送需求" class="p-c-submit" />
								<span>也可以将您的需求信息直接发送至邮箱：<a href="mailto:rodey@systacm.com?subject=写给盛艺需求" class="p-c-email" target="_blank">rodey@systacm.com</a></span>
							</p>
						</form>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="f-gotop">TOP</div>
	<!-- Footer End -->
	<script type="text/javascript">
	$(function(){
		/*var data_pics = new Array(
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__UPLOAD__']->value;?>
/slider/Banner01.jpg', href: '#' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__UPLOAD__']->value;?>
/slider/Banner02.jpg', href: '#' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__UPLOAD__']->value;?>
/slider/Banner03.jpg', href: '#' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__UPLOAD__']->value;?>
/slider/Banner04.jpg', href: '#' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__UPLOAD__']->value;?>
/slider/banner_img7.png', href: '#' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__UPLOAD__']->value;?>
/slider/banner_img8.png', href: '#' }
		);*/
		var data_pics = new Array(
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__AIMAGES__']->value;?>
/index-banners/Banner00.jpg', href: '<?php echo $_smarty_tpl->tpl_vars['__BASE__']->value;?>
', bgcolor: '#E8E335' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__AIMAGES__']->value;?>
/index-banners/Banner01.jpg', href: '#', bgcolor: '#00D1C7' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__AIMAGES__']->value;?>
/index-banners/Banner06.jpg', href: '#', bgcolor: '#BCEB5E' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__AIMAGES__']->value;?>
/index-banners/Banner03.jpg', href: '#', bgcolor: '#00CA79' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__AIMAGES__']->value;?>
/index-banners/Banner04.jpg', href: '#', bgcolor: '#0BB3FF' },
			{ bgimg:'<?php echo $_smarty_tpl->tpl_vars['__AIMAGES__']->value;?>
/index-banners/Banner05.jpg', href: '<?php echo $_smarty_tpl->tpl_vars['__CURL__']->value;?>
server#pages-s-syphp', bgcolor: '#E5E5E5' }
			
		);
		SY.Bmenu({ navDiv:'.nav', listTag: 'a', lineClass: '.nav-bottom-line' });
		SY.Slider({ containerDiv:'.banner', height:350, data: data_pics, time:15000 });
		
	});
	</script>
	</body>
</html><?php }} ?>