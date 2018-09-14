<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>도착 예정 시간 오차 및 오차율</title>
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
				<!-- .titContents -->
				<div class="titContents">
					<h2>도착 예정 시간 오차 및 오차율</h2>
					<p>
						Home > 상세데이터 >
						<strong>도착 예정 시간 오차 및 오차율</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" width=100%>
                	<!-- .search -->
                	<jsp:include page="/WEB-INF/views/layouts/checkbox.jsp"/>
                	<!-- /.search -->
                	<!-- .row -->   
                	<div style="margin-bottom: 25px">
	                	<!-- table -->               
                    	<table id="tbl-arrival-error-info" style="border-style: none;">
                            <thead>
                            	<tr>
                                    <th colspan="2" style="background-color: #e6e6ff;">도착 예정 시간 오차</th> 
                                    <th colspan="3" style="background-color: white;border-style: none"></th>
                                </tr>                               
                                <tr>
                                    <th rowspan="3">평가 대상</th>
                                    <th colspan="4">정상주행</th>
                                </tr>
                                <tr>
                                	<th>구간</th>
                                	<th>ETA 오차 평균</th>
                                	<th>ETA 오차 최대</th>
                                	<th>ETA 오차 표준오차</th>
                                </tr>
                                <tr>
                                	<th>(단위 : 개 )</th>
                                	<th>(단위 : 분)</th>
                                	<th>(단위 : 분)</th>
                                	<th>(단위 : 분)</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>   
	                    <!-- \table -->  
                	</div>
                	<!-- /.row --> 
                	<!-- .row -->   
                	<div class="row" style="margin-bottom: 25px">
	                	<!-- table -->               
                    	<table id="tbl-arrival-errorRate-info" style="border-style: none;">
                            <thead style="height: 25px">
                             	<tr>
                                    <th colspan="2" style="background-color: #e6e6ff;">도착 예정 시간 오차율</th> 
                                    <th colspan="3" style="background-color: white;border-style: none"></th>
                                </tr>                               
                                <tr>
                                    <th rowspan="3">평가 대상</th>
                                    <th colspan="4">정상주행</th>
                                </tr>
                                <tr>
                                	<th>구간</th>
                                	<th>ETA 오차율 평균</th>
                                	<th>ETA 오차율 최대</th>
                                	<th>ETA 오차율 표준오차</th>
                                </tr>
                                <tr>
                                	<th>(단위 : 개 )</th>
                                	<th>(단위 : %)</th>
                                	<th>(단위 : %)</th>
                                	<th>(단위 : %)</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>   
	                    <!-- \table -->  
                	</div>
                	<!-- /.row --> 
                	<!-- .row -->  
                	<div class="row" style="border-style: none;">
						<!-- 도착 예정 시간 분포도 -->
	                    <table style="border-style: none;">
	                    	<tbody style="border-style: none;">
		                    	<tr style="border-style: none;">
		                    		<td style="border-style: none;">
		                    			<div id="arrival_graph"></div>
		                    		</td>
		                    	</tr>
	                    	</tbody>
	                    </table>
                	</div>
                	<!-- /.row --> 
                </div>
                <!-- /.contents -->
			</div>
			<!-- /#contentArea -->
		</div>
		<!-- \.body clearFix -->
	</div>
	<!-- \#container -->
</body>
<script src="/js/common.js"></script>
<script>
	$(document).ready(function() {
		
		$('.btnSearch').attr('href', 'javascript:arrivalScheduledTimeErrorAndErrorRate()');
	
		// 검색된 값이 없는경우 
		notFoundResult();
	
	});//document.ready
	
	
	/**
	* arrivalScheduledTimeErrorAndErrorRate data 조회
	*/
	arrivalScheduledTimeErrorAndErrorRate = function() {
		
		var list1 = $('#tbl-arrival-error-info').children('tbody');
		var list2 = $('#tbl-arrival-errorRate-info').children('tbody');
    	//var chart1 = $('#first_later_score');
    	
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
			url : '/detailsData/arrivalScheduledTimeErrorAndErrorRateData'
				, type : 'post'
				, dataType : 'json'
	 			, data : $('#search-bmt').serializeObject()
				, processData : true /*querySTring make false*/
				, success : function(data, stat, xhr) {
					
					arrival_data = data.out;
					arrival_graph_data = data.graph;
					
					list1.empty();
					list2.empty();
					
					if (data.out.length === 0) {
						alert('검색된 값이 없습니다');
						notFoundResult();
						return;
					};
					
					data.out.forEach(function(items, index, array) {
						var html1 = [
							'<tr class="',  items.check_select_02 , '">',
							'<td>', items.cp, '</td>',
							'<td>', items.normal_count, '</td>',
							'<td>', items.avg_mae_eta, '</td>',
							'<td>', items.max_mae_eta, '</td>',
							'<td>', items.standard_deviation_mae, '</td>',
							'</tr>'
						].join('');
						
						var html2 = [
							'<tr class="',  items.check_select_02 , '">',
							'<td>', items.cp, '</td>',
							'<td>', items.normal_count, '</td>',
							'<td>', items.avg_mape_eta, '</td>',
							'<td>', items.max_mape_eta, '</td>',
							'<td>', items.standard_deviation_mape, '</td>',
							'</tr>'
						].join('');
						
						list1.append(html1);
						list2.append(html2);
						
					});
					//강조 표시
					$('.1').css( "background-color", '#e6ffcc' );
					$('.2').css( "background-color", '#ffcccc' );
					
					//그래프 함수 호출
					arrival_graph();
		
				}
				,error : function(data, stat, xhr) {
					alert("error");
			    	console.log(err);
				}
		});
	};
	
	// 그래프 데이터 변수
	var arrival_data = '';
	var arrival_graph_data = '';
	
	// 도착 예정 시간 분포도 그래프 
	function arrival_graph() {
		$('#arrival_graph').empty();
		if (arrival_graph_data == '' || arrival_graph_data == null) {
			return;
		};
		var array = [];
		array.push(['cp', '구간번호', 'ETA오차(단위:분)', 'legend']);
		arrival_graph_data.forEach(function(items, index, array2) {
    		var chartdata = [ 
				items.cp
				,items.eta_mae_no
				,items.eta_mae	
				,items.cp
			];
    		// null check
    		if (chartdata[2] == null) {
				return;
			}
			array.push(chartdata);
		});
         google.charts.setOnLoadCallback(arrival_drawChart(array));
	};
	
	// 도착 예정 시간 분포도 차트 그리기 함수
	function arrival_drawChart(array) {
        var data = google.visualization.arrayToDataTable(array);
        var options = {
        		title: '도착 예정 시간 분포도',            		
        		hAxis: {
                    title: '구간번호',
                    ticks: [],
                    gridlines: {color: '#696966'},
                    titleTextStyle:{italic:'0'}
                    },
                vAxis: {
                    title: 'ETA오차(단위:분)',
                    ticks: [],
                    gridlines: {color: '#696966'},
                    titleTextStyle:{italic:'0'}
                    },
                colors: [],
                sizeAxis: {
                	maxSize:7,
                	minSize:1    	
                    },
                chartArea:{backgroundColor:'#fffffff'},
                animation:{easing:'in'}
        }; 
        // bubbleChart options set line fucntion
        setBubbleOptions_line(array, options);
     	// bubbleChart options set color fucntion
        setBubbleOptions_color(options);
        var chart = new google.visualization.BubbleChart(document.getElementById('arrival_graph'));
        chart.draw(data, options);
     };
     
  	// bubbleChart options set line fucntion
    function setBubbleOptions_line(array, options) {
    	
    	// 첫번째 배열값 제외
    	var cnt = array.length - 1;
    	 
    	// 구간번호 : eta_mae_no (구간번호 기준으로 DB조회되므로 마지막 값이 최대값이다.)
        var hval = array[cnt][1] + 3;
    	 
      	// 가로 라인개수 조회 결과값 중 최대값
        var maxNum= 0;
      	
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
		
		// 가로 라인개수(그래프에 반영)
		var result = maxNum + 10;
        for (var j = 0; j < result; j += 5) {
        	options.vAxis.ticks.push(j);
        };
    };
    
 	// bubbleChart options set color fucntion
    function setBubbleOptions_color(options) {
    	var co = ['#FF0000', '#0000FF', '#FFFF00', '#00FF00', '#FFA500', '#BA55D3', '#8B4513', '#C0C0C0', '#EE82EE', '#00BFFF'];
    	var cp = [];
    	arrival_data.forEach(function(items, index, array) {
			cp.push(items.cp); 
    	});
    	
    	var cnt = cp.length;
    	
  		// colorAxis.colors 
  		if (cnt <= 10) {
  			for (var i = 0; i < cnt; i++) {
  				options.colors.push(co[i]);
  	  		};
		} else {
			for (var i = 0; i < 10; i++) {
				options.colors.push(co[i]);
  	  		};	
  	  		for (var i = 10; i < cnt; i++) {
  	  			// getRandomColor()은 common.js 안에 있습니다.
  	  		options.colors.push(getRandomColor());
	  		};
		}
    };
    
	
	/**
     * 검색된 값이 없는 경우
     */
     notFoundResult = function() {
    	$('#tbl-arrival-error-info').children('tbody').append('<tr><td colspan="5">검색된 값이 없습니다</tr>');
    	$('#tbl-arrival-errorRate-info').children('tbody').append('<tr><td colspan="5">검색된 값이 없습니다</tr>');
    	$('#arrival_graph').empty();
     };
    
</script>
</html>