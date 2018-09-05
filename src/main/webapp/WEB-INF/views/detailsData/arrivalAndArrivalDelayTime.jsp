<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<title>선/후착 및 도착 지연 시간</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="../js/style.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type = "text/javascript">google.charts.load('current', {packages: ['corechart']});</script>
    
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../css/import.css" />
    <link rel="stylesheet" type="text/css" href="../css/board.css" />
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/layout.css" />
    <link rel="stylesheet" type="text/css" href="../css/login.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />    
    <link rel="stylesheet" type="text/css" href="../css/modal.css" />
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
			<jsp:include page="/WEB-INF/views/layouts/detailsData_subMenu.jsp"/>
			<!-- \#snbArea -->
			<!-- #contentArea -->
			<div id="contentsArea">
				<div class="titContents">
					<h2>선/후착 및 도착 지연 시간</h2>
					<p>
						Home > 상세데이터 >
						<strong>선/후착 및 도착 지연 시간</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" width=100%>
                	<!-- .search -->
                	<div class="search">
                        <form id="search-bmt">
                        	<div class="row" style="margin-bottom: 20px">
                        		<span class="pd">시작 날짜</span>
                            <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" />
                            <span class="pd">~</span>
                            <span class="pd">종료 날짜</span>
                            <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" />
                            <a href="javascript:arrivalAndArrivalDelayTime()" class="btnSearch">
                                <img src="../images/board/btn_search.gif" alt="search" />
                            </a>
                        	</div>
                            <div class="row">
                            	<div class="day" style="padding: 0px 3px 0px 10px;display: inline-block;vertical-align: top;">
	                            	<span style="display : table;">요일특성</span>
	                            	<br>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="weekday" value="weekday">주중
									</label>
									<label>
										<input type="checkbox" id="weekend" value="weekend">주말
									</label>
                            	</div>                            	
            					<div class="timecheck" style="padding: 0px 0px 0px 100px;display: inline-block;vertical-align : top;">
            						<span style="display : table;padding: 0px 0px 10px 0px;">시간대특성</span>
            						<div class="row timecheck">
            							<div style="display: inline-block;">
		            						<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="am_peak" name="am_peak" value="am_peak" class="weekday" disabled>오전 첨두
											</label>
											<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="pm_peak" name="pm_peak" value="pm_peak" class="weekday" disabled>오후 첨두
											</label>
											<label>
											  <input type="checkbox" id="am" name="am" value="am" class="weekend" disabled>오전
											</label>
            							</div>
            							<div style="padding: 0px 100px 0px 20px;display: inline-block;">
	            							<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="am_non_peak" name="am_non_peak" value="am_non_peak" class="weekday" disabled>오전 비첨두
											</label>
											<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="pm_non_peak" name="pm_non_peak" value="pm_non_peak" class="weekday" disabled> 오후 비첨두
											</label>
											<label>
											  <input type="checkbox" id="pm" name="pm" value="pm" class="weekend" disabled>오후
											</label>
            							</div>
            						</div>
            					</div>
            					<div class="distance" style="display: inline-block;vertical-align: top;">
            						<span style="display : table;padding: 0px 0px 10px 0px;">거리특성</span>
            						<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="shortest_distance" name="shortest_distance" value="shortest_distance" disabled> 초 단거리(0 ~ 5km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="short_distance" name="short_distance" value="short_distance" disabled> 단거리(5 ~ 10km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="medium_distance" name="medium_distance" value="medium_distance" disabled> 중거리(10 ~ 30km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="long_distance" name="long_distance" value="long_distance" disabled> 장거리(30 ~ 50km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="longest_distance" name="longest_distance" value="longest_distance" disabled> 초 장거리(50 ~ km)
									</label>
            					</div>
                            </div>
                        </form>
                	</div>
                	<!-- /.search -->
                	<!-- .row -->   
                	<div class="row" style="margin-bottom: 25px">
	                	<!-- table -->               
                    	<table id="tbl-delay-info" style="border-style: none;">
                            <thead>
                            	<tr>
                                    <th colspan="2" style="background-color: #e6e6ff;">선후착 집계(정상 비율)</th> 
                                    <th colspan="7" style="background-color: white;border-style: none"></th>
                                </tr>                               
                                <tr>
                                    <th colspan="5" style="background-color: #f2e6d9;">목적지 선후착</th>
                                    <th colspan="4" style="background-color: #f2e6d9;">도착 지연 시간(후착 구간)</th>
                                </tr>
                                <tr>
                                	<th style="background-color: #f2e6d9;">CP</th>
                                	<th style="background-color: #f2e6d9;">총 구간</th>
                                	<th style="background-color: #f2e6d9;">선착률</th>
                                	<th style="background-color: #f2e6d9;">동시도착률</th>
                                	<th style="background-color: #f2e6d9;">후착률</th>
                                	<th style="background-color: #f2e6d9;">구간</th>
                                	<th style="background-color: #f2e6d9;">평균 지연 시간</th>
                                	<th style="background-color: #f2e6d9;">최대 지연 시간</th>
                                	<th style="background-color: #f2e6d9;">표준 편차</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>   
	                    <!-- \table -->  
                	</div>
                	<!-- /.row --> 
                	
                	<div class="row" style="border-style: none;">
						<!-- 목적지 선후착률(전체구간) -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="first_later_score"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	
                	<div class="row">
						<!-- 최선착 대비 도착 지연 시간 분포 -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="delay_score"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	
                	<div class="row">
						<!-- 주중 오전 첨두 선후착률 -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="am_peak_score"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	
                	<div class="row">
						<!-- 주중 오전 비첨두 선후착률 -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="am_non_peak_score"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	
                	<div class="row">
						<!-- 주중 오후 비첨두 선후착률 -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="pm_non_peak_score"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	
                	<div class="row">
						<!-- 주중 오후 첨두 선후착률 -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="pm_peak_score"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	
                	<div class="row">
						<!-- 주말 오전 선후착률 -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="am_score"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	
                	<div class="row">
						<!-- 주말 오후 선후착률 -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="pm_score"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	
                </div>
			</div>
		</div>
		<!-- \.body clearFix -->
	</div>
	<!-- \#container -->
</body>
<script>
	$(document).ready(function() {

		// 초기 date 설정
		setDate();
		
		// 주중, 주말 선택할 경우
		$('#weekday, #weekend').on('change', function() {
			var checked = $(this).is(':checked');
			var value = $(this).val();
			var items = $('.'.concat(value));
			items.prop('disabled', !checked);
			if (!checked) {
				// checked == false
				items.prop('checked', checked);
			}
			distanceCheck();
		});
		
		// 거리특성 선택할 경우
		$('.weekday, .weekend').on('change', function() {
			distanceCheck();
		});
		
		// 검색된 값이 없는경우 
		notFoundResult();
	
	});//document.ready
	
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
	* 거리특성 선택함수
	*/
	function distanceCheck() {
		var cnt = $('.timecheck input[type=checkbox]:checked').length;
		var items = $('.distance input[type=checkbox]'); 
		items.prop('disabled', (cnt>0) ? false : true);
		if (cnt <= 0) {
			items.prop('checked', false);
		}
	};
	
    
    /**
    * arrivalAndArrivalDelayTime data 조회
    */
    arrivalAndArrivalDelayTime = function() {
    	
    	var list = $('#tbl-delay-info').children('tbody');
    	var chart1 = $('#first_later_score');
    	
    	//시간대 특성 체크된 개수 확인
    	var count_time = $('.timecheck input:checked').length;
    	if (count_time < 1) {
    		alert('시간대특성 및 거리특성을 1개 이상 선택해 주시기바랍니다.');
			return false;
		}
    	
    	//거리 특성 체크된 개수 확인
    	var count_distance = $('.distance input:checked').length;
    	if (count_distance < 1) {
    		alert('거리특성을 1개 이상 선택해 주시기바랍니다.');
			return false;
		}
    	
    	//시작날짜 종료날짜 입력 확인
    	var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		if (start == null || start == '' || end == null || end == '') {
			return false;
		}
		
		$.ajax({
			url : '/detailsData/arrivalAndArrivalDelayTimeData'
				, type : 'post'
				, dataType : 'json'
	 			, data : $('#search-bmt').serializeObject()
				, processData : true /*querySTring make false*/
				, success : function(data, stat, xhr) {
					
					all_score_data = data.out;
					ampm_score_data = data.ampm;
					delay_score_data = data.delay;
					
					list.empty();
					
					if (data.out.length === 0) {
						alert('검색된 값이 없습니다');
						notFoundResult();
					};
					
					data.out.forEach(function(items, index, array) {
						var html = [
							'<tr>',
							'<td>', items.cp, '</td>',
							'<td>', items.total_count, '</td>',
							'<td>', items.ratio_first, '</td>',
							'<td>', items.ratio_together, '</td>',
							'<td>', items.ratio_later, '</td>',
							'<td>', items.path_count, '</td>',
							'<td>', items.avg_delay_time, '</td>',
							'<td>', items.max_delay_time, '</td>',
							'<td>', items.standard_deviation_delay, '</td>',
							'</tr>'
						].join('');
						list.append(html);
					});
					
					//그래프 함수 호출
					all_score();
					delay_score();
					ampeak_score();
					amnonpeak_score();
					pmnonpeak_score();
					pmpeak_score();
					am_score();
					pm_score();
		
				}
				,error : function(data, stat, xhr) {
					alert("error");
			    	console.log(err);
				}
		});
    };
    
    // 그래프 데이터 변수
    var all_score_data = '';
    var ampm_score_data = '';
    var delay_score_data = '';
    
    // 목적지 선후착률(전체구간) 그래프
    function all_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	all_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.score_first
				,items.score_together
				,items.score_later
			];
			array.push(chartdata);
		});
    	function drawChart() {
            var data = google.visualization.arrayToDataTable(array);
            var options = {title: '목적지 선후착률(전체구간)', isStacked:true};  
            var chart = new google.visualization.ColumnChart(document.getElementById('first_later_score'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
    }; 
    
    
    // 최선착 대비 도착 지연 시간 분포
    function delay_score() {
    	var array = [];
    	array.push(['cp', '구간번호', '최선착 대비 지연 시간 (단위:분)', 'color']);
    	delay_score_data.forEach(function(items, index, array2) {
    		var chartdata = [ 
				items.cp
				,items.delay_no
				,items.arrival_delay_time				
			];
    		if (chartdata[2] == '' || chartdata[2] == null || chartdata[2] == 0) {
				return;
			}
    		if (chartdata[0] != 'Bluelink 최소') {
    			chartdata.push(1);
			} else if (chartdata[0] != 'Bluelink 추천') {
				chartdata.push(2);
			} else if (chartdata[0] != 'T map 최소') {
				chartdata.push(3);
			} else if (chartdata[0] != 'T map 최적') {
				chartdata.push(4);
			} else if (chartdata[0] != 'Kakao') {
				chartdata.push(5);
			}
			array.push(chartdata);
    	});
    	function drawChart() {
            var data = google.visualization.arrayToDataTable(array);
            var options = {
            		title: '최선착 대비 도착 지연 시간 분포',            		
            		hAxis: {
                        title: '구간분포',
                        ticks: [],
                        gridlines: {color: '#696966'},
                        titleTextStyle:{italic:'0'}
                        },
                    vAxis: {
                        title: '최선착 대비 지연 시간 (단위:분)',
                        ticks: [],
                        gridlines: {color: '#696966'},
                        titleTextStyle:{italic:'0'}
                        },
                    colorAxis: {
               	        values: [1, 2, 3, 4, 5], 
               	        colors: ['#ff3385', '#8c1aff', '#00a3cc', '#009933', '#ff9966'], 
               	        legend: {position: 'none'}
                        },
                    sizeAxis: {
                    	maxSize:7,
                    	minSize:1    	
                        },
                    chartArea:{backgroundColor:'#fffffff'},
                    animation:{easing:'in'}
            }; 
            // 가로 라인개수
            for (i = 0; i < array.length; i++) { 
            	options.hAxis.ticks.push(i);
            };
            // 세로
            var cnt = array.length - 1;
            var total = array[cnt][2];
            var result = total/5 + 2;
            for (i = 0; i < result; i++) {
            	options.vAxis.ticks.push(i*5);
            };
            // 차트그리기
            var chart = new google.visualization.BubbleChart(document.getElementById('delay_score'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
    };
    
    
    // 주중 오전 첨두 그래프
    function ampeak_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.am_peak_score_first
				,items.am_peak_score_together
				,items.am_peak_score_later
			];
			array.push(chartdata);
		});
    	function drawChart() {
            var data = google.visualization.arrayToDataTable(array);
            var options = {title: '주중 오전첨두 선후착률', isStacked:true};  
            var chart = new google.visualization.ColumnChart(document.getElementById('am_peak_score'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
    };
    
    
    // 주중 오전 비첨두 그래프
    function amnonpeak_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.am_non_peak_score_first
				,items.am_non_peak_score_together
				,items.am_non_peak_score_later
			];
			array.push(chartdata);
		});
    	function drawChart() {
            var data = google.visualization.arrayToDataTable(array);
            var options = {title: '주중 오전 비첨두 선후착률', isStacked:true};  
            var chart = new google.visualization.ColumnChart(document.getElementById('am_non_peak_score'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
    };
    
    // 주중 오후 비첨두 그래프
     function pmnonpeak_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.pm_non_peak_score_first
				,items.pm_non_peak_score_together
				,items.pm_non_peak_score_later 
			];
			array.push(chartdata);
		});
    	function drawChart() {
            var data = google.visualization.arrayToDataTable(array);
            var options = {title: '주중 오전 비첨두 선후착률', isStacked:true};  
            var chart = new google.visualization.ColumnChart(document.getElementById('pm_non_peak_score'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
    };
    
    // 주중 오후 첨두 그래프
    function pmpeak_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.pm_peak_score_first
				,items.pm_peak_score_together
				,items.pm_peak_score_later 
			];
			array.push(chartdata);
		});
    	function drawChart() {
            var data = google.visualization.arrayToDataTable(array);
            var options = {title: '주중 오후 첨두 선후착률', isStacked:true};  
            var chart = new google.visualization.ColumnChart(document.getElementById('pm_peak_score'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
    };
    
    // 주말 오전 그래프 
    function am_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.am_score_first
				,items.am_score_together
				,items.am_score_later
			];
			array.push(chartdata);
		});
    	function drawChart() {
            var data = google.visualization.arrayToDataTable(array);
            var options = {title: '주말 오전 선후착률', isStacked:true};  
            var chart = new google.visualization.ColumnChart(document.getElementById('am_score'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
    };
    
    // 주말 오후 그래프
    function pm_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.pm_score_first
				,items.pm_score_together
				,items.pm_score_later
			];
			array.push(chartdata);
		});
    	function drawChart() {
            var data = google.visualization.arrayToDataTable(array);
            var options = {title: '주말 오후 선후착률', isStacked:true};  
            var chart = new google.visualization.ColumnChart(document.getElementById('pm_score'));
            chart.draw(data, options);
         }
         google.charts.setOnLoadCallback(drawChart);
    };
    
    
    /**
     * 검색된 값이 없는 경우
     */
     notFoundResult = function() {
    	$('#tbl-delay-info').children('tbody').append('<tr><td colspan="9">검색된 값이 없습니다</tr>');
     };
    
    
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