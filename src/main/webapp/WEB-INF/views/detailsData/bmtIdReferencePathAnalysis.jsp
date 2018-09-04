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
	                	<div class="search">
	                        <form id="search-bmt">
	                        	<div class="row" style="margin-bottom: 20px">
	                        		<span class="pd">시작 날짜</span>
	                            <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" />
	                            <span class="pd">~</span>
	                            <span class="pd">종료 날짜</span>
	                            <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" />
	                            <a href="javascript:bmtIdReferencePathAnalysis()" class="btnSearch">
	                                <img src="../images/board/btn_search.gif" alt="search" />
	                            </a>
	                        	</div>
	                            <div class="row">
	                            	<div class="day" style="padding: 0px 3px 0px 10px;display: inline-block;vertical-align: top;">
		                            	<span style="display : table;">요일특성</span>
		                            	<br>
										<label style="display: table;margin-bottom: 7px;">
										  <input type="checkbox" id="weekday">주중
										</label>
										<label>
											<input type="checkbox" id="weekend">주말
										</label>
	                            	</div>                            	
	            					<div class="timecheck" style="padding: 0px 0px 0px 100px;display: inline-block;vertical-align : top;">
	            						<span style="display : table;padding: 0px 0px 10px 0px;">시간대특성</span>
	            						<div class="row">
	            							<div style="display: inline-block;">
			            						<label style="display: table;margin-bottom: 7px;">
												  <input type="checkbox" id="am_peak" name="am_peak" value="am_peak">오전 첨두
												</label>
												<label style="display: table;margin-bottom: 7px;">
												  <input type="checkbox" id="pm_peak" name="pm_peak" value="pm_peak">오후 첨두
												</label>
												<label>
												  <input type="checkbox" id="am" name="am" value="am">오전
												</label>
	            							</div>
	            							<div style="padding: 0px 100px 0px 20px;display: inline-block;">
		            							<label style="display: table;margin-bottom: 7px;">
												  <input type="checkbox" id="am_non_peak" name="am_non_peak" value="am_non_peak">오전 비첨두
												</label>
												<label style="display: table;margin-bottom: 7px;">
												  <input type="checkbox" id="pm_non_peak" name="pm_non_peak" value="pm_non_peak"> 오후 비첨두
												</label>
												<label>
												  <input type="checkbox" id="pm" name="pm" value="pm">오후
												</label>
	            							</div>
	            						</div>
	            					</div>
	            					<div class="distance" style="display: inline-block;vertical-align: top;">
	            						<span style="display : table;padding: 0px 0px 10px 0px;">거리특성</span>
	            						<label style="display: table;margin-bottom: 7px;">
										  <input type="checkbox" id="shortest_distance" name="shortest_distance" value="shortest_distance"> 초 단거리(0 ~ 5km)
										</label>
										<label style="display: table;margin-bottom: 7px;">
										  <input type="checkbox" id="short_distance" name="short_distance" value="short_distance"> 단거리(5 ~ 10km)
										</label>
										<label style="display: table;margin-bottom: 7px;">
										  <input type="checkbox" id="medium_distance" name="medium_distance" value="medium_distance"> 중거리(10 ~ 30km)
										</label>
										<label style="display: table;margin-bottom: 7px;">
										  <input type="checkbox" id="long_distance" name="long_distance" value="long_distance"> 장거리(30 ~ 50km)
										</label>
										<label style="display: table;margin-bottom: 7px;">
										  <input type="checkbox" id="longest_distance" name="longest_distance" value="longest_distance"> 초 장거리(50 ~ km)
										</label>
	            					</div>
	                            </div>
	                        </form>
	                	</div>
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
			/**
			* 초기 date 설정
			*/
			setDate();
			
			day();
			
			notFoundResult();
			
	        $('#weekday').on('change', function() {
	            day();
	        });
	
	         $('#weekend').on('click', function() {
	            day();
	        });        
	
	        $('.timecheck input').on('click', function() {
	            distance();
	        });
	
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
		* 요일특성 선택시 실행함수
		*/
		day = function() {
	        var weekday = $('#weekday').prop('checked');
	        var weekend = $('#weekend').prop('checked');
	        if(weekday == false && weekend == false) {
	            $('.timecheck input').prop('checked', false).attr('disabled', true);
	            distance();
	            return;
	        }
	        if(weekday === true && weekend === false) {
	            $('#am_peak').attr('disabled', false);
	            $('#am_non_peak').attr('disabled', false);
	            $('#pm_peak').attr('disabled', false);
	            $('#pm_non_peak').attr('disabled', false);
	            $('#am').attr('disabled', true);
	            $('#pm').attr('disabled', true);
	            distance();
	            return;
	        }
	        if(weekday === false && weekend === true) {
	            $('#am_peak').attr('disabled', true);
	            $('#am_non_peak').attr('disabled', true);
	            $('#pm_peak').attr('disabled', true);
	            $('#pm_non_peak').attr('disabled', true);
	            $('#am').attr('disabled', false);
	            $('#pm').attr('disabled', false);
	            distance();
	            return;
	        }
	        if(weekday === true && weekend === true) {          
	            $('.timecheck input').attr('disabled', false);
	            distance();
	            return;
	        }       
	    };
	    
	    /**
		* 거리특성 선택시 실행함수
		*/
	    distance = function() {
	    	var weekday = $('#weekday').prop('checked');
	        var weekend = $('#weekend').prop('checked');
	        var ampeak = $('#am_peak').prop('checked');
	        var amnonpeak = $('#am_non_peak').prop('checked');
	        var pmpeak = $('#pm_peak').prop('checked');
	        var pmnonpeak = $('#pm_non_peak').prop('checked');
	        var am = $('#am').prop('checked');
	        var pm = $('#pm').prop('checked');
	        if(weekday === true || weekend === true || 
	        	ampeak === true || amnonpeak === true ||
	            pmpeak === true || pmnonpeak === true ||
	            am === true || pm === true) {
	            $('.distance input').attr('disabled', false);
	            return;
	        }
	        if(weekday === false || weekend === false || 
	        	ampeak === false && amnonpeak === false &&
	            pmpeak === false && pmnonpeak === false &&
	            am === false && pm === false) {
	            $('.distance input').prop('checked', false).attr('disabled', true);
	            return;
	        }
	    };
	    
	    
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
	     	데이터 조회
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