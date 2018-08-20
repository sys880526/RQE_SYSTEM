<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Welcome to RQE System (Route Quality Evaluation)</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- import.css -->
    <link rel="stylesheet" type="text/css" href="../css/import.css" />
    
    <!-- js -->
    <script type="text/javascript" src="../js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="../js/style.js"></script>
    
	<!-- fullCalendar js -->
    <script type="text/javascript" src="../js/moment.min.js"></script>
 	<script type="text/javascript" src="../js/fullcalendar.js"></script>
 	<script type="text/javascript" src="../js/locale-all.js"></script>

    <!-- fullCalendar css -->
	<link rel="stylesheet" type="text/css" href="../css/fullcalendar.css" />
	
 	
</head>

<body>

    <!--
    layout.css : body, #wrap 주석처리 및 #wrap 사용(X)
    -->
    <!-- #container -->
    <div id="container" class="gnb">
        <!-- #header -->
        <%@ include file = "../views/layouts/header.jsp" %>
        <!-- /#header -->
        <div class="body clearFix">
            <!-- #snbArea -->
			<!--  HOME 화면은 subMenu가 필요없어서 주석처리 -->
<%--         	<%@ include file = "../views/layouts/bmtList_subMenu.jsp" %>     --%>
            <!-- /#snbArea -->
            <div id="contentsArea">
                <div class="titContents">
                    <h2>HOME</h2>
                    <p>
                        <strong>HOME</strong>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- /#container -->
    <div style="margin-left: 240px; margin-right: 250px;     text-align: center;">
    	<input type="button" id="prevBtn" value="<<" style="float: left;  width: 34px; height: 29px;">
    	<span id="yearText" style="font: bold italic 2.0em/1.0em 돋움체;"></span>
    	<input type="button" id="nextBtn" value=">>" style="float:  right; width: 34px; height: 29px;">
	</div>
    <div id ="calendar_body" style="margin-left: 240px; margin-right: 250px;">
		<table>
				<thead>
					<div id="calendar_head"></div>
				</thead>
				<tbody>
					<tr>
						<td id="calendar_1" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_2" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_3" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_4" style="width: 250px; height: 350px; padding: 5px"></td>
					</tr>
					<tr>
						<td id="calendar_5" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_6" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_7" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_8" style="width: 250px; height: 350px; padding: 5px"></td>
					</tr>
					<tr>
						<td id="calendar_9" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_10" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_11" style="width: 250px; height: 350px; padding: 5px"></td>
						<td id="calendar_12" style="width: 250px; height: 350px; padding: 5px"></td>
					</tr>
				</tbody>
		</table>
	</div>
	
	<!-- #footer -->
	<div id=footer>
		COPYRIGHT ⓒ ALL RIGHTS RESERVED.
	</div>
	
	<script>
 
		var date = new Date();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();	
	
	 

   	 var event = ${bmtListEvent};
	 var events = [
		 
		 {
        title: '',
        start: '2018-08-10'
      },
		{
        title: '',
        start: '2018-08-09'
      },
		{
        title: '',
        start: '2018-08-08'
      },
		{
        title: '',
        start: '2018-08-07'
      },
		{
        title: '',
        start: '2018-08-06'
      },
    ];	
	
	 var event = ${bmtListEvent};
	 var events = [];	
	 for(var i=0; i<event.length; i++){
		 events.push({
			 title : ''
			 , start: event[i]
		 })   
	}
	 
 	$(document).ready(function() {
 		
//  		getEvent();

		 
		 $("#yearText").html(year + "년도");
		 drawCalendar('calendar_1', '01', events);
		 drawCalendar('calendar_2', '02', events);
		 drawCalendar('calendar_3', '03', events);
		 drawCalendar('calendar_4', '04', events);
		 drawCalendar('calendar_5', '05', events);
		 drawCalendar('calendar_6', '06', events);
		 drawCalendar('calendar_7', '07', events);
		 drawCalendar('calendar_8', '08', events);
		 drawCalendar('calendar_9', '09', events);
		 drawCalendar('calendar_10', '10', events);
		 drawCalendar('calendar_11', '11', events);
		 drawCalendar('calendar_12', '12', events);
		 
		  $(".fc-left").hide();
		  $(".fc-right").hide();
		  
// 		  drawAllCalendar();
		  
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
		 for(var i = 1; i < 13;i++){
			 if(i <10){
				 str = '0'+i;
			 }else{
				 str= i;
			 }
			 drawCalendar('calendar_'+i, str, events);
			 
		 }
		 $("#yearText").html(year + "년도");
		  $(".fc-left").hide();
		  $(".fc-right").hide();
	 }
	 
	 function drawCalendar(div, month, events){
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
	 		      events: events
	 		    });
	 	}
	</script>
	
</body>
<script>
</script>
</html>