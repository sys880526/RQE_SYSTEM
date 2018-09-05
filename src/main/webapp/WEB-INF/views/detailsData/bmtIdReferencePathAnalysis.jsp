<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
	<head>
		<title>BMT ID 기준 경로 지도 분석</title>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
	    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
	    <script type="text/javascript" src="../js/style.js"></script>
	    <script type="text/javascript" src="../js/common.js"></script>
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fbd114108f63ae7f837dbe2cee10a1ba"></script>
	    
	    
	     <!-- CSS -->
	    <link rel="stylesheet" type="text/css" href="../css/import.css" />
	    <link rel="stylesheet" type="text/css" href="../css/board.css" />
	    <link rel="stylesheet" type="text/css" href="../css/common.css" />
	    <link rel="stylesheet" type="text/css" href="../css/default.css" />
	    <link rel="stylesheet" type="text/css" href="../css/layout.css" />
	    <link rel="stylesheet" type="text/css" href="../css/login.css" />
	    <link rel="stylesheet" type="text/css" href="../css/style.css" />
	    <link rel="stylesheet" type="text/css" href="../css/modal.css" />
	    
	    <style>
	    	#cpResultTableDiv table thead tr th,
	    	#cpResultTableDiv table tbody tr td,
	    	#analysisTableDiv table thead tr th,
	    	#analysisTableDiv table tbody tr th,
	    	#analysisTableDiv table tbody tr td
	    	{
	    		padding : 0;
	    	}
	    	#analysisTableDiv table thead tr th,
	    	#analysisTableDiv table tbody tr th{
    		    width: 90px;
	    	}
	    	#cpResultTableDiv table tbody tr td{
	    	    font-weight: bold;
    	    }
	    
	    </style>
	</head>
	<body>
		<!-- #container -->
		<div id="container" class="gnb">
			<!-- #header -->
			<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
			<!-- \#header -->
			<div class="body clearFix">
				<!-- #snbArea -->
				<jsp:include page="/WEB-INF/views/layouts/detailsData_subMenu.jsp"/>
				<!-- \#snbArea -->
				<!-- #contentArea -->
				<div id="contentsArea">
					<!-- .titContents -->
					<div class="titContents">
						<h2>BMT ID 기준 경로 지도 분석</h2>
						<p>
							Home > 상세데이터 >
							<strong>BMT ID 기준 경로 지도 분석</strong>
						</p>
					</div>
					<!-- \.titContents -->
					<!-- .contents -->
	                <div class="contents" style="width:100%">
	                	<!-- .search -->
	                	<jsp:include page="/WEB-INF/views/layouts/checkbox.jsp"/>
	                	<!-- /.search -->
	                	<div id="resultDiv">
	                		<div id="resultListDiv" style="width: 15%; float: left;">
	                			<table>
	                				<thead>
	                					<tr>
	                						<th>BMT_ID</th>
	                					</tr>
	                				</thead>
	                				<tbody>
	                				</tbody>
	                			</table>
	                		</div>
	                		<div id="resultMapDiv" style= "position: relative; width:85%; height:550px; z-index:1; float: right;">
	                			<div id="cpResultTableDiv" style="width: 20%;position: absolute; z-index: 2;">
	                				<table style="border:3px dashed; background:white;">
	                					<thead>
	                						<tr>
		                						<th>cp명</th>
		                						<th>구분</th>
	                						</tr>
	                					</thead>
	                					<tbody>
	                					</tbody>
	                				</table>
	                			</div>
	                			<div id="analysisTableDiv" style="width: 75%; float: right; position: absolute; z-index: 2; left: 170px;">
	                				<table style="border:3px dashed; background:white;">
		                				<thead></thead>
		                				<tbody></tbody>
	                				</table>
	                			</div>
	                			<div id="bmtIdReferencePathAnalysisDiv" style= "position: relative; height:550px; z-index:1;">
	                			
	                			</div>
	                		</div>
	                	
	                	</div>
	               	</div>
	               	<!-- /.contents -->
	            </div>
	            <!-- /#contentsArea -->
	        </div>
	        <!-- /.body.clearFix -->
        </div>
        <!-- /#container -->
	</body>
	<script>
		var mapContainer = document.getElementById('bmtIdReferencePathAnalysisDiv'), // 지도를 표시할 div  
			mapOption = { 
			    center: new daum.maps.LatLng(37.314438, 126.954653), // 지도의 중심좌표
			    level: 9 // 지도의 확대 레벨
			};
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var polylineList = [];
		
		$(document).ready(function() {
			
			$('.btnSearch').attr('href', 'javascript:bmtIdReferencePathAnalysis()');
			
			notFoundResult();
	
		});//document.ready
		
	    
	    /**
	     * 검색된 값이 없는 경우
	     */
	     notFoundResult = function() {
	     	$('#tbl-specific-list').children('tbody').append('<tr><td colspan="3">검색된 값이 없습니다</tr>');
	     	$('#tbl-specific-info').children('tbody').append('<tr><td colspan="5">검색된 값이 없습니다</tr>');					
	 		$('#tbl-specific-etc1').text('검색된 값이 없습니다');
	 		$('#tbl-specific-etc2').text('검색된 값이 없습니다');
	 		$('#tbl-specific-etc3').text('검색된 값이 없습니다');
	     };
	    
	     
	     /** 
	     *	데이터 조회
	     */
		bmtIdReferencePathAnalysis = function(){
			var list1 = $('#tbl-specific-list').children('tbody');
	    	var list2 = $('#tbl-specific-info').children('tbody');
	    	var image = $('#specific-image');
	    	
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
	    	 
			$("#resultListDiv > table > tbody").empty();
			
			$.ajax({
				url : '/detailsData/getBmtIdList'
				, type : 'post'
				, dataType : 'json'
	 			, data : $('#search-bmt').serializeObject()
				, processData : true /*querySTring make false*/
				, success : function(data, stat, xhr) {
					var resultListHtml = '';
					for(var i = 0; i < data.list.length; i++){
						resultListHtml += '<tr onclick="selectBmtId(\''+data.list[i].bmtid+'\')">';
						resultListHtml += '<td>' +data.list[i].bmtid+ '</td>';
						resultListHtml += '</tr>';
						
					}
					$("#resultListDiv > table > tbody").html(resultListHtml);
				}
				, error : function(xhr, stat, err) {
			    	alert("error");
			    	console.log(err);
			    }
			});
    	}
			
		selectBmtId = function(bmtId){
			var data = {
					bmtid : bmtId
					, userid : "user01"				
			};
			
			$.ajax({
				url : '/detailsData/getBmtIdListDetail'
		        , type : 'post'
				, dataType : 'json'
	 			, data : JSON.stringify(data)
				, contentType : 'application/json; charset=UTF-8'
				, success : function(data, stat, xhr) {
					var colorList = [];
					console.log(data);
					// cp list 테이블
					if(data.list.userList != null && data.list.userList != ''){
						var userList = data.list.userList;
						var userListHtml = '';
						$("#cpResultTableDiv > table > tbody").empty();
						for(var i = 0; i < userList.length; i++){
// 							var color = 'black';
							var color = getRandomColor();
							userListHtml += '<tr>';
							userListHtml += '<td>'+userList[i].cp+'</td>';
							userListHtml += '<td style="background-color:'+color+'"></td>';
							userListHtml += '</tr>';
							
							colorList.push(color);
						}
						$("#cpResultTableDiv > table > tbody").html(userListHtml);
					}
					// 분석데이터
					if(data.list.analysisList != null && data.list.analysisList != ''){
						var analysisList = data.list.analysisList;				
						$("#analysisTableDiv > table > thead").empty();
						$("#analysisTableDiv > table > tbody").empty();
						var subHeadHtml1 = '';
						var subHeadHtml2 = '<tr><th>CP</th>';
						var subHeadHtml3 = '<tr><th>구간주행상태</th>';
						subHeadHtml1 += '<tr>';
						subHeadHtml1 += '<th>BMTID</th>';
						subHeadHtml1 += '<th colspan="'+analysisList.length+'">'+ analysisList[0].bmtid +'</th>';
						subHeadHtml1 += '</tr>';
						// 분석데이터 헤더
						for(var i = 0; i < analysisList.length; i++){
							subHeadHtml2 += '<th>';
							subHeadHtml2 += analysisList[i].cp;
							subHeadHtml2 += '</th>';
							subHeadHtml3 += '<th>';
							subHeadHtml3 += analysisList[i].bmt_condition;
							subHeadHtml3 += '</th>';
						}
						subHeadHtml1 += '</tr>';
						subHeadHtml2 += '</tr>';
						var subHeadHtml = subHeadHtml1 + subHeadHtml2 + subHeadHtml3;

						$("#analysisTableDiv > table > thead").html(subHeadHtml);
						
						
						// 분석 데이터 tbody 부분
						var subBodyHtml1 = '<tr><th>예상 소요 시간</th>';
						var subBodyHtml2 = '<tr><th>실제 소요 시간</th>';
						var subBodyHtml3 = '<tr><th>예상 소요 거리</th>';
						var subBodyHtml4 = '<tr><th>실제 소요 거리</th>';
						var subBodyHtml5 = '<tr><th>예상 소요 요금</th>';
						var subBodyHtml6 = '<tr><th>실제 소요 요금</th>';
						
						for(var i = 0; i < analysisList.length; i++){
							subBodyHtml1 += '<td>';
							subBodyHtml1 += analysisList[i].est_time;
							subBodyHtml1 += '</td>';
							
							subBodyHtml2 += '<td>';
							subBodyHtml2 += analysisList[i].driver_tm;
							subBodyHtml2 += '</td>';
							
							subBodyHtml3 += '<td>';
							subBodyHtml3 += analysisList[i].est_distance;
							subBodyHtml3 += '</td>';
							
							subBodyHtml4 += '<td>';
							subBodyHtml4 += analysisList[i].arrive_distance;
							subBodyHtml4 += '</td>';
							
							subBodyHtml5 += '<td>';
							subBodyHtml5 += analysisList[i].est_charge;
							subBodyHtml5 += '</td>';
							
							subBodyHtml6 += '<td>';
							subBodyHtml6 += analysisList[i].arrive_charge;
							subBodyHtml6 += '</td>';
						}
						subBodyHtml1 += '</tr>';
						subBodyHtml2 += '</tr>';
						subBodyHtml3 += '</tr>';
						subBodyHtml4 += '</tr>';
						subBodyHtml5 += '</tr>';
						subBodyHtml6 += '</tr>';
						
						var subHeadHtml = subBodyHtml1 
										+ subBodyHtml2 
										+ subBodyHtml3 
										+ subBodyHtml4 
										+ subBodyHtml5 
										+ subBodyHtml6;
						$("#analysisTableDiv > table > tbody").html(subHeadHtml);
					}
						
// 					선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
// 					var linePath = [
// 					    new daum.maps.LatLng(33.452344169439975, 126.56878163224233),
// 					    new daum.maps.LatLng(33.452739313807456, 126.5709308145358),
// 					    new daum.maps.LatLng(33.45178067090639, 126.5726886938753) 
// 					];

					// 지도에 표시할 선을 생성합니다
// 					var polyline = new daum.maps.Polyline({
// 					    path: linePath, // 선을 구성하는 좌표배열 입니다
// 					    strokeWeight: 5, // 선의 두께 입니다
// 					    strokeColor: '#FFAE00', // 선의 색깔입니다
// 					    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
// 					    strokeStyle: 'solid' // 선의 스타일입니다
// 					});

					// 지도에 선을 표시합니다 
// 					polyline.setMap(map);  
						
					
					for(var i= 0 ; i < polylineList.length; i++) {
						polylineList[i].setMap(null);
					}
					
					polylineList= [];
					var centerLat = 0;
					var centerLon = 0;
					if(data.list.gpsDataList.length != null && data.list.gpsDataList != ''){
						var gpsDataList = data.list.gpsDataList;
						for(var i = 0; i < gpsDataList.length; i++){
							var linePath = [];
							for(var j = 0; j < gpsDataList[i].length ; j++){
								linePath.push(new daum.maps.LatLng(gpsDataList[i][j].lat, gpsDataList[i][j].lon));
								centerLat += parseFloat(gpsDataList[i][j].lat);
								centerLon += parseFloat(gpsDataList[i][j].lon);
							}
							centerLat = centerLat / gpsDataList[i].length;								
							centerLon = centerLon / gpsDataList[i].length;								
							
							var polyline = new daum.maps.Polyline({
							    path: linePath, // 선을 구성하는 좌표배열 입니다
							    strokeWeight: 5, // 선의 두께 입니다
							    strokeColor: colorList[i], // 선의 색깔입니다
							    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
							    strokeStyle: 'solid' // 선의 스타일입니다
							});
							polyline.setMap(map);
							polylineList.push(polyline);
						}
					}
					
					
					map.setCenter(new daum.maps.LatLng(centerLat ,centerLon));
					
					
				}
				, error : function(xhr, stat, err) {
			    	alert("error");
			    	console.log("xhr" + xhr);
			    	console.log("stat" + stat);
			    	console.log("err" + err);
			    }
			});
		}

	</script>
</html>