<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"
	, target-densitydpi=device-dpi />
<title>도착 지연 시간 및 오차 집계</title>

<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="../js/style.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../js/placeholder.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript" src="../js/style.js"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../css/import.css" />
<link rel="stylesheet" type="text/css" href="../css/board.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<link rel="stylesheet" type="text/css" href="../css/layout.css" />
<link rel="stylesheet" type="text/css" href="../css/login.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/modal.css" />

<title>Insert title here</title>
</head>
<body>
	<div id=wrap>
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
		<!-- \#header -->
		<!-- #snbArea -->
		<jsp:include page="/WEB-INF/views/layouts/synthesisData_subMenu.jsp" />
		<!-- \#snbArea -->
		<section id="contents" style="width: 95%;">
			<div class="tit-page">
				<span>도착 지연 시간 및 오차 집계</span>
				<ul class="path">
					<li>종합 데이터</li>
					<li>도착 지연 시간 및 오차 집계</li>
				</ul>
				<!-- .path -->
			</div>
			<!-- tit-page -->
			<!-- .contents -->
			<div class="contents">
				<!-- .search -->
				<div class="search">
					<form id="search-bmt">
						<span class="pd">시작 날짜</span> <input type="text" class="text date"
							id="bmt-start-date" name="bmt-start-date" /> <span class="pd">~</span>
						<span class="pd">종료 날짜</span> <input type="text" class="text date"
							id="bmt-end-date" name="bmt-end-date" /> <a
							href="javascript:sumOfArrivalDelayTimesErrorsController()"
							class="btnSearch"> <img src="../images/board/btn_search.gif"
							alt="search" />
						</a>
					</form>
				</div>
				<!-- /.search -->
				<!-- table -->
				<div style="margin-bottom: 25px">
					<table id="tbl-arrival-delay" style="border-style: none;">
						<thead>
							<tr>
								<th style="background-color: #e6e6ff;">도착 지연 시간 집계</th>
								<th colspan="6"
									style="background-color: white; border-style: none"></th>
							</tr>
							<tr style="background-color: #e6f2ff">
								<th rowspan="3" style="height: 25PX;">평가 대상명</th>
								<th rowspan="3" style="height: 25PX;">구간 (단위 : 개)</th>
								<th colspan="6">정상 주행</th>
							</tr>
							<tr style="background-color: #e6f2ff;">
								<th>평균 지연 시간</th>
								<th>최대 지연 시간</th>
								<th>표준 편차</th>
								<th>평균 지연율</th>
								<th>최대 지연율</th>
								<th>표준 편차</th>
							</tr>
							<tr style="height: 25PX; background-color: #e6f2ff;">
								<th>단위 : 분</th>
								<th>단위 : 분</th>
								<th>단위 : 분</th>
								<th>단위 : %</th>
								<th>단위 : %</th>
								<th>단위 : %</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<div>
					<table id="tbl-arrival-schedule" style="border-style: none;">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #e6e6ff;">도착 예정 시간
									오차</th>
								<th colspan="6"
									style="background-color: white; border-style: none"></th>
							</tr>
							<tr style="background-color: #e6f2ff">
								<th rowspan="2" style="height: 25PX;">평가 대상명</th>
								<th rowspan="2" style="height: 25PX;">구간 (단위 : 개)</th>
								<th>도착 예정 시간 오차 평균</th>
								<th>도착 예정 시간 오차 최대</th>
								<th>도착 예정 시간 오차 표준 편차</th>
								<th>도착 예정 시간 오차율 평균</th>
								<th>도착 예정 시간 오차율 최대</th>
								<th>도착 예정 시간 오차율 표준 편차</th>
							</tr>
							<tr style="height: 25PX; background-color: #e6f2ff;">
								<th>단위 : 분</th>
								<th>단위 : 분</th>
								<th>단위 : 분</th>
								<th>단위 : %</th>
								<th>단위 : %</th>
								<th>단위 : %</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- \table -->
			</div>	
			<!-- /.contents -->
		</section>
		<!-- /.contents -->
		</section>
		<!--  #container -->
		<footer>
			<p class="copyright">Copyright ⓒ 2018. WaveM Co. All rights
				reserved.</p>
		</footer>
	</div>
	<!-- wrap -->
</body>
<script>
	$(document).ready(function() {
		/**
		* 초기 date 설정
		*/
		setDate();
		
		/**
		* 도착지연 시간 및 오차집계 값 불러오기
		*/
		sumOfArrivalDelayTimesErrorsController();
		
	});
	
	
	//<![CDATA[
	// date picker
	$(".date").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '2013:2018',
	    showOn: "button",
	    buttonImage: "../images/board/btn_date.gif",
	    buttonImageOnly: true,
	    buttonText: "날짜선택",
	    inline: true,
	    duration: 300,
	    showAnim: "slideDown"
	});
	$.datepicker.regional['ko'] = {
	    closeText: '닫기',
	    prevText: '이전달',
	    nextText: '다음달',
	    currentText: '오늘',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    dateFormat: 'yy-mm-dd', firstDay: 0,
	    isRTL: false
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	//]]>
	
	/**
	* data sheet 초기 검색값 설정하기
	*/
	setDate = function() {
		var start = $('#bmt-start-date');
		var end = $('#bmt-end-date');
		var modalCal = $('#bmt-date');	// modal 에 입력되는 달력
		
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		if (month < 10) {
			month = '0' + month;
		}
		var day = date.getDate();
		if (day < 10) {
			day = '0' + day;
		}

		var prevDate = new Date(date.setDate(date.getDate()-30));
		var prevYear = prevDate.getFullYear();
		var prevMonth = prevDate.getMonth() + 1;
		if (prevMonth < 10) {
			prevMonth = '0' + prevMonth;
		}
		var prevDay = prevDate.getDate();
		if (prevDay < 10) {
			prevDay = '0' + prevDay;
		}
		
		start.val(prevYear + '-' + prevMonth + '-' + prevDay);
		end.val(year + '-' + month + '-' + day);
		modalCal.val(year + '-' + month + '-' + day);	
	}; 
	
	/**
	* 도착지연 시간 및 오차집계 값 불러오기
	*/
	sumOfArrivalDelayTimesErrorsController = function() {
		var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		var list1 = $('#tbl-arrival-delay').children('tbody');
		var list2 = $('#tbl-arrival-schedule').children('tbody');
		if (start == null || start == '' || end == null || end == '') {
			return false;		
		}
		
		$.ajax({
			url : '/synthesisData/getSumOfArrivalDelayTimesErrorData'
	        , type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				list1.empty();
				list2.empty();
				
				if (data.arrivalDelay.length === 0) {				
					list1.append('<tr><td colspan="8">검색된 값이 없습니다</tr>');	
					if (data.arrivalSchedule.length === 0) {
						list2.append('<tr><td colspan="8">검색된 값이 없습니다</tr>');	
						return;
					}
					return;
				}				
				
				data.arrivalDelay.forEach(function(items, index, array) {					
					var html1 = [
						'<tr class="',  items.check_select , '">',
						'<td>', items.cp, '</td>',
						'<td>', items.normal_count, '</td>',
						'<td>', items.avg_delay_time, '</td>',
						'<td>', items.max_delay_time, '</td>',
						'<td>', items.standard_deviation_delay, '</td>',
						'<td>', items.avg_delay_ratio, '</td>',
						'<td>', items.max_delay_ratio, '</td>',
						'<td>', items.standard_deviation_ratio, '</td>',
						'</tr>'
					].join('');	
					list1.append(html1);
				});//forEach
				
				data.arrivalSchedule.forEach(function(items, index, array) {
					var html2 = [
						'<tr class="',  items.check_select , '">',
						'<td>', items.cp, '</td>',
						'<td>', items.normal_count, '</td>',
						'<td>', items.avg_mae_eta, '</td>',
						'<td>', items.max_mae_eta, '</td>',
						'<td>', items.standard_deviation_mae, '</td>',
						'<td>', items.avg_mape_eta, '</td>',
						'<td>', items.max_mape_eta, '</td>',
						'<td>', items.standard_deviation_mape, '</td>',
						'</tr>'
					].join('');		
					list2.append(html2);
				});//forEach
				//강조 표시
				$('.1').css( "background-color", '#e6ffcc' );
				$('.2').css( "background-color", '#ffcccc' );
			}
		    , error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		})//ajax
	}
	
	
	/**
	 * form data 직렬화 
	 */
	$.fn.serializeObject = function() {
		var result = {};
		var extend = function(i, element) {
			var node = result[element.name];

			if ('undefined' !== typeof node && node !== null) {
				if ($.isArray(node)) {
					node.push(element.value);
				} else {
					result[element.name] = [ node, element.value ];
				}
			} else {
				result[element.name] = element.value;
			}
		};

		$.each(this.serializeArray(), extend);
		return result;
	};
</script>
</html>