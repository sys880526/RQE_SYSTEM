<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>BMT LIST 이력 조회</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="../js/style.js"></script>
    
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../css/modal.css" />
    <link rel="stylesheet" type="text/css" href="../css/import.css" />
    <link rel="stylesheet" type="text/css" href="../css/board.css" />
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/layout.css" />
    <link rel="stylesheet" type="text/css" href="../css/login.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
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
			<jsp:include page="/WEB-INF/views/layouts/bmtListRegistraion_subMenu.jsp"/>
			<!-- \#snbArea -->
			<!-- #contentArea -->
			<div id="contentsArea">
				<!-- .titContents -->
				<div class="titContents">
					<h2>BMT LIST 이력 조회</h2>
					<p>
						BMT LIST 사전 등록 > 
						<strong>BMT LIST 이력 조회</strong>
					</p>
				</div>
				<!-- \.titContents -->
				<!-- .contents -->
                <div class="contents" width=100%>
                    <!-- .search -->
                    <!--
                        board.css : box-sizing: content-box 추가
                    -->
                    <div class="search">
                        <form id="search-bmt">
                            <span class="pd">시작 날짜</span>
                            <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" />
                            <span class="pd">~</span>
                            <span class="pd">종료 날짜</span>
                            <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" />
                            <a href="javascript:getList()" class="btnSearch">
                                <img src="../images/board/btn_search.gif" alt="search" />
                            </a>
                           	
                            <a href="#" class="btnNewReg" id="btnNewReg" style="float : right;">
                                <img src="../images/board/btn_regist_2.gif" alt="newReg" />
                            </a>
                           	
                            
                        </form>
                    </div>
                    <!-- /.search -->
                    <div>
                        <table id="tbl-data-sheet" class="boardListStyle" cellspacing="0" width="100%" border="0">
                          	<colcolgroup>
                          		<col width="10%">
                          		<col width="12%">
                          		<col width="*">
                          		<col width="*">
                          		<col width="12%">
                          	</colcolgroup>
                           	<thead>
                                <tr>
                                    <th>BMT ID</th>
                                    <th>정상주행 cp 수 / 총 cp 수</th>
                                    <th>출발지명</th>
                                    <th>도착지명</th>
                                    <th>신규 리스트 반영 선택</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <!-- /.contents -->
			</div>
			<!-- \#contentArea -->
			
			<!-- The Modal -->
			<div id="modal-data-detail" class="modal" >
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<span class="close">&times;</span>
						<span class="tooltiptext">닫기</span>
					</div>
					<div class="modal-body">
						<input type="text" class="text date" id="bmt-date" name="bmt-date" />
						<table id="tbl-modal-data1" style="margin-bottom: 10px">
							<colcolgroup>
                          		<col width="10%">
                          		<col width="*">
                          		<col width="*">
                          	</colcolgroup>
							<thead>
								<th>순번</th>
								<th>출발지명</th>
								<th>도착지명</th>
							</thead>
		                    <tbody>
		                    </tbody>
						</table>
					</div>
					<div class="modal-footer">
						<a href="javascript:#" class="btnNewBmtSave" id="btnNewBmtSave" style="float : right;">
	               	        <img src="../images/board/btn_regist_2.gif" alt="btnNewBmtSave" />
	                    </a>
                    </div>
				</div>
				<!-- \Modal content -->
			</div>
			<!-- \The Modal -->		
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
		
		/**
		* bmtListRegistration list 값 불러오기
		*/
		getList();
		
		/**
		* bmtListRegistration 상세보기
		*/
		$('#btnNewReg').on('click', function() {
			if($("input:checkbox[name=bmtid]:checked").length == 0) {
				alert("신규 리스트에 반영할 bmt 를 선택해주세요.")
				return false;
			}
			var indexArray = [];
		    $("input:checkbox[name=bmtid]:checked").map(function(){
				  indexArray.push($(this).val());
		  	});
			var list = $('#tbl-modal-data1 > tbody');
			list.empty();
			saveDataSize = indexArray.length;
			indexArray.forEach(function(items, index, array) {					
				var html = [
					'<tr >',
					'<td><input type="text" id="bmt_'+index+'" style="width: 20px;"/></td>',
// 					'<td><input type="text" id="bmt_startpoi_'+index+'" value="'+dataList[items].startpoi+'" readonly/></td>',
// 					'<td><input type="text" id="bmt_endpoi_'+index+'" value="'+dataList[items].endpoi+'" readonly/></td>',
					'<td><span id="bmt_startpoi_'+index+'">'+dataList[items].startpoi+'</span></td>',
					'<td><span id="bmt_endpoi_'+index+'">'+dataList[items].endpoi+'</span></td>',
					'</tr>'
				].join('');
				list.append(html);
			});//forEach
			$("#modal-data-detail").show();
		});
		
		$('#btnNewBmtSave').on('click', function() {
			var saveData = [];
			var checkBmtIndex = [];
			for(var i=0; i < saveDataSize; i++){
				if($("#bmt_"+i).val() == null || $("#bmt_"+i).val() == '') {
					alert("순번 정보가 전부 입력되어야 합니다.");
					return false;
				}
				
				for(var chkBmt = 0; chkBmt < checkBmtIndex.length; chkBmt++){
					if(checkBmtIndex[chkBmt] == $("#bmt_"+i).val()){
						alert("동일 한 순번을 지정할수 없습니다. 순번 " + $("#bmt_"+i).val() + " 값을 수정 하시기 바랍니다.");
						return false;
					}
				}
				checkBmtIndex.push($("#bmt_"+i).val());
				
				var formatDate = new Date($("#bmt-date").val());
				
				saveData.push({
					bmtid : formatDate.format("yyMMdd") + "-" + pad($("#bmt_"+i).val(),2)
					, startpoi : $("#bmt_startpoi_"+i).html()
					, endpoi : $("#bmt_endpoi_"+i).html()
					, userid : 'admin01'
					
				});
			}
			
			console.log(saveData);
			
			$.ajax({
				url : '/bmtListRegistration/saveNewBmtList'
		        , type : 'post'
				, dataType : 'json'
	 			, data : JSON.stringify(saveData)
				, contentType : 'application/json; charset=UTF-8'
				, success : function(data, stat, xhr) {
					if(data.code == 0) {
						alert("신규 리스트를 등록하였습니다.");
						$('#modal-data-detail').css({ 'display': "none" });
					}else if (data.code == 1) {	// 동일한 키값의 데이터가 존재할때
						alert($("#bmt-date").val() + " 날짜에 bmt 순번이 겹치는 데이터가 데이터 베이스에 존재합니다.");
					} else if(data.code == 2) {	// 데이터베이스에 저장할 때 오류가 발생한 경우 (아마 디비쪽 문제일때)
						alert("데이터 베이스 입력 오류입니다. 관리자에게 문의 바랍니다.");
					}
				}
			    , error : function(xhr, stat, err) {
			    	alert("error");
			    	console.log("xhr" + xhr);
			    	console.log("stat" + stat);
			    	console.log("err" + err);
			    }
			});
			
		});
		
		/**
		* When the user clicks on <span> (x), close the modal
		*/
        $('.close').on('click', function() {
        	$('#modal-data-detail').css({ 'display': "none" });
        }); 
		
		/**
		* When the user clicks anywhere outside of the modal, close it
		*/
//         window.onclick = function (event) {
// 			var modal = $('#modal-data-detail')[0];
//             if (event.target == modal) {
//                 modal.style.display = "none";
//             }
//         }
		
	});
	
	// 컨트롤러에서 전달받은 리스트 ( 화면에 출력되는 리스트 )
	var dataList = null;
	// 체크박스에서 선택된 리스트 크기
	var saveDataSize = 0;
	
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
	
	getList = function() {
		var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		var list = $('#tbl-data-sheet').children('tbody');
		if (start == null || start == '' || end == null || end == '') {
			return false;
		}
		var jsonStr = JSON.stringify($('#search-bmt').serialize());

		$.ajax({
			url : '/bmtListRegistration/getBmtHistoryList'
	        , type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				list.empty();
				dataList = data.list;
				if (data.list.length === 0) {				
					list.append('<tr><td colspan="5">검색된 값이 없습니다</tr>');					
					return;
				}				
				data.list.forEach(function(items, index, array) {					
					var html = [
						'<tr >',
						'<td>', items.bmtid , '</td>',
						'<td>', items.normal_count , '</td>',
						'<td>', items.startpoi , '</td>',
						'<td>', items.endpoi , '</td>',
						'<td><input type="checkbox" value = "', index ,'" name="bmtid"/></td>',
						'</tr>'
					].join('');
					list.append(html);
				});//forEach
					
			}
		    , error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		});
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
	
	// 숫자앞에 0 붙이는 펑션
	function pad(n, width) {
		  n = n + '';
		  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	
	Date.prototype.format = function (f) {

	    if (!this.valueOf()) return " ";
	    
	    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
	    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
	    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	    var d = this;

	    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear(); // 년 (4자리)
	            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
	            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
	            case "dd": return d.getDate().zf(2); // 일 (2자리)
	            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
	            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
	            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
	            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
	            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
	            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
	            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
	            default: return $1;
	        }
	    });
	};

	String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
	String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
	Number.prototype.zf = function (len) { return this.toString().zf(len); };
	
</script>
</html>
