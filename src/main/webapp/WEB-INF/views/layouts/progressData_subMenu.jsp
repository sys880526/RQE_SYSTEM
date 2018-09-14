<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="snbArea" style="margin-right: 20px">
	<img src="../images/snb/h2_ingdata.gif" alt="bmt_list"/>                  
   	<ul class="snb">
   		<c:choose>
	    	<c:when test="${sub_control eq 'progressData_eachEvaluationSectionCurrentSituation'}">
		   		<li><a href="/progressData/eachEvaluationSectionCurrentSituation" class="active">각 평가 구간 현황</a></li>
	      	</c:when>
	        <c:otherwise>
		   		<li><a href="/progressData/eachEvaluationSectionCurrentSituation">각 평가 구간 현황</a></li>
	      	</c:otherwise>
	     </c:choose>
	     <c:choose>
	    	<c:when test="${sub_control eq 'progressData_evaluationVehiclePositionCheck'}">
		   		<li><a href="/progressData/evaluationVehiclePositionCheck" class="active">각 평가 차량 위치 확인</a></li>
	      	</c:when>
	        <c:otherwise>
		   		<li><a href="/progressData/evaluationVehiclePositionCheck">각 평가 차량 위치 확인</a></li>
	      	</c:otherwise>
	     </c:choose>
	</ul>
</div>