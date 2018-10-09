<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <div id="snbArea" style="margin-right: 20px"> -->
<!--     <img src="../images/snb/h2_work.gif" alt="bmt_list"/>                   -->
<section id="container">
	<nav id="snb">
		<div class="tit">
			<span>BMT LIST 등록</span>
		</div>
		<!-- .tit -->
		<ul>
			<c:choose>
				<c:when
					test="${sub_control eq 'bmtListRegistration.bmtListRegistration'}">
					<li class="active"><a
						href="/bmtListRegistration/bmtListRegistration">BMT LIST 이력 조회</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a
						href="/bmtListRegistration/bmtListRegistration">BMT LIST 이력 조회</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${sub_control eq 'bmtListRegistration.bmtNewList'}">
					<li class="active"><a href="/bmtListRegistration/bmtNewList">등록
							이력 조회</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a href="/bmtListRegistration/bmtNewList">등록
							이력 조회</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<!-- #snb -->