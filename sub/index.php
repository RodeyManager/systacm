<?php
$link = mysql_connect('localhost','root','8289732916') or die(@mysql_error());

mysql_select_db('systacm', $link) or die(@mysql_error());

mysql_query('SET NAMES utf8;');

$sql = "SELECT * FROM `syst_user`";

$data = mysql_query($sql);
Echo '<pre>';
while($row = mysql_fetch_array($data)){
	print_r($row);
}

//insert

/* $insert_sql = "INSERT INTO syst_user(name, pass, email) VALUES ('华锋', '8289732916', 'rodeyluo@gmail.com')";

$data = mysql_query($insert_sql);

print_r($data); */

Echo '</pre>';