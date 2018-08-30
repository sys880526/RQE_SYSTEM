<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>BMT ID 기준 특이사항</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="../js/style.js"></script>
    
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../css/import.css" />
    <link rel="stylesheet" type="text/css" href="../css/board.css" />
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/layout.css" />
    <link rel="stylesheet" type="text/css" href="../css/login.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />    
    <link rel="stylesheet" type="text/css" href="../css/modal.css" />
</head>
<body>
<!-- #container -->
	<div id="container" class="gnb">
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
		<!-- \#header -->
		<!-- .body clearFix -->
		<div class="body clearFix">
			<!-- #snbArea -->
			<jsp:include page="/WEB-INF/views/layouts/synthesisData_subMenu.jsp"/>
			<!-- \#snbArea -->
			<!-- #contentArea -->
			<div id="contentsArea">
				<div class="titContents">
					<h2>BMT ID 기준 특이사항</h2>
					<p>
						Home > 상세데이터 >
						<strong>BMT ID 기준 특이사항</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" width=100%>
                	<!-- .search -->
                	<div class="search">
                        <form id="search-bmt">
                        	<div class="row" style="margin-bottom: 20px">
                        		<span class="pd">시작 날짜</span>
                            <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" />
                            <span class="pd">~</span>
                            <span class="pd">종료 날짜</span>
                            <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" />
                            <a href="javascript:bmtIdReferenceSpecific()" class="btnSearch">
                                <img src="../images/board/btn_search.gif" alt="search" />
                            </a>
                        	</div>
                            <div class="row">
                            	<div class="day" style="padding: 0px 3px 0px 10px;display: inline-block;vertical-align: top;">
	                            	<span style="display : table;">요일특성</span>
	                            	<br>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="weekday">주중
									</label>
									<label>
										<input type="checkbox" id="weekend">주말
									</label>
                            	</div>                            	
            					<div class="timecheck" style="padding: 0px 0px 0px 100px;display: inline-block;vertical-align : top;">
            						<span style="display : table;padding: 0px 0px 10px 0px;">시간대특성</span>
            						<div class="row">
            							<div style="display: inline-block;">
		            						<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="am_peak" name="am_peak" value="am_peak">오전 첨두
											</label>
											<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="pm_peak" name="pm_peak" value="pm_peak">오후 첨두
											</label>
											<label>
											  <input type="checkbox" id="am" name="am" value="am">오전
											</label>
            							</div>
            							<div style="padding: 0px 100px 0px 20px;display: inline-block;">
	            							<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="am_non_peak" name="am_non_peak" value="am_non_peak">오전 비첨두
											</label>
											<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="pm_non_peak" name="pm_non_peak" value="pm_non_peak"> 오후 비첨두
											</label>
											<label>
											  <input type="checkbox" id="pm" name="pm" value="pm">오후
											</label>
            							</div>
            						</div>
            					</div>
            					<div class="distance" style="display: inline-block;vertical-align: top;">
            						<span style="display : table;padding: 0px 0px 10px 0px;">거리특성</span>
            						<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="shortest_distance" name="shortest_distance" value="shortest_distance"> 초 단거리(0 ~ 5km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="short_distance" name="short_distance" value="short_distance"> 단거리(5 ~ 10km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="medium_distance" name="medium_distance" value="medium_distance"> 중거리(10 ~ 30km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="long_distance" name="long_distance" value="long_distance"> 장거리(30 ~ 50km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="longest_distance" name="longest_distance" value="longest_distance"> 초 장거리(50 ~ km)
									</label>
            					</div>
                            </div>
                        </form>
                	</div>
                	<!-- /.search -->
                	<div class="row">
	                	<!-- table -->               
	                    <div class="col-5" style="display: inline-block;vertical-align : top;margin-right: 50px">
	                    	<table id="tbl-specific-list">
	                            <thead style="background-color: #e6f2ff">                               
	                                <tr>
	                                    <th style="height: 25PX;">BMT ID</th>
	                                    <th style="height: 25PX;">no</th>
	                                    <th style="height: 25PX;">cp</th>
	                                </tr>
	                            </thead>
	                            <tbody></tbody>
	                        </table>   
	                    </div>
	                    <!-- \table -->    
	                    <!-- table -->
	                    <div class="col-6" style="display: inline-block;margin-bottom: 20px">
	                    	<table id="tbl-specific-info">
	                    		<thead style="background-color: #e6f2ff">                               
	                                <tr>
	                                    <th style="height: 25PX;">BMT ID</th>
	                                    <th style="height: 25PX;">Code</th>
	                                    <th style="height: 25PX;">Cp</th>
	                                    <th style="height: 25PX;">출발지명</th>
	                                    <th style="height: 25PX;">도착지명</th>
	                                </tr>
	                            </thead>
	                    	</table>
	                    	<!-- image -->
		                    <div id="specific-image" style="margin-bottom: 20px">
		                    
		                    </div>
	                       <!-- \image -->
	                       <table id="tbl-specific-etc">
	                       		<tr>
	                       			<td style="background-color: #e6f2ff">발생 시간</td>
	                       			<td id="tbl-specific-etc1"></td>
	                       		</tr>
	                       		<tr>
	                       			<td style="background-color: #e6f2ff">발생 장소(경/위도)</td>
	                       			<td id="tbl-specific-etc2"></td>
	                       		</tr>
	                       		<tr>
	                       			<td style="background-color: #e6f2ff">내용</td>
	                       			<td id="tbl-specific-etc3"></td>
	                       		</tr>
	                       </table>
	                    </div> 
	                    <!-- \table -->
                	</div>
                </div>
			</div>
		</div>
		<!-- \.body clearFix -->
	</div>
	<!-- \#container -->
</body>
<script>
	$(document).ready(function() {
		/**
		* 초기 date 설정
		*/
		setDate();
		
		day();
		
        $('#weekday').on('change', function() {
            day();
        });

         $('#weekend').on('click', function() {
            day();
        });        

        $('.timecheck input').on('click', function() {
            distance();
        });

	});//document.ready
	
	//<![CDATA[
	// date picker
	$(".date").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '2013:2018',
	    showOn: "button",
	    buttonImage: "../images/board/btn_date.gif",
	    buttonImageOnly: true,
	    buttonText: "날짜선택",
	    inline: true,
	    duration: 300,
	    showAnim: "slideDown"
	});
	$.datepicker.regional['ko'] = {
	    closeText: '닫기',
	    prevText: '이전달',
	    nextText: '다음달',
	    currentText: '오늘',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    dateFormat: 'yy-mm-dd', firstDay: 0,
	    isRTL: false
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	//]]>
	
	/**
	* data sheet 초기 검색값 설정하기
	*/
	setDate = function() {
		var start = $('#bmt-start-date');
		var end = $('#bmt-end-date');
		var modalCal = $('#bmt-date');	// modal 에 입력되는 달력
		
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		if (month < 10) {
			month = '0' + month;
		}
		var day = date.getDate();
		if (day < 10) {
			day = '0' + day;
		}

		var prevDate = new Date(date.setDate(date.getDate()-30));
		var prevYear = prevDate.getFullYear();
		var prevMonth = prevDate.getMonth() + 1;
		if (prevMonth < 10) {
			prevMonth = '0' + prevMonth;
		}
		var prevDay = prevDate.getDate();
		if (prevDay < 10) {
			prevDay = '0' + prevDay;
		}
		
		start.val(prevYear + '-' + prevMonth + '-' + prevDay);
		end.val(year + '-' + month + '-' + day);
		modalCal.val(year + '-' + month + '-' + day);
	}
	
	
	/**
	* 요일특성 선택시 실행함수
	*/
	day = function() {
        var weekday = $('#weekday').prop('checked');
        var weekend = $('#weekend').prop('checked');
        if(weekday == false && weekend == false) {
            $('.timecheck input').prop('checked', false).attr('disabled', true);
            distance();
            return;
        }
        if(weekday === true && weekend === false) {
            $('#am_peak').attr('disabled', false);
            $('#am_non_peak').attr('disabled', false);
            $('#pm_peak').attr('disabled', false);
            $('#pm_non_peak').attr('disabled', false);
            $('#am').attr('disabled', true);
            $('#pm').attr('disabled', true);
            distance();
            return;
        }
        if(weekday === false && weekend === true) {
            $('#am_peak').attr('disabled', true);
            $('#am_non_peak').attr('disabled', true);
            $('#pm_peak').attr('disabled', true);
            $('#pm_non_peak').attr('disabled', true);
            $('#am').attr('disabled', false);
            $('#pm').attr('disabled', false);
            distance();
            return;
        }
        if(weekday === true && weekend === true) {          
            $('.timecheck input').attr('disabled', false);
            distance();
            return;
        }       
    };
    
    /**
	* 거리특성 선택시 실행함수
	*/
    distance = function() {
    	var weekday = $('#weekday').prop('checked');
        var weekend = $('#weekend').prop('checked');
        var ampeak = $('#am_peak').prop('checked');
        var amnonpeak = $('#am_non_peak').prop('checked');
        var pmpeak = $('#pm_peak').prop('checked');
        var pmnonpeak = $('#pm_non_peak').prop('checked');
        var am = $('#am').prop('checked');
        var pm = $('#pm').prop('checked');
        if(weekday === true || weekend === true || 
        	ampeak === true || amnonpeak === true ||
            pmpeak === true || pmnonpeak === true ||
            am === true || pm === true) {
            $('.distance input').attr('disabled', false);
            return;
        }
        if(weekday === false || weekend === false || 
        	ampeak === false && amnonpeak === false &&
            pmpeak === false && pmnonpeak === false &&
            am === false && pm === false) {
            $('.distance input').prop('checked', false).attr('disabled', true);
            return;
        }
    };
    
    /**
    * bmtIdReferenceSpecific data 조회
    */
    bmtIdReferenceSpecific = function() {
    	//시간대 특성 체크된 개수 확인
    	var count_time = $('.timecheck input:checked').length;
    	if (count_time < 1) {
    		alert('시간대특성 및 거리특성을 1개 이상 선택해 주시기바랍니다.');
			return false;
		}
    	
    	//거리 특성 체크된 개수 확인
    	var count_distance = $('.distance input:checked').length;
    	if (count_distance < 1) {
    		alert('거리특성을 1개 이상 선택해 주시기바랍니다.');
			return false;
		}
    	
    	//시작날짜 종료날짜 입력 확인
    	var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		if (start == null || start == '' || end == null || end == '') {
			return false;
		}
		
		$.ajax({
			url : '/detailsData/bmtIdReferenceSpecificData'
			, type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				alert(data);	
			}
			, error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		})
    }
    
    /**
	 * form data 직렬화 
	 */
	$.fn.serializeObject = function() {
		var result = {};
		var extend = function(i, element) {
			var node = result[element.name];

			if ('undefined' !== typeof node && node !== null) {
				if ($.isArray(node)) {
					node.push(element.value);
				} else {
					result[element.name] = [ node, element.value ];
				}
			} else {
				result[element.name] = element.value;
			}
		};

		$.each(this.serializeArray(), extend);
		return result;
	};
	
</script>
</html>