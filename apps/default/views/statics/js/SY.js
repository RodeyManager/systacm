/**
 * Author: Rodey
 * E-mail: rodeyluo@gmail.com
 * Date:   2013-05-17
 */

var SY = function(){};
SY.Slider = (function($){
	var than = jQuery.fn.slider= function(options){
		setting = jQuery.extend({
			containerDiv: 				'.banner',		// value: 容器
			childPanel: 				'.banner-list',	// value: 列表容器
			childTag: 					'li',			// value: 列表Tag Name
			btnList: 					'.btns-list',	// value: 按钮容器
			btnCurrentClass: 			'current',		// value: 当前按钮类
			width: 						'100%',			// value: 图片宽度：数值
			height: 					400,			// value: 图片高度: 数值
			prevBtn: 					'.prev',		// value: 按钮上
			nextBtn: 					'.next',		// value: 按钮下
			startAt: 					1,				// value: 开始执行索引值
			event: 						'click',		// value: 是否移入跳转 'click' | 'hover'
			autoPlay: 					true,			// value: 是否自动切换：true | false, 默认 TRUE
			speed: 						"slow", 		// value: 三种预定速度之一的字符串("slow","normal", or "fast")或表示动画时长的毫秒数值(如：1000)
			easing: 					"linear",		// value: 用来指定切换效果，默认是"swing"，可用参数"linear"
 			time: 						6000,			// value: 过渡时间: 毫秒
			data: 						new Array()
		}, options);

		$(function(){
			var flag = false;
			var current = 0, index = 0;
			var isPlay = false;
			if(setting.width > $(document).width()){
				$(setting.containerDiv).css('width', '100%');
			}else{
				$(setting.containerDiv).width(setting.width);
			}
			$(setting.containerDiv).height(setting.height);
			var ch = $(setting.containerDiv).height();
			var cw = $(setting.containerDiv).width();

			//
			var bul = $('<ul class="banner-list"></ul>').css({width:'100%', height:'100%', overflow:'hidden'});
			var bli = '';
			for (var i = 0; i < setting.data.length; i++) {
				if(!setting.data[i].bgcolor || setting.data[i].bgcolor == ''){
					setting.data[i].bgcolor = 'none';
				}
				bli += '<li style="background-color:'+setting.data[i].bgcolor+';background-image:url('+ setting.data[i].bgimg +');background-position:center 0;background-repeat:no-repeat;"><a href="'+ setting.data[i].href +'"></a></li>';
			}
			bul.append(bli);
			$(setting.containerDiv).prepend(bul);

			var list = $(setting.containerDiv).find(setting.childTag);
			var list_arr = $(setting.containerDiv).find(setting.childTag).toArray();
			$(setting.containerDiv).find(setting.childTag).css('display', 'none');
			$(list_arr[0]).css('display','block');
			var li_w = $(list_arr[0]).width();
			var li_h = $(list_arr[0]).height();


			
			//
			

			/*list.each(function(n){
				$(this).css({'background': 'url('+setting.data[n]+') no-repeat center top'});
				//console.log($(this));
			})*/
			var spans = '';
			for (var s = 0; s < list.length; s++) {
				spans += '<span></span>';
			};
			$(setting.containerDiv).find(setting.btnList).append(spans);
			var btns = $(setting.containerDiv).find(setting.btnList).children();
			var btns_arr = $(setting.containerDiv).find(setting.btnList).children().toArray();
			$(btns_arr[0]).addClass(setting.btnCurrentClass);
			var btnList_css = {'position': 'absolute','left': (cw - $(setting.btnList).outerWidth()) / 2,'bottom': '-30px' };
			$(setting.btnList).css(btnList_css).css('background', setting.data[0].bgcolor);

			//resize
			$(window).resize(function(){
				btnList_css = {'position': 'absolute','left': (cw - $(setting.btnList).outerWidth()) / 2,'bottom': '-30px' };
				$(setting.btnList).css(btnList_css);
			});

			//定义s开始
			var s;
			if(setting.autoPlay){
				s = setInterval(slider_pic, setting.time);
				isPlay = true;
			}

			function slider_pic(){
				current++;
				if(current > list.length-1){ current = 0; }
				//按钮样式控制
				btns.removeClass(setting.btnCurrentClass);
				$(btns_arr[current]).addClass(setting.btnCurrentClass);
				$(setting.containerDiv).find(setting.childTag).hide();
				$(setting.btnList).css('background', setting.data[current].bgcolor);
				$(list_arr[current]).fadeIn(setting.speed, setting.easing, setting.data[current].comfn);
				//console.log(list_arr[current]);
				
			};

			if(setting.event == 'click'){
				//小按钮触发事件
				btns.bind('click',
					function(){
						//if(setting.autoPlay){ clearInterval(s); }					
						btns.removeClass(setting.btnCurrentClass);
						$(this).addClass(setting.btnCurrentClass);					
						index = btns.index($(this));
						list.hide();
						$(setting.btnList).css('background', setting.data[index].bgcolor);
						$(list_arr[index]).fadeIn(setting.speed, setting.easing, setting.data[index].comfn);
						current = index;
					}
				);
			}else if(setting.event == 'hover'){ //是否移入跳转
				btns.hover(
					function(){
						if(setting.autoPlay){ clearInterval(s); }					
						btns.removeClass(setting.btnCurrentClass);
						$(this).addClass(setting.btnCurrentClass);					
						index = btns.index($(this));
						list.hide();
						$(setting.btnList).css('background', setting.data[index].bgcolor);
						$(list_arr[index]).fadeIn(setting.speed, setting.easing, setting.data[index].comfn);
						current = index;
					},
					function(){
						if(setting.autoPlay){ s = setInterval(slider_pic, setting.time); };
					}
				);
			}else{ console.log('必须给控制按钮指定事件'); return; }
			//前后控制
			$(setting.prevBtn).bind('click', function(){
				flag = true;
				//if(setting.autoPlay){ clearInterval(s); }
				clearInterval(s);
				current -= 1;
				if(current <= 0){ current=list.length; }					
				btns.removeClass(setting.btnCurrentClass);
				$(setting.btnList).css('background', setting.data[current-1].bgcolor);
				$(btns_arr[current-1]).addClass(setting.btnCurrentClass);
				switch(setting.sliderFunc){
					case 'fade':
						list.hide();
						$(list_arr[current-1]).fadeIn('slow');
						break;
					case 'sliderv':
						sliderv(current-1);
						break;
					case 'sliderh':
						sliderh(current-1);
						break;
					default:
						list.css('display','none');
						$(list_arr[current-1]).fadeIn('slow');
						break;
				}
			});
			$(setting.nextBtn).bind('click', function(){
				flag = true;
				//if(setting.autoPlay){ clearInterval(s); }
				clearInterval(s);
				current += 1;
				if(current > list.length-1){ current=0; }
				btns.removeClass(setting.btnCurrentClass);
				$(setting.btnList).css('background', setting.data[current].bgcolor);
				$(btns_arr[current]).addClass(setting.btnCurrentClass);
				switch(setting.sliderFunc){
					case 'fade':
						list.hide();
						$(list_arr[current]).fadeIn('slow');
						break;
					case 'sliderv':
						sliderv(current);
						break;
					case 'sliderh':
						sliderh(current);
						break;
					default:
						list.css('display','none');
						$(list_arr[current]).fadeIn('slow');
						break;
				}
			});
			$(setting.prevBtn).bind('mouseout', function(){
				if(flag == true){
					s = setInterval(slider_pic, setting.time);
				}
			});
			$(setting.nextBtn).bind('mouseout', function(){
				if(flag == true){
					s = setInterval(slider_pic, setting.time);
				}
			});
		});

	};/* END Slider */
	return than;
})(jQuery);

/* MENU */
SY.Bmenu = (function($){
	var than = jQuery.fn.bmenu = function(options){
		options = jQuery.extend({
			navDiv: '.nav',
			listTag: 'a',
			lineClass: '.nav-bottom-line'
		}, options);
		$(function(){
			var list = $(options.navDiv).find(options.listTag);
			var list_arr = list.toArray();
			var fw = $(list_arr[0]).width();
			var bline;
			//console.log(fw);
			if(options.lineClass != undefined){
				bline = $('<span />').addClass('nav-bottom-line');
			}else{
			 	bline = $('<span />').css({
								width: fw,
								height: 3,
								display: 'inline-block',
								background: '#2599B2',
								position: 'absolute',
								//overflow: 'hidden',
								left: 6+($(list_arr[0]).outerWidth() - $(list_arr[0]).width())/2,
								top: 30
							});
			}
			
			$(options.navDiv).append(bline);
			list.each(function(){
				var $$ = $(this);
				$$.hover(function(){
					bline.stop().animate({'width': $$.width(), 'left': $$.position().left+20});
				}, function(){
					bline.stop().animate({'width': fw, 'left': 6+($(list_arr[0]).outerWidth() - $(list_arr[0]).width())/2});
				});
			});
		});
	}
	return than;
})(jQuery);
/* END Bmenu */

SY.Util = new Object();