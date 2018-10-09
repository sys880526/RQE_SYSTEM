<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="container">
	<nav id="snb">
		<div class="tit">
			<span>진행 데이터</span>
		</div>
		<!-- .tit -->
		<ul>
	      <c:choose>
		    	<c:when test="${sub_Control eq 'system_userManagement'}">
					<li class="active"><a href="/system/userManagement">기준 데이터 설정</a></li>
		      	</c:when>
		     </c:choose>
	    </ul>
	</nav>
	<!-- #snb -->