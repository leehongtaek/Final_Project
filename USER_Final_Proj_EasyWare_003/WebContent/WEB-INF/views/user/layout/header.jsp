<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="org.springframework.security.core.GrantedAuthority"%>
<%@page import="java.util.List"%>
<%@page import="com.easyware.common.security.Member_Vo_Security"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- sockjs -->
<script type="text/javascript" src="<c:url value='/resources/plugin/sockjs-client/dist/sockjs-0.3.4.min.js'/>" ></script>
  
<script type="text/javascript"> //wsoket alram
var alram_wsocket;
function alarm_connect() {
	alram_wsocket = new SockJS(
			"<c:url value='/ws/chat.sockjs'/>");
	alram_wsocket.onopen = alram_Open;
	alram_wsocket.onmessage = alram_Message;
	alram_wsocket.onclose = alram_Close;
	
}

function alram_Message(evt) {   
	var data = evt.data;
	console.log("alram_Message::::::::::::::"+ evt.data);
	alram_appendMessage(data);
}   

function alram_Open(evt) {
	console.log("알람서버와 연결되었습니다.");
}
function alram_Close(evt) {
	console.log("알람서버와 연결끊어졌습니다.");
}

function alram_Send(data) {
	var msg_stype = data.split("/");
	if( (($("#board_code").val()==9)&&(msg_stype[0]=='notice'))||(msg_stype[0]!='notice')){
		console.log("send:::::::"+data  );
		alram_wsocket.send(data);
	}
}
	 
function alram_appendMessage(msg) {
	// var dept_info = $("#sns_info").val();
	var now = new Date(); // 현재시간                                                 
    var nowTime = now.getHours() + "시" + now.getMinutes() + "분" + now.getSeconds() + "초";
	
	var task_info = $("#session_memcode").val();      
	console.log("mem_code:::::::"+task_info);
	var msg_type = msg.split("/");
	if((msg_type[0]=='task')&&(msg_type[1]==task_info)){
		// var msgs = msg_type[3];
		console.log(msg_type[3])
		var msgs = ["새로운 업무가 추가되었습니다.", "업무가 승인 받았습니다."];
		$("#alarm_box").prepend(
				'<li class="alarm_card">'
					+'<a href="<c:url value='/task/assignee_list' />" >' 
					+nowTime+':'+msgs[msg_type[3]]+'</a>'  
				+'</li>'       
		);
		$('#alram_glyphicon').css('color', 'yellow');
		setTimeout(function() {  $('#alram_glyphicon').css('color', 'white'); }, 500);
		notification_show(msg_type[0],msgs[msg_type[3]]); 
		//notification_show();
		alram_playBeep(); 
	}else if((msg_type[0]=='notice')){
			$("#alarm_box").prepend(
					'<li class="alarm_card_red">'
						+'<a href="<c:url value="/board/board_L_list?board_code=9" />" >' /* '<strong>'
							+'알림:'
						+'</strong>' */
						+nowTime+':새로운 공지가 추가되었습니다 </a>'  
					+'</li>'       
			);
			$('#alram_glyphicon').css('color', 'red');
			setTimeout(function() {  $('#alram_glyphicon').css('color', 'white'); }, 500);
			alram_playBeep(); 
		
	}else if((msg_type[0]=='report')&&(msg_type[1]==task_info)){
		var scope = msg_type[3];
		var reportLocation = ['/report/report_appr_list', '/report/report_workflow_list/4']; 
		
		$("#alarm_box").prepend(
				'<li class="alarm_card_red">'
					+'<a href="<c:url value="'+reportLocation[scope]+'" />" >' /* '<strong>'
						+'알림:'
					+'</strong>' */ 
					+nowTime+'report-'+msg_type[2]+'</a>'   
				+'</li>'       
		);
		$('#alram_glyphicon').css('color', 'red');
		notification_show(msg_type[0],msg_type[2]);  
		setTimeout(function() {  $('#alram_glyphicon').css('color', 'white'); }, 500);
		alram_playBeep(); 
	
}
	
	
}

function alram_playBeep() {
	 var beep = new Audio("<c:url value='/resources/sound/10182_1367780534.mp3'/>");
	 beep.play();
};

window.onload=alarm_connect();
</script>


<script type="text/javascript"> // notification
  
$(function() {
	notification_Check();
});

var Notification = window.Notification || window.mozNotification || window.webkitNotification;
function notification_Check() {
	Notification.requestPermission(function (permission) {
		if('granted'=== permission){
			
		}else if ('denied' === permisson){
			Alert("허용하지 않으시면 알람을 못받습니다.");
		}
		
		console.log(permission);
	});	
}


function notification_show(msgType,msg) {
	var now = new Date(); // 현재시간                                                 
    var nowTime = now.getHours() + "시" + now.getMinutes() + "분" + now.getSeconds() + "초";
	
	var message = msg;
	var options = {
            body: message,         
           /*  icon: <c:url value='/resources/img/favicon.ico'/> */
        }
       
        //데스크탑 알림 요청
    var notification = new Notification(msgType+"::"+nowTime, options);
        //알림 후 5초 뒤,
    setTimeout(function () {
            //얼람 메시지 닫기
	notification.close();
	}, 5000);
}
</script>
<style>
.alarm_card a:HOVER{
	text-decoration: none;
}
.alarm_card a{
	color: white;
}
.alarm_card_red a{
	color: white;
}
.alarm_card{
		text-align:center;
		width: 100%;
	    overflow: auto;
	    padding: 4px;
	    position: relative;
	    z-index: 10;
		background: #10CE32;
		margin-bottom: 7px;
		font-size: 12px;
		}
.alarm_card_red{
		text-align:center;
		width: 100%;
	    overflow: auto;
	    padding: 4px;
	    position: relative;
	    z-index: 10;
		background: #10CE32;
		margin-bottom: 7px;
		font-size: 12px;
		
		}
.alarm_card a{color: white;}		
.alram_wrapper{

			height: 300px;
			background: white;
			margin:auto;
			width: 100%;
			overflow-y: auto;
		    overflow-x: hidden;
		         
		   }	
.alarm_bar{
			height: 30px;
			border-radius:30px;
			background: #005880;
			margin:auto;
			max-width: 250px;
			overflow-y: hidden;
		    overflow-x: hidden;
		    
		   }	
.dropdown-toggle{
cursor: pointer;
}
</style>
<script>
$(function(){

	
	$.ajax({
		type : "GET",
		url : "<c:url value='/user/deptInfo.json' />",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
		
			$.each(resultData, function(index, value) {
				var dept_num=$("#session_deptnum").val();
				if(value.DEPT_NUM==parseInt(dept_num,10)){ 
					$('#span_dept_name').html(value.DEPT_NAME); 
				}  
				
			});

		}

	});
	
}); 		

</script>
<script>
$(function(){

	
	$.ajax({
		type : "GET",
		url : "<c:url value='/user/positInfo.json' />",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
		      
			$.each(resultData, function(index, value) {
				var posit_num=$("#session_positnum").val(); 
				if(value.POSIT_NUM==parseInt(posit_num,10)){ 
				   $('#span_posit_name').html(value.POSIT_NAME); 
				}
				
			});

		}

	});
	
}); 		

</script>

<div class="bs-component">
	<nav class="navbar navbar-inverse navbar-fixed-top" style="box-shadow:0 0px 0px rgba(0, 0, 0, 0);height: 65px;">
		<input id="session_memcode" type="hidden" value="${sessionScope.mem_code}">
		<input id="session_positnum" type="hidden" value="${sessionScope.posit_num}">
		<input id="session_deptnum" type="hidden" value="${sessionScope.dept_num}">
		
		<!-- /navbar-header Start --> 
		<div class="navbar-header">
			<!-- Top Menu Category : Service Name = Home --> 
			<img style="cursor:pointer; ; padding: 5px 15px; height:65px;line-height: inherit; " class="navbar-brand" 
				onclick="javacript:location='<c:url value="/"/>'" 	
			src="<c:url value="/resources/img/white_clear.png"/>"/>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>							
							<span class="icon-bar"></span>
				</button>
		</div>
		<!-- /navbar-header END -->
			
		<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<!-- Top Menu Category : Home -->
					<li><a href="#" data-toggle="dropdown" class="dropdown-toggle">
						<span class="glyphicon glyphicon-user">
						</span>
						사원코드 : <c:out value="${sessionScope.mem_code}"/> ,
						 직급: <span id="span_posit_name"></span>,
						 부서: <span id="span_dept_name"></span>,
						 <c:out value="${sessionScope.mem_name}" /> 님 </a>
					</li>				
				</ul>
				
				   
				   
				<ul class="nav navbar-nav navbar-right" style=" margin-right: 15px;">
					<li style="text-align: center;">
						<a style="padding-right: 3px;">
							<span id="alram_glyphicon" class="glyphicon glyphicon glyphicon-bell"></span>Alarm
						</a>
					
					<!-- <a data-toggle="dropdown" class="dropdown-toggle">
					<span id="alram_glyphicon" class="glyphicon glyphicon glyphicon-bell"></span>Alarm
					</a> -->
					<!-- 
						<ul class="dropdown-menu dropdown-messages" style="border-radius: 0px;padding: 0px 0;"> 
							<li class="alram_wrapper" style="height: 100px; width: 200px; float: right;" > 
								<ul id="alarm_box" style="padding: 0px;">
								  		
								</ul>   
							</li>
						</ul>  -->
					</li>
					<li style="padding-top : 18px;padding-left: 0px;">
						<ul class="alarm_bar"style="padding: 0px; margin: 0px;">
							<li style="height: 100%;">
								<ul  id="alarm_box" style="padding: 0px;">
									
								</ul>
							</li>   
						</ul>
					</li>
					
					<li><a href="#" data-toggle="dropdown" class="dropdown-toggle" style="width: 100px;">
						<span class="glyphicon glyphicon-user">
						</span>MYPAGE	 </a>
						<ul class="dropdown-menu dropdown-menu-right" style="width: 100px;min-width: 110px; ">
							<li style="width: 110px;">
								<a style="width: 110px;" href="<c:url value='/profile'/>">
									<span id="alram_glyphicon" class="glyphicon glyphicon glyphicon-user"></span>
									Profile
								</a>
							</li>
							<li style="width: 100px;"><a style="width: 100px;" href="<c:url value='/setting'/>">
								<span id="alram_glyphicon" class="glyphicon glyphicon-cog"></span>
								Settings
								</a>
							</li>
						</ul> <!-- Dropdown menu End-->
					</li>
					<li><a href="<c:url value='/logout'/>"><span class="glyphicon glyphicon-log-in"></span> Log-Out</a></li>
					</ul> <!-- Dropdown menu End-->
				</ul>
		
								
		</div>
	</nav>

</div>



	   
<hr>
        
       
