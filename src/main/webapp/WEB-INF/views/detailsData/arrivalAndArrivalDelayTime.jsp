<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                	<jsp:include page="/WEB-INF/views/layouts/checkbox.jsp"/>
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
                                    <th colspan="5">목적지 선후착</th>
                                    <th colspan="4">도착 지연 시간(후착 구간)</th>
                                </tr>
                                <tr>
                                	<th>CP</th>
                                	<th>총 구간</th>
                                	<th>선착률</th>
                                	<th>동시도착률</th>
                                	<th>후착률</th>
                                	<th>구간</th>
                                	<th>평균 지연 시간</th>
                                	<th>최대 지연 시간</th>
                                	<th>표준 편차</th>
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
		
		$('.btnSearch').attr('href', 'javascript:arrivalAndArrivalDelayTime()');
		
		// 검색된 값이 없는경우 
		notFoundResult();
	
	});//document.ready

    
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
					
					// 표 및 그래프 초기화
					list.empty();
					$('#first_later_score').empty();
					$('#delay_score').empty();
					$('#am_peak_score').empty();
					$('#pm_non_peak_score').empty();
					$('#pm_peak_score').empty();
					$('#am_score').empty();
					$('#pm_score').empty();
					
					if (data.out.length === 0) {
						alert('검색된 값이 없습니다');
						notFoundResult();
						return;
					};
					
					data.out.forEach(function(items, index, array) {
						
						if (items.avg_delay_time == null || items.avg_delay_time == '') {
							items.avg_delay_time = '-';
						}; 
						if (items.max_delay_time == null || items.max_delay_time == '') {
							items.max_delay_time = '-';
						};
						if (items.standard_deviation_delay == null || items.standard_deviation_delay == '') {
							items.standard_deviation_delay = '-';
						};
						
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
    		if (chartdata[2] == '' || chartdata[2] == null) {
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
                        title: '구간번호',
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
            
            var cnt = array.length - 1;
            var hval = array[cnt][1] + 1;
            var maxNum= 0;
            //var total = array[cnt][2];
            //var result = total/3 + 2;
            // 세로 라인개수
            for (i = 0; i < hval; i++) { 
            	options.hAxis.ticks.push(i);
            };
            // 가로 라인개수
            for (var i = 0; i < cnt; i++) {
	        	// maxNum 값이 없는 경우 현재 배열값으로 지정
	        	/* if (maxNum == 0 || maxNum == null) {
	        	    maxNum = array[0][2];
	        	}; */
	        	// maxNum의 값과 현재 값을 비교해서 maxNum값을 가장 큰 값으로 유지
	        	if (maxNum < array[i][2]) {
	        	    maxNum = array[i][2];
	        	};
			};
			var result = maxNum+5;
			console.log(maxNum);
			console.log(result);
            for (j = 0; j < result; j += 3) {
            	options.vAxis.ticks.push(j);
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
            var options = {title: '주중 오후 비첨두 선후착률', isStacked:true};  
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
     function notFoundResult() {
    	$('#tbl-delay-info').children('tbody').append('<tr><td colspan="9">검색된 값이 없습니다</tr>');
    	$('#first_later_score').empty();
		$('#delay_score').empty();
		$('#am_peak_score').empty();
		$('#am_non_peak_score').empty();
		$('#pm_non_peak_score').empty();
		$('#pm_peak_score').empty();
		$('#am_score').empty();
		$('#pm_score').empty();
    	
     };

</script>
</html>