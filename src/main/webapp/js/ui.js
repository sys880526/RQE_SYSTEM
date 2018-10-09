$(function() {
	//mediaQuery();
	elemHeight();
	scroll();
	check();
	//defSelBtn();

	/* p.checkbox */
	$(document).on("mouseup", "p.checkbox", function() {
		var $input = $(this).children("input");
		if ($input.is(":checked"))
		{
			$input.prop("checked", false);
		}else
		{
			$input.prop("checked", true);
		}
		check();
	});

	$(document).on("mouseup", "p.checkbox.check-all", function() {
		checkAll($(this));
	});

	/* p.radio */
	$(document).on("mouseup", "p.radio", function() {
		var $input = $(this).children("input");
		if (!$input.is(":checked"))
		{
			$input.prop("checked", true);
		}
		check();
	});

	/* input type number */
	$(".numeric-input").each(function() {
		$(this).append("<div class='btn up'></div><div class='btn down'></div>");
	});
	$(document).on("mouseup", ".numeric-input .btn.up", function() {
		var $input = $(this).siblings("input");
		var val = Number($input.val());

		val = val + 1;
		$input.val(val);
	});
	$(document).on("mouseup", ".numeric-input .btn.down", function() {
		var $input = $(this).siblings("input");
		var val = Number($input.val()) - 1;
		var min = Number($(this).closest(".numeric-input").data("min"));

		if (val >= min)
		{
			$input.val(val);
		}
	});

	/* 차트 애니메이션 */
	//chartAni();

	/* datepicker, weekpicker, monthpicker 만들기 */
	//buildPicker();

	/* 다이얼로그 드래그 */
	$(".dialog").draggable({
		iframeFix: true,
		scroll:false,
		handle:".dl-header"
	});

	/* 다이얼로그 헤더 클릭 시 */
	$(document).on("click", ".dialog.multiple .dl-container", function() {
		dialogOnTop($(this).closest(".dialog"));
	});
	$(document).on("mousedown", ".dialog.multiple .dl-header", function() {
		dialogOnTop($(this).closest(".dialog"));
	});

	/* datepicker readonly 상태에서 클릭 시 달력 노출 */
	$(document).on("click", ".datepicker:visible", function() {
		if ($(this).next("img").hasClass("ui-datepicker-trigger"))
		{
			$(this).nextAll(".ui-datepicker-trigger").eq(0).trigger("click");
		}
	});

	/* 탭 클릭 시 */
	$(document).on("click", "div.tab > ul > li > a", function() {
		var idx = $(this).closest("div.tab > ul").children("li").index($(this).closest("li"));
		$(this).closest("div.tab > ul").children("li").removeClass("active");
		$(this).closest("li").addClass("active");
		$(this).closest(".tab-wrap").children(".tab-contents").removeClass("active");
		$(this).closest(".tab-wrap").children(".tab-contents").eq(idx).addClass("active");
	});

	/* 파일업로드 */
	$(document).on("click", ".file-upload > a.btn", function() {
		$(this).closest(".file-upload").children("input").trigger("click");
	});
	$(document).on("change", ".file-upload > input", function() {
		var val = [];
	    for (var i = 0; i < $(this).get(0).files.length; ++i) {
	        val.push($(this).get(0).files[i].name);
	    }
		var attr = $(this).attr('multiple');
		$(this).closest(".file-upload").children("span").html(val);

		if (typeof attr !== typeof undefined && attr !== false) {
			var multiVal = [];
		    for (var i = 0; i < $(this).get(0).files.length; ++i) {
				if (i == $(this).get(0).files.length - 1) {
			        multiVal.push("'" + $(this).get(0).files[i].name + "'");
				}
				else{
			        multiVal.push("'" + $(this).get(0).files[i].name + "', ");
				}
		    }
			$(this).closest(".file-upload").children("span").html(multiVal);
		}
	});

	/* 마스터그리드 클릭 시 active */
	$(document).on("click", ".table-box.master table tbody tr", function() {
		$(this).closest("table").find("tbody tr").removeClass("active");
		$(this).addClass("active");
	});

	/* 셀렉트 버튼 */
	$(document).on("click", "a.btn.select", function() {
		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
		}
		else {
			$(this).addClass("active")
		}
		return false;
	});
	$(document).on("click", "a.btn.select span.opt", function() {
		var val = $(this).html();
		if ($(this).closest("a.btn.select").hasClass("multi")) {
			if ($(this).hasClass("selected")) {
				$(this).removeClass("selected");
			}
			else {
				$(this).addClass("selected");
			}
		}
		else{
			$(this).closest("a.btn.select").find("span.opt.selected").removeClass("selected");
			$(this).addClass("selected");
			defSelBtn();
		}
		return false;
	});
	$(document).on("click", "body", function() {
		$("a.btn.select").removeClass("active");
	});


	/* 알림 */
	function almActive() {
		if ($("a.btn.alm").hasClass("active")) {
			$("a.btn.alm.active").animate({'background-color':'#f3358f', 'box-shadow':'0 0 10px rgba(243, 53, 143, 0.5)'}, 600).animate({'background-color':'#93a8ef', 'box-shadow':'0 0 0px rgba(0, 0, 0, 0)'}, 600, almActive);
		}
	}
	almActive();

	/* 셀렉트 랩 버튼 */
	$(document).on("click", ".select-wrap a", function() {
		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
		}
		else {
			$(this).addClass("active")
		}

		if ($(this).hasClass("select-all")){
			$(this).closest(".select-wrap").find("a").addClass("active");
		}

		if ($(this).closest(".select-wrap").find("div ul li a").length != $(this).closest(".select-wrap").find("div ul li a.active").length) {
			$(this).closest(".select-wrap").find("a.select-all").removeClass("active");
		}else{
			$(this).closest(".select-wrap").find("a.select-all").addClass("active");
		}
	});

	/* .toggle */
	$(document).on("click", "div.toggle > a", function() {
		$(this).siblings("a.btn").removeClass("active");
		$(this).addClass("active");

		/* 검색조건 토글 일 때 */
		if ($(this).closest(".toggle").hasClass("toggle-search-condition")) {
			var idx = $(this).closest(".toggle").children("a").index($(this));
			$(this).closest(".search-box").find(".floor-wrap").addClass("hidden");
			$(this).closest(".search-box").find(".floor-wrap").eq(idx).removeClass("hidden");
		}
	});

	/* modal 클릭 시 */
	$(".modal").click(function() {
		initPopup();
	});

	/* 메뉴 버튼 클릭 시 */
	$(document).on("click", "a.btn-menu", function() {
		if ($("body").hasClass("menu-active"))
		{
			$("body").removeClass("menu-active")
		}
		else
		{
			$("body").addClass("menu-active")
		}
		return false;
	});

	/* 검색조건 비활성화 */
	//searchDivDisabled();

	/* 글자 수 세기 */
	$('.send-sms > textarea').keyup(function (e){
		var content = $(this).val();
		var max = Number($(this).closest('.send-sms').data("max"));
		//alert(content);
		//$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$(this).closest('.send-sms').find(".capa > .count").html(content.length);
		alertOver($(this), content.length, max);
	});
	$('.send-sms > textarea').keyup();


	/* 토글 버튼 */
	$(document).on("click", ".toggle-btn", function() {
		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
		}
		else {
			$(this).addClass("active")
		}
		return false;
	});

	/* 셋팅 버튼 */
	$(document).on("click", "a.btn.setting", function() {
		$("a.btn.setting").removeClass("active");
		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
		}
		else {
			$(this).addClass("active")
		}
		return false;
	});

	/* 내비게이션 버튼 */
	$(document).on("mouseup", ".depth1 > a.active, .depth2 > a", function() {
		var $div = $(this).closest("div");
		$div.siblings("div").removeClass("opened");
		if ($div.hasClass("opened")) {
			$div.removeClass("opened");
		}
		else {
			$div.addClass("opened");
		}
		return false;
	});

	/* 이미지 줌
	$(document).on("click", "img.zoom", function() {
        var img = $(this);
        var realWidth = this.width;
        var realHeight = this.height;
        // Create dummy image to get real width and height
        $("<img/>").attr("src", $(img).attr("src")).load(function(){
            realWidth = this.width;
            realHeight = this.height;
            //alert("Original width=" + realWidth + ", " + "Original height=" + realHeight);
			if ($(this).attr("style") == "undefined") {
				alert(1);
				$(this).css({"max-width" : "auto"});
				$(this).css({"width" : realWidth});
				$(this).css({"height" : realHeight});
			}
			else{
				alert(2);
				$(this).removeAttr("style");
			}
			alert("Original width=" + realWidth + ", " + "Original height=" + realHeight);
        });
	}); */
});






/* 윈도우 리사이즈 시 */
var resizeId;
$(window).resize(function() {
	clearTimeout(resizeId);
	resizeId = setTimeout(doneResizing, 300);
});
function doneResizing(){ // 리사이즈가 완료된 후 실행 될 기능 입력
	//mediaQuery();
	scroll();
	elemHeight();

//	historyBoxSize();
}





function destroyPicker() {
	$('.datepicker').datepicker("destroy");
}

/* datepicker, weekpicker, monthpicker 만들기*/
function buildPicker() {
	/* datepicker */
	$('.datepicker').datepicker(options).attr('readonly','readonly');

	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dateFormat: 'yy-mm-dd', firstDay: 0,
		isRTL: false};
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		/* weekpicker */
		$('input.weekpicker:visible').each(function () {
			$(this).weekpicker({
				firstDay: 1,
				showOtherMonths: true,
				selectOtherMonths: true,
				onSelect: function() { // 날짜 선택 시 주단위로 입력
					var $first = $(".ui-weekpicker:visible a.ui-state-hover").first();
					var $last = $(".ui-weekpicker:visible a.ui-state-hover").last();
					//$first = $(this).siblings().find("a").first();
					//$last = $(this).siblings().find("a").last();
					$parentFirst = $first.parent();
					$parentLast = $last.parent();

					/* 주의 시작일 */
					var fYear = $parentFirst.data("year");
					var fMon = Number($parentFirst.data("month")) + 1;
					var fDay = Number($first.text());
					if (fMon < 10) {
						fMon = "0" + fMon;
					}
					if (fDay < 10) {
						fDay = "0" + fDay;
					}
					var fDate = fYear +"-"+ fMon +"-"+ fDay;

					/* 주의 마지막일 */
					var lYear = $parentLast.data("year");
					var lMon = Number($parentLast.data("month")) + 1;
					var lDay = Number($last.text());
					if (lMon < 10) {
						lMon = "0" + lMon;
					}
					if (lDay < 10) {
						lDay = "0" + lDay;
					}
					var lDate = lYear +"-"+ lMon +"-"+ lDay;
					$(".weekpicker").val(
						fDate + " ~ " + lDate
					);
				}
			});
		});

		/* monthpicker */
		$(".monthpicker:visible").each(function() {
			$(this).MonthPicker({
				MonthFormat:"yy-mm",
				jumpYears:"연도",
				Button: '<img class="icon" src="../images/board/btn_date.png" />',
				months: ["1","2","3","4","5","6","7","8","9","10","11","12"]
			});
		});
	}

	/* datepicker */
	var options = {
		changeMonth: true,
		changeYear: true,
		yearRange: '1900:2018',
		showOn: "button",
		//buttonImage: "../images/board/btn_date.png",
		buttonImage: "../images/common/btn_date.png",
		buttonImageOnly: true,
		buttonText: "선택",
		inline: true,
		duration: 300,
		showAnim: "slideDown"
	}

	/* 차트 애니메이션 */
	function chartAni() {
		$(".percent-box .circle").each(function() {
			var percentage = $(this).find(".val").html();
			$(this).find("span.fill").height(percentage);
		});

		$(".bar-box").each(function() {
			var idx = $(".bar-box:visible").index($(this));
			var delay = idx * 100;
			var percentage = $(this).find(".val").html();
			if ($(this).is(":visible")) {
				$(this).find(".bar > span").css({"width": 0}).delay(delay).animate({"width": percentage}, 200);
			}else {
				$(this).find(".bar > span").css({"width": 0})
			}
		});
	}

	/* layout 높이 정의 */
	function elemHeight() {
		var winH = $(window).height();
		var fixedH = Number("");

		if ($("header").length != 0) {// header 높이 빼기
			var headerH = $("header").outerHeight();
			fixedH = fixedH + Number(headerH);
		}

		if ($("footer").length != 0) {// footer 높이 빼기
			var footerH = $("footer").outerHeight();
			fixedH = fixedH + Number(footerH);
		}

		if ($("#snb").length != 0) {// #snb 폭 빼기
			var snbW = $("#snb").outerWidth();
		}

		if ($(window).width() <= 1600) {
			if ($(".user-info").length != 0) {// .user-info 높이 빼기
				var userInfoH = $(".user-info").outerHeight();
				headerH = headerH + Number(userInfoH);
			}
			$(".user-info").css(
				{
					"width": $(window).outerWidth() - $("#snb").outerWidth(),
					"min-width": 1280 - $("#snb").outerWidth()
				}
			);
		}
		else {
			$(".user-info").removeAttr("style");
		}

		var height = winH - fixedH;
		$("#snb").outerHeight(height);
		$("#container").css({"padding-top":headerH, "padding-bottom":footerH, "padding-left": snbW});
	}

	/* 검색조건 비활성화 */
	function searchDivDisabled() {
		$(".search-div.disabled").each(function() {
			$(this).find("input, select").prop("disabled", true);
			$(this).find(".datepicker").datepicker("option", "disabled", true);
		});
	}

	/* mediaQuery */
	function mediaQuery() {
		var docuW = $(window).width();
		if (!$("body").hasClass("popup"))
		{// 팝업이 아닌 경우 실행
			if (docuW <= 1920 && docuW > 1280)
			{
				$("body").removeClass("w1024 w1280");
			}
			else if (docuW <= 1280 && docuW >= 1026)
			{
				$("body").removeClass("w1024").addClass("w1280");
			}
			else if (docuW < 1026)
			{
				$("body").removeClass("w1280").addClass("w1024");
			}
		}
	}

	/* scroll */
	function scroll() {
		$(".scroll").each(function() {
			var h = $(this).data("height");
			if (h != "") {
				$(this).outerHeight(h);
			}
		});

		$(".scroll").mCustomScrollbar("destroy");

		$(".scroll").mCustomScrollbar({
			scrollInertia: 200, // 스크롤 easing 속도
			axis:"y",
			advanced:{autoExpandHorizontalScroll:true},
			advanced:{ updateOnContentResize: true }, // <table> table-layout:auto; <td> white-space:nowrap; 과 함께 사용
			autoHideScrollbar: true,
			alwaysShowScrollbar: 0,
			speed:20,
			theme:"minimal",
			scrollTo:top,
			mouseWheelPixels: 100, //change this to a value, that fits your needs
			callbacks:{ // 고정 헤더 따라다니기.. ㅠㅠ
				whileScrolling: function(){
					var left = this.mcs.left;
					$(this).find(".float_header").animate({"left":left}, 0);
				}
			}
		});
	}

	/* .checkbox / .radio */
	function check() {
		$("p.checkbox, p.radio").each(function() {
			if ($(this).children("input").is(":checked"))
			{
				$(this).addClass("checked");
			}else {
				$(this).removeClass("checked");
			}
		});
	}

	function checkAll(elem) {
		if ($(elem).children("input").is(":checked"))
		{
			$(elem).closest("table").find("p.checkbox input:checkbox").prop("checked", true);
		}else {
			$(elem).closest("table").find("p.checkbox input:checkbox").prop("checked", false);
		}
		check();
	}

	function checkAndDo(elem) {
		initRight();
		var amt = $(elem).closest(".table-box table").find("tbody p.checkbox.checked").length;
		if (amt != 0) {
			$(".function-box").addClass("active");
			$(".function-box").find(".amt").html(amt);
		}
		else {
			initFunctionBox();
		}
	}

	function deselectAll() {
		$(".table-box.list p.checkbox:visible, .table-box.list p.radio:visible").children("input").prop("checked", false);
		check();
		trActivation();
	}

	function initFunctionBox() {
		$(".function-box").find(".amt").html("0");
		$(".function-box").removeClass("active");
	}

	function trActivation() {
		$(".table-box.list tbody p.checkbox:visible, .table-box.list tbody p.radio:visible").each(function() {
			if ($(this).children("input").is(":checked"))
			{
				$(this).closest("tr").addClass("active");
			}else {
				$(this).closest("tr").removeClass("active");
			}
		});
	}

	/* 레이어팝업 호출 */
	function callPopup(id, width, height) {
		if ($("#"+id).is(":hidden")) {
			$("#"+id).show();

			if ($("#"+id).find("iframe").length != 0) { // iframe으로 내용을 불러오는 경우
				var iframeUrl = $("#"+id).find("iframe").data("src");
				$("#"+id).find("iframe").attr("src", iframeUrl);
			}

			var left = ($(window).width() / 2) - ($("#"+id).outerWidth() / 2);
			var top = ($(window).height() / 2) - ($("#"+id).outerHeight() / 2);
			$("#"+id).css({"left": left, "top": top});

			if (!$("#"+id).hasClass("multiple")) { // 다중으로 뜨는 팝업이 아닌 경우
				$(".modal").fadeIn(200); // modal 띄움
			}else{
				dialogOnTop($("#"+id));
			}
		}else {
			dialogOnTop($("#"+id));
		}
	}

	function initPopup() {
		$(".over-modal:visible").fadeOut(200);
		$(".modal").fadeOut(200);
	}

	function initMultiplePopup(elem) {
		$(elem).closest(".dialog.multiple").fadeOut(200);
	}

	function dialogOnTop(elem) {
		$(".dialog.multiple.middle").removeClass("middle");
		$(".dialog.multiple.top").removeClass("top").addClass("middle");
		$(".dialog.multiple:visible").removeClass("top");
		$(elem).addClass("top");
		/*
		var zIndex = [];
		$(".dialog.multiple:visible").each(function() {
		var z = $(this).css("z-index");
		$(this).css("z-index", z);
		zIndex.push(z);
	});
	var maxZIndex = Math.max.apply(null, zIndex);
	$(elem).css("z-index", maxZIndex + 1);
	$(".dialog.multiple:visible").each(function() {
	var z = $(this).css("z-index");
	$(this).css("z-index", z - 1);
});*/
}

/* 셀렉트 버튼 값 넣기 */
function defSelBtn() {
	$("a.btn.select").each(function () {
		var val = $(this).find("span.opt.selected").html();
		$(this).find("span.val").html(val);
		$("a.btn.select").removeClass("active");
	});
}

/* 좌/우 주고받기 영역
function LRselected() {
	$(".left-to-right-wrap .box.right").each(function() {
		var amt = $(this).find(".list p.active").length;
		if (amt != 0) {
			$(this).addClass("selected");
		}
		else {
			$(this).removeClass("selected");
		}
		$(this).find("a.btn.download strong").html(amt);
	})
}  */

/* 입력란 추가
function addRow(id) {
	destroyPicker();
	var $tr = $("#" + id).find("tbody tr:last-child");
	var html = $tr.html();
	$("#" + id).find("tbody").append("<tr></tr>");
	$("#" + id).find("tbody tr:last-child").html(html);
	$("#" + id).find("tbody tr:last-child").find("input").val("");
	$("#" + id).find("tbody tr:last-child").find(".datepicker").removeAttr("id");
	$("#" + id).find("tbody tr:last-child").find("select").find("option").prop("selected", false);
	$("#" + id).find("tbody tr:last-child").find("select").find("option").eq(0).prop("selected", true);
	buildPicker();
} */

/* row삭제
function removeRow(elem) {
	$(elem).closest("tr").remove();
} */

/* 글자수 최대값 오버 시
function alertOver($elem, count, max) {
	if (count > max) {
		$elem.closest(".send-sms").find(".capa").addClass("over");
		//$elem.closest(".send-sms").find("textarea").val($elem.closest(".send-sms").find("textarea").val().substring(0, max));
	}
	else {
		$elem.closest(".send-sms").find(".capa").removeClass("over");
	}
} */

/* loading */
function callLoading() {
	$(".loading.common").addClass("active");
	$(".modal").fadeIn(200);
}
function initLoading() {
	$(".loading.common").removeClass("active");
	$(".modal").hide();
}

/* gnb > snb 복제
function gnbClone() {
	if ($("body.main").length == 0) {
		var depth1 = [];
		$("#gnb > ul > li > a").each(function() {
			var html = $(this).wrap('<p/>').parent().html();
			depth1.push(html);
			$(".depth1").append(html);
			//alert(depth1);
			$(this).unwrap();
		});
		$( ".depth1 > a" ).wrapAll( "<div></div>" );
		$( ".depth1 a" ).eq(d1 - 1).addClass("active").removeAttr("href");
		$( ".depth1 a.active" ).clone().prependTo($(".depth1"));

		var $ul = $("#gnb > ul > li").eq(d1 - 1).children("ul");
		var depth2 = $ul.wrap('<p/>').parent().html();
		$(".depth2").append(depth2);
		$ul.unwrap();
		$(".depth2 > ul > li").eq(d2 - 1).addClass("active");
		$(".depth2 > ul > li.active > a").removeAttr("href");
		$(".depth2 > ul > li.active > a").clone().prependTo($(".depth2"));
	}
} */
