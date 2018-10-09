<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.web.servlet.i18n.SessionLocaleResolver"%>
<%@ page import="java.util.Locale"%>
<%@ taglib uri="jstl-c" prefix="c"%>
<%@ taglib uri="jstl-fmt" prefix="fmt"%>
<%@ taglib uri="jstl-fn" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%-- 	<c:set var="Depth1" value="<%=Depth1%>"/>	 --%>
<%
	String userId = (String)session.getAttribute("SS_USER_ID");
	String cp = (String)session.getAttribute("SS_CP");
	String carinfo = (String)session.getAttribute("SS_CAR_INFO");
	String au = (String)session.getAttribute("SS_AUCODE");
%>
<header>
	<h1>
		<a href="/main"><img src="../images/common/img_logo.png" alt="" /></a>
	</h1>
	<nav id="gnb">
		<c:set value="<%=au %>" var="au" />
		<c:if test="${au eq '사용자'}">
			<c:choose>
				<c:when test="${control eq 'bmtListRegistration'}">
					<li class="bmt active"><a
						href="/bmtListRegistration/bmtListRegistration">BMT LIST 등록</a></li>
				</c:when>
				<c:otherwise>
					<li class="bmt"><a
						href="/bmtListRegistration/bmtListRegistration">BMT LIST 등록</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${control eq 'progressData'}">
					<li class="progress active"><a
						href="/progressData/eachEvaluationSectionCurrentSituation">진행 데이터</a></li>
				</c:when>
				<c:otherwise>
					<li class="progress"><a
						href="/progressData/eachEvaluationSectionCurrentSituation">진행 데이터</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${control eq 'synthesisData'}">
					<li class="synthesis active"><a href="/synthesisData/datasheet">종합 데이터</a></li>
				</c:when>
				<c:otherwise>
					<li class="synthesis"><a href="/synthesisData/datasheet">종합 데이터</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${control eq 'detailsData'}">
					<li class="detail active"><a href="/detailsData/pathDistance">상세 데이터</a></li>
				</c:when>
				<c:otherwise>
					<li class="detail"><a href="/detailsData/pathDistance">상세 데이터</a></li>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${au eq '관리자'}">
			<c:choose>
				<c:when test="${control eq 'bmtListRegistration'}">
					<li class="bmt active"><a
						href="/bmtListRegistration/bmtListRegistration">BMT LIST 등록</a></li>
				</c:when>
				<c:otherwise>
					<li class="bmt"><a
						href="/bmtListRegistration/bmtListRegistration">BMT LIST 등록</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${control eq 'progressData'}">
					<li class="progress active"><a
						href="/progressData/eachEvaluationSectionCurrentSituation">진행 데이터</a></li>
				</c:when>
				<c:otherwise>
					<li class="progress"><a
						href="/progressData/eachEvaluationSectionCurrentSituation">진행 데이터</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${control eq 'synthesisData'}">
					<li class="synthesis active"><a href="/synthesisData/datasheet">종합 데이터</a></li>
				</c:when>
				<c:otherwise>
					<li class="synthesis"><a href="/synthesisData/datasheet">종합 데이터</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${control eq 'detailsData'}">
					<li class="detail active"><a href="/detailsData/pathDistance">상세 데이터</a></li>
				</c:when>
				<c:otherwise>
					<li class="detail"><a href="/detailsData/pathDistance">상세 데이터</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${control eq 'userManagement'}">
					<li class="system active"><a href="/system/userManagement">시스템 관리</a></li>
				</c:when>
				<c:otherwise>
					<li class="system"><a href="/system/userManagement">시스템 관리</a></li>
				</c:otherwise>
			</c:choose>
		</c:if>
		</ul>
	</nav>
	<!-- #gnb -->

	<div class="user-info">
		<ul>
			<li class="user"><%=userId %>님</li>

			<c:set value="<%=cp %>" var="cp" />
			<c:if test="${cp eq '관리자'}">
				<c:choose>
					<c:when test="${cp eq '관리자'}">
						<li class="cp"><%=cp %></li>
					</c:when>
				</c:choose>
			</c:if>

			<c:set value="<%=au %>" var="cp1" />
			<c:if test="${cp1 eq '사용자'}">
				<c:choose>
					<c:when test="${cp1 eq '사용자' }">
						<li class="cp"><%=cp %></li>
						<li class="car"><%=carinfo %></li>
					</c:when>
				</c:choose>
			</c:if>
		</ul>
		<a href="/login/logoutUser" class="btn logout">로그아웃</a>
	</div>
</header>
	<!-- .user-info -->