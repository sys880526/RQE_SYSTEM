<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="container">
	<nav id="snb">
		<div class="tit">
			<span>상세 데이터</span>
		</div>
		<!-- .tit -->
		<ul>
			<c:choose>
				<c:when test="${sub_Control eq 'detailsData_pathDistance'}">
					<li class="active"><a href="/detailsData/pathDistance">경로
							거리</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a href="/detailsData/pathDistance">경로 거리</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${sub_Control eq 'detailsData_tollsCharge'}">
					<li class="active"><a href="/detailsData/tollsCharge">통행
							요금</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a href="/detailsData/tollsCharge">통행 요금</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when
					test="${sub_Control eq 'detailsData_arrivalAndArrivalDelayTime'}">
					<li class="active"><a
						href="/detailsData/arrivalAndArrivalDelayTime">선/후착 및 도착 지연 시간</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a href="/detailsData/arrivalAndArrivalDelayTime">선/후착
							및 도착 지연 시간</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when
					test="${sub_Control eq 'detailsData_arrivalScheduledTimeErrorAndErrorRate'}">
					<li class="active"><a
						href="/detailsData/arrivalScheduledTimeErrorAndErrorRate">도착예정시간 오차 및 오차율</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a
						href="/detailsData/arrivalScheduledTimeErrorAndErrorRate">도착예정시간 오차 및 오차율</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when
					test="${sub_Control eq 'detailsData_bmtIdReferencePathAnalysis'}">
					<li class="active"><a
						href="/detailsData/bmtIdReferencePathAnalysis">BMT ID 기준 경로 지도
							분석</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a href="/detailsData/bmtIdReferencePathAnalysis">BMT
							ID 기준 경로 지도 분석</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when
					test="${sub_Control eq 'detailsData_bmtIdReferenceSpecific'}">
					<li class="active"><a
						href="/detailsData/bmtIdReferenceSpecific">BMT ID 기준 특이사항</a></li>
				</c:when>
				<c:otherwise>
					<li class=""><a href="/detailsData/bmtIdReferenceSpecific">BMT
							ID 기준 특이사항</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<!-- #snb -->