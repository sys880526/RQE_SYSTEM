<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="jstl-c" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	String strParamSO = request.getParameter("SS_OUT");
	if(null == strParamSO) strParamSO = "N";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta charset=utf-8" />
  <title>사용자 인터페이스</title>
  <link rel="stylesheet" type="text/css" href="./css/import.css" />
  <script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="./js/style.js"></script>
  <script type="text/javascript">
	$(document).ready(function() {
		// keydown event 
		$("#userPass").keydown(function(event) {
			if (event.which == 13) {
				alert("test");
				loginAction();
			}
		});

		// button event
		$("#btnLogin").click(function() {
			loginAction();
		});
			
<%
	if("Y".equals(strParamSO)) {
		out.println("alert('세션이 만료되었습니다. 다시 로그인 하세요.');");		  
	}
%>
		//getid(document.frm);
		// alert
		if ("true" == $("#loginflag").val()) {
			location.href = "/bulletin/bulletin";
		} else if ("false" == $("#loginflag").val()) {
			alert($("#msg").val());
			return;
		}
	});

	// valid
	function loginValid() {
		var userId = $("#userId");
		var userPass = $("#userPass");

		if ("" == userId.val() || !"" == userPass.val()) {

			alert("아이디를 입력해주세요.");
			userId.focus();
			return false;
		} else if (!"" == userId.val() || "" == userPass.val()) {

			alert("패스워드를 입력해주세요.");
			userPass.focus();
			return false;
		} else if ("" == userId.val() || "" == userPass.val()) {

			alert("로그인정보를 입력해주세요.");
			userId.focus();
			return false;
		} else {
			return true;
		}
	}

	// submit
	function loginAction() {
		if (loginValid()) {
			$("#frm").action = "/login/login";
			$("#frm").submit();
		}
	}
	
	</script>
  <script type="text/javascript">
	$(function(){
		$('#login .text').focusin(function(){
			$(this).addClass('active');
		}).focusout(function(){
			$(this).removeClass('active');
		});
	});
  </script>
 </head>
<form id="frm" name="frm" action="/login/login" method="post">
 <body style="background:#dce1e9 url(./images/login/bg_body.gif) center 0 no-repeat;">
	<!-- #login -->
	<div id="login">
		<ul>
			<li><label for="userId">ID</label> <input type="text" id="userId" class="text" /></li>
			<li><label for="userPw">PASSWORD</label> <input type="password" id="userPass" class="text" /></li>
<!-- 			<li class="btn"><a href="./sample.do"><img src="./images/login/btn_login.gif" alt="로그인" /></a></li> -->
			<li class="btn">					
				<img id="btnLogin" src="./images/login/btn_login.gif" alt="Login" title="Login" style="cursor: pointer;" />
			</li>
			<li style="padding:7px 0 0 302px"><a href="#layerPopup_1" class="btnLayer">관리자 등록</a></li>
		</ul>
	</div>
	</form>
	<!-- /#login -->

</html>
