<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
"
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no", target-densitydpi=device-dpi />
<title>실차평가시스템</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../js/placeholder.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<!-- fullCalendar js -->
    <script type="text/javascript" src="../js/moment.min.js"></script>
 	<script type="text/javascript" src="../js/fullcalendar.js"></script>
 	<script type="text/javascript" src="../js/locale-all.js"></script>
</head>

<body>
	<div id=wrap>
		<!-- #header -->
		<%@ include file="../views/layouts/header.jsp"%>
	<div id="container" class="gnb">
		<!-- /#header -->
		<div class="body clearFix">
			<!-- #snbArea -->
			<!--  HOME 화면은 subMenu가 필요없어서 주석처리 -->
			<%--         	<%@ include file = "../views/layouts/bmtList_subMenu.jsp" %>     --%>
			<!-- /#snbArea -->
			<div id="contentsArea">
				<div class="titContents" style="width: 1300px;">
<!-- 					<h2>HOME</h2> -->
<!-- 					<p> -->
<!-- 						<strong>HOME</strong> -->
<!-- 					</p> -->
				</div>
			</div>
		</div>
	</div>
	<!-- /#container -->
	<div
		style="margin-left: 240px; margin-right: 250px; text-align: center;">
		<input type="button" id="prevBtn" value="<<" style=" float:left;  width: 34px; height: 29px;">
		<span id="yearText" style="font: bold italic 2.0em/1.0em 돋움체;"></span>
		<input type="button" id="nextBtn" value=">>"
			style="float: right; width: 34px; height: 29px;">
	</div>
	<div id="calendar_body"
		style="margin-left: 240px; margin-right: 250px;">
		<table>
			<thead>
				<div id="calendar_head"></div>
			</thead>
			<tbody>
				<tr>
					<td id="calendar_1"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_2"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_3"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_4"
						style="width: 250px; height: 350px; padding: 5px"></td>
				</tr>
				<tr>
					<td id="calendar_5"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_6"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_7"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_8"
						style="width: 250px; height: 350px; padding: 5px"></td>
				</tr>
				<tr>
					<td id="calendar_9"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_10"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_11"
						style="width: 250px; height: 350px; padding: 5px"></td>
					<td id="calendar_12"
						style="width: 250px; height: 350px; padding: 5px"></td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- #footer -->
	<footer>
	    <p class="copyright">Copyright ⓒ 2018. WaveM Co. All rights reserved.</p>
    </footer>
	
	</div>
	
	<script>
 
		var date = new Date();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();	
	
	 

	 var event = ${bmtListEvent};
	 // controller 로직 수정으로 인해 주석 
	 // 2018-08-20 ys880526
// 	 var events = [];
// 	 for(var i=0; i<event.result.length; i++){
// 		 var monthSub = 1;
		 
		 
	 // controller 로직 수정으로 인해 주석 
	 // 2018-08-20 ys880526
// 		 events.push({
// 			 title : ''
// 			 , start: event.result[i]
// 		 })   
// 	}
	 
	 
	console.log("debug");
	 
 	$(document).ready(function() {
 		
//  		getEvent();

		 
		 $("#yearText").html(year + "년도");
		 // controller 로직 수정으로 인해 주석 
		 // 2018-08-20 ys880526
// 		 drawCalendar('calendar_1', '01', event.result.month1);
// 		 drawCalendar('calendar_2', '02', event.result.month2);
// 		 drawCalendar('calendar_3', '03', event.result.month3);
// 		 drawCalendar('calendar_4', '04', event.result.month4);
// 		 drawCalendar('calendar_5', '05', event.result.month5);
// 		 drawCalendar('calendar_6', '06', event.result.month6);
// 		 drawCalendar('calendar_7', '07', event.result.month7);
// 		 drawCalendar('calendar_8', '08', event.result.month8);
// 		 drawCalendar('calendar_9', '09', event.result.month9);
// 		 drawCalendar('calendar_10', '10', event.result.month10);
// 		 drawCalendar('calendar_11', '11', event.result.month11);
// 		 drawCalendar('calendar_12', '12', event.result.month12);
		 
// 		  $(".fc-left").hide();
// 		  $(".fc-right").hide();
		  
		  drawAllCalendar();
		  
// 		drawCalendar_header('calendar_head');
		
		$( "#prevBtn" ).click(function() {
			year = year -1;
			emptyAllCalendar();
			drawAllCalendar();
			  
		});
		
		$( "#nextBtn" ).click(function() {
				year = year +1;
				emptyAllCalendar();
				drawAllCalendar();
		});
		
	 	
	 	function drawCalendar_header(div, month, events){
	 		$('#'+div).fullCalendar({
//	  		      defaultDate: year + '-' + month + '-10',
	 		      defaultDate:year + '-' + month + '-10',
// 	 		      contentHeight:310,
	 				height: 250,
	 				locale: "ko",
	 				header : {
	 					left : 'prevYear',
	 					center : 'title',
	 					right : 'nextYear'
	 				},
// 	 				calendar_title_separate : function(){
// 	 			         console.log($('.fc-center').text());                  // 타이틀 텍스트를 받아온다.
// 	 			         var strArray = $('.fc-center').text().split(' ');     // 텍스트 분리
// 	 			         console.log(strArray);                              // ["2015년", "5월2015년", "5월"]
// //	  			         $('.fc-left h2:first').replaceWith('<h2>' + strArray[0] + '</h2>');  // 2015년 대체
// 	 			         $('.fc-center h2:last').replaceWith('<h2>' + strArray[2] + '</h2>');   // 5월 대체
// 	 			     },
	 		      editable: true,
	 		      eventLimit: true, // allow "more" link when too many events
	 		      events: events
	 		    });

	 	}
	  });
	 
	 function emptyAllCalendar(){
		 for(var i = 1; i < 13;i++){
			 $("#calendar_"+i).fullCalendar('destroy');
		 }
	 }
	 
	 function drawAllCalendar(){
		 // controller 로직 수정으로 인해 로직 수정 
		 // 2018-08-20 ys880526
		 drawCalendar('calendar_1', '01', event.result.month1);
		 drawCalendar('calendar_2', '02', event.result.month2);
		 drawCalendar('calendar_3', '03', event.result.month3);
		 drawCalendar('calendar_4', '04', event.result.month4);
		 drawCalendar('calendar_5', '05', event.result.month5);
		 drawCalendar('calendar_6', '06', event.result.month6);
		 drawCalendar('calendar_7', '07', event.result.month7);
		 drawCalendar('calendar_8', '08', event.result.month8);
		 drawCalendar('calendar_9', '09', event.result.month9);
		 drawCalendar('calendar_10', '10', event.result.month10);
		 drawCalendar('calendar_11', '11', event.result.month11);
		 drawCalendar('calendar_12', '12', event.result.month12);
		 
		 $("#yearText").html(year + "년도");
		 $(".fc-left").hide();
		 $(".fc-right").hide();
	 }
	 
	 function drawCalendar(div, month, events){
		 // controller 로직 수정으로 인해 로직 추가 
		 // 2018-08-20 ys880526 start
		 var eventSub = [];
		 if(events != undefined){
			 for(var i=0; i<events.length; i++){
		 		 eventSub.push({
		 			 title : ''
		 			 , start: events[i]
		 		 })   
			 }
		 }
		 // end
		 
	 		$('#'+div).fullCalendar({
	 		      defaultDate: year + '-' + month + '-10',
	 		      contentHeight:310,
	 				height: 150,
	 				locale: "ko",
	 				header : {
//	 					left : 'preYear',
	 					center : 'title',
	 					//right : 'month,agendaWeek,agendaDay'
//	 					right : 'nextYear'
	 				},
	 				defaultView: 'month',
//	 				viewRender: function(view){
//	 					var title = view.title;
//	 					$("#externalTitle").html(title);
//	 				},
	 		      editable: true,
	 		      eventLimit: true, // allow "more" link when too many events
	 		      events: eventSub
	 		    });
	 	}
	 
	 
	</script>

</body>
<script>
</script>
</html>