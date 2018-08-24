<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>경로 거리</title>
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
					<h2>경로 거리</h2>
					<p>
						Home > 상세데이터 >
						<strong>경로 거리</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" style="width:100%">
                    <!-- .search -->
                    <!--
                        board.css : box-sizing: content-box 추가 -->
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
   		      <!-- /.contents -->
				</div>
				<!-- \#contentArea -->
				</div>
			<!-- \.body clearFix -->
			</div>
	</div>
</body>
</html>