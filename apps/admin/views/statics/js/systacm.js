(function(){

});

var SYST = SYST || {};
SYST.INFO = {'version':'1.0 relase', 'author':'Rodey', 'email':'rodeyluo@gmail.com', 'qq':'453474593'};
SYST.getVersion = SYST.INFO.version;
SYST.getAuthor = SYST.INFO.author;
SYST.getEmail = SYST.INFO.email;
SYST.getQQ = SYST.INFO.qq;
SYST.IN_ARRAY = Array.prototype.in_array = function(index){
	for(i=0; i<this.length; i++){  
		if(this[i] == index)  
		return true;  
	}  
	return false;
}
SYST.UPLOAD = function(root, plugins, setting ){
	var scripts = new Array();
	script.push(root+'/statics/js/SWFUpload/swfupload.js');
	script.push(root+'/statics/js/SWFUpload/hanndlers.js');
	plugins = plugins.split(';');
	for (var i = 0; i < plugins.length; i++) {
		script.push(plugins[i]);
	};
	for (var j=0; j<script.length; j++){
		var sel = document.createElement('script');
		sel.type = 'text/javascript';
		sel.src = script[j];
		sel.async = true;
		document.getElementByTagName('head')[0].append(sel);
	}
	var swf;
	var setting = {
		flash_url : setting.flash_url | './SWFUpload/swfupload.swf',
		upload_url: setting.upload_url | './upload',
		file_post_name : swf_set.file_post_name | 'upload_pic',
		post_params : setting.post_params | {},

		// File Upload Settings
		file_size_limit : setting.file_size_limit | '2MB',	// 2MB
		file_types: setting.file_types | '*.*',
		file_types_description: setting.file_types_description | 'All files',
		file_upload_limit : setting.file_upload_limit | '100',
		file_queue_limit : setting.file_queue_limit | '0',
		file_dialog_start_handler : fileDialogStart,
		file_queue_hander : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler: fileDialogComplete,
		upload_start_handler : uploadStart,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,

		// Button Settings
		button_image_url: setting.button_image_url | '/SWFUpload/uploads_btn.png',
		button_placeholder_id : setting.button_placeholder_id | "add_pics_btn",
		button_width: setting.button_width | 130,
		button_height: setting.button_height | 30,
		button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
		button_action: SWFUpload.BUTTON_ACTION.SELECTS_FILE,
		button_cursor: SWFUpload.CURSOR.HAND,
		custom_settings : setting.custom_settings | {
			progressTarget : "fsUploadProgress",
			cancelButtonId : "btnCancel"
		},
        debug: setting.debug | false
	}
	swf = new SWFUpload(setting);
}
//弹窗
function _POP(config){
	var pop = window.top.art.dialog({
		id: config.id | 'SYSTACM_DIALOG',
		title: config.title,
		content: config.content,
		time: config.time ? config.time : 1,
		icon: config.icon ? config.icon: ''
	});
}

