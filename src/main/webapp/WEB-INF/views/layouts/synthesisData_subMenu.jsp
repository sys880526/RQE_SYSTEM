<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="container">
	<nav id="snb">
		<div class="tit">
			<span>종합 데이터</span>
		</div>
		<!-- .tit -->
		<ul>
	      	<c:choose>
		    	<c:when test="${sub_Control eq 'synthesisData_dataSheet'}">
					<li class="active"><a href="/synthesisData/datasheet">Data Sheet</a></li>
		      	</c:when>
		        <c:otherwise>
		       		<li class=""><a href="/synthesisData/datasheet">Data Sheet</a></li>
		      	</c:otherwise>
		     </c:choose>
		    
		     <c:choose>
		      <c:when test="${sub_Control eq 'synthesisData_totalDistanceFaresTimes'}">
		        <li class="active"><a href="/synthesisData/totalDistanceFaresTimes">건수/거리/요금/시간 집계</a></li>
		       </c:when>
		        <c:otherwise>
		        <li class=""><a href="/synthesisData/totalDistanceFaresTimes">건수/거리/요금/시간 집계</a></li>
		        </c:otherwise>
		      </c:choose>
		   
		     <c:choose>
		      <c:when test="${sub_Control eq 'synthesisData_statusOfAssessmentSectionForeAftereffect'}">
		        <li class="active"><a href="/synthesisData/statusOfAssessmentSectionForeAftereffect">평가구간 현황 및 선후착 집계</a></li>
		       </c:when>
		        <c:otherwise>
		        <li class=""><a href="/synthesisData/statusOfAssessmentSectionForeAftereffect">평가구간 현황 및 선후착 집계</a></li>
		        </c:otherwise>
		      </c:choose>
		      
		     <c:choose>
		      <c:when test="${sub_Control eq 'synthesisData_sumOfArrivalDelayTimesErrors'}">
		        <li class="active"><a href="/synthesisData/sumOfArrivalDelayTimesErrors">도착 지연 시간 및 오차 집계</a></li>
		       </c:when>
		        <c:otherwise>
		        <li class=""><a href="/synthesisData/sumOfArrivalDelayTimesErrors">도착 지연 시간 및 오차 집계</a></li>
		        </c:otherwise>
		      </c:choose>
 		</ul>
	</nav>
	<!-- #snb -->