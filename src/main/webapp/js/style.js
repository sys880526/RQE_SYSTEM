$(document).ready(function(){
//	if($('#gnb').is('#gnb')){
//		$('#gnb > li > a.active > img').attr('src',$('#gnb > li > a.active > img').attr('src').replace('.gif','_on.gif'));
//	}
//	$('#gnb > li > a').mouseenter(function(){
//		if(!$(this).hasClass('active')){
//			var imgSrc = $(this).find('> img').attr('src');
//			$(this).find('> img').attr('src',imgSrc.replace('.gif','_on.gif'));
//		}
//	}).mouseleave(function(){
//		if(!$(this).hasClass('active')){
//			var imgSrc = $(this).find('> img').attr('src');
//			$(this).find('> img').attr('src',imgSrc.replace('_on.gif','.gif'));
//		}
//	});
	/* modal */
	$('.layerPopup').each(function(){
		var $this = $(this);
		var $height = $this.height()/2;
		var $width = $this.width()/2;
		$this.css('margin-top',-$height+'px').css('margin-left',-$width+'px')
	});
	$('body').append('<div id="mask"></div>');
	$('.btnLayerClsoe').click(function(){
		$(this).parents('.layerPopup').hide();
		if (!$(this).is('.btnLayer')){
			$('#mask').hide();
		}else {
			
		}
		return false;
	});
	$('.btnLayer').click(function(){
		var $href = $(this).attr('href');
		if ($(this).is('.btnLayerClsoe')){
			$($href).show();
		} else {
			$('#mask').fadeTo(600,0.5,function(){
				$($href).show();
			});
		}
		return false;
	});
	/* table */
	$('.boardListStyle tr').mouseenter(function(){
		$(this).addClass('over');
	}).mouseleave(function(){
		$(this).removeClass('over');
	});
	$('.borderTrClick tr td').click(function(){
		if (!$(this).find('a').is('a')){
			$('#mask').fadeTo(600,0.5,function(){
				$('#layerPopupInfo').show();
			});
		}
	});

});