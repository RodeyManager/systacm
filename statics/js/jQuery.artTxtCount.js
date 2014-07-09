(function($){
	// tipWrap: 	提示消息的容器
	// maxNumber: 	最大输入字符
	$.fn.artTxtCount = function(tipWrap, maxNumber){
		var countClass = 'js_txtCount',		// 定义内部容器的CSS类名
			fullClass = 'js_txtFull';		// 定义超出字符的CSS类名
		var value;
		
		// 统计字数
		var count = function(){
			value = $(this).val();
			var val = $(this).val().length;
			if(val <= maxNumber){
				tipWrap.css('color', '#6ABF0F').html('<span class="' + countClass + '">\u8FD8\u80FD\u8F93\u5165 <strong>' + (maxNumber - val) + '</strong> \u4E2A\u5B57</span>');
				if(val == maxNumber){
					tipWrap.css('color', '#CCA933').html('<span class="' + countClass + '">\u4E0D\u53EF\u518D\u8F93\u5165\u4E86,\u8FD8\u80FD\u8F93\u5165 <strong>' + (maxNumber - val) + '</strong> \u4E2A\u5B57</span>');
				}
			}else{
				tipWrap.css('color', '#CC6633').html('<span class="' + countClass + ' ' + fullClass + '">\u5DF2\u7ECF\u8D85\u51FA <strong>' + (val - maxNumber) + '</strong> \u4E2A\u5B57</span>');
				//tipWrap.css('color', '#CC6633').html('<span class="' + countClass + ' ' + fullClass + '">\u4E0D\u53EF\u518D\u8F93\u5165\u4E86</span>');
			};
		};
		var returnErr = function(e){
			val = $(this).val().length;
			if(val >= maxNumber){
				tipWrap.css('color', '#CCA933').html('<span class="' + countClass + ' ' + fullClass + '">\u4E0D\u53EF\u518D\u8F93\u5165\u4E86</span>');
			}
		}

		$(this).bind('keyup change', count);
		$(this).bind('keydown', returnErr);
		
		return this;
	};

})(jQuery);


function strlen_verify(obj, checklen, maxlen) {
	var v = obj.value, charlen = 0, maxlen = !maxlen ? 200 : maxlen, curlen = maxlen, len = strlen(v);
	for(var i = 0; i < v.length; i++) {
		if(v.charCodeAt(i) < 0 || v.charCodeAt(i) > 255) {
			curlen -= charset == 'utf-8' ? 2 : 1;
		}
	}
	if(curlen >= len) {
		$('#'+checklen).html(curlen - len);
	} else {
		obj.value = mb_cutstr(v, maxlen, true);
	}
}
function strlen(str) {
	return ($.browser.msie && str.indexOf('\n') != -1) ? str.replace(/\r?\n/g, '_').length : str.length;
}
function mb_cutstr(str, maxlen, dot) {
	var len = 0;
	var ret = '';
	var dot = !dot ? '...' : '';
	maxlen = maxlen - dot.length;
	for(var i = 0; i < str.length; i++) {
		len += str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255 ? (charset == 'utf-8' ? 3 : 2) : 1;
		if(len > maxlen) {
			ret += dot;
			break;
		}
		ret += str.substr(i, 1);
	}
	return ret;
}
