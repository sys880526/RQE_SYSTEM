<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>통행 요금</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="../js/style.js"></script>

    <!-- chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
    
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
				<!-- .titContents -->
				<div class="titContents">
					<h2>경로 거리</h2>
					<p>
						Home > 상세데이터 >
						<strong>통행 요금</strong>
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
                                <a href="javascript:pathDistanceSearch()" class="btnSearch">
                                    <img src="../images/board/btn_search.gif" alt="search" />
                                </a>
                            </div>
                            <div class="row">
                                <div class="day" style="padding: 0px 3px 0px 10px;display: inline-block;vertical-align: top;">
                                    <span style="display : table;">요일특성</span>
                                    <br>
                                    <label style="display: table;margin-bottom: 7px;">
                                        <input type="checkbox" id="weekday" value="weekday"> 주중
                                    </label>
                                    <label>
                                        <input type="checkbox" id="weekend" value="weekend"> 주말
                                    </label>
                                </div>
                                <div class="timecheck" style="padding: 0px 0px 0px 100px;display: inline-block;vertical-align : top;">
                                    <span style="display : table;padding: 0px 0px 10px 0px;">시간대특성</span>
                                    <div class="row timecheck">
                                        <div style="display: inline-block;">
                                            <label style="display: table;margin-bottom: 7px;">
                                                <input type="checkbox" id="am_peak" name="am_peak" value="am_peak" class="weekday" disabled> 오전 첨두
                                            </label>
                                            <label style="display: table;margin-bottom: 7px;">
                                                <input type="checkbox" id="pm_peak" name="pm_peak" value="pm_peak" class="weekday" disabled> 오후 첨두
                                            </label>
                                            <label>
                                                <input type="checkbox" id="am" name="am" value="am" class="weekend" disabled> 오전
                                            </label>
                                        </div>
                                        <div style="padding: 0px 100px 0px 20px;display: inline-block;">
                                            <label style="display: table;margin-bottom: 7px;">
                                                <input type="checkbox" id="am_non_peak" name="am_non_peak" value="am_non_peak" class="weekday" disabled> 오전 비첨두
                                            </label>
                                            <label style="display: table;margin-bottom: 7px;">
                                                <input type="checkbox" id="pm_non_peak" name="pm_non_peak" value="pm_non_peak" class="weekday" disabled> 오후 비첨두
                                            </label>
                                            <label>
                                                <input type="checkbox" id="pm" name="pm" value="pm" class="weekend" disabled> 오후
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
                    <!-- .contents -->
                    <div class="row">
                        <div class="contents" style="display: inline-block">
                            <table class="table" id="totalDistance">
                                <thead>
                                <tr>
                                    <th colspan="4">총 통행 요금</th>
                                </tr>
                                <tr>
                                    <th>평가 대상</th>
                                    <th>총계(∑)</th>
                                    <th>차이(Δc)</th>
                                    <th>차이(Δc/cmin)</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                        <!-- Chart Area Start-->
                        <div style="display: inline-block; vertical-align: top; width: 55%">
                            <canvas id="ratio_distance_chart"></canvas>
                        </div>
                        <!-- Chart Area End-->
                    </div>
                    <div class="row">
                        <div class="content">
                            <!-- Chart Area Start-->
                            <div style="display: inline-block; vertical-align: top; width: 45%">
                                <canvas id="distanceSpecificityChart"></canvas>
                            </div>
                            <div style="display: inline-block; vertical-align: top; width: 45%">
                                <canvas id="timeSpecificityChart"></canvas>
                            </div>
                            <!-- Chart Area End-->
                        </div>
                    </div>
                    <!-- /.contents -->
                </div>
				<!-- \#contentArea -->
				</div>
			<!-- \.body clearFix -->
			</div>
	</div>

</body>
<script>

    $(document).ready(function() {
        // 초기 date 설정
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
    })

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

    function pathDistanceSearch() {


        var list = $('#totalDistance').children('tbody');

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

        $.fn.serializeObject = function()
        {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };

        var params = $('#search-bmt').serializeObject();

        $.ajax({
            url : '/detailsData/tollsChargeData'
            , type : 'GET'
            , dataType : 'json'
            , data : params
            , processData : true /*querySTring make false*/
            , success : function(data, status, xhr) {

                list.empty();

                if (data.list.length === 0) {
                    alert('검색된 값이 없습니다');
                    notFoundResult();
                };

                data.list.forEach(function(items) {
                    var html = [
                        '<tr>',
                        '<td>', items.cp, '</td>',
                        '<td>', items.sum_charge + '원', '</td>',
                        '<td>', items.sub_charge + '원', '</td>',
                        '<td>', items.ratio_charge + '%', '</td>',
                        '</tr>'
                    ].join('');
                    list.append(html);
                });

                //그래프 함수 호출
                ratioChargeChart(data.list);
                distanceSpecificity(data.chart);
                timeSpecificity(data.chart);

            }
            ,error : function(status, xhr, error) {
                alert("error");
                console.log(error);
            }
        });

    }

    function ratioChargeChart(dataList) {

        var ctx = document.getElementById("ratio_distance_chart");

        var cpName = [];
        var ratioCharge = [];
        if (dataList.length != 0){
            for (var i = 0; i < dataList.length; i++){
                cpName.push(dataList[i].cp);
                ratioCharge.push(dataList[i].sum_charge);
            }
        }

        var radarChart = new Chart(ctx, {
            type : 'radar',
            data : {
                labels : cpName,
                datasets : [{
                    label : '총 통행 요금(Δc/cmin, 단위 : 원)',
                    data : ratioCharge,
                    backgroundColor : 'transparent',
                    borderColor : 'rgba(0,0,255,0.3)'
                }]
            }
        });

    }

    function distanceSpecificity(dis) {

        var ctx = document.getElementById("distanceSpecificityChart");
        var cpName = [];
        var shortest_distance = [];
        var short_distance = [];
        var medium_distance = [];
        var long_distance = [];
        var longest_distance = [];

        if (dis.length != 0){
            for (var i = 0; i < dis.length; i++){
                cpName.push(dis[i].cp);
                shortest_distance.push(dis[i].shortest_distance);
                short_distance.push(dis[i].short_distance);
                medium_distance.push(dis[i].medium_distance);
                long_distance.push(dis[i].long_distance);
                longest_distance.push(dis[i].longest_distance);
            }
        }

        var distanceChart = new Chart(ctx, {
            type : 'line',
            data : {
                labels : cpName,
                datasets : [
                    {
                        label : '초단거리',
                        data : shortest_distance,
                        borderColor : 'rgba(255, 0, 0, 1)',
                        backgroundColor: 'transparent'
                    },
                    {
                        label : '단거리',
                        data : short_distance,
                        borderColor : 'rgba(0, 125, 0, 1)',
                        backgroundColor : 'transparent'
                    },
                    {
                        label : '중거리',
                        data : medium_distance,
                        borderColor : 'rgba(0, 0, 0, 1)',
                        backgroundColor : 'transparent'
                    },
                    {
                        label : '장거리',
                        data : long_distance,
                        borderColor : 'rgba(0, 0, 125, 1)',
                        backgroundColor : 'transparent'
                    },
                    {
                        label : '초장거리',
                        data : longest_distance,
                        borderColor : 'rgba(0, 0, 255, 1)',
                        backgroundColor : 'transparent'
                    }
                ]
            },
            options: {
                elements: {
                    line: {
                        tension: 0
                    }
                }
            }
        });
    }

    function timeSpecificity(time) {

        var ctx = document.getElementById("timeSpecificityChart");
        var cpName = [];
        var am_peak = [];
        var am_non_peak = [];
        var am = [];
        var pm_peak = [];
        var pm_non_peak = [];
        var pm = [];

        if (time.length != 0){
            for (var i = 0; i < time.length; i++){
                cpName.push(time[i].cp);
                am_peak.push(time[i].am_peak);
                am_non_peak.push(time[i].am_non_peak);
                am.push(time[i].am);
                pm_peak.push(time[i].pm_peak);
                pm_non_peak.push(time[i].pm_non_peak);
                pm.push(time[i].pm);
            }
        }

        var timeChart = new Chart(ctx, {
            type : 'line',
            data : {
                labels : cpName,
                datasets : [
                    {
                        label : '오전 첨두',
                        data : am_peak,
                        borderColor : 'rgba(255, 0, 0, 1)',
                        backgroundColor : 'transparent'
                    },
                    {
                        label : '오전 비첨두',
                        data : am_non_peak,
                        borderColor : 'rgba(0, 125, 0, 1)',
                        backgroundColor : 'transparent'
                    },
                    {
                        label : '오후 첨두',
                        data : pm_peak,
                        borderColor : 'rgba(0, 0, 255, 1)',
                        backgroundColor : 'transparent'
                    },
                    {
                        label : '오후 비첨두',
                        data : pm_non_peak,
                        borderColor : 'rgba(0, 0, 125, 1)',
                        backgroundColor : 'transparent'
                    },
                    {
                        label : '오전',
                        data : am,
                        borderColor : 'rgba(0, 0, 0, 1)',
                        backgroundColor : 'transparent'
                    },
                    {
                        label : '오후',
                        data : pm,
                        borderColor : 'rgba(173, 115, 209, 1)',
                        backgroundColor : 'transparent'
                    }
                ]
            },
            options: {
                elements: {
                    line: {
                        tension: 0
                    }
                }
            }
        });
    }


</script>
</html>