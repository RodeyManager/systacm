(function (config) {
    config['lock'] = true;
    config['fixed'] = true;
    config['okVal'] = '提交';
    config['cancelVal'] = '取消';
    // [more..]
})(art.dialog.defaults);

$(document).ready(function(){
	var dw = $(document).width();
	var dh = $(document).height();
	//开始布局
	win_reset(dw, dh);
	$(window).bind('resize', function(){
		win_reset(dw, dh); //重置布局
	});
	
	//缩进
	/*$('#aopen').click(function(){
		if($(this).hasClass('aopen')){
			$('#aleft').stop().animate({left:-180});
			$(this).removeClass('aopen');
			$(this).addClass('aclose');
			$('#amain').animate({width: dw});
		}else{
			$('#amain').animate({width: dw - $('#aleft').width() - 2});
			$('#aleft').stop().animate({left:0});
			$('#amain-left-con').stop().animate({left:0});
			$(this).removeClass('aclose');
			$(this).addClass('aopen');
		}
	});*/
	
	//获取当前时间
	$('#now-time').css('display', 'none');
	setInterval(function(){
		getNow(new Date(), $('#now-time'));
	}, 1000);
	setTimeout(function(){
		$('#now-time').fadeIn();
	}, 1000);
	//设置闹钟
	var isClock = false;
	var clockTime = '';
	$('#set-clock').click(function(){
		window.top.art.dialog.prompt('输入一个整数代表多少分钟提醒：', function(data){
			$('#set-clock').data('tvalue', data);
			tipCC(Number(data)*60*1000);
		}, '30');
	});
	
	//Top-nav
	$('.atop-nav-list li').click(function(){
		if($(this).hasClass('on-current')) return;
		$('.atop-nav-list li').removeClass('on-current');
		$(this).addClass('on-current');
	});
	
});

function tipCC(timer){
	var s = setInterval(function(){ alert(timer); clearInterval(s); }, timer);
}

function win_reset( dw, dh){
	var atop = $('#atop').height();
	var aleft = $('#aleft').width();
	$('#aleft').height(dh - atop - 2);
	$('#amain').width(dw - aleft - 2);
	$('#amain').height($('#aleft').height());
	$('#amain-right-con').width($('#amain').width() - $('#amain-left-con').width() - 10);
	$('#amain-right-con').height($('#amain').height() - 10);
	$('#right-content').height($('#amain').height() - $('#right-header-position').height());
	$('#con-loader').height($('#right-content').height() - 10);
}




//左侧菜单
function _M(url){
	$('#con-loader').attr('src', url);
}

function _P(arr){
	var url = arr.url;
	var id = arr.id;
	var type = arr.type ? arr.type : 'POST';

	$.ajax({
		type : type,
		url  : url,
		data : {id: id},
		success: function(data){
			if(data === 'OK')
				return true;
			else 
				return false;
		},
		error: function(data){return false;}
	});
}


function getNow(date, obj){
		//var ntime = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var today = date.getDate();
		var day = date.getDay();
		var h = date.getHours();
		var m = date.getMinutes();
		var s = date.getSeconds();
		
		if(month < 10) month = '0'+month;
		if(today < 10) today = '0'+today;
		if(h < 10) h = '0'+h;
		if(m < 10) m = '0'+m;
		if(s < 10) s = '0'+s;
		
		var days = new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六');
		
		var time_str = year + '年' + month + '月' + today + '号' + ' ' + h + ':' + m + ':' + s + ' ' + days[day];
		obj.html(time_str);
}