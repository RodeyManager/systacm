<?php /* Smarty version Smarty-3.1.13, created on 2014-04-29 20:16:49
         compiled from "E:\Nupupw\htdocs\systacm\apps\default\views\header_index.html" */ ?>
<?php /*%%SmartyHeaderCode:27326535f9831da1d92-00469527%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '074015662311b8bd310e5a7bf5687561b32e2820' => 
    array (
      0 => 'E:\\Nupupw\\htdocs\\systacm\\apps\\default\\views\\header_index.html',
      1 => 1379113860,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '27326535f9831da1d92-00469527',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'lang' => 0,
    '__BASE__' => 0,
    '__SYSCSS__' => 0,
    '__ACSS__' => 0,
    '__SYSJS__' => 0,
    '__AJS__' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_535f9831e0ff63_09070675',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_535f9831e0ff63_09070675')) {function content_535f9831e0ff63_09070675($_smarty_tpl) {?><?php if (!is_callable('smarty_function_powerby')) include 'E:\\Nupupw\\htdocs\\systacm\\libs\\plugins\\smarty\\plugins\\function.powerby.php';
?><!DOCTYPE html>
<html>
<head>
	<title><?php if ($_smarty_tpl->tpl_vars['title']->value){?><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['lang']->value['title'];?>
<?php }?> - <?php echo smarty_function_powerby(array(),$_smarty_tpl);?>
</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<meta content="telephone=no" name="format-detection" />
	<meta name="keywords" content="<?php echo $_smarty_tpl->tpl_vars['lang']->value['keywords'];?>
" />
	<meta name="description" content="<?php echo $_smarty_tpl->tpl_vars['lang']->value['description'];?>
" />
	<meta name="name" content="rodey" cn-name="天蝎飞碟"/>
	<meta name="email" content="rodeyluo@gmail.com" />
	<meta name="qq" content="453474593" />
	<meta name="mobile phone number" content="13723722479" />
	<meta name="website" content="www.systacm.com | www.roadey.com" />
	<link rel="icon" href="<?php echo $_smarty_tpl->tpl_vars['__BASE__']->value;?>
/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="<?php echo $_smarty_tpl->tpl_vars['__BASE__']->value;?>
/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="<?php echo $_smarty_tpl->tpl_vars['__BASE__']->value;?>
/f-128.png" type="images/x-icon" />
	<link type="text/css" rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['__SYSCSS__']->value;?>
/bootstrap/css/bootstrap.css" />
	<link type="text/css" rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['__ACSS__']->value;?>
/globa.css?v=<?php echo time();?>
" />
	<link type="text/css" rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['__ACSS__']->value;?>
/main.css?v=<?php echo time();?>
" />	
	<!--[if IE]>
	<script src=”http://html5shiv.googlecode.com/svn/trunk/html5.js”></script>
	< ![endif]-->
	<script src="<?php echo $_smarty_tpl->tpl_vars['__SYSJS__']->value;?>
/jquery-1.9.1.min.js?v=<?php echo time()+5;?>
"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['__SYSJS__']->value;?>
/jquery.easing.js?v=<?php echo time()+2;?>
"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['__SYSCSS__']->value;?>
/bootstrap/js/bootstrap.min.js"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['__AJS__']->value;?>
/SY.js?v=<?php echo time();?>
"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['__AJS__']->value;?>
/main.js?v=<?php echo time();?>
"></script>
	<script> var base = '<?php echo $_smarty_tpl->tpl_vars['__BASE__']->value;?>
'; var curl = base + '/default/index/'</script>
</head>
	<?php }} ?>