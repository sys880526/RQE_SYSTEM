<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>평가 구간 현황 및 선후착 집계</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
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
	<!-- #container -->
	<div id="container" class="gnb">
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
		<!-- \#header -->
		<!-- .body clearFix -->
		<div class="body clearFix">
			<!-- #snbArea -->
			<jsp:include page="/WEB-INF/views/layouts/synthesisData_subMenu.jsp"/>
			<!-- \#snbArea -->
			<!-- #contentArea -->
			<div id="contentsArea">
				<div class="titContents">
					<h2>Data Sheet</h2>
					<p>
						Home > 종합데이터 >
						<strong>평가 구간 현황 및 선후착 집계</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" width=100%>
                	<!-- .search -->
                	<div class="search">
                        <form id="search-bmt">
                            <span class="pd">시작 날짜</span>
                            <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" />
                            <span class="pd">~</span>
                            <span class="pd">종료 날짜</span>
                            <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" />
                            <a href="javascript:statusOfAssessmentSectionForeAftereffecta()" class="btnSearch">
                                <img src="../images/board/btn_search.gif" alt="search" />
                            </a>
                        </form>
                	</div>
                	<!-- /.search -->
                	<!-- table -->               
                    <div style="margin-bottom: 25px">
                    	<table id="tbl-evaluation-day">
                            <thead style="background-color: #e6f2ff">
                                <tr>
                                    <th colspan="10" style="height: 25PX;">평가 구간 현황(요일별)</th> 
                                </tr>
                                <tr>
                                    <th rowspan="2" style="height: 25PX;">평가 대상명(단위:개)</th>
                                    <th style="height: 25PX;">월</th>
                                    <th style="height: 25PX;">화</th>
                                    <th style="height: 25PX;">수</th>
                                    <th style="height: 25PX;">목</th>
                                    <th style="height: 25PX;">금</th>
                                    <th style="height: 25PX;">토</th>
                                    <th style="height: 25PX;">일</th>
                                    <th rowspan="2" style="height: 25PX;">정상주행</th>
                                    <th rowspan="2" style="height: 25PX;">총 구간</th>
                                </tr>
                                <tr>
                                    <th colspan="7" style="height: 25PX;">정상 주행 구간(총 구간)</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>   
                    </div>
                    <div style="margin-bottom: 25px">
                        <table id="tbl-evaluation-time">
                            <thead style="background-color: #e6f2ff">
                                <tr>
                                    <th colspan="10" style="height: 25PX;">평가 구간 현황(시간대별)</th> 
                                </tr>
                                <tr>
                                    <th rowspan="3" style="height: 25PX;">평가 대상명(단위:개)</th>
                                    <th colspan="4" style="height: 25PX;">주중</th>
                                    <th colspan="2" style="height: 25PX;">주말</th>
                                    <th rowspan="3" style="height: 25PX;">정상주행</th>
                                    <th rowspan="3" style="height: 25PX;">총 구간</th>
                                </tr>
                                <tr>
                                    <th style="height: 25PX;">오전 첨두</th>
                                    <th style="height: 25PX;">오전 비첨두</th>
                                    <th style="height: 25PX;">오후 비첨두</th>
                                    <th style="height: 25PX;">오후 첨두</th>
                                    <th style="height: 25PX;">오전</th>
                                    <th style="height: 25PX;">오후</th>
                                </tr>
                                <tr>
                                    <th colspan="6" style="height: 25PX;">정상 주행 구간(총 구간)</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>                        
                    </div>
                    <div style="margin-bottom: 25px">
                        <table id="tbl-fore-after">
                            <thead style="background-color: #e6f2ff">
                            	<tr>
                            		<th colspan="7">선후착 집계(건)</th>
                            	</tr>                                
                                <tr>
                                    <th colspan="5" style="height: 25PX;">정상 주행</th>
                                    <th style="height: 25PX;">기타(경로 이탈 등</th>
                                    <th style="height: 25PX;">총 구간</th>
                                </tr>
                                <tr>
                                    <th style="height: 25PX;">CP</th>
                                    <th style="height: 25PX;">총 구간</th>
                                    <th style="height: 25PX;">선착률</th>
                                    <th style="height: 25PX;">동시도착률</th>
                                    <th style="height: 25PX;">후착률</th>
                                    <th style="height: 25PX;">단위 : 개</th>
                                    <th style="height: 25PX;">단위 : 개</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>                        
                    </div>
                    <!-- \table -->       
                </div>
			</div>
		</div>
		<!-- \.body clearFix -->
	</div>
	<!-- \#container -->
</body>
<script>
	$(document).ready(function() {
		/**
		* 초기 date 설정
		*/
		setDate();
		
		/**
		* 평가 구간 현황 및 선후착 집계 값 불러오기
		*/
		statusOfAssessmentSectionForeAftereffecta();
		
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
		start.val('2018-08-01');
		end.val('2018-08-31');		
	} 
	
	/**
	* 평가구간 현황 가져오기
	*/
	statusOfAssessmentSectionForeAftereffecta = function() {
		var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		var list1 = $('#tbl-evaluation-day').children('tbody');
		var list2 = $('#tbl-evaluation-time').children('tbody');
		var list3 = $('#tbl-fore-after').children('tbody');
		if (start == null || start == '' || end == null || end == '') {
			return false;
		}

		$.ajax({
			url : '/synthesisData/getStatusOfAssessmentSectionForeAftereffectData'
	        , type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				list1.empty();
				list2.empty();
				list3.empty();
				
				if (data.dayTime.length === 0) {				
					list1.append('<tr><td colspan="10">검색된 값이 없습니다</tr>');			
					list2.append('<tr><td colspan="9">검색된 값이 없습니다</tr>');	
					if (data.foreAfter.length === 0) {
						list3.append('<tr><td colspan="7">검색된 값이 없습니다</tr>');
						return;
					}
					return;
				}				
				
				data.dayTime.forEach(function(items, index, array) {					
					var html1 = [
						'<tr>',
						'<td>', items.cp, '</td>',
						'<td>', items.monday_nomal, '(', items.monday_total, ')', '</td>',
						'<td>', items.tuesday_nomal, '(', items.tuesday_total, ')', '</td>',
						'<td>', items.wednesday_nomal, '(', items.wednesday_total, ')', '</td>',
						'<td>', items.thursday_nomal, '(', items.thursday_total, ')', '</td>',
						'<td>', items.friday_nomal, '(', items.friday_total, ')', '</td>',
						'<td>', items.saturday_nomal, '(', items.saturday_total, ')', '</td>',
						'<td>', items.sunday_nomal, '(', items.sunday_total, ')', '</td>',
						'<td>', items.except_info_y, '</td>',
						'<td>', items.state_condition_y, '</td>',
						'</tr>'
					].join('');
					
					var html2 = [
						'<tr>',
						'<td>', items.cp, '</td>',
						'<td>', items.am_peak_normal, '(', items.am_peak_total, ')', '</td>',
						'<td>', items.am_non_peak_normal, '(', items.am_non_peak_total, ')', '</td>',
						'<td>', items.pm_non_peak_normal, '(', items.pm_non_peak_total, ')', '</td>',
						'<td>', items.pm_peak_normal, '(', items.pm_peak_total, ')', '</td>',
						'<td>', items.am_normal, '(', items.am_total, ')', '</td>',
						'<td>', items.pm_normal, '(', items.pm_total, ')', '</td>',
						'<td>', items.except_info_y, '</td>',
						'<td>', items.state_condition_y, '</td>',
						'</tr>'
					].join('');
					list1.append(html1);
					list2.append(html2);
				});//forEach
				
				data.foreAfter.forEach(function(items, index, array) {
					var html3 = [
						'<tr>',
						'<td>', items.cp, '</td>',
						'<td>', items.total_nomal, '</td>',
						'<td>', items.arrive_first, '</td>',
						'<td>', items.arrive_together, '</td>',
						'<td>', items.arrive_later, '</td>',
						'<td>', items.etc_count, '</td>',
						'<td>', items.total_count, '</td>',
						'</tr>'
					].join('');		
					list3.append(html3);
				});//forEach
				
					
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