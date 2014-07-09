<!DOCTYPE html>
<html>
<head>
	<title>系统出错！</title>
	<style type="text/css">
	body{
		padding:0px;
		margin: :0px;
		font-size: 12px;
		font-family: Microsoft YaHei;
		font-weight: bold;
		color: #009900;

	}
	.main {
		position: relative;
		width: 900px;
		margin: 0 auto;
		margin-top: 100px;
		padding: 20px 10px;
		border: #009900 solid 1px;
		box-shadow: 0px 1px 3px 1px rgba(200,200,200,0.8);
		-webkit-box-shadow: 0px 1px 3px 1px rgba(200,200,200,0.8);
	}
	.main span{
		display:block;
		font-size: 16px;
		color: red;
		background: white;
		position: absolute;
		top: -10px;
		left: 20px; 
	}
	</style>
</head>
<body>
	<div class="main">
		<span>系统错误信息：</span>
		<?php Echo $message; ?>
	</div>
</body>
</html>