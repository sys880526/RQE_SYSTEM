<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"
	, target-densitydpi=device-dpi />
	<title>각 평가 구간 현황</title>
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="../js/style.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
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
</head>
<body>
	<div id=wrap>
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
		<!-- \#header -->
			<!-- #snbArea -->
			<jsp:include page="/WEB-INF/views/layouts/progressData_subMenu.jsp"/>
			<!-- \#snbArea -->
			<section id="contents" style="width: 95%;">
				<div class="tit-page">
					<span>각 평가 구간 현황</span>
					<ul class="path">
						<li>진행 데이터</li>
						<li>각 평가 구간 현황</li>
					</ul>
					<!-- .path -->
				</div>
				<!-- \.tit-page -->
                <div class="contents">
                	<!-- .row -->   
                	<div class="row" style="margin-bottom: 25px">
	                	<!-- table -->               
                    	<table id="tbl-current-situation-info" style="border-style: none;">
                            <thead>
                            	<tr>
                                    <th>BMT ID</th>
                                    <th>CP</th>
                                    <th>차량정보</th>
                                    <th>공지사항</th>
                                    <th>출발지명</th>
                                    <th>도착지명</th>
                                    <th>경로 요청 시간</th>
                                    <th>예상 소요 시간</th>
                                    <th>예상 소요 거리</th>
                                    <th>예상 소요 요금</th>
                                    <th>출발시간</th>
                                    <th>도착시간</th>
                                </tr>                               
                            </thead>
                            <tbody>
                            	<c:if test="${list eq null || list == '[]'}">
                            		<tr>
										<td colspan="12">검색된 값이 없습니다.</td>
									</tr>
                            	</c:if>
                            	<c:forEach items="${list}" var="list">
                            		<tr>
	                            		<td>${list.bmtid }</td>
	                            		<td>${list.cp }</td>
	                            		<td>${list.carinfo }</td>
	                            		<td>${list.notice }</td>
	                            		<td>${list.startpoi }</td>
	                            		<td>${list.endpoi }</td>
	                            		<td>${list.real_req_time }</td>
	                            		<td>${list.est_time }</td>
	                            		<td>${list.est_distance }</td>
	                            		<td>${list.est_charge }</td>
	                            		<c:choose>
	                            			<c:when test="${list.bmt_start_tm eq '평가 준비중'}">
	                            				<td style="color: #0000FF;">${list.bmt_start_tm }</td>
	                            			</c:when>
	                            			<c:when test="${list.bmt_start_tm eq '평가 진행중'}">
	                            				<td style="color: #FF0000;">${list.bmt_start_tm }</td>
	                            			</c:when>
	                            			<c:otherwise>
	                            				<td>${list.bmt_start_tm }</td>
	                            			</c:otherwise>
	                            		</c:choose>
	                            		<c:choose>
	                            			<c:when test="${list.bmt_end_tm eq '평가 준비중'}">
	                            				<td style="color: #0000FF;">${list.bmt_end_tm }</td>
	                            			</c:when>
	                            			<c:when test="${list.bmt_end_tm eq '평가 진행중'}">
	                            				<td style="color: #FF0000;">${list.bmt_end_tm }</td>
	                            			</c:when>
	                            			<c:otherwise>
	                            				<td>${list.bmt_end_tm }</td>
	                            			</c:otherwise>
	                            		</c:choose>
                            		</tr>
                            	</c:forEach>
                            </tbody>
                        </table>   
	                    <!-- \table -->  
                	</div>
                	<!-- /.row --> 
                </div>
                <!-- /.contents -->
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
</html>