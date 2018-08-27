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
                    	<table id="cpName" style="border:3px dashed; padding-bottom:20px;width:30%; background:white;">
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
                    	</table>
                    </div>
                    <div id="EvaluationVehiclePositionCheckMap" style= "position: relative; top:-103px; width:100%; height:550px; z-index:1"></div>
                    
                    
                 </div>
               </div>
          </div>
     </div>
</body>
<script>
var container = document.getElementById('EvaluationVehiclePositionCheckMap'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(37.312750, 126.953932), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
</html>