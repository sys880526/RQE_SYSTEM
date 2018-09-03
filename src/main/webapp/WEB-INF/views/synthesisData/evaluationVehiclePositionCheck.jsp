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
					<h2>각 평가 차량 위치 확인</h2>
					<p>
						Home > 종합데이터 >
						<strong>각 평가 차량 위치 확인</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" style="width:100%">
                    <!-- .search -->
                    <!--
                        board.css : box-sizing: content-box 추가
                    -->

				<!-- 시작날짜 종료날짜 선언부인데 현재페이지에서는 필요 없으므로 제외 -->
<!--                     <div class="search"> -->
<!--                         <form id="search-bmt"> -->
<!--                             <span class="pd">시작 날짜</span> -->
<!--                             <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" /> -->
<!--                             <span class="pd">~</span> -->
<!--                             <span class="pd">종료 날짜</span> -->
<!--                             <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" /> -->
<!--                             <a href="javascript:getList()" class="btnSearch"> -->
<!--                                 <img src="../images/board/btn_search.gif" alt="search" /> -->
<!--                             </a> -->
<!--                         </form> -->
<!--                     </div> -->
                    
                    <div style="position: relative; z-index: 2;">
                    	<table id="cpName" style="border:3px dashed;width:30%; background:white;">
                    		<tr>
                    			<th>CP</th>
                    			<th>USER ID</th>
                    			<th>CAR INFO</th>
                    		</tr>
                    		<tr>
                    			<td>Bluelink최소</td>
                    			<td>user01</td>
                    			<td>51무8155</td>
                    		</tr>
                    		<tr>
                    			<td>Bluelink추천</td>
                    			<td>user02</td>
                    			<td>18라0920</td>
                    		</tr>
                    		<tr>
                    			<td>Kakao</td>
                    			<td>user03</td>
                    			<td>18너1818</td>
                    		</tr>
                    		<tr>
                    			<td>Tmap</td>
                    			<td>user04</td>
                    			<td>18너4444</td>
                    		</tr>
                    		<tr>
                    			<td>Mappy</td>
                    			<td>user05</td>
                    			<td>04거1808</td>
                    		</tr>
                    	</table>
                    </div>
                    <div id="EvaluationVehiclePositionCheckMap" style= "position: relative; top:-210px; width:100%; height:550px; z-index:1"></div>
                    
                    
                 </div>
               </div>
          </div>
     </div>
</body>

<script>
var mapContainer = document.getElementById('EvaluationVehiclePositionCheckMap'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(37.314438, 126.954653), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
    content: '<div>Bluelink추천</div>', 
    latlng: new daum.maps.LatLng(37.314438, 126.954653)
},
{
    content: '<div>Bluelink최소</div>', 
    latlng: new daum.maps.LatLng(37.315658, 126.952921)
},
{
    content: '<div>Kakao</div>', 
    latlng: new daum.maps.LatLng(37.314762, 126.950786)
},
{
    content: '<div>Tmap</div>',
    latlng: new daum.maps.LatLng(37.316251, 126.950657)
},
{
    content: '<div>Mappy</div>',
    latlng: new daum.maps.LatLng(37.315193, 126.956064)
}
];

for (var i = 0; i < positions.length; i ++) {
// 마커를 생성합니다
var marker = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng // 마커의 위치
});

// 마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new daum.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}

</script>
</html>