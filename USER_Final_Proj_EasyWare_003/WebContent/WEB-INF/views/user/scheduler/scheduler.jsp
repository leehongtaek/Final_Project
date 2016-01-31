<%-- 
    작업 날짜 : 2015. 11. 16.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<!-- =====================bootstrap data============================= -->
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="<c:url value='/resources/plugin/sockjs-client/dist/sockjs-0.3.4.min.js'/>" ></script>
<title>PAGE - MENU [NAME] </title>

<script>//scheduler insert,check
function goUrl(url) {
	location = url;
}

 function playBeep_sns() {
	 var _beep = new Audio("<c:url value='/resources/sound/button-37.mp3'/>");
	 _beep.play();
 };
function scheduler_check(num) {
	$.ajax({
   	 type:"POST",
   	 url:"scheduler_check",
   	data:{sched_num:num},
	success:function(){ 
		/* $('#'+num).closest('tr').remove(); */
		$('#'+num).text('완료됨');
		$('#'+num).addClass('color_red');
	}
	});
	
}


var sched_recent=0;
function scheduler_insert() {
	var event = $('#sched_event').val();
	var content =$('#sched_content').val();
	var daystart_date = $('#sched_someday_date').val();
	var daystart_time=$('#sched_someday_time').val();
	var dayend_date = $('#sched_somedayend_date').val();
	var dayend_time=$('#sched_somedayend_time').val();
	
	if( (daystart_date != '')&&(event != '')&&(daystart_time != '') ){
	
		if(daystart_time!=null){
		}else{
			daystart_time ='';
			dayend_time ='';
		}
		console.log(daystart_date);
		$.ajax({
	   	 type:"POST",
	   	 url:"scheduler_insert.json",
	   	data:{
	   		sched_event:event,
	   		sched_content:content,
	   		sched_someday_date:daystart_date,
	   		sched_somedayend_date:dayend_date,
	   		sched_someday_time:daystart_time,
	   		sched_somedayend_time:dayend_time	
	   	},
		success:function(){ 
			$('#sched_event').val('');
			$('#sched_content').val('');
			$('#sched_someday_date').val('');
			$('#sched_someday_time').val('');
			$('#sched_somedayend_date').val('');
			$('#sched_somedayend_time').val('');
			tog();
			setTimeout(function(){scheduler_update();}, 1000);
		}
		});
	}else {
		alert('제목,시작 날짜,시작 시간은  필수 입력입니다');
	}
}
function scheduler_update(){
	$.ajax({
    	url:"/scheduler/scheduler_update.json",
    	dataType: "json",
    	success: function(list) {
            $.each(list,function(idx,dta) {
            	sched_recent=dta.sched_num;
            	$('#sched_table').prepend(
            			'<tr class="sched_card" >'+
        				'<td>'
        					+'<div>'
        					+'<p>'
							+'<a id="'+dta.sched_num+'" class="pull_right" onclick="scheduler_check('+dta.sched_num+')">완료</a>'
							+'제목:'+dta.sched_event+'</br>'
							+'시작 날짜:'+dta.sched_someday_date+'</br>'
							+'시작 시간:'+dta.sched_someday_time+'</br>'
							+'내용:'+'<br/>'
							+dta.sched_content
							+'</p>'
							+'</div>'
						+'</td>'
					+'</tr>'
				);	
            	
            });
    	  },
		error: function() {}
    });
	
}


</script>

<script>//sns first load
var arr=[];
var arr_log=[];
var num=0;
var num_log=0;
var recent=0;
var decent=0;

$(document).ready(function(){
	$.ajax({
    	url:"sns_firstupdate.json",
    	dataType: "json",
    	data:{"recent":recent},
    	success: function(list) {
    		//console.log("LOG "+list);
            $.each(list,function(idx,dta) {
            	//console.log(dta.sns_num);
            	recent = dta.sns_num;
            	if(decent == 0 ){
            		decent = dta.sns_num;
            	
            	}
            	arr.push({
            		sns_num:dta.sns_num,
            		w_num:dta.mem_code,
            		title:dta.sns_title,
            		writer:dta.mem_name,
            		dept:dta.dept_num,
            		content:dta.sns_content,
            		date:dta.sns_date,
            	});
            	
            	
            	
            	$('#timeline').prepend(
            			'<div class="card">'
	            			+'<div class="card_content">'
		            			+'<small class="pull_right">'
								+arr[num].date
								+'</small>'
	            				+'<strong>'
	            				+arr[num].writer
	            				+'</strong>'
	            				+'</br>'
	            				+arr[num].content
							+'</div>'	
						+'</div>'
				);	
            	
            	
            	num++;
            });
    	  },
		error: function() {
         
      }
    });
	
	
});
</script>
<script>//sns_update
	function update() {
		var content = $("#sns_content").val();	
		$.ajax({
        	url:"sns_insert.json",
        	dataType: "json",
        	data:{"sns_content":content},
        	success: function() {
        	}
		});
		
		/* setTimeout(function(){refresh();}, 500); */
	}
</script>

<script>//sns refresh,log 
function refresh() {
	if(recent!=0){
		$.ajax({
        	url:"sns_update.json",
        	dataType: "json",
        	data:{"recent":recent},
        	success: function(list) {
        		//console.log("LOG "+list);
                $.each(list,function(idx,dta) {
                	//console.log(dta.sns_num);
                	recent = dta.sns_num;
                	arr.push({
                		sns_num:dta.sns_num,
                		w_num:dta.mem_code,
                		title:dta.sns_title,
                		writer:dta.mem_name,
                		dept:dta.dept_num,
                		content:dta.sns_content,
                		date:dta.sns_date,
                	});
                	
                	$('#timeline').prepend(
                			'<div class="card">'
	            			+'<div class="card_content">'
		            			+'<small class="pull_right">'
								+arr[num].date
								+'</small>'
	            				+'<strong>'
	            				+arr[num].writer
	            				+'</strong>'
	            				+'</br>'
	            				+arr[num].content
							+'</div>'	
						+'</div>'
					);	
                	num++;
                	playBeep_sns();
                });
        	  },
			error: function() {
	         
	      }
        });
	}
}
	function log() {
			if(decent!=0){
				$.ajax({
		        	url:"sns_log.json",
		        	dataType: "json",
		        	data:{"decent":decent},
		        	success: function(list) {
		        		//console.log("LOG "+list);
		                $.each(list,function(idx,dta) {
		                	//console.log(dta.sns_num);
		                	decent = dta.sns_num;
		                	arr_log.push({
		                		sns_num:dta.sns_num,
		                		title:dta.sns_title,
		                		writer:dta.mem_name,
		                		dept:dta.dept_num,
		                		content:dta.sns_content,
		                		date:dta.sns_date,
		                	});            	
		                	$('#timeline').append(
		                			'<div class="card">'
			            			+'<div class="card_content">'
				            			+'<small class="pull_right">'
										+arr_log[num_log].date
										+'</small>'
			            				+'<strong>'
			            				+arr_log[num_log].writer
			            				+'</strong>'
			            				+'</br>'
			            				+arr_log[num_log].content
									+'</div>'	
								+'</div>'
							);	
		                	num_log++;
		                });
		        	  },
					error: function() {
			         
			      }
		        });
	}
}			
</script>

<script>//schedlue data
$(document).ready(function(){
	$.ajax({
    	url:"/scheduler/scheduler_event_30.json",
    	dataType: "json",
    	success: function(list) {
            $.each(list,function(idx,dta) {
            	var chk = dta.sched_check;
            	sched_recent=dta.sched_num;
            	var btn_type;
            	if (chk==0) {
            		btn_type='완료';
            	$('#sched_table').prepend(
            		'<tr class="sched_card" >'+
        				'<td>'
        					+'<div>'
        					+'<p>'
							+'<a id="'+dta.sched_num+'" class="pull_right" onclick="scheduler_check('+dta.sched_num+')">완료</a>'
							+'제목:'+dta.sched_event+'</br>'
							+'시작 날짜:'+dta.sched_someday_date+'</br>'
							+'시작 시간:'+dta.sched_someday_time+'</br>'
							+'내용:'+'<br/>'
							+dta.sched_content
							+'</p>'
							+'</div>'
						+'</td>'
					+'</tr>'
				);	
            	}else if (chk==1) {
            		$('#sched_table').prepend(
                    		'<tr class="sched_card">'+
                				'<td>'
                					+'<div>'
        							+'<a id="'+dta.sched_num+'" class="pull_right" onclick="scheduler_check('+dta.sched_num+')" style="color:red;">완료됨</a>'
        							+'제목:'+dta.sched_event+'</br>'
        							+'시작 날짜:'+dta.sched_someday_date+'</br>'
        							+'시작 시간:'+dta.sched_someday_time+'</br>'
        							+'내용:'
        							+dta.sched_content
        							+'</div>'
        						+'</td>'
        					+'</tr>'
        				);	
				}
            });
    	  },
		error: function() {}
    });
	
	
});
</script>

<script>//toggler
function tog() {
	if ($("#sched_list").is( ":hidden" ) ) {
		$( "#sched_list" ).show("slow");
		$("#add_form_btn").show("slow");
	}else {
	    $( "#sched_list" ).slideUp();
	    $("#add_form_btn").slideUp();
	    
	  }
	}
</script>

<script>//wsoket
var wsocket;
function connect() {
	wsocket = new SockJS(
			"<c:url value='/ws/chat.sockjs'/>");
	/* wsocket.onopen = onOpen; */
	wsocket.onmessage = onMessage;
	/* wsocket.onclose = onClose; */
}
$(document).ready(function(){
	$('#sns_sendBtn').click(function() { send(); });
});
function onMessage(evt) {
	var data = evt.data;
		appendMessage(data);
}
function appendMessage(msg) {
	var dept_info = $("#sns_info").val();
	var task_info = $("#task_info").val();
	var msg_type = msg.split("/");
	 if((msg_type[0]=='sns')&&(msg_type[2]==dept_info)){
		refresh();
	 }
}
function send() {
	var sns_info = $("#sns_info").val();
	update();
	setTimeout(function(){wsocket.send('sns/t/'+sns_info)}, 300);
	$("#sns_content").val("");
}
window.onload=connect();
</script>

<style>
	.color_red{color:red;}

	.sched_main #sns_sendBtn{
	color:white;
	border-style: solid;
	border-color: white;  
	border-width: 3px;
	text-align: center;
	min-width: 25px;
	line-height: 1.5;
	font-size: 15px;
	border-radius: 4px;
	}
	.sched_main #sns_sendBtn:hover{
	color: #2AB9D0; 
	border-color: white; 
	background: white;
	}
	
	.sched_main .ok_sched{
		color:#C1BCBC;
	}
	.ok_sched:hover{
		color:green;
	}
	.sched_main .cancel_sched{
		color:#C1BCBC;

	}
	.cancel_sched:hover{
		color: red;
		background-color: tr
	}
	
	#input_form input{
	font-size: 13px;
	line-height:20px;
	width: 90%;
	height:120%;
	background-color: white;
	}
	.sched_main #input_form textarea{
	background-color: white;
	}
	.sched_main .sched_bar{
		height: 70px;
		background: #2AB9D0;
		width: 100%;
		}
	
	.sched_main .sched{border-radius:4px;
			height: 500px; 
			background: #2AB9D0;
		    margin: 0 4px;
		    padding:7px;
		    border-width: 1px;border-color:#2AB9D0;
		    overflow-y: hidden;
		    }
	.sched_main .sched_custom{border-radius:4px;
			background: #2AB9D0;
		    border-width: 1px;border-color:#2AB9D0;
		    overflow-y: hidden;
		    }
	.sched_main .sched_cont{
			border-radius:4px;
			height: 400px;
			background: white;
			margin:auto;
			width: 100%;
			overflow-y: auto;
		    overflow-x: hidden;
		   
		    }
	.sched_main .sched_cont_bottom{
		height: 50px;
		background: #2AB9D0;
	}
	.sched_main .sched_cont_top{
		padding:8px 34px 8px 10px;
		position:relative;
		height: 50px;
		background: #2AB9D0;
	}
	.sched_main .card{
		width 100%;
	    overflow: hidden;
	    word-break: break-all;
	    padding: 8px;
	    position: relative;
	    z-index: 10;
		background: #C8E7FF;
		border-radius:4px;
		opacity: 0;
		pointer-events:auto; 
		margin-bottom: 7px;
		 animation: 
		        openspace .3s ease forwards, 
		        restored-item-animation .5s .3s cubic-bezier(.14,.25,.52,1.56) forwards;
		-webkit-transition: all 0.5s ease-out;
    	transition: all 0.5s ease-out;
		}
	.sched_main .card:hover{
		background: #12D4F3;
	}
	.sched_card{
	height: 50px;
	word-break: break-all;
		opacity: 0;
		 animation: 
		        openspace .3s ease forwards, 
		        restored-item-animation .5s .3s cubic-bezier(.14,.25,.52,1.56) forwards;
	}
	.sched_main .alarm_card{
		width: 100%;
	    overflow: auto;
	    padding: 8px;
	    position: relative;
	    z-index: 10;
		background: #FFBEBE;
		border-radius:4px;
		opacity: 0;
		margin-bottom: 7px;
		 animation: 
		        openspace .3s ease forwards, 
		        restored-item-animation .5s .3s cubic-bezier(.14,.25,.52,1.56) forwards;
		-webkit-transition: all 0.5s ease-out;
    	transition: all 0.5s ease-out;
		}
	.sched_main	.alarm_card:hover{
		background:#FF6C6C;
		}
	.sched_main .card_content{width: 100%;}
	.sched_main .pull_right {
    float: right;
	}
	
	
	.sched_main .check{box-shadow:0px;background-color:#2AB9D0;-webkit-box-shadow: 0px 0px 0px; }
	.sched_main #sched2{height: 300px;}
	
	.sched_main h4{color:white;
	    display: inline;
	    font-size: 15px;
	    line-height: 18px;
	    margin: 0;
	    overflow: hidden;
   		text-overflow: ellipsis;
 	  	word-wrap: break-word;
	}
	.icon{
	text-decoration: none;
	color:white;
	}
	.icon:hover{font-size: 15px;color:#0012FF;}
	.sched_main a{
	text-decoration: none;
	font-size: 13px;
	cursor:pointer;
	}
	.sched_main a:hover{
	text-decoration: none;
	}
	.sched_main .input_form{height: 0px;padding: 0px;}
	.sched_main .list_form{height: 0px;padding: 0px;}
@keyframes openspace {
    to {
       /*  height: auto; */
    }
}
@keyframes restored-item-animation {
    0% {
        opacity: 0;
         transform: translateX(300px);
    }
    70% {
        opacity: 1;
        transform: translateX(-50px);
    }
    100% {
        opacity: 1;
        transform: translateX(0);
    }
}

#sched_table tr{
height: 50px;
-webkit-transition: all 0.5s ease-out;
    	transition: all 0.5s ease-out;
}
#sched_table tr:hover{
background: #C4EFF9;
}
#sched_table tr div{
height: 50px;
overflow: hidden;
margin-top: 0px;
}
#sched_table tr div:hover{
height: auto;
}
.sched_main{
width: auto;
}

</style>




<div class="sched_main container" >
	<div class="row" >
		<div class="col-md-5 sched">
			<div class="sched_cont_top" >
					<h4 align="left">Private Schedule</h4>
					<a class="icon sa" aria-label="Right Align" 
						style="background: #2AB9D0;color:white;font-size: 10px" 
						href="<c:url value="/scheduler/scheduler_big"/>" 
						data-toggle="tooltip" title="일정 자세히 보기">
					  <span class="glyphicon glyphicon glyphicon-calendar icon" aria-hidden="true"></span>
					</a>
			</div>
			<div class="sched_cont" style="overflow-y: hidden;">
				<div class="sched_cont" id="sched_list">
					<table class="table" id="sched_table">
					
					</table>
				</div>
				<div class="sched_cont " id="input_form" align="center" style=" background-color: #F1F1F1; margin-left: 0px;">
					<table style="width: 100%;padding: 9px; border-collapse: separate;cursor:pointer; ">
						<tr align="center">
							<td colspan="2" ><h5 style="color: #2AB9D0;">Add New Schedule</h5><td>
						</tr>
						<tr>
								<td id="colname">Title:</td>
								<td colspan="2"><input type="text" style="height: 20px;width: 97%;" class="form-control" id="sched_event" name="sched_event" required="required"></td>
							</tr>
							<tr>
								<td id="colname">Start:</td>
								<td>
									<input type="date" class="form-control" id="sched_someday_date" name="sched_someday_date" required="required" >
								</td>
								<td>	
									<input type="time" class="form-control" id="sched_someday_time" name="sched_someday_time">
								</td>
							</tr>
							<tr>
								<td id="colname" >End:</td>
								<td>
									<input type="date" class="form-control" id="sched_somedayend_date" name="sched_somedayend_date" required="required">
								</td>
								
								<td>
									<input type="time" class="form-control" id="sched_somedayend_time" name="sched_somedayend_time">
								</td>
								
							</tr>
							<tr>
								<td id="colname">Content:</td>
							</tr>
							<tr>
								<td colspan="3"><textarea rows="5" style="width: 100%;" class="form-control" id="sched_content" name="sched_content"></textarea> </td>
							</tr>
						<tfoot align="right">
								<tr>
									<td colspan="3">
										<a class="ok_sched" onclick="scheduler_insert()">Add Schedule<span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a>
										<a class="cancel_sched" onclick="tog()">Cancel<span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
									</td>
									<td align="right">
					        			
									</td>
								</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div align="right" id="add_form_btn">
				<a class="icon" onclick="tog()" id="open_add_form" aria-label="Right Align" style="font-size: 10px;text-decoration: none;" data-toggle="tooltip" title="일정 추가하기">
					ADD <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				</a>
			</div>
			
			
		</div>
	
		<div class="col-md-5 sched">
			<%-- <div class="sched_custom" style="padding 0px; width100%; height: 120px; margin-bottom: 4px;">
				<div class="sched_cont_top">
					<h4 align="left">Alarm</h4>	
					<input type="hidden" id="task_info" value="${mem_code}">
				</div>
				<div class="sched_cont" style="height: 70px;">
					<div  id="alarm_list">
					
					</div>
				</div>
			</div> --%>
			<div class="sched_custom" >
				<div class="sched_cont_top" >
					<h4 align="left">SNS</h4>
					<a class="icon sa"style="background: #2AB9D0;color:white;font-size: 10px" >
					  <span class="glyphicon glyphicon-comment icon" aria-hidden="true"></span>
					</a>	
				</div>
				<div class="sched_cont"style="height:375px; overflow-y:auto;">
						<div id="timeline"style="overflow-x: hidden;overflow-y: hidden;"></div>
						<div align="center">
							<a href="#" onclick="log()" style="color: #8c8c8c;display: block;">See more</a>
						</div>
				</div>
				
			</div>
				<div style="height: 29px;width:100%; margin-top: 2px; ">
					<input type="hidden"id="sns_info" value="${dept_num}" autocomplete="off" >
					<input class="form-group" style="line-height: 25px;width:85%;border-radius: 4px;" type="text" id="sns_content">
					<a id="sns_sendBtn">  Send  </a>
				</div>
		</div>
	</div>
</div>
