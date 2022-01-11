<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />
<link href='lib/main.css' rel='stylesheet' />
<script src='lib/main.js'></script>
<script src='lib/locales-all.js'></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {

		/*
			fullCalendar 사용
			https://velog.io/@devyang97/FullCalendar-v4-%EC%98%B5%EC%85%98-%EB%B0%8F-%EC%82%AC%EC%9A%A9%EB%B2%95-%EC%A0%95%EB%A6%AC
			
		 */
		var date = new Date();
		var year = date.getFullYear();
		var month = new String(date.getMonth() + 1);
		var day = new String(date.getDate());
		var nowdate = "";
		// 한자리수일 경우 0을 채워준다. 
		if (month.length == 1) {
			month = "0" + month;
		}
		if (day.length == 1) {
			day = "0" + day;
		}
		nowdate = year + "-" + month + "-" + day;

		var initialLocaleCode = 'ko';
		var localeSelectorEl = document.getElementById('locale-selector');
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'title',//today
				center : '',
				right : 'prev,next'
			},
			height : 'parent',
			contentHeight : 'auto',
			initialDate : nowdate,
			locale : initialLocaleCode,
			buttonIcons : false, // show the prev/next text
			weekNumbers : false,
			navLinks : false, // can click day/week names to navigate views
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			selectable : true,
			selectMirror : false,
			events : [
			/* 스케줄에 입력 될 내용  */
			{
				title : 'All Day Event',
				start : nowdate,
				id : 1,
				backgroundColor : 'red',
				color : "#FF0000",
				textColor : "#FFFF00"
			}, {
				title : '12312312312 Long Event',
				start : '2020-10-21',
				end : '2020-10-21',
				id : 2,
				backgroundColor : 'orange'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-09-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-09-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2020-11-11',
				end : '2020-11-13'
			}, {
				title : 'Meeting',
				start : '2020-11-12T10:30:00',
				end : '2020-11-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2020-11-18T12:00:00'
			}, {
				title : 'Meeting',
				start : '2020-11-22T14:30:00'
			}, {
				title : 'Happy Hour',
				start : '2020-11-14T17:30:00',

			}, {
				title : 'Dinner',
				start : '2020-11-09T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2020-09-13T07:00:00'
			} ],
			eventClick : function(info) {
				wrapWindowByMask();
				return false;
			},
			eventAfterRender : function(event, element, view) {
				var activityColors = [ "red", "yellow", "green", "blue" ];
				element.children().css({
					"background-color" : "red"
				})
				for (x = 0; x < activityColors[0].length; x++) {
					if (event.id == activityColors[0][x]) {

					}
				}

			}
		});

		calendar.render();

		// when the selected option changes, dynamically change the calendar option
		localeSelectorEl.addEventListener('change', function() {
			if (this.value) {
				calendar.setOption('locale', this.value);
			}
		});

	});
</script>
<style>
#calendar {
	font-size: 14px; max-width : 1100px;
	margin: 0px auto;
	padding: 20px 10px;
	max-width: 1100px;
}
</style>
<!-- Modal -->
<style> 
/* 마스크 뛰우기 */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window{
    display: none;
    position:absolute;  
    left:50%;
    top:50%;
    width:100%;
    max-width:80%;
    background-color:#FFF;
    z-index:10000;
    height:600px;
    transform: translate(-50%, -50%);
 }
 
</style>

<script type="text/javascript"> 
//<![CDATA[
    function wrapWindowByMask(){
 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
 
        //윈도우 같은 거 띄운다.
        $(".window").show();
 
    }
 
    $(document).ready(function(){
        //검은 막 띄우기
        $(".openMask").click(function(e){
         //   e.preventDefault();
            
        });
 
        //닫기 버튼을 눌렀을 때
        $(".window .close").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
          //  e.preventDefault();  
            $("#mask, .window").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask").click(function () {  
            $(this).hide();  
            $(".window").hide();  
 
        });      
 
    });
 
//]]>
</script>



<div class="bg-white" style="position:relative; overflow: hidden;">
	<div id="mask"></div>
	<div class="window">
	    <jsp:include page="carousel.jsp"></jsp:include>
	</div>
	
	<!-- Sub Page Heading -->
	<nav class="navbar bg_spogg_color">
		<!--back (Topbar) -->
		<button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3"
			onclick="history.back()">
			<i class="fas fa-arrow-left"></i>
		</button>
		<div class="subpage_title">스케줄</div>
	</nav>
	<div class="cora_cale  ">
		<div id='calendar'></div>
		<div class="cora_cale_add">
			<a href="javascript:void(0);"
				onclick="calendarId.addEvent(eventData);">+</a>
		</div>
	</div>
</div>
