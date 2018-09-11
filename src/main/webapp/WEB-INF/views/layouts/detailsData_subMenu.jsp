<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="snbArea" style="margin-right: 20px">
    <img src="../images/snb/h2_statistics.gif" alt="bmt_list"/>                  
    <ul class="snb">
    	<c:choose>
	    	<c:when test="${sub_Control eq 'detailsData_pathDistance'}">
		        <li><a href="/detailsData/pathDistance" class="active">경로 거리</a></li>
		    </c:when>
		    <c:otherwise>
		        <li><a href="/detailsData/pathDistance">경로 거리</a></li>
		    </c:otherwise>    
		</c:choose>        
		
		<c:choose>
			<c:when test="${sub_Control eq 'detailsData_tollsCharge'}">     
		        <li><a href="/detailsData/tollsCharge" class="active">통행 요금</a></li>
		    </c:when>
		    <c:otherwise>
		        <li><a href="/detailsData/tollsCharge">통행 요금</a></li>
		    </c:otherwise>
		</c:choose>
		
			<c:choose>
			<c:when test="${sub_Control eq 'detailsData_arrivalAndArrivalDelayTime'}">     
		        <li><a href="/detailsData/arrivalAndArrivalDelayTime" class="active">선/후착 및 도착 지연 시간</a></li>
		    </c:when>
		    <c:otherwise>
		        <li><a href="/detailsData/arrivalAndArrivalDelayTime">선/후착 및 도착 지연 시간</a></li>
		    </c:otherwise>
		</c:choose>
		
			<c:choose>
			<c:when test="${sub_Control eq 'detailsData_arrivalScheduledTimeErrorAndErrorRate'}">     
		        <li><a href="/detailsData/arrivalScheduledTimeErrorAndErrorRate" class="active">도착 예정 시간 오차 및 오차율</a></li>
		    </c:when>
		    <c:otherwise>
		        <li><a href="/detailsData/arrivalScheduledTimeErrorAndErrorRate">도착 예정 시간 오차 및 오차율</a></li>
		    </c:otherwise>
		</c:choose>
		
			<c:choose>
			<c:when test="${sub_Control eq 'detailsData_bmtIdReferencePathAnalysis'}">     
		        <li><a href="/detailsData/bmtIdReferencePathAnalysis" class="active">BMT ID 기준 경로 지도 분석</a></li>
		    </c:when>
		    <c:otherwise>
		        <li><a href="/detailsData/bmtIdReferencePathAnalysis">BMT ID 기준 경로 지도 분석</a></li>
		    </c:otherwise>
		</c:choose>
		
			<c:choose>
			<c:when test="${sub_Control eq 'detailsData_bmtIdReferenceSpecific'}">     
		        <li><a href="/detailsData/bmtIdReferenceSpecific" class="active">BMT ID 기준 특이사항</a></li>
		    </c:when>
		    <c:otherwise>
		        <li><a href="/detailsData/bmtIdReferenceSpecific">BMT ID 기준 특이사항</a></li>
		    </c:otherwise>
		</c:choose>
		        
    </ul>
</div>