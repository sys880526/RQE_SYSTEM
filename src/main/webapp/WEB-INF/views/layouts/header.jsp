<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.servlet.i18n.SessionLocaleResolver"%>
<%@ page import="java.util.Locale" %>
<%@ taglib uri="jstl-c" prefix="c"%>
<%@ taglib uri="jstl-fmt" prefix="fmt"%>
<%@ taglib uri="jstl-fn" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%-- 	<c:set var="Depth1" value="<%=Depth1%>"/>	 --%>

	<div id="header">
          <a href="#">
              <img src="../images/common/logo.gif" alt="wavem_logo" />
          </a>
          <ul class="util">
              <li class="name"><strong>홍길동</strong>님</li>
              <li><a href="#"><img src="../images/common/util_logout.gif" alt="logout" /></a></li>
          </ul>
          <div class="row">                
              <ul id="gnb" class="gnb">
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_1.gif" alt="home" /></a></li> --%>
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_2.gif" alt="bmt_list" /></a></li> --%>
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_3.gif" alt="synthesisData" /></a></li> --%>
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_4.gif" alt="detailsData" /></a></li> --%>
<%--                     <li><a href="#" <c:if test="${Depth1 == '' }" var="result">class="active"</c:if>><img src="../images/common/gnb_5.gif" alt="system" /></a></li> --%>
            <li><a href="#" class="active"><img src="../images/common/gnb_1.gif" alt="home" /></a></li>
            <li><a href="#" ><img src="../images/common/gnb_2.gif" alt="bmt_list" /></a></li>
            <li><a href="#" ><img src="../images/common/gnb_3.gif" alt="synthesisData" /></a></li>
            <li><a href="#" ><img src="../images/common/gnb_4.gif" alt="detailsData" /></a></li>
            <li><a href="#" ><img src="../images/common/gnb_5.gif" alt="system" /></a></li>
        </ul>
  	  </div>
	</div>