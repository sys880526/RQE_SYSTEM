<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="snbArea" style="margin-right: 20px">
    <img src="../images/snb/h2_work.gif" alt="bmt_list"/>                  
    <ul class="snb">
      	<c:choose>
	    	<c:when test="${sub_Control eq 'synthesisData_dataSheet'}">
<<<<<<< HEAD
				<li><a href="/synthesisData/datasheet" class="active">DataSheet</a></li>
=======
				<li><a href="/synthesize/datasheet" class="active">DataSheet</a></li>
>>>>>>> d8989a01b466e965cb5888aa14b0192f01ace123
	      	</c:when>
	        <c:otherwise>
	       		<li><a href="/synthesisData/datasheet">DataSheet</a></li>
	      	</c:otherwise>
	     </c:choose>
	    
	     <c:choose>
	      <c:when test="${sub_Control eq 'synthesisData_totalDistanceFaresTimes'}">
<<<<<<< HEAD
	        <li><a href="/synthesisData/totalDistanceFaresTimes" class="active">건수/거리/요금/시간 집계</a></li>
=======
	        <li><a href="/synthesize/totalDistanceFaresTimes" class="active">건수/거리/요금/시간 집계</a></li>
>>>>>>> d8989a01b466e965cb5888aa14b0192f01ace123
	       </c:when>
	        <c:otherwise>
	        <li><a href="/synthesisData/totalDistanceFaresTimes">건수/거리/요금/시간 집계</a></li>
	        </c:otherwise>
	      </c:choose>
	   
	     <c:choose>
	      <c:when test="${sub_Control eq 'synthesisData_statusOfAssessmentSectionForeAftereffect'}">
<<<<<<< HEAD
	        <li><a href="/synthesisData/statusOfAssessmentSectionForeAftereffect" class="active">평가 구간 현황 및 선후착 집계</a></li>
=======
	        <li><a href="/synthesize/statusOfAssessmentSectionForeAftereffect" class="active">평가 구간 현황 및 선후착 집계</a></li>
>>>>>>> d8989a01b466e965cb5888aa14b0192f01ace123
	       </c:when>
	        <c:otherwise>
	        <li><a href="/synthesisData/statusOfAssessmentSectionForeAftereffect">평가 구간 현황 및 선후착 집계</a></li>
	        </c:otherwise>
	      </c:choose>
	      
	     <c:choose>
	      <c:when test="${sub_Control eq 'synthesisData_sumOfArrivalDelayTimesErrors'}">
<<<<<<< HEAD
	        <li><a href="/synthesisData/sumOfArrivalDelayTimesErrors" class="active">도착 지연 시간 및 오차 집계</a></li>
=======
	        <li><a href="/synthesize/sumOfArrivalDelayTimesErrors" class="active">도착 지연 시간 및 오차 집계</a></li>
>>>>>>> d8989a01b466e965cb5888aa14b0192f01ace123
	       </c:when>
	        <c:otherwise>
	        <li><a href="/synthesisData/sumOfArrivalDelayTimesErrors">도착 지연 시간 및 오차 집계</a></li>
	        </c:otherwise>
	      </c:choose>
    </ul>
</div>