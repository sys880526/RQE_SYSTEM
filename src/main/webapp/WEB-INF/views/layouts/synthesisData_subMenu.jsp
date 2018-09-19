<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="snbArea" style="margin-right: 20px">
    <img src="../images/snb/h2_obstacle.gif" alt="bmt_list"/>                  
    <ul class="snb">
      	<c:choose>
	    	<c:when test="${sub_Control eq 'synthesisData_dataSheet'}">
				<li><a href="/synthesisData/datasheet" class="active">Data Sheet</a></li>
	      	</c:when>
	        <c:otherwise>
	       		<li><a href="/synthesisData/datasheet">Data Sheet</a></li>
	      	</c:otherwise>
	     </c:choose>
	    
	     <c:choose>
	      <c:when test="${sub_Control eq 'synthesisData_totalDistanceFaresTimes'}">
	        <li><a href="/synthesisData/totalDistanceFaresTimes" class="active">건수/거리/요금/시간 집계</a></li>
	       </c:when>
	        <c:otherwise>
	        <li><a href="/synthesisData/totalDistanceFaresTimes">건수/거리/요금/시간 집계</a></li>
	        </c:otherwise>
	      </c:choose>
	   
	     <c:choose>
	      <c:when test="${sub_Control eq 'synthesisData_statusOfAssessmentSectionForeAftereffect'}">
	        <li><a href="/synthesisData/statusOfAssessmentSectionForeAftereffect" class="active">평가 구간 현황 및 선후착 집계</a></li>
	       </c:when>
	        <c:otherwise>
	        <li><a href="/synthesisData/statusOfAssessmentSectionForeAftereffect">평가 구간 현황 및 선후착 집계</a></li>
	        </c:otherwise>
	      </c:choose>
	      
	     <c:choose>
	      <c:when test="${sub_Control eq 'synthesisData_sumOfArrivalDelayTimesErrors'}">
	        <li><a href="/synthesisData/sumOfArrivalDelayTimesErrors" class="active">도착 지연 시간 및 오차 집계</a></li>
	       </c:when>
	        <c:otherwise>
	        <li><a href="/synthesisData/sumOfArrivalDelayTimesErrors">도착 지연 시간 및 오차 집계</a></li>
	        </c:otherwise>
	      </c:choose>
    </ul>
</div>