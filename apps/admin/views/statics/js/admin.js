(function (config) {
    config['lock'] = true;
    config['fixed'] = true;
})(art.dialog.defaults);

$(document).ready(function(){

	//tab
	$('.m-tab-cons').hide();
	$('.m-tab-cons:first').show();
	$('.m-header-tab').click(function(){
		var tab_con_list = $('.m-tab-cons');
		$('.m-tab-cons').hide();
		$('#'+ $(this).attr('ref')).fadeIn();
		$('.m-header-tab').removeClass('m-tab-on');
		$(this).addClass('m-tab-on');
	});
	
	//
	$('*[title]').tooltip({
		animation: true,
		placement: 'top'
	});
});//-----end ready----
/* -----系列函数------ */
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
//全选
function _S(name){
	if($("#check_box").attr('checked') == 'checked') {
		$("input[name='"+name+"']").each(function() {
  			$(this).attr("checked", "checked");
		});
		$('.m_select_all').text($('.m_select_all').data('unselected'));
	} else {
		$("input[name='"+name+"']").each(function() {
  			$(this).removeAttr("checked");
		});
		$('.m_select_all').text($('.m_select_all').data('selected'));
	}
}
//批量解锁和加锁
function _LOCK(url, state){
	var ids = '';
	$('input[name="check[]"]:checked').each(function(){
		ids += $(this).val() + ',';
	});
	if(ids === '') {
		art.dialog.alert('没有选择的修改项，请选择！') ; 
		return false;
	}

	$.post(url, {ids : ids, state: state}, function(data){
		if(data === 'OK') 
			_POP({title:'更改用户状态',content:'更改成功！',icon:'success'});
		else 
			_POP({title:'更改用户状态',content:'更改失败！',icon:'error'});
		window.location.reload();
	});
}
//删除
function _D(id, url){
	art.dialog.confirm('你确认删除操作？', function(){
		$.post(url, {id: id}, function(data){
			/*_Dat(data);
			return;*/
			if(data == 'OK') 
				_POP({title:'删除',content:'删除成功！',icon:'success'});
			else 
				_POP({title:'删除',content:'删除失败！',icon:'error'});
			window.location.reload();
		});
	}, function(){
		this.close();
	});
}
//批量删除
function _DS(url){
	var ids = '';
	$('input[name="check[]"]:checked').each(function(){
		ids += $(this).val() + ',';
	});
	if(ids === '' || !ids){
		art.dialog.alert('必须选择需要删除的项！');
		return false;
	}
	_D(ids, url);
}

//批量清理
function _DSS(url){
	if(window.confirm('此操作需慎重执行，你确定要执行此操作吗？')){
		$.post(url, {exec: 'ok'}, function(data){
			if(data === 'OK') 
				_POP({title:'批量清理',content:'批量清理成功！',icon:'success'});
			else 
				_POP({title:'批量清理',content:'批量清理失败！',icon:'error'});
			window.location.reload();
		});
	}else{
		return false;
	}
}

//修改
function _MOD(url){
	var ids = '';
	$('input[name="check[]"]:checked').each(function(){
		ids += $(this).val() + ',';
	});
	if(ids == '' || !ids){
		art.dialog.alert('必须选择需要修改的项！');
		return false;
	}
	var reg=/,$/gi;
	ids=ids.replace(reg,"");
	ids = ids.split(',');
	if(ids.length > 1 ){
		art.dialog.alert('一次只能选择一项进行修改！');
		return false;
	}else{
		window.location.href = url + ids;
	}
}
function _MODS(url){
	var ids = '';
	$('input[name="check[]"]:checked').each(function(){
		ids += $(this).val() + ',';
	});
	var reg=/,$/gi;
	ids=ids.replace(reg,"");
	if(ids === ''){
		art.dialog.alert('必须选择需要修改的项！');
		return false;
	}else{
		window.location.href = url + ids;
	} 
}

//Tab
function _TAB(id, than){
	var tab_con = $('#'+id);
	var tab_con_list = $('.m-tab-cons');
	$.each(tab_con_list, function(){
		$(this).fadeOut();
	});
	tab_con.fadeIn();
	$('.m-header-tab').removeClass('m-tab-on');
	$($(than)).addClass('m-tab-on');
}

//art.dialog
function _Dat(msg){
	window.top.art.dialog.alert(msg);
}
function _Daf(msg){
	art.dialog.alert(msg);
	return false;
}

//Tips
function tips(id){
	var than = $(id);
	if(than.val() == ''){
		than.nextAll('.explain').removeClass('em-success').addClass('em-error');
		return false;
	}else{
		than.nextAll('.explain').removeClass('em-error').addClass('em-success');
		return true;
	}
}

/**
 * 提示并检查唯一性
 * id 		[string] 当前对象
 * url: 	[string] 检查的地址
 * varn: 	[string] 后台接受的变量名，以post方式发送,后台使用 $_POST['varn']
 * in_text: [string] 默认提示
 * is_text: [string] 存在时的提示
 * no_text: [string] 不存在时的提示
 */
function tips_check(id, url, in_text, is_text, no_text){
	var than = $(id);
	var value = than.val();
	if(than.val() == ''){
		than.nextAll('.explain').removeClass('em-success').addClass('em-error').html(in_text);
		return false;
	}else{
		than.nextAll('.explain').removeClass('em-error').addClass('em-success').html(no_text);
		
		$.post(url, { varn:value }, function(data){
			if('OK' === data){
				than.nextAll('.explain').removeClass('em-success').addClass('em-error').html(is_text);
				return false;
			}else if('NO' === data){
				than.nextAll('.explain').removeClass('em-error').addClass('em-success').html(no_text);
				return true;
			}else if('FORMAT_ERROR' === data){
				than.nextAll('.explain').removeClass('em-success').addClass('em-error').html('格式不正确');
				return false;
			}
		});

		return true;
	}
}
function tips_success(id){
	$(id).nextAll('.explain').removeClass('em-error').addClass('em-success'); return true;
}
function tips_error(id){
	$(id).nextAll('.explain').removeClass('em-success').addClass('em-error'); return false;
}
function isEmail(strEmail) {
	if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
		return true;
	else
		return false;
}