<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>종합데이터</title>
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
				<!-- .titContents -->
				<div class="titContents">
					<h2>Data Sheet</h2>
					<p>
						Home > 종합데이터 >
						<strong>Data Sheet</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" width=100%>
                    <!-- .search -->
                    <!--
                        board.css : box-sizing: content-box 추가
                    -->
                    <div class="search">
                        <form id="search-bmt">
                            <span class="pd">시작 날짜</span>
                            <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" />
                            <span class="pd">~</span>
                            <span class="pd">종료 날짜</span>
                            <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" />
                            <a href="javascript:dataSheetList()" class="btnSearch">
                                <img src="../images/board/btn_search.gif" alt="search" />
                            </a>
                        </form>
                    </div>
                    <!-- /.search -->
                    <div>
                        <table id="tbl-data-sheet" class="boardListStyle" cellspacing="0" width="100%" border="0">
                            <thead>
                                <tr>
                                    <th style="width: 70px">BMT ID</th>
                                    <th style="width: 100px">구간 주행 상태</th>
                                    <th style="width: 50px">CP</th>
                                    <th style="width: 70px">출발지명</th>
                                    <th style="width: 70px">도착지명</th>
                                    <th>예상 시간(분)</th>
                                    <th>예상 거리(Km)</th>
                                    <th>예상 요금(원)</th>
                                    <th>실제 소요 시간(분)</th>
                                    <th>실제 소요 거리(Km)</th>
                                    <th>실제 소요 요금(원)</th>
                                    <th>선/후착/동시도착</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <!-- /.contents -->
			</div>
			<!-- \#contentArea -->
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
		* data sheet list 값 불러오기
		*/
		dataSheetList();
		
		/**
		* data sheet 상세보기
		*/
		/* $('#tbl-data-sheet tr').on('click', function(this) {
			
		}); */
		
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
		
		/*var year = new Date().getFullYear();
		
		var month1 = new Date().getMonth() + 1;
		var month2 = null;
		if (month1 < 10) {
			month2 = '-0' + month1;
		} else {
			month2 = '-' + month1;
		}
		
		var day1 = new Date().getDate();
		var day2 = null;
		
		if (day1 < 10) {
			day2 = '-0' + day1;
		} else {
			day2 = '-' + day1;
		}
		
		start.val(year + month2 + day2);
		end.val(year + month2 + day2); */
		start.val('2018-08-01');
		end.val('2018-08-31');
		
	} 
	
	dataSheetList = function() {
		var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		var list = $('#tbl-data-sheet').children('tbody');
		if (start == null || start == '' || end == null || end == '') {
			return false;
		}
		var jsonStr = JSON.stringify($('#search-bmt').serialize());

		$.ajax({
			url : '/synthesize/datasheetlist'
	        , type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				list.empty();
				if (data.list.length === 0) {				
					list.append('<tr><td colspan="12">검색된 값이 없습니다</tr>');					
					return;
				}				
				data.list.forEach(function(items, index, array) {					
					var html = [
						'<tr id = "', items.bmtid ,'">',
						'<td>', items.userid , '</td>',
						'<td>', items.state_condition , '</td>',
						'<td>', items.cp , '</td>',
						'<td>', items.startpoi , '</td>',
						'<td>', items.endpoi , '</td>',
						'<td>', items.est_time , '</td>',
						'<td>', items.est_distance , '</td>',
						'<td>', items.est_charge , '</td>',
						'<td>', items.driver_tm , '</td>',
						'<td>', items.arrive_distance , '</td>',
						'<td>', items.arrive_charge , '</td>',
						'<td>', items.score , '</td>',
						'</tr>'
					].join('');
					list.append(html);
				});//forEach
					
			}
		    , error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		});


		
		
		
// 		$.ajax({
// 			url : '/synthesize/datasheetlist',
// 			type : 'post',
// 			data : {start : start, end : end},
// // 			data : $('#search-bmt').serialize(),
// // 			dataType : 'json',
// 			contentType: "application/json; charset=utf-8",
// 			success : function(data) {
// 				if (data.code == '0') {
// 					console.log(data.message);
// 				} else if (data.code == '-1') {
// 					cosole.log(data.message);
// 				}				
// 			},
// 			error : function() {
				
// 			}
// 		});//ajax
	}//dataSheetList()
	
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
