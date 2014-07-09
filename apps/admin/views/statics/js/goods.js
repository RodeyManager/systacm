var swf_set = {
	file_post_name : "goods_thumbs",
	post_params : {},

	// File Upload Settings
	file_size_limit : "2MB",	// 2MB
	file_types:"*.jpg;*.jpeg;*.png;*.gif;",
	file_types_description:"Web Image Files",
	file_upload_limit : "10",
	file_queue_limit : "0",
	// Button Settings
	button_placeholder_id : "ButtonPlaceholder",
	button_width: 76,
	button_height: 30
};

var parts_list_li;
$(document).ready(function(){
	

	//选择查看图片
	$('.view-pic-img-list-s').live('click', function(){
		$('.view-pic-img-list-box').css({'border':'dashed 1px #C8C8C8'});
		$('.view-pic-img').attr('src', $(this).attr('src'));
		$(this).parent().parent('.view-pic-img-list-box').css({'border':'dashed 1px red'});
	});
});
var goods = goods || {};

goods._VPATH = function(url){};

goods._DEL_PIC = function(id, pic_url){};

