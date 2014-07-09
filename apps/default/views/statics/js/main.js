/**
 * Author: Rodey
 * E-mail: rodeyluo@gmail.com
 * Date:   2013-05-17
 */

$(document).ready(function(){
	/*var _SY = $;
	var navs = $('.main-con-ul li');
	var navs_arr = navs.toArray();
	var nav_num = navs_arr.length;
	var nav_w = $('.main-con-ul li:first').width();
	var nav_h = $('.main-con-ul li:first').height();
	navs.each(function(){
		var than = $(this);
		than.hover(function(){
			than.find('i').stop().animate({right:5, opacity:1});
		}, function(){
			than.find('i').stop().animate({right:50, opacity:0});
		});
	});*/
	var logo_timer;
	$('#logo').hover(function(){
		logo_timer = setInterval(function(){
			$('#logo').stop().animate({'left':'-81px', 'top':'21px'},10,function(){
				$(this).animate({'left':'-80px','top':'20px'},10,function(){
					$(this).animate({'left':'-79px','top':'21px'},10,function(){
						$(this).animate({'left':'-77px','top':'23px'},10,function(){
							$(this).animate({'left':'-78px','top':'25px'},10,function(){
								$(this).animate({'left':'-79px','top':'27px'},10,function(){
									$(this).animate({'left':'-81px','top':'27px'},10,function(){
										$(this).animate({'left':'-81px','top':'27px'},10,function(){
											$(this).animate({'left':'-80px','top':'24px'},10);
										});
									});
								});
							});
						});
					});
				});
			});			
			$('<i />').css({
				'position':'absolute',
				'display':'block',
				'width':5,
				'height':5,
				'opacity':1,
				'border-radius':'50%',
				'background-color':'white',
				'left':$('#logo').width()/2 + Math.random(),
				'top':$('#logo').position().left + 280 + Math.random()*10
			}).appendTo($('#logo')).animate({'top':40},400).animate({'opacity':0}, 80, function(){$(this).remove();});
			
		},80);
		
	}, function(){ $('#logo').animate({'left':'-80px','top':'24px'},1).stop();clearInterval(logo_timer); });

	$('.banner').hover(function(){
		$(this).find('.btns').fadeIn('slow');
	}, function(){
		$(this).find('.btns').fadeOut('slow');
	})


	//pro-list-a
	$('.pro-list-a').hover(function(){ hin($(this).find('p')); }, function(){ hout($(this).find('p')); });

	function hin(obj){
		obj.stop().animate({'top': '-1245px'},{duration: '2000',easing: 'easeInBounce'});
	}
	function hout(obj){
		obj.stop().animate({'top': '125px'},{duration: '2000',easing: 'easeOutBounce'});
	}

	//page
	$('.page-list').css({ height: $(window).height() - $('.header-con').height() });
	$('.page-list').css({display:'none'});
	$('.page-item').css('display', 'none');
	$('.main').css({ height: $(window).height() - $('.header-con').height() });
	$(window).resize(function(){
		$('.page-list').css({ height: $(window).height() - $('.header-con').height() });
		$('.page-item').animate({'height': $('.page-list').height()*0.8-$('.page-item').css('padding-top')});
		$('.main').css({ height: $(window).height() - $('.header-con').height() });
	});

	$('.pro-list-a').bind('click', function(){
		var than = $(this);
		$('.page-list').show();
		$('.contanier').stop()
			.css('position', 'relative')
			.animate({'top': -($(window).height()-$('.header-con').height())},
				1000,
				'easeOutCirc', 
				function(){
					$('.goBack').css('background-color', $('#'+than.attr('rel')).data('bgcolor'))
						.animate({'top':-25, 'opacity':1}, 500, 'easeOutCirc', function(){
						
					});
					$('.page-item').css('padding-top', $('.page-list').height()*0.2);
					$('#'+than.attr('rel')).animate({'height': $('.page-list').height()*0.8}).fadeIn('slow');
					$('#'+than.attr('rel')).find('.page-left').css({'background-color':$('#'+than.attr('rel')).data('bgcolor')});
					$('#'+than.attr('rel')).find('.page-right').css({'background-color':$('#'+than.attr('rel')).data('bgcolor')});
				});

	});
	$('.goBack').click(function(){
		$('.goBack').animate({'top':500, 'opacity':0}, 500, 'easeOutCirc');
		$('.contanier').stop().css('position', 'relative').animate({'top': 0}, 1000, 'easeOutCirc', function(){
			$('.page-item').hide();
			$('.page-list').hide();
		});
		
	});

	//globa
	$('*[title]').tooltip({ animation: true, placement: 'top' });
	//$("#go-top").click(function(e){ $('html,body').animate({ scrollTop:0 },300); });
	$(".f-gotop").click(function(){ $('html,body').animate({ scrollTop:0 },300); });
	$(window).scroll(function(){
		if($('body').scrollTop() > 100){
			$('.f-gotop').fadeIn('slow');
		}else if($('body').scrollTop() <= 10){
			$('.f-gotop').fadeOut('fast');
		}
		/*if($(document).height() - $(this).scrollTop() - $(this).height() == 0){
			$('#footer').stop().animate({ bottom: 360 });
		}else{
			$('#footer').stop().animate({ bottom: 0 });
		}*/
	});
	//Footer
	var f_flag = true;
	$("#open-footer").click(function(){ open_show(); });
	$("#close-footer").click(function(){ open_hide(); });
	$('.footer-con').bind('dblclick', function(){ if(f_flag){ open_show(); }else{ open_hide(); } });


	//server pages
	$('.pages-s-ol>li>a').click(function(){
		var target = $($(this).data('rel'));
		$('body').animate({ scrollTop:target.offset().top }, 500, 'swing');
	});

	//comment
	$('.p-c-in').click(function(){
		if($(this).hasClass('p-c-border') && $(this).val() != ''){
			$(this).removeClass('p-c-border');
		}else{
			$(this).addClass('p-c-border');
		}
	});

	//submit comment
	$('#usubmit').click(function(){
		if($('#uname').val() == ''){
			_BorderTip_false('#uname', '请填写您的姓名！');
		}else if($('#uemail').val() == ''){
			_BorderTip_false('#uemail', '请填写您的邮箱地址！');
		}else if(!isEmail($('#uemail').val())){
			_BorderTip_false('#uemail', '请填写正确的邮箱地址！');
		}else if($('#uphone').val() == ''){
			_BorderTip_false('#uphone', '请填写您的电话号码！');
		}else if($('#ucompany').val() == ''){
			_BorderTip_false('#ucompany', '请填写您公司/组织/个人的名称！');
		}else if($('#ucomment').val() == ''){
			_BorderTip_false('#ucomment', '请填写您的需求内容！');
		}else{
			_BorderTip_true('.p-c-in');
		}

	});

	//case pages
	$('.p-c-cl-item').hover(function(){
		$(this).find('.p-c-cl-item-i').stop().fadeIn('slow');
	}, function(){
		$(this).find('.p-c-cl-item-i').stop().hide();
	});
	$('.p-c-cl-ul li>a').click(function(){
		if(!$(this).hasClass('s-on')){
			$('.p-c-cl-ul li').find('a').removeClass('s-on');
			$(this).addClass('s-on')
		}
		if($(this).hasClass('s-all')){
			$('.p-c-cl-item-con').find('.p-c-cl-item').stop().fadeIn('slow');
		}else{
			var cat_link = $(this).data('cat');
			$('.p-c-cl-item-con').find('.p-c-cl-item').stop().fadeOut('fast');
			$('.p-c-cl-item-con').find('.item-' + cat_link).stop().fadeIn('slow');
		}
	});

	//about pages
	$('.p-r-a-i-ul li').css('display','none');
	$('.p-r-a-i-ul li:first').css('display','block');
	var uul = $('.p-r-a-t-ul');
	$('.p-r-a-t-ul li').find('.p-r-a-t-gran').each(function(n, item){
		var than = $(this);
		than.hover(function(){
			$('#p-r-a-u-i').stop().animate({ 'left':n*150+65 });
			$('.p-r-a-i-ul li').css('display','none');
			$('.p-r-a-i-ul li').eq(n).fadeIn('slow');
		}, function(){ return; });
	});
	$('.p-r-a-i-ul').hover(function(){ return; }, function(){
		$('#p-r-a-u-i').animate({ 'left':'65' }, 100, 'linear');
		$('.p-r-a-i-ul li').css('display','none');
		$('.p-r-a-i-ul li:first').css('display','block');
	});

	//case pages
	$('.case-pics-list-ul li').find('img').hover(function(){
		$(this).stop().animate({'marginTop':-100}, 'slow', 'easeOutCirc');
	}, function(){
		$(this).stop().animate({'marginTop':0}, 'slow', 'easeOutCirc');
	});

	//footer
	$('.f-gb-form-tab-item1').click(function(){
		$('.f-gb-form-tab>a').removeClass('se-on');
		$(this).addClass('se-on');
		$('.f-gb-form-cfo').html('扫描加微信');
		$('.f-gb-form-codes').animate({ backgroundPositionX: 0, backgroundPositionY: -200 }, 600, 'easeOutCirc');
	});
	$('.f-gb-form-tab-item2').click(function(){
		$('.f-gb-form-tab>a').removeClass('se-on');
		$(this).addClass('se-on');
		$('.f-gb-form-cfo').html('扫描打电话给我们');
		$('.f-gb-form-codes').animate({ backgroundPositionX: 0, backgroundPositionY: -400 }, 600, 'easeOutCirc');
	});
	$('.f-gb-form-tab-item3').click(function(){
		$('.f-gb-form-tab>a').removeClass('se-on');
		$(this).addClass('se-on');
		$('.f-gb-form-cfo').html('扫描发送需求给我们');
		$('.f-gb-form-codes').animate({ backgroundPositionX: 0, backgroundPositionY: 0 }, 600, 'easeOutCirc');
	});
	
});

function _Open_addr(){
	alert('欢迎我们的地理位置');
}
function _BorderTip_false(obj, text){
	$(obj).css('border', 'red solid 1px');
	_SubTip(text);
	$(obj).focus();
	return false;
}

function _BorderTip_true(obj){
	$(obj).css('border', '#07DA07 solid 1px');
	$.ajax({
		url: (curl ? curl : base + '/default/index/comment')  + 'comment',
		type: 'POST',
		data: { 
				token: $('input[name="token"]').val(),
				uname: $('#uname').val(),
				uemail: $('#uemail').val(),
				uphone: $('#uphone').val(),
				ucompany: $('#ucompany').val(),
				ucomment: $('#ucomment').val()
			},
		dataType: 'html',
		success: function(data){
			$('#subtip').css('color', '#555').html('提交成功，我们会在24小时内给你回复！').slideDown('fast');
			_SubTip_UP();
			$('.p-c-in').css('border', 'solid #DADADA 1px').val('');
			setTimeout(function(){
				open_hide();
			}, 2000);
		},
		error: function(){
			$('#subtip').css('color', 'red').html('链接失败！').stop().slideDown('fast');
			_SubTip_UP();
		}
	});
}

function _SubTip_UP(){
	setTimeout(function(){
		$('#subtip').html('').stop().slideUp('slow');
	}, 5000);
}
function _SubTip(text, flag){
	$('#subtip').html(text).slideDown('fast');
	!flag ? $('#subtip').css('color', '#F74F34') : $('#subtip').css('color', '#555');
	_SubTip_UP();
}

function open_show(){
	$('#footer').stop().animate({ bottom: 360 });
	$('#open-footer').hide();
	$("#close-footer").show();
	f_flag = false;
}
function open_hide(){
	$('#footer').stop().animate({ bottom: 0 });
	$('#close-footer').hide();
	$("#open-footer").show();
	f_flag = true;
}

function isEmail(strEmail) {
	if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
		return true;
	else
		return false;
}