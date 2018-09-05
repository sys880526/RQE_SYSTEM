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
			<jsp:include page="/WEB-INF/views/layouts/detailsData_subMenu.jsp"/>
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
									  <input type="checkbox" id="weekday" value="weekday">주중
									</label>
									<label>
										<input type="checkbox" id="weekend" value="weekend">주말
									</label>
                            	</div>                            	
            					<div class="timecheck" style="padding: 0px 0px 0px 100px;display: inline-block;vertical-align : top;">
            						<span style="display : table;padding: 0px 0px 10px 0px;">시간대특성</span>
            						<div class="row timecheck">
            							<div style="display: inline-block;">
		            						<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="am_peak" name="am_peak" value="am_peak" class="weekday" disabled>오전 첨두
											</label>
											<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="pm_peak" name="pm_peak" value="pm_peak" class="weekday" disabled>오후 첨두
											</label>
											<label>
											  <input type="checkbox" id="am" name="am" value="am" class="weekend" disabled>오전
											</label>
            							</div>
            							<div style="padding: 0px 100px 0px 20px;display: inline-block;">
	            							<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="am_non_peak" name="am_non_peak" value="am_non_peak" class="weekday" disabled>오전 비첨두
											</label>
											<label style="display: table;margin-bottom: 7px;">
											  <input type="checkbox" id="pm_non_peak" name="pm_non_peak" value="pm_non_peak" class="weekday" disabled> 오후 비첨두
											</label>
											<label>
											  <input type="checkbox" id="pm" name="pm" value="pm" class="weekend" disabled>오후
											</label>
            							</div>
            						</div>
            					</div>
            					<div class="distance" style="display: inline-block;vertical-align: top;">
            						<span style="display : table;padding: 0px 0px 10px 0px;">거리특성</span>
            						<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="shortest_distance" name="shortest_distance" value="shortest_distance" disabled> 초 단거리(0 ~ 5km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="short_distance" name="short_distance" value="short_distance" disabled> 단거리(5 ~ 10km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="medium_distance" name="medium_distance" value="medium_distance" disabled> 중거리(10 ~ 30km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="long_distance" name="long_distance" value="long_distance" disabled> 장거리(30 ~ 50km)
									</label>
									<label style="display: table;margin-bottom: 7px;">
									  <input type="checkbox" id="longest_distance" name="longest_distance" value="longest_distance" disabled> 초 장거리(50 ~ km)
									</label>
            					</div>
                            </div>
                        </form>
                	</div>
                	<!-- /.search -->
                	<div class="row">
	                	<!-- table -->               
	                    <div style="display: inline-block;vertical-align : top;width: 250px;margin-right: 30px;overflow: scroll;height: 500px">
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
	                    <div style="display: inline-block;margin-bottom: 20px;width: 500px;">
	                    	<table id="tbl-specific-info" style="margin-bottom: 20px">
	                    		<thead style="background-color: #e6f2ff">                               
	                                <tr>
	                                    <th style="height: 25PX;">BMT ID</th>
	                                    <th style="height: 25PX;">Code</th>
	                                    <th style="height: 25PX;">Cp</th>
	                                    <th style="height: 25PX;">출발지명</th>
	                                    <th style="height: 25PX;">도착지명</th>
	                                </tr>
	                            </thead>
	                            <tbody></tbody>
	                    	</table>
	                    	<!-- image -->
		                    <div style="margin-bottom: 20px">
								<img id="specific-image" src="" style="display: block;margin-left: auto;margin-right: auto;width: 50%">		                    
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
		
		// 주중, 주말 선택할 경우
		$('#weekday, #weekend').on('change', function() {
			var checked = $(this).is(':checked');
			var value = $(this).val();
			var items = $('.'.concat(value));
			items.prop('disabled', !checked);
			if (!checked) {
				// checked == false
				items.prop('checked', checked);
			}
			distanceCheck();
		});
		
		// 거리특성 선택할 경우
		$('.weekday, .weekend').on('change', function() {
			distanceCheck();
		});
		
		// 검색된 값이 없는경우 
		notFoundResult();

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
	};
	
	/**
	* 거리특성 선택함수
	*/
	function distanceCheck() {
		var cnt = $('.timecheck input[type=checkbox]:checked').length;
		var items = $('.distance input[type=checkbox]'); 
		items.prop('disabled', (cnt>0) ? false : true);
		if (cnt <= 0) {
			items.prop('checked', false);
		}
	};

    /**
    * bmtIdReferenceSpecific data 조회
    */
    bmtIdReferenceSpecific = function() {
    	
    	var list1 = $('#tbl-specific-list').children('tbody');
    	var list2 = $('#tbl-specific-info').children('tbody');
    	var image = $('#specific-image');
    	
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
				
				gbl_data = data.out;
				
				var etc1 = $('#tbl-specific-etc1'); 
				var etc2 = $('#tbl-specific-etc2'); 
				var etc3 = $('#tbl-specific-etc3');
				
				list1.empty();
				list2.empty();
				image.attr('src', '');
				etc1.empty();
				etc2.empty();
				etc3.empty();
				
				if (data.out.length === 0) {
					alert('검색된 값이 없습니다');
					notFoundResult();
				}
				
				data.out.forEach(function(items, index, array) {
					var html1 = [
						'<tr onclick="selectSpecific(',
						index,
						')">',
						'<td>', items.bmtid, '</td>',
						'<td>', items.yugocode, '</td>',
						'<td>', items.cp, '</td>',
						'</tr>'
					].join('');
					list1.append(html1);
				});
				
				var html2 = [
					'<tr>',
					'<td>', data.out[0].bmtid, '</td>',
					'<td>', data.out[0].yugocode, '</td>',
					'<td>', data.out[0].cp, '</td>',
					'<td>', data.out[0].startpoi, '</td>',
					'<td>', data.out[0].endpoi, '</td>',
					'</tr>'
				].join('');
				list2.append(html2);
				
				//image.attr('src', data.out[0].yugo_img_filenm);
				/**
				* img test 용도 (추후 지워야 함)
				*/
				image.attr('src', 'http://uw.iptime.org:4322/bmt/yugo/list/img/171221-01_user01_yugo_01.jpg');
				
				etc1.text(data.out[0].yugotime);
				etc2.text(data.out[0].yugolat + '/' + data.out[0].yugolong);
				etc3.text(data.out[0].yugoinfo);
				
			}
			, error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		})
    }
    
    var gbl_data = '';
    
    /**
    * 특정 값 선택시 tbl-specific-info/specific-image/tbl-specific-etc 값 변환
    */
    selectSpecific = function(index) {
     	var select_index = index;
    	var list = $('#tbl-specific-info').children('tbody');
    	var image = $('#specific-image');
    	var etc1 = $('#tbl-specific-etc1'); 
		var etc2 = $('#tbl-specific-etc2'); 
		var etc3 = $('#tbl-specific-etc3');
		
		list.empty();
		image.attr('src', '');
		etc1.empty();
		etc2.empty();
		etc3.empty();
		
		var html = [
			'<tr>',
			'<td>', gbl_data[select_index].bmtid, '</td>',
			'<td>', gbl_data[select_index].yugocode, '</td>',
			'<td>', gbl_data[select_index].cp, '</td>',
			'<td>', gbl_data[select_index].startpoi, '</td>',
			'<td>', gbl_data[select_index].endpoi, '</td>',
			'</tr>'
		].join('');
		list.append(html);
		
		//image.attr('src', gbl_data[select_index].yugo_img_filenm);
		/**
		* img test 용도 (추후 지워야 함)
		*/
		image.attr('src', 'http://uw.iptime.org:4322/bmt/yugo/list/img/171221-01_user01_yugo_01.jpg');
		
		etc1.text(gbl_data[select_index].yugotime);
		etc2.text(gbl_data[select_index].yugolat + '/' + gbl_data[select_index].yugolong);
		etc3.text(gbl_data[select_index].yugoinfo);
     	
    }
    
    /**
    * 검색된 값이 없는 경우
    */
    notFoundResult = function() {
    	$('#tbl-specific-list').children('tbody').append('<tr><td colspan="3">검색된 값이 없습니다</tr>');
    	$('#tbl-specific-info').children('tbody').append('<tr><td colspan="5">검색된 값이 없습니다</tr>');					
		$('#tbl-specific-etc1').text('검색된 값이 없습니다');
		$('#tbl-specific-etc2').text('검색된 값이 없습니다');
		$('#tbl-specific-etc3').text('검색된 값이 없습니다');
		return false;
    };
    
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