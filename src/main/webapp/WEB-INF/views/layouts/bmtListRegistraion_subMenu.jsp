<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="snbArea" style="margin-right: 20px">
    <img src="../images/snb/h2_work.gif" alt="bmt_list"/>                  
   <ul class="snb">
   		<c:choose>
	    	<c:when test="${sub_control eq 'bmtListRegistration.bmtListRegistration'}">
		   		<li><a href="/bmtListRegistration/bmtListRegistration" class="active">BMT LIST 이력 조회</a></li>
	      	</c:when>
	        <c:otherwise>
		   		<li><a href="/bmtListRegistration/bmtListRegistration">BMT LIST 이력 조회</a></li>
	      	</c:otherwise>
	     </c:choose>
   		<c:choose>
	    	<c:when test="${sub_control eq 'bmtListRegistration.bmtNewList'}">
		   		<li><a href="/bmtListRegistration/bmtNewList" class="active">등록 이력 조회</a></li>
	      	</c:when>
	        <c:otherwise>
		   		<li><a href="/bmtListRegistration/bmtNewList">등록 이력 조회</a></li>
	      	</c:otherwise>
	     </c:choose>
	</ul>
</div>