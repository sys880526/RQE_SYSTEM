<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="search">
	<form id="search-bmt">
		<div class="row" style="margin-bottom: 20px">
			<span class="pd">시작 날짜</span> <input type="text" class="text date"
				id="bmt-start-date" name="bmt-start-date" /> <span class="pd">~</span>
			<span class="pd">종료 날짜</span> <input type="text" class="text date"
				id="bmt-end-date" name="bmt-end-date" /> <a
				href="/" class="btnSearch"> <img
				src="../images/board/btn_search.gif" alt="search" />
			</a> &nbsp; &nbsp; <input type="checkbox" name="all" value="all"> 전체선택
		</div>
		<div class="row">
			<div class="day"
				style="padding: 0px 3px 0px 10px; display: inline-block; vertical-align: top;">
				<span style="display: table;">요일특성</span> <br> <label
					style="display: table; margin-bottom: 47px;"> <input
					type="checkbox" id="weekday" name="weekday" value="weekday">주중
				</label> <label> <input type="checkbox" id="weekend" name="weekend"
					value="weekend">주말
				</label>
			</div>
			<div class="timecheck"
				style="padding: 0px 0px 0px 100px; display: inline-block; vertical-align: top;">
				<span style="display: table; padding: 0px 0px 10px 0px;">시간대특성</span>
				<div class="row timecheck">
					<div style="display: inline-block;">
						<label style="display: table; margin-bottom: 7px;"> <input
							type="checkbox" id="am_peak" name="am_peak" value="am_peak"
							class="weekday" disabled>오전 첨두
						</label> <label style="display: table; margin-bottom: 28px;"> <input
							type="checkbox" id="pm_peak" name="pm_peak" value="pm_peak"
							class="weekday" disabled>오후 첨두
						</label> <label> <input type="checkbox" id="am" name="am"
							value="am" class="weekend" disabled>오전
						</label>
					</div>
					<div style="padding: 0px 100px 0px 20px; display: inline-block;">
						<label style="display: table; margin-bottom: 7px;"> <input
							type="checkbox" id="am_non_peak" name="am_non_peak"
							value="am_non_peak" class="weekday" disabled>오전 비첨두
						</label> <label style="display: table; margin-bottom: 28px;"> <input
							type="checkbox" id="pm_non_peak" name="pm_non_peak"
							value="pm_non_peak" class="weekday" disabled> 오후 비첨두
						</label> <label> <input type="checkbox" id="pm" name="pm"
							value="pm" class="weekend" disabled>오후
						</label>
					</div>
				</div>
			</div>
			<div class="distance"
				style="display: inline-block; vertical-align: top;">
				<span style="display: table; padding: 0px 0px 10px 0px;">거리특성</span>
				<label style="display: table; margin-bottom: 7px;"> <input
					type="checkbox" id="shortest_distance" name="shortest_distance"
					value="shortest_distance" disabled> 초 단거리(0 ~ 5km)
				</label> <label style="display: table; margin-bottom: 7px;"> <input
					type="checkbox" id="short_distance" name="short_distance"
					value="short_distance" disabled> 단거리(5 ~ 10km)
				</label> <label style="display: table; margin-bottom: 7px;"> <input
					type="checkbox" id="medium_distance" name="medium_distance"
					value="medium_distance" disabled> 중거리(10 ~ 30km)
				</label> <label style="display: table; margin-bottom: 7px;"> <input
					type="checkbox" id="long_distance" name="long_distance"
					value="long_distance" disabled> 장거리(30 ~ 50km)
				</label> <label style="display: table; margin-bottom: 7px;"> <input
					type="checkbox" id="longest_distance" name="longest_distance"
					value="longest_distance" disabled> 초 장거리(50 ~ km)
				</label>
			</div>
		</div>
	</form>
</div>
<script>
	$(document).ready(function() {
		/**
		* 초기 date 설정
		*/
		setDate();
		
		// 전체선택
		$('input[name=all]').on('change', function(){
	       var checked = $(this).is(':checked');
	       var items = $('.row input[type=checkbox]').not('input[name=all]');
	       items.prop('checked', checked);
	       items.prop('disabled', !checked);
	       if (!checked) {
	    		// checked가 false일때   
				$('#weekday').prop('disabled', checked);
				$('#weekend').prop('disabled', checked);
			}
	   });
		
		// 주중, 주말 선택할 경우
		$('#weekday, #weekend').on('change', function() {
			var checked = $(this).is(':checked');
			var value = $(this).val();
			var items = $('.'.concat(value));
			allcheck();
			items.prop('disabled', !checked);
			if (!checked) {
				// checked == false
				items.prop('checked', checked);
			}
			distanceCheck();
		});
		
		// 시간특성 선택할 경우
		$('.weekday, .weekend').on('change', function() {
			distanceCheck();
		});
		
		// 거리특성 선택할 경우
		$('.distance').on('change', function() {
			allcheck();
		});
	});

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
		allcheck();
	    items.prop('disabled', (cnt>0) ? false : true);
		if (cnt <= 0) {
			items.prop('checked', false);
		}
	};
	
	// 전체버튼 선택해제
	function allcheck() {
		var cnt1 = $('.row input[type=checkbox]').not('input[name=all]').length;
	    var cnt2 = $('.row input[type=checkbox]:checked').not('input[name=all]').length;
	    $('input[name=all]').prop('checked', (cnt2 < cnt1) ? false : true);
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