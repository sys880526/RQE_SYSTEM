<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>각 평가 차량 위치 확인</title>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
	    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
	    <script type="text/javascript" src="../js/style.js"></script>
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
			.customoverlay {
				position:relative;
				bottom:85px;
				border-radius:6px;
				border: 1px solid #ccc;
				border-bottom:2px solid #ddd;
				float:left;
			    left: -8px;
			}
			.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
			.customoverlay a {	
							display:block;
							text-decoration:none;
							color:#000;
							text-align:center;
							border-radius:6px;
							font-size:14px;
							font-weight:bold;
							overflow:hidden;
/* 							background: #d95050; */
/* 							background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; */
			}
			.customoverlay .title {
							display:block;
							text-align:center;
							background:#fff;
/* 							margin-right:35px; */
							padding:10px 15px;
							font-size:14px;
							font-weight:bold;
			}
			.customoverlay:after {
							content:'';
							position:absolute;
							margin-left:-12px;
							left:50%;
							bottom:-12px;
							width:22px;
							height:12px;
							background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
			}
		</style>
	    
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
				<jsp:include page="/WEB-INF/views/layouts/progressData_subMenu.jsp"/>
				<!-- \#snbArea -->
				<!-- #contentArea -->
				<div id="contentsArea">
					<!-- .titContents -->
					<div class="titContents">
						<h2>각 평가 차량 위치 확인</h2>
						<p>
							종합데이터 > 
							<strong>각 평가 차량 위치 확인</strong>
						</p>
					</div>
					<!-- \.titContents -->
					<!-- .contents -->
	                <div class="contents" style="width:100%">
	                    <div style="position: absolute; z-index: 2;">
	                    	<table id="cpName" style="border:3px dashed; background:white;">
	                    		<thead>
		                    		<tr>
		                    			<th>CP</th>
		                    			<th>USER ID</th>
		                    			<th>CAR INFO</th>
		                    		</tr>
	                    		</thead>
		                    	<tbody>
	                    		</tbody>
	                    	</table>
	                    </div>
	                    <div id="EvaluationVehiclePositionCheckMap" style= "position: relative; width:100%; height:550px; z-index:1"></div>
	                    
	                    
	                 </div>
	               </div>
	          </div>
	     </div>
	</body>
	
	<script>
	var mapContainer = document.getElementById('EvaluationVehiclePositionCheckMap'), // 지도를 표시할 div  
		mapOption = { 
		    center: new daum.maps.LatLng(37.314438, 126.954653), // 지도의 중심좌표
		    level: 9 // 지도의 확대 레벨
		};
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	callPositionInfo();	
	setInterval(function(){ callPositionInfo() }, 10000);
	
	var customOverlayList = [];
	
	function drawInfo(positions){
		var centerLon = 0;
		var centerLat = 0;
		
		$("#cpName > tbody").empty();
		
		if(positions.length == 0){
			return false;
		}
		
		var tableHtml = '';
		
		centerLon = (parseFloat(positions[0].lon) + parseFloat(positions[1].lon))/2;
		centerLat = (parseFloat(positions[0].lat) + parseFloat(positions[1].lat))/2;
		
		for(var i = 0; i < customOverlayList.length; i++) {
			customOverlayList[i].setMap(null);
		}
		
		for (var i = 0; i < positions.length; i++) {
			var imageSrc = '../svg/markerSVG'+ (i+1) + '.svg', // 마커이미지의 주소입니다    
			    imageSize = new daum.maps.Size(34, 34), // 마커이미지의 크기입니다
			    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    map: map, // 마커를 표시할 지도
			    position: new daum.maps.LatLng(positions[i].lat, positions[i].lon), // 마커의 위치
			    image: markerImage // 마커이미지 설정 
			});
				
			// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var content = '<div class="customoverlay">' +
			    '  <a>' +
			    '    <span class="title">' + positions[i].cp + '</span>' +
			    '  </a>' +
			    '</div>';
	
			// 커스텀 오버레이가 표시될 위치입니다 
			var position = new daum.maps.LatLng(positions[i].lat, positions[i].lon);  
	
			// 커스텀 오버레이를 생성합니다
			var customOverlay = new daum.maps.CustomOverlay({
			    map: map,
			    position: position,
			    content: content,
			    yAnchor: 1 
			});
			customOverlayList.push(customOverlay);
			// table 데이터 
			tableHtml += '<tr>';
			tableHtml += '<td>' + positions[i].cp + '</td>';
			tableHtml += '<td>' + positions[i].userid + '</td>';
			tableHtml += '<td>' + positions[i].carinfo + '</td>';
			tableHtml += '</tr>';
			
		}	
		$("#cpName > tbody").html(tableHtml);
		map.setCenter(new daum.maps.LatLng(centerLat ,centerLon));
	}
	
	
	function callPositionInfo() {
		var data = {};
		data.userid = 'user01';
		
		$.ajax({
			url : '/progressData/evaluationVehiclePositionCheckData'
	        , type : 'post'
			, dataType : 'json'
 			, data : JSON.stringify(data)
			, contentType : 'application/json; charset=UTF-8'
			, success : function(data, stat, xhr) {
				var gpsData = data.EvaluationVehiclePositionCheck;
				
				var positionData = [];
				
				for(var i = 0; i < gpsData.length; i++){
					positionData.push({
						cp : gpsData[i].cp
						, lat : gpsData[i].lat
						, lon : gpsData[i].lon
						, carinfo : gpsData[i].carinfo
						, userid : gpsData[i].userid
					});
				}
				
				drawInfo(positionData);
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