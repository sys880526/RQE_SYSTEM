<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<!-- , target-densitydpi=device-dpi -->
<title>등록 이력 조회</title>
<!-- JS -->
	<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="../js/placeholder.js"></script>
	<script type="text/javascript" src="../js/common.js"></script>
	<script type="text/javascript" src="../js/ui.js"></script>
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
	<div id=wrap>
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
		<!-- \#header -->

		<!-- #subMenu -->
		<jsp:include
			page="/WEB-INF/views/layouts/bmtListRegistraion_subMenu.jsp" />
		<!-- \#subMenu -->

		<section id="contents" style="width: 95%;">
			<div class="tit-page">
				<span>등록 이력 조회</span>
				<ul class="path">
					<li>BMT LIST 등록</li>
					<li>등록 이력 조회</li>
				</ul>
				<!-- .path -->
			</div>
			<!-- .tit-page -->

			<div class="contents">
				<!-- .search -->
				<!--
	              board.css : box-sizing: content-box 추가
	          -->
				<div class="search">
					<form id="search-bmt">
						<span class="pd">시작 날짜</span> <input type="text" class="text date"
							id="bmt-date" name="bmt-date" /> <a href="javascript:getList()"
							class="btnSearch"> <img src="../images/board/btn_search.gif"
							alt="search" />
						</a> <a href="javascript:deleteNewList()" class="btnNewSave"
							id="btnNewSave" style="float: right;"> <img
							src="../images/board/btn_dele.gif" alt="newSave" />
						</a> <a href="javascript:saveNewList()" class="btnNewSave"
							id="btnNewSave" style="float: right;"> <img
							src="../images/board/btn_save.gif" alt="newSave" />
						</a>
					</form>
				</div>
				<!-- /.search -->

				<div>
					<a href="javascript:addNewList()" class=""
						btnAddNew"" id="btnAddNew" style="float: right;"> <img
						src="../images/board/btn_add.png" alt="addNew"
						style="width: 20px;" />
					</a> <a href="javascript:removeNewList()" class=""
						btnRemoveNew"" id="btnRemoveNew"
						style="float: right; width: 20px;"> <img
						src="../images/board/btn_remove.png" alt="removeNew"
						style="width: 20px;" />
					</a>
					<table id="tbl-data-sheet" class="boardListStyle" cellspacing="0"
						width="100%" border="0">
						<colcolgroup>
						<col width="5%">
						<col width="10%">
						<col width="*">
						<col width="*">
						</colcolgroup>
						<thead>
							<tr>
								<th></th>
								<th>BMT ID</th>
								<th>출발지명</th>
								<th>도착지명</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- /.contents -->
		</section>
		<!--  #container -->
		<footer>
			<p class="copyright">Copyright ⓒ 2018. WaveM Co. All rights
				reserved.</p>
		</footer>
	</div>
	<!-- wrap -->
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
		
	});
	
	// 컨트롤러에서 전달받은 리스트 ( 화면에 출력되는 리스트 )
	var dataList = null;
	// 체크박스에서 선택된 리스트 크기
	var saveDataSize = 0;
	var lastBmtIndex = 0;		// 넘겨 받은 데이터의 마지막 index 값을 저장한다.
	var addRemoveIndex = 0;		// 화면에서 추가 되거나 제외 된 리스트의 마지막 index 값을 저장
	
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
		$('#bmt-date').val(year + '-' + month + '-' + day);
	} 
	
	getList = function() {
		var date = $('#bmt-date').val();
		var list = $('#tbl-data-sheet').children('tbody');
		if (date == null || date == '') {
			return false;
		}
		var jsonStr = JSON.stringify($('#search-bmt').serialize());

		$.ajax({
			url : '/bmtListRegistration/getBmtNewList'
	        , type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				list.empty();
				dataList = data.list;
				if (data.list.length === 0) {				
					list.append('<tr><td colspan="4">검색된 값이 없습니다</tr>');					
					return;
				}			
				// 중간에 비어 있는 bmtID 를 찾기 위해 저장 되어잇는 bmtid 중 가장 마지막 bmtid 의 인덱스 값을 확인한다.
				var lastBmtId = data.list[data.list.length -1].bmtid;
				lastBmtIndex = lastBmtId.split('-')[1];
				addRemoveIndex = lastBmtIndex;
				
				var dataIndex = 0; //data list 의 index 값
				
				// 테이블에 입력될 tr 테그들을 저장할 값
				var html = '';
				
				// index 값이 01 부터시작하기 때문에 for 문도 1 부터 시작하기로 한다.
				for(var i = 0; i < lastBmtIndex; i++) {
					var dataListBmtId = data.list[dataIndex].bmtid;
					var dataListBmtIndex = dataListBmtId.split('-')[1];
					
					
					if(dataListBmtIndex == i + 1) {
						html += '<tr>';		
						html += '<td><input type="checkbox" name="chkBmtId" value="' + dataList[dataIndex].bmtid +'||'+dataList[dataIndex].userid+ '"/></td>';
						html += '<td><input type="text" id="bmtid_' + i + '" value = "' + dataList[dataIndex].bmtid + '" readonly/></td>'
						html += '<td><input type="text" id="startpoi_' + i + '" value = "' + dataList[dataIndex].startpoi + '" readonly/></td>'
						html += '<td><input type="text" id="endpoi_' + i + '" value = "' + dataList[dataIndex].endpoi + '" readonly/></td>'
						html += '<input type="hidden" id="bmtSaveFlag_'+i+'" value="Y" />';
						html += '</tr>';
						dataIndex++;		
					} else {
						html += '<tr>';		
						html += '<td></td>';
						html += '<td><input type="text" id="bmtid_' + i + '" value = "' + new Date(date).format('yyMMdd') + '-'+pad(i+1,2) + '" readonly/></td>'
						html += '<td><input type="text" id="startpoi_' + i + '" value = ""/></td>'
						html += '<td><input type="text" id="endpoi_' + i + '" value = ""/></td>'
						html += '<input type="hidden" id="bmtSaveFlag_'+i+'" value="N" />';
						html += '</tr>';		
					}
					
				}
				list.html(html);
				
					
			}
		    , error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		});
	}
	
	// 체크 박스에 선택된 데이터 삭제 하기
	deleteNewList = function(){
		var deleteArray = [];
		 $("input:checkbox[name=chkBmtId]:checked").map(function(){
			 deleteArray.push($(this).val());
	  	});
		 var deleteData = [];
		 for(var i = 0; i < deleteArray.length; i++){
			 deleteData.push({bmtid: deleteArray[i].split("||")[0]
			 				, userid : deleteArray[i].split("||")[1]	
			 });
		 }
		 
		 console.log(deleteData);
		 
		 $.ajax({
				url : '/bmtListRegistration/deleteBmtNewList'
		        , type : 'post'
				, dataType : 'json'
	 			, data : JSON.stringify(deleteData)
				, contentType : 'application/json; charset=UTF-8'
				, success : function(data, stat, xhr) {
					if(data.code == 0) {
						alert("삭제를 성공하였습니다.");
						getList();
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
		 
	}
	
	// 입력된 데이터 저장하기
	saveNewList = function(){
		// 저장할때는 각 항목의 값들이 모두 입력되었는지 확인한 후 저장한다.
		var saveData = [];
		for(var i = 0 ; i < addRemoveIndex; i++){
			if($("#bmtSaveFlag_"+i).val() == 'N'
					&& $("#startpoi_" + i).val() != null
					&& $("#startpoi_" + i).val() != ''
					&& $("#endpoi_" + i).val() != null
					&& $("#endpoi_" + i).val() != ''){
				saveData.push({bmtid : $("#bmtid_" + i).val()
								, startpoi : $("#startpoi_" + i).val()
								, endpoi : $("#endpoi_" + i).val()
								, userid : 'admin01'
				
				})
			}
		}
		
		$.ajax({
			url : '/bmtListRegistration/bmtNewListsInsert'
	        , type : 'post'
			, dataType : 'json'
 			, data : JSON.stringify(saveData)
			, contentType : 'application/json; charset=UTF-8'
			, success : function(data, stat, xhr) {
				if(data.code == 0) {
					alert("신규 리스트를 등록하였습니다.");
					getList();
				}else if (data.code == 1) {	// 동일한 키값의 데이터가 존재할때
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
		
		
	}
	
	// bmt 리스트 추가
	addNewList = function() {
		addRemoveIndex++;
		var date = $('#bmt-date').val();
		var html = '';
		
		html += '<tr>';
		html += '<td></td>';
		html += '<td><input type="text" id="bmtid_' + addRemoveIndex + '" value = "' + new Date(date).format('yyMMdd') + '-'+pad(addRemoveIndex,2) + '" readonly/></td>'
		html += '<td><input type="text" id="startpoi_' + addRemoveIndex + '" value = ""/></td>'
		html += '<td><input type="text" id="endpoi_' + addRemoveIndex + '" value = ""/></td>'
		html += '<input type="hidden" id="bmtSaveFlag_'+addRemoveIndex+'" value="N" />';
		html += '</tr>';
		
		$('#tbl-data-sheet > tbody').append(html);
	}
	
	// 추가 된 bmt 리스트 삭제( 기존에 저장 되어 있는 bmt 리스트 삭제는 막아야 한다. )
	removeNewList = function(){
		if(addRemoveIndex <= lastBmtIndex) {
			alert("저장 되어있는 신규 bmt 리스트는 체크 박스를 선택 후 삭제 버튼을 클릭하여 삭제가 가능합니다.")
			return false;
		} else {
			addRemoveIndex--;
			$('#tbl-data-sheet > tbody tr:last').remove();
		}
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
