<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>건수/거리/요금/시간 집계</title>
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
    
    <!-- Google Chart -->
  	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
					<h2>건수/거리/요금/시간 집계</h2>
					<p>
						Home > 종합데이터 >
						<strong>건수/거리/요금/시간 집계</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" style="width:100%">
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
                            <a href="javascript:getList()" class="btnSearch">
                                <img src="../images/board/btn_search.gif" alt="search" />
                            </a>
                        </form>
                    </div>
                    <!-- /.search -->
					<div style="width:100%; padding-bottom: 20px; padding-top: 20px">
						<table style="width:100%; padding-bottom: 20px">
							<tbody>
								<tr>
									<td id="Comprehensive_distanceGraph" style="width:33%; height: 250px"></td>
									<td id="Comprehensive_timeGraph" style="width:33%; height: 250px"></td>
									<td id="Comprehensive_chargeGraph" style="width:33%; height: 250px"></td>
								</tr>
							</tbody>
						</table>
					</div>
                    
                    <div style="padding-bottom: 20px">
                        <table id="EvaluationSectionStatus" cellspacing="0" width="100%" border="0">
                            <thead>
<!-- 								<tr style="background-color: #e6f2ff;"> -->
								<tr>
										<th>평가 구간 현황</th>
								</tr>		
<!--                                 <tr style="background-color: #e6f2ff;"> -->
                                <tr>
										<th rowspan="2">평가 대상명</th>
										<th>정상 주행</th>
										<th>기타(경로이탈 등)</th>
										<th>총 구간</th>
                                </tr>
                                <tr>
                                <th>단위 : 개</th>
                                <th>단위 : 개</th>
                                <th>단위 : 개</th>
                            </thead>
                            <tbody></tbody>
                        </table>
                      </div>
                      
                      
                      <div>  
                           <table id="PathCostStatus" cellspacing="0" width="100%" border="0">
                            <thead>
								<tr style="background-color: #e6f2ff;">
										<th>경로 비용 현황</th>
								</tr>		
                                <tr style="background-color: #e6f2ff;">
										<th rowspan="2">평가 대상명</th>
										<th>대상 구간</th>
										<th>총 경로 거리</th>
										<th>총 통행 요금</th>
										<th>총 통행 시간</th>
										<th colspan="3">총 통행 거리</th>
										<th colspan="3">총 통행 요금</th>
                                </tr>
                                <tr style="background-color: #e6f2ff;">
                                <th>단위 : 개</th>
                                <th>단위 : km</th>
                                <th>단위 : 원</th>
                                <th>단위 : 분</th>
                                <th>총계(∑)</th>
                                <th>차이(∆c)</th>
                                <th>차이(∆c/cmin)</th>
                                <th>총계(∑)</th>
                                <th>차이(∆c)</th>
                                <th>차이(∆c/cmin)</th>
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
		getList();
		
		/**
		* data sheet 상세보기
		*/
		
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
	} 
	
	
	// Load the Visualization API and the piechart package.
	google.charts.load('current', {'packages':['corechart']});
  
	// Set a callback to run when the Google Visualization API is loaded.
// 	google.charts.setOnLoadCallback(drawChart1);
// 	google.charts.setOnLoadCallback(drawChart2);
// 	google.charts.setOnLoadCallback(drawChart3);
     
	//총 경로 거리 차트 function
     function drawChart1(data) {
    	 // Create the data table.
    	 var graphData1 = new google.visualization.DataTable();
    	 
         graphData1.addColumn('string', 'cp 명');
         graphData1.addColumn('number', '총 경로 거리');
         
         for(var i = 0; i < data.list.length; i++){
            graphData1.addRow([data.list[i].cp, data.list[i].sum_distance]);
            
         }
         
          var options = {
            title: '총 경로 거리 (단위:km)',
            is3D: true,
          };

          var chart1 = new google.visualization.PieChart(document.getElementById('Comprehensive_distanceGraph'));
          chart1.draw(graphData1, options);
        }
     
 	//총 통행 요금 차트 function
     function drawChart2(data) {
       var graphData2 = new google.visualization.DataTable();
    	   graphData2.addColumn('string', 'cp 명');
           graphData2.addColumn('number', '총 통행 요금');
           
           for(var i = 0; i < data.list.length; i++){
              graphData2.addRow([data.list[i].cp, data.list[i].sum_charge]);
              
           }

       var options = {
         title: '총 통행 요금 (단위:원)',
         is3D: true,
       };

       var chart2 = new google.visualization.PieChart(document.getElementById('Comprehensive_chargeGraph'));
       chart2.draw(graphData2, options);
     }
 	//총 통행 시간 차트 function
     function drawChart3(data) {
       var graphData3 = new google.visualization.DataTable();
           graphData3.addColumn('string', 'cp 명');
           graphData3.addColumn('number', '총 통행 시간');
           
           for(var i = 0; i < data.list.length; i++){
                  graphData3.addRow([data.list[i].cp, data.list[i].sum_tm]);
               }
    	   
       var options = {
         title: '총 통행 시간 (단위:분)',
         is3D: true,
       };

       var chart3 = new google.visualization.PieChart(document.getElementById('Comprehensive_timeGraph'));
       chart3.draw(graphData3, options);
     }
     
	
	getList = function() {
		var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		if (start == null || start == '' || end == null || end == '') {
			return false;
		}
		var jsonStr = JSON.stringify($('#search-bmt').serialize());

		$.ajax({
			url : '/synthesisData/totalDistanceFaresTimesData'
	        , type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				
				var evaluationSectionStatusHtml = '';
				var pathCostStatusHtml = '';
				
				for(var i = 0; i < data.list.length; i++){				
					evaluationSectionStatusHtml += '<tr>';
					evaluationSectionStatusHtml += '<td>'+data.list[i].cp+'</td>';
					evaluationSectionStatusHtml += '<td>'+data.list[i].normal_count+'</td>';
					evaluationSectionStatusHtml += '<td>'+data.list[i].abnormal_count+'</td>';
					evaluationSectionStatusHtml += '<td>'+data.list[i].total_count+'</td>';
					evaluationSectionStatusHtml += '</tr>';
					
					pathCostStatusHtml += '<tr>'
					pathCostStatusHtml += '<td>'+data.list[i].cp+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].bmt_count+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_distance+' km'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_charge+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_tm+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_distance+' km'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sub_distance+' km'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].ratio_distance+'%'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_charge+' 원'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sub_charge+' 원'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].ratio_charge+' %'+'</td>';
					pathCostStatusHtml += '</tr>'
					
				}
				$('#EvaluationSectionStatus > tbody').html(evaluationSectionStatusHtml);
				$('#PathCostStatus > tbody').html(pathCostStatusHtml);
				drawChart1(data);
				drawChart2(data);
				drawChart3(data);

				// 기존 김지은 사원 foreach 소스
// 				data.list.forEach(function(items, index, array) {					
// 					var html = [
// 						'<tr>',
// 						'<td>', items.cp , '</td>',
// 						'<td>', items.normal_count , '</td>',
// 						'<td>', items.abnormal_count , '</td>',
// 						'<td>', items.total_count , '</td>',
// 						'</tr>'
// 					].join('');
// 					list.append(html);
// 				});//forEach
					
			}
		    , error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		});


		
		
		
// 		$.ajax({
// 			url : '/synthesisData/totalDistanceFaresTimesData',
// 			type : 'post',
// 			data : {start : start, end : end},
// 			data : $('#search-bmt').serialize(),
// 			dataType : 'json',
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
