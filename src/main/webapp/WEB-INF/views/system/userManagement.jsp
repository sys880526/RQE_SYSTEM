<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"
	, target-densitydpi=device-dpi />

<title>기준 데이터 설정</title>

<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="../js/style.js"></script>
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
<body>
	<div id=wrap>
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
		<!-- \#header -->
		<!-- #snbArea -->
		<jsp:include page="/WEB-INF/views/layouts/system_subMenu.jsp" />
		<!-- \#snbArea -->
		<section id="contents" style="width: 95%;">
			<div class="tit-page">
				<span>기준 데이터 설정</span>
				<ul class="path">
					<li>시스템 관리</li>
					<li>기준 데이터 설정</li>
				</ul>
				<!-- .path -->
			</div>
			<!-- tit-page -->
			<!-- .contents -->
			<div class="contents" width=100%>
				<!-- Save button -->
				<div>
					<!-- <a href="javascript:void(0); onclick=" " class="btnSave" id="btnSave" style="float : right;"> -->
					<a href="#" class="btnSave" id="btnSave" style="float: right;">
						<img src="../images/board/btn_save.gif" alt="save"
						style="padding-bottom: 15px; padding-top: 15px;" />
					</a> <a href="#" class="btnReset" id="btnReset" style="float: right;">
						<img src="../images/board/btn_reset.gif" alt="reset"
						style="padding-bottom: 15px; padding-top: 15px;" />
					</a>
				</div>


				<!-- table -->
				<div style="margin-bottom: 45px">
					<table id="userManagementTime">
						<thead style="background-color: #e6f2ff">
							<tr>
								<th colspan="6" style="height: 15PX;"><b>시간 구분</b></th>
							</tr>
							<tr>
								<th colspan="5" style="height: 15PX;"><b>주중</b></th>
								<th colspan="1" style="height: 15PX;"><b>주말</b></th>
							</tr>
							<tr>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>오전
										첨두 시작 시간</b>
								<p>("hh:mm:ss" 이상)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>오전
										첨두 종료 시간</b>
								<p>("hh:mm:ss" 미만)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>오전
										오후 경계 시간</b>
								<p>("hh:mm:ss" 부터 오후)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>오후
										첨두 시작 시간</b>
								<p>("hh:mm:ss" 이상)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>오후
										첨두 종료 시간</b>
								<p>("hh:mm:ss" 미만)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>오전
										오후 경계 시간</b>
								<p>("hh:mm:ss" 부터 오후)</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>


				<div>
					<table id="userManagementDistance">
						<thead style="background-color: #e6f2ff">
							<tr>
								<th colspan="4" style="height: 15PX;"><b>거리 구분</b></th>
								<th colspan="1" style="height: 15PX;"><b>동시 도착</b></th>
							</tr>
							<tr>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>최단거리</b>
								<p>(" "km 이하)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>단거리</b>
								<p>(" "km 이하)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>중거리</b>
								<p>(" "km 이하)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>장거리</b>
								<p>(" "km 이하)</th>
								<th colspan="1" style="height: 45px; background-color: #EAEAEA;"><b>동시도착
										조건</b>
								<p>(" "km 이하))</th>

							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- \table -->
			</div>
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
<script src="/js/common.js"></script>
<script>
	
	$(document).ready(function() {
		getList();
		
		$('#btnSave').click(function(event){
			updateSystemValue();
		});
		
		$('#btnReset').click(function(){
			Reset();
		});
		
	});
	
	function getList(){
		$.ajax({
			url : '/system/userManagementData'
		    , type : 'post'
			, dataType : 'json'
			, data : JSON
			, contentType : 'application/json; charset=UTF-8'
			, success : function(data, stat, xhr) {
				var systemData1 = '';
				var systemData2 = '';
				for(var i =0; i < data.list.length  ; i++){
// 					systemData1 = '<td><input type="text" id="am_peak_start" value="' + data.list[i].am_peak_start +' " style = "width: 100px" /></td>' +
// 									'<td><input type="text" id="am_non_peak_start" value="' + data.list[i].am_non_peak_start +' " style = "width: 100px" /></td>' +
// 									'<td><input type="text" id="pm_non_peak_start" value="' + data.list[i].pm_non_peak_start +' " style = "width: 145px" /></td>' +
// 									'<td><input type="text" id="pm_peak_start" value="' + data.list[i].pm_peak_start +' " style = "width: 100px" /></td>' +
// 									'<td><input type="text" id="pm_peak_end" value="' + data.list[i].pm_peak_end +' " style = "width: 100px" /></td>' +
// 									'<td><input type="text" id="pm_start" value="' + data.list[i].pm_start +' " style = "width: 145px" /></td>'				
//00:00:00
				// 각 변수별로 split한 변수명 선언
				var am_peak_start_value = data.list[i].am_peak_start.split(":");
				var am_non_peak_start_value = data.list[i].am_non_peak_start.split(":");
				var pm_non_peak_start_value = data.list[i].pm_non_peak_start.split(":");
				var pm_peak_start_value = data.list[i].pm_peak_start.split(":");
				var pm_peak_end_value = data.list[i].pm_peak_end.split(":");
				var pm_start_value = data.list[i].pm_start.split(":");
				
					systemData1 = '<td><input type="text" id="am_peak_start1" value="' + am_peak_start_value[0] +' " style = "width: 45px; text-align:center;" />  : ' +
									'<input type="text" id="am_peak_start2" value="' +am_peak_start_value[1] +' " style = "width: 45px; text-align:center" />  :  ' +
									'<input type="text" id="am_peak_start3" value="' + am_peak_start_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="am_non_peak_start1" value="' + am_non_peak_start_value[0] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="am_non_peak_start2" value="' + am_non_peak_start_value[1] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="am_non_peak_start3" value="' + am_non_peak_start_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="pm_non_peak_start1" value="' + pm_non_peak_start_value[0] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_non_peak_start2" value="' + pm_non_peak_start_value[1] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_non_peak_start3" value="' + pm_non_peak_start_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="pm_peak_start1" value="' + pm_peak_start_value[0] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_peak_start2" value="' + pm_peak_start_value[1] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_peak_start3" value="' + pm_peak_start_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="pm_peak_end1" value="' + pm_peak_end_value[0] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_peak_end2" value="' + pm_peak_end_value[1] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_peak_end3" value="' + pm_peak_end_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="pm_start1" value="' + pm_start_value[0] +' " style = "width: 45px; text-align:center" />  : ' +				
									'<input type="text" id="pm_start2" value="' + pm_start_value[1] +' " style = "width: 45px; text-align:center" />  : ' +			
									'<input type="text" id="pm_start3" value="' + pm_start_value[2] +' " style = "width: 45px; text-align:center" /></td>'
					
					systemData2 = '<td><input type="text" id="shortest_distance_end" value="' + data.list[i].shortest_distance_end + '"/></td>' +
									'<td><input type="text" id="short_distance_end" value="' + data.list[i].short_distance_end + '"/></td>' +	
									'<td><input type="text" id="medium_distance_end" value="' + data.list[i].medium_distance_end + '"/></td>' +	
									'<td><input type="text" id="long_distance_end" value="' + data.list[i].long_distance_end + '"/></td>' + 	
									'<td><input type="text" id="pre_arrival" value="' + data.list[i].pre_arrival + '"/></td>'	
				}
				$("#userManagementTime > tbody").html(systemData1);
				$("#userManagementDistance > tbody").html(systemData2);
			}
		    , error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log("err" + err);
		    }
		});
	}	// getList
	
	function Reset() {
	    msg = "기본값으로 초기화 하시겠습니까?";
	    if (confirm(msg)!=0) {
	    	$.ajax({
				url : '/system/userManagementDefaultData'
			    , type : 'post'
				, dataType : 'json'
				, data : JSON
				, contentType : 'application/json; charset=UTF-8'
				, success : function(data, stat, xhr) {
					var systemData1 = '';
					var systemData2 = '';
					for(var i =0; i < data.defaultList.length  ; i++){
// 						systemData1 = '<td><input type="text" id="am_peak_start" value="' + data.defaultList[i].am_peak_start +' " style = "width: 100px" /></td>' +
// 										'<td><input type="text" id="am_non_peak_start" value="' + data.defaultList[i].am_non_peak_start +' " style = "width: 100px" /></td>' +
// 										'<td><input type="text" id="pm_non_peak_start" value="' + data.defaultList[i].pm_non_peak_start +' " style = "width: 145px" /></td>' +
// 										'<td><input type="text" id="pm_peak_start" value="' + data.defaultList[i].pm_peak_start +' " style = "width: 100px" /></td>' +
// 										'<td><input type="text" id="pm_peak_end" value="' + data.defaultList[i].pm_peak_end +' " style = "width: 100px" /></td>' +
// 										'<td><input type="text" id="pm_start" value="' + data.defaultList[i].pm_start +' " style = "width: 145px" /></td>'
				
					//defaultList에 대한 변수를 split할 변수 선언
					var am_peak_start_value = data.defaultList[i].am_peak_start.split(":");
					var am_non_peak_start_value = data.defaultList[i].am_non_peak_start.split(":");
					var pm_non_peak_start_value = data.defaultList[i].pm_non_peak_start.split(":");
					var pm_peak_start_value = data.defaultList[i].pm_peak_start.split(":");
					var pm_peak_end_value = data.defaultList[i].pm_peak_end.split(":");
					var pm_start_value = data.defaultList[i].pm_start.split(":");
						
						systemData1 = '<td><input type="text" id="am_peak_start1" value="' + am_peak_start_value[0] +' " style = "width: 45px; text-align:center;" />  : ' +
									'<input type="text" id="am_peak_start2" value="' +am_peak_start_value[1] +' " style = "width: 45px; text-align:center" />  :  ' +
									'<input type="text" id="am_peak_start3" value="' + am_peak_start_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="am_non_peak_start1" value="' + am_non_peak_start_value[0] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="am_non_peak_start2" value="' + am_non_peak_start_value[1] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="am_non_peak_start3" value="' + am_non_peak_start_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="pm_non_peak_start1" value="' + pm_non_peak_start_value[0] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_non_peak_start2" value="' + pm_non_peak_start_value[1] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_non_peak_start3" value="' + pm_non_peak_start_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="pm_peak_start1" value="' + pm_peak_start_value[0] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_peak_start2" value="' + pm_peak_start_value[1] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_peak_start3" value="' + pm_peak_start_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="pm_peak_end1" value="' + pm_peak_end_value[0] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_peak_end2" value="' + pm_peak_end_value[1] +' " style = "width: 45px; text-align:center" />  : ' +
									'<input type="text" id="pm_peak_end3" value="' + pm_peak_end_value[2] +' " style = "width: 45px; text-align:center" /></td>' +
									
									'<td><input type="text" id="pm_start1" value="' + pm_start_value[0] +' " style = "width: 45px; text-align:center" />  : ' +				
									'<input type="text" id="pm_start2" value="' + pm_start_value[1] +' " style = "width: 45px; text-align:center" />  : ' +			
									'<input type="text" id="pm_start3" value="' + pm_start_value[2] +' " style = "width: 45px; text-align:center" /></td>'
						
// 						systemData1 = '<td><input type="text" id="am_peak_start" value="' + data.defaultList[i].am_peak_start +' " style = "width: 100px" /></td>' +
// 										'<td><input type="text" id="am_non_peak_start" value="' + data.defaultList[i].am_non_peak_start +' " style = "width: 100px" /></td>' +
// 										'<td><input type="text" id="pm_non_peak_start" value="' + data.defaultList[i].pm_non_peak_start +' " style = "width: 145px" /></td>' +
// 										'<td><input type="text" id="pm_peak_start" value="' + data.defaultList[i].pm_peak_start +' " style = "width: 100px" /></td>' +
// 										'<td><input type="text" id="pm_peak_end" value="' + data.defaultList[i].pm_peak_end +' " style = "width: 100px" /></td>' +
// 										'<td><input type="text" id="pm_start" value="' + data.defaultList[i].pm_start +' " style = "width: 145px" /></td>'
						
						systemData2 = '<td><input type="text" id="shortest_distance_end" value="' + data.defaultList[i].shortest_distance_end + '"/></td>' +
										'<td><input type="text" id="short_distance_end" value="' + data.defaultList[i].short_distance_end + '"/></td>' +	
										'<td><input type="text" id="medium_distance_end" value="' + data.defaultList[i].medium_distance_end + '"/></td>' +	
										'<td><input type="text" id="long_distance_end" value="' + data.defaultList[i].long_distance_end + '"/></td>' + 	
										'<td><input type="text" id="pre_arrival" value="' + data.defaultList[i].pre_arrival + '"/></td>'	
					}
					$("#userManagementTime > tbody").html(systemData1);
					$("#userManagementDistance > tbody").html(systemData2);
				}
			    , error : function(xhr, stat, err) {
			    	alert("error");
			    	console.log("err" + err);
			    }
			});
	    	alert("기본값으로 설정되었습니다.");
		}
	} // Reset
	
	
	
	
	function updateSystemValue(){
	   msg = "변경된 값을 저장하시겠습니까?";
	    if (confirm(msg)!=0) {
	    	
	    	
	    	// test 예시
	    	if(validate())	{
	    		
// 	    		update 할 데이터 세팅
				var updateData = {am_peak_start : $("#am_peak_start1").val().trim() + ":" + $("#am_peak_start2").val().trim() + ":" + $("#am_peak_start3").val().trim()
									,am_non_peak_start : $("#am_non_peak_start1").val().trim() + ":" + $("#am_non_peak_start2").val().trim() + ":" + $("#am_non_peak_start3").val().trim()
									,pm_non_peak_start : $("#pm_non_peak_start1").val().trim() + ":" + $("#pm_non_peak_start2").val().trim() + ":" + $("#pm_non_peak_start3").val().trim()
									,pm_peak_start : $("#pm_peak_start1").val().trim() + ":" + $("#pm_peak_start2").val().trim() + ":" + $("#pm_peak_start3").val().trim()
									,pm_peak_end : $("#pm_peak_end1").val().trim() + ":" + $("#pm_peak_end2").val().trim() + ":" + $("#pm_peak_end3").val().trim()   
									,pm_start : $("#pm_start1").val().trim() + ":" + $("#pm_start2").val().trim() + ":" + $("#pm_start3").val().trim()   
									,shortest_distance_end : Number($("#shortest_distance_end").val())
									,short_distance_end : Number($("#short_distance_end").val())
									,medium_distance_end : Number($("#medium_distance_end").val())
									,long_distance_end : Number($("#long_distance_end").val())
									,pre_arrival : Number($("#pre_arrival").val())
								};
		
				jQuery.ajaxSettings.traditional = true;
		
		
				$.ajax({
					url : '/system/userManagementUpdateData'
			        , type : 'post'
					, dataType : 'json'
		 			, data : JSON.stringify(updateData)
					, contentType : 'application/json; charset=UTF-8'
					, success : function(data, stat, xhr) {
						if(data.code == 0) {
							alert("설정된 값으로 저장되었습니다.");
							getList();
						}else if (data.code == 1) {	// 동일한 키값의 데이터가 존재할때
							alert("데이터 베이스 입력 오류입니다. 관리자에게 문의 바랍니다.");
						} else if (data.code == 3) {
							alert("세션이 만료 되었습니다. 로그인을 다시해주시기 바랍니다.");
							// 로그인 화면으로 이동 하는 코드 
							
						}
					}
				    , error : function(xhr, stat, err) {
				    	alert("error");
				    	console.log("xhr" + xhr);
				    	console.log("stat" + stat);
				    	console.log("err" + err);
				    }
				});
	    		
	    	}
		}
	} // updateSystemValue

	// 유효성 검사
	function validate(){
		// 시간구분 테이블에 대한 변수 선언
		var am_peak_start = $("#am_peak_start1").val().trim() + ":" + $("#am_peak_start2").val().trim() + ":" + $("#am_peak_start3").val().trim();
		var am_non_peak_start = $("#am_non_peak_start1").val().trim() + ":" + $("#am_non_peak_start2").val().trim() + ":" + $("#am_non_peak_start3").val().trim();
		var pm_non_peak_start = $("#pm_non_peak_start1").val().trim() + ":" + $("#pm_non_peak_start2").val().trim() + ":" + $("#pm_non_peak_start3").val().trim();
		var pm_peak_start = $("#pm_peak_start1").val().trim() + ":" + $("#pm_peak_start2").val().trim() + ":" + $("#pm_peak_start3").val().trim();
		var pm_peak_end = $("#pm_peak_end1").val().trim() + ":" + $("#pm_peak_end2").val().trim() + ":" + $("#pm_peak_end3").val().trim();
		var pm_start = $("#pm_start1").val().trim() + ":" + $("#pm_start2").val().trim() + ":" + $("#pm_start3").val().trim();
	
		// 거리구분 테이블에 대한 변수 선언
		var shortest_distance_end = $("#shortest_distance_end").val().trim();
		var short_distance_end = $("#short_distance_end").val().trim();
		var medium_distance_end = $("#medium_distance_end").val().trim();
		var long_distance_end = $("#long_distance_end").val().trim();
		var pre_arrival = $("#pre_arrival").val().trim();
		
		// 시간구분 테이블 변수형식 비교 Reference 형식
// 		var timeReference = /^\d{2}\:\d{2}\:\d{2}$/;
		
		// 거리구분 테이블 변수형식 비교 Reference 형식
		var distanceReference = /^[0-9]*$/;
		
		//메시지
		var msg = "24시간 시간 형식에 맞게 다시 입력해 주세요. (예 : 00:00:00)" ;
		var msg1 = "최단거리는 단거리 / 중거리 / 장거리 보다 값이 클 수 없습니다."
		var msg2 = "단거리는 중거리 / 장거리 보다 값이 클 수 없습니다."
		var msg3 = "중거리는 장거리 보다 값이 클 수 없습니다."
		var msg4 = "숫자를 올바르게 입력해 주세요."
		var msg5 = "빈칸을 입력해 주세요."
		
		var msg6 = "'오전 첨두 시작 시간'은 '오전 첨두 종료 시간'보다 값이 클 수 없습니다."
		var msg7 = "'오전 첨두 종료 시간'은 '오전 오후 경계 시간'보다 값이 클 수 없습니다."
		var msg8 = "'오전 오후 경계 시간'은 '오후 첨두 시작 시간'보다 값이 클 수 없습니다."
		var msg9 = "'오후 첨두 시작 시간'은 '오후 첨두 종료 시간'보다 값이 클 수 없습니다."
		
		// 변수의 형변환 선언 
		var shortest_distance = Number($("#shortest_distance_end").val().trim()); 
		var short_distance = Number($("#short_distance_end").val().trim());
		var medium_distance = Number($("#medium_distance_end").val().trim());
		var long_distance = Number($("#long_distance_end").val().trim());
		
		// 시간 계산을 윈한 변수 선언 (오전 첨두 시작시간 < 오전 첨두 종료 시간 과 같은 시간에 대한 계산)
		var am_peak_start_sum_value = Number($("#am_peak_start1").val()) * 3600 + Number($("#am_peak_start2").val()) * 60 + Number($("#am_peak_start3").val());
		var am_non_peak_start_sum_value = Number($("#am_non_peak_start1").val()) * 3600 + Number($("#am_non_peak_start2").val()) * 60 + Number($("#am_non_peak_start3").val());
		var pm_non_peak_start_sum_value = Number($("#pm_non_peak_start1").val()) * 3600 + Number($("#pm_non_peak_start2").val()) * 60 + Number($("#pm_non_peak_start3").val());
		var pm_peak_start_sum_value = Number($("#pm_peak_start1").val()) * 3600 + Number($("#pm_peak_start2").val()) * 60 + Number($("#pm_peak_start3").val());
		var pm_peak_end_sum_value = Number($("#pm_peak_end1").val()) * 3600 + Number($("#pm_peak_end2").val()) * 60 + Number($("#pm_peak_end3").val());
		
// 		if(!timeReference.test(am_peak_start)){
// 			alert(msg);
// 			$("#am_peak_start").focus();
// 			return false;
// 		}
		
		// 오전첨두 시작시간의 유효성 검사
		if(am_peak_start_sum_value >= am_non_peak_start_sum_value || am_peak_start_sum_value >= pm_non_peak_start_sum_value ||
		   am_peak_start_sum_value >= pm_peak_start_sum_value || am_peak_start_sum_value >= pm_peak_end_sum_value){
			
			alert(msg6);
			return false;
		}

		// 오전첨두 종료 시간의 유효성 검사
		if(am_non_peak_start_sum_value >= pm_non_peak_start_sum_value || am_non_peak_start_sum_value >= pm_peak_start_sum_value ||
		   am_non_peak_start_sum_value >= pm_peak_end_sum_value){
			
			alert(msg7);
			return false;
		}

		// 오전 오후 경계 시간의 유효성 검사
		if(pm_non_peak_start_sum_value >= pm_peak_start_sum_value || pm_non_peak_start_sum_value >= pm_peak_end_sum_value){
			
			alert(msg8);
			return false;
		}

		// 오후 첨두 시작 시간의 유효성 검사
		if(pm_peak_start_sum_value >= pm_peak_end_sum_value){
			
			alert(msg9);
			return false;
		}
		
		
		// 24시간 형식 HH 부분의 유효성 검사 조건문
		if(Number($("#am_peak_start1").val().trim()) >= 24 || Number($("#am_non_peak_start1").val().trim()) >= 24 ||
		   Number($("#pm_non_peak_start1").val().trim()) >= 24 || Number($("#pm_peak_start1").val().trim()) >= 24 ||
		   Number($("#pm_peak_end1").val().trim()) >= 24 || Number($("#pm_start1").val().trim()) >= 24){
			alert(msg);
// 			$("#am_peak_start").focus();
			return false;
		} 
		// 24시간 형식 MM/SS 부분의 유효성 검사 조건문
		if(Number($("#am_peak_start2").val().trim()) >= 60 || Number($("#am_peak_start3").val().trim()) >= 60 ||
		   Number($("#am_non_peak_start2").val().trim()) >= 60 || Number($("#am_non_peak_start3").val().trim()) >= 60 ||
		   Number($("#pm_non_peak_start2").val().trim()) >= 60 || Number($("#pm_non_peak_start3").val().trim()) >= 60 ||
		   Number($("#pm_peak_start2").val().trim()) >= 60 || Number($("#pm_peak_start3").val().trim()) >= 60 || 
		   Number($("#pm_peak_end2").val().trim()) >= 60 || Number($("#pm_peak_end3").val().trim()) >= 60 ||
		   Number($("#pm_start2").val().trim()) >= 60 || Number($("#pm_start3").val().trim()) >= 60){
			alert(msg);
// 			$("#am_peak_start").focus();
			return false;
		}
	
		// 시간 구분(HH:MM:SS) 부분이 비어있는 값일 경우에 대한 유효성 검사 조건문
		if($("#am_peak_start1").val().trim() == null || $("#am_peak_start1").val().trim() == '' ||
		   $("#am_peak_start2").val().trim() == null || $("#am_peak_start2").val().trim() == '' ||
		   $("#am_peak_start3").val().trim() == null || $("#am_peak_start3").val().trim() == '' ||
		   
		   $("#am_non_peak_start1").val().trim() == null || $("#am_non_peak_start1").val().trim() == '' ||
		   $("#am_non_peak_start2").val().trim() == null || $("#am_non_peak_start2").val().trim() == '' ||
		   $("#am_non_peak_start3").val().trim() == null || $("#am_non_peak_start3").val().trim() == '' ||
		   
		   $("#pm_non_peak_start1").val().trim() == null || $("#pm_non_peak_start1").val().trim() == '' ||
		   $("#pm_non_peak_start2").val().trim() == null || $("#pm_non_peak_start2").val().trim() == '' ||
		   $("#pm_non_peak_start3").val().trim() == null || $("#pm_non_peak_start3").val().trim() == '' ||

		   $("#pm_peak_start1").val().trim() == null || $("#pm_peak_start1").val().trim() == '' ||
		   $("#pm_peak_start2").val().trim() == null || $("#pm_peak_start2").val().trim() == '' ||
		   $("#pm_peak_start3").val().trim() == null || $("#pm_peak_start3").val().trim() == '' ||

		   $("#pm_peak_end1").val().trim() == null || $("#pm_peak_end1").val().trim() == '' ||
		   $("#pm_peak_end2").val().trim() == null || $("#pm_peak_end2").val().trim() == '' ||
		   $("#pm_peak_end3").val().trim() == null || $("#pm_peak_end3").val().trim() == '' ||

		   $("#pm_start1").val().trim() == null || $("#pm_start1").val().trim() == '' ||
		   $("#pm_start2").val().trim() == null || $("#pm_start2").val().trim() == '' ||
		   $("#pm_start3").val().trim() == null || $("#pm_start3").val().trim() == ''){
			
			alert(msg5);
			return false;
		}
		
		// 거리구분 부분의 값이 비었을 경우 유효성 검사
		if(shortest_distance == null || shortest_distance == '' ||
		   short_distance == null || short_distance == '' ||
		   medium_distance == null || medium_distance == '' ||
		   long_distance == null || long_distance == ''){
			
			alert(msg5);
			return false;
		}
		
		// 최단거리가 단거리 / 중거리 / 장거리 보다 값이 클 경우 유효성 검사
		if( shortest_distance >= short_distance ||
			shortest_distance >= medium_distance || 
			shortest_distance >= long_distance){
			alert(msg1);
			$("#shortest_distance_end").focus();
			return false;
		}
		
		// 단거리가 중거리 / 장거리 보다 값이 클 경우 유효성 검사
		if( short_distance >= medium_distance || 
			short_distance >= long_distance){
			alert(msg2);
			$("#short_distance_end").focus();
			return false;
			}
		
		// 중거리가 장거리 보다 값이 클 경우 유효성 검사
		if( medium_distance >= long_distance){
			alert(msg3);
			$("#medium_distance").focus();
			return false;
			}
			
		// 거리구분 테이블 유효성 검사 조건문
		if(!distanceReference.test(shortest_distance_end)){
			alert(msg4);
			$("#shortest_distance_end").focus();
			return false;
		}
		
		if(!distanceReference.test(short_distance_end)){
			alert(msg4);
			$("#short_distance_end").focus();
			return false;
		}
		
		if(!distanceReference.test(medium_distance_end)){
			alert(msg4);
			$("#medium_distance_end").focus();
			return false;
		}
		
		if(!distanceReference.test(long_distance_end)){
			alert(msg4);
			$("#long_distance_end").focus();
			return false;
		}
		
		if(!distanceReference.test(pre_arrival)){
			alert(msg4);
			$("#pre_arrival").focus();
			return false;
		}
		
		return true;
	}

</script>
</html>