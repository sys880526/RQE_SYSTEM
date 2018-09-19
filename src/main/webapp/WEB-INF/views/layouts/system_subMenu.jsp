<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="snbArea" style="margin-right: 20px">
    <img src="../images/snb/h2_system.gif" alt="bmt_list"/>                  
    <ul class="snb">
      <c:choose>
	    	<c:when test="${sub_Control eq 'system_userManagement'}">
				<li><a href="/system/userManagement" class="active">기준 데이터 설정</a></li>
	      	</c:when>
	     </c:choose>
    </ul>
</div>