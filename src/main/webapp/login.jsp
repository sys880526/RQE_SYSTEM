<!DOCTYPE html>
<html lang="ko">
<!-- <html lang="ko" xmlns="http://www.w3.org/1999/xhtml" > -->
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	String strParamSO = request.getParameter("SS_OUT");
	if(null == strParamSO) strParamSO = "N";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi" /> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no", target-densitydpi=device-dpi />
    <title>실차평가시스템</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="../js/placeholder.js"></script>
    <script type="text/javascript" src="../js/ui.js"></script>
<!--     <link rel="stylesheet" type="text/css" href="../share/css/style.css" /> -->
<!--     <script type="text/javascript" src="../share/js/jquery-3.3.1.js"></script> -->
<!--     <script type="text/javascript" src="../share/js/jquery-ui.min.js"></script> -->
<!--     <script type="text/javascript" src="../share/js/jquery.mCustomScrollbar.concat.min.js"></script> -->
<!--     <script type="text/javascript" src="../share/js/placeholder.js"></script> -->
<!--     <script type="text/javascript" src="../share/js/ui.js"></script> -->
    <script type="text/javascript">
	$(document).ready(function() {
		// keydown event 
		$("#userPass").keydown(function(event) {
			if (event.which == 13) {
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
// 		var msg = ${msg};

		if ("true" == $("#loginflag").val()) {
		} else if ("false" == $("#loginflag").val()) {
		    alert("로그인 실패 / ID-Password 재확인!");
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
	});3
  </script>
</head>
<form id="frm" name="frm" action="/login/login" method="post">
	<body class="login">
	    <div id="wrap">
	        <div class="login-box">
	            <h1><img src="../images/common/img_logo.png" alt="" /></h1>
	            <input type="text" value="" placeholder="아이디" id="userId" name="userId" class="user-id" />
	            <input type="password" value="" placeholder="비밀번호" id="userPass" name="userPass" class="user-pw" />
	            <a id="btnLogin" class="btn">LOGIN</a>
	            <p class="copyright">Copyright ⓒ 2018. WaveM Co. All rights reserved.</p>
	        </div>
	        <!-- /.login_box -->
	        <div class="loading common"><p>로딩중입니다.</p></div>
	        <div class="modal"></div>
	    </div>
	    <!-- #wrap -->
	</body>
</form>
</html>
