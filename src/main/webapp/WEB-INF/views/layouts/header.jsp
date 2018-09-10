<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.servlet.i18n.SessionLocaleResolver"%>
<%@ page import="java.util.Locale" %>
<%@ taglib uri="jstl-c" prefix="c"%>
<%@ taglib uri="jstl-fmt" prefix="fmt"%>
<%@ taglib uri="jstl-fn" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%-- 	<c:set var="Depth1" value="<%=Depth1%>"/>	 --%>
<%
	String userId = (String)session.getAttribute("SS_USER_ID");
	String cp = (String)session.getAttribute("SS_CP");
	String carinfo = (String)session.getAttribute("SS_CARINFO");
%>
	<div id="header">
          <a href="/main">
              <img src="../images/common/logo.gif" alt="wavem_logo" />
          </a>
<!--           <ul class="util"> -->
<%--               <li class="name"><strong><%=userId%></strong>님</li> --%>
<!--               <li><a href="/login/logoutUser"><img src="../images/common/util_logout.gif" alt="logout" /></a></li> -->
<!--           </ul> -->
		<div class="util">
			<div style="border:1px solid blue">
				<li class="name"><strong><%=userId %></strong>님</li>
				<li><a href="/login/logoutUser"><img src="../images/common/util_logout.gif" alt="logout" /></a></li>
			</div>
		</div>
          <div class="row">                
              <ul id="gnb" class="gnb">
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_1.gif" alt="home" /></a></li> --%>
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_2.gif" alt="bmt_list" /></a></li> --%>
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_3.gif" alt="synthesisData" /></a></li> --%>
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_4.gif" alt="detailsData" /></a></li> --%>
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_5.gif" alt="system" /></a></li> --%>
            <c:choose>
            	<c:when test="${control eq 'main'}">
            		<li><a href="/main" class="active"><img src="../images/common/gnb_1.gif" alt="home" /></a></li>
            	</c:when>
            	<c:otherwise>
            		<li><a href="/main"><img src="../images/common/gnb_1.gif" alt="home" /></a></li>
            	</c:otherwise>
            </c:choose>            
            <c:choose>
            	<c:when test="${control eq 'bmtListRegistration'}">
	            	<li><a href="/bmtListRegistration/bmtListRegistration" class="active"><img src="../images/common/gnb_2.gif" alt="bmt_list" /></a></li>
            	</c:when>
            	<c:otherwise>
	            	<li><a href="/bmtListRegistration/bmtListRegistration"><img src="../images/common/gnb_2.gif" alt="bmt_list" /></a></li>
            	</c:otherwise>
            </c:choose>            
            <c:choose>
            	<c:when test="${control eq 'synthesisData'}">
            		<li>
            			<a href="/synthesisData/datasheet" class="active"><img src="../images/common/gnb_3.gif" alt="synthesisData" /></a>
           			</li>
            	</c:when>
            	<c:otherwise>
		            <li>
		            	<a href="/synthesisData/datasheet" ><img src="../images/common/gnb_3.gif" alt="synthesisData" /></a>
	            	</li>
            	</c:otherwise>
            </c:choose>
            <c:choose>
            	<c:when test="${control eq 'detailsData'}">
            		<li><a href="/detailsData/pathDistance" class="active"><img src="../images/common/gnb_4.gif" alt="detailsData" /></a></li>	
            	</c:when>
            	<c:otherwise>
            		<li><a href="/detailsData/pathDistance" ><img src="../images/common/gnb_4.gif" alt="detailsData" /></a></li>
            	</c:otherwise>
            </c:choose>            
            <li><a href="#" ><img src="../images/common/gnb_5.gif" alt="system" /></a></li>
        </ul>
  	  </div>
	</div>