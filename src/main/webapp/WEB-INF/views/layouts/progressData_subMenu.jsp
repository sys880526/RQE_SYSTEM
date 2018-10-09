<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<section id="container">
	<nav id="snb">
		<div class="tit">
			<span>진행 데이터</span>
		</div>
		<!-- .tit -->
		<ul>
			<c:choose>
				<c:when
					test="${sub_control eq 'progressData_eachEvaluationSectionCurrentSituation'}">
					<li class="active"><a
						href="/progressData/eachEvaluationSectionCurrentSituation">각
							평가 구간 현황</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a
						href="/progressData/eachEvaluationSectionCurrentSituation">각
							평가 구간 현황</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when
					test="${sub_control eq 'progressData_evaluationVehiclePositionCheck'}">
					<li class="active"><a
						href="/progressData/evaluationVehiclePositionCheck">각 평가 차량 위치
							확인</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a
						href="/progressData/evaluationVehiclePositionCheck">각 평가 차량 위치
							확인</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<!-- #snb -->