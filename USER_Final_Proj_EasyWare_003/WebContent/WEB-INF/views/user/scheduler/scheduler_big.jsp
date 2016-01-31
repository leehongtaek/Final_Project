
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->


<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 

<script>
var calEventv;
$(function(){
	  var currentLangCode = 'ko';
	  $('#calendar').fullCalendar('destroy');
	  $('#calendar').fullCalendar({
         	aspectRatio:1.5,
	       timeFormat: 'hh:mm', //시간 포멧
	       header: {
			     left: 'prev,next today',
			     center: 'title',
			     right: 'month,agendaWeek'
		      },
	   	   eventClick : function(calEvent,jsEvent,view){ //데이터 베이스에서도 이벤트 제거
	   		calEventv=calEvent
	   			scheduler_data(calEvent.id);
		    },
		   defaultView: 'month',
		   editable: false,                                            
		   selectable: false,
		   selectHelper: true,
	   select: function(start, end, event) {
		  
	   },
	   eventLimit: true,
	   events: function(start,end,timezone,callback) {
		   $.ajax({
	        	url:"scheduler_event.json",
	        	
	        	dataType: "json",
	        	success: function(list) {
	        		console.log("LOG "+list);
	                var events = [];
	                $.each(list,function(idx,dta) {
	                	console.log(dta.sched_check);
	                	
	                	
	                	var col = 'blue';
	                	var sched_someday_time = '';
	                	var sched_somedayend_time = '';
	                	
	                	if(dta.sched_check=='1'){
	                		col='red';
	                	}
	                	if (dta.sched_someday_time!=null) {
	                		sched_someday_time = dta.sched_someday_time
						}
	                	if (dta.sched_somedayend_time!=null) {
	                		sched_somedayend_time = dta.sched_somedayend_time
						}
	                	
	                	
	                    events.push({
	                        title: dta.sched_event,//$(this).attr('title'),
	                        start: dta.sched_someday_date+'T'+sched_someday_time, //$(this).attr('start') // will be parsed
	                        end:dta.sched_somedayend_date+'T'+sched_somedayend_time,
	                        id:dta.sched_num,
	                        backgroundColor:col
	                    });
	                    
	                    
	                });
	                console.log(events);
	                callback(events);
	            }
	          });
	          
 		}
	  });
	  $('.fc-license-message').val('');
	 });
 $( "#calendar,event" ).draggable({
	  disabled: true
	}); 
</script>
<style>
	.fc-button{color:#2196f3;}
	.fc-center h2{color:#2196f3;}
	h2{color:#2196f3;}
	.fc-state-default.fc-corner-right{border-top-right-radius: 0px;border-bottom-right-radius: 0px;}
	.fc-state-default.fc-corner-left{border-top-left-radius: 0px;border-bottom-left-radius: 0px;}
	.fc-event {border-radius: 0px;}
</style>
<script>
function scheduler_data(num) {
		$.ajax({
	   	 
	   	url:"scheduler_data",
	   	data:{sched_num:num},
		success:function(data){
				$("#sched_event").val(data.sched_event);
				
				$("#sched_someday_date").val(data.sched_someday_date);
				$("#sched_somedayend_date").val(data.sched_somedayend_date);
				$("#sched_someday_time").val(data.sched_someday_time);
				$("#sched_somedayend_time").val(data.sched_somedayend_time);
				
				$("#sched_content").val(data.sched_content);
				
				$("#sched_num").val(data.sched_num);
	    }
	});
		$('#myModal').modal('show');
}
function scheduler_modify() {
	var num = $("#sched_num").val();
	$.ajax({
   	url:"scheduler_modify",
   	data:{
   		sched_num:$("#sched_num").val(),
   		sched_event:$("#sched_event").val(),
   		
   		sched_someday_date:$("#sched_someday_date").val(),
   		sched_somedayend_date:$("#sched_somedayend_date").val(),
   		sched_someday_time:$("#sched_someday_time").val(),
   		sched_somedayend_time:$("#sched_somedayend_time").val(),
   		
   		sched_content:$("#sched_content").val()
		
   	},
	success:function(){$('#calendar').fullCalendar( 'refetchEvents' );}
	});
	
}

function scheduler_delete() {
	var num = $("#sched_num").val();
	$.ajax({
   	 type:"POST",
   	 url:"scheduler_delete",
   	data:{sched_num:num},
	success:function(){}
	});
	$('#calendar').fullCalendar('removeEvents', calEventv._id);
}


</script>



<div class="col-md-11">
	<div id='calendar'></div>
	<div align="right"><a class="btn btn-primary" href="<c:url value="/"/>">Back to index</a> </div>
</div>

<!-- ==============================================================modal -->
<div class="container" >
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">일정 수정/삭제</h4>
	      </div>
	      	
		      <div class="modal-body">
		      
		        <table id="table">
			
					<tbody>
						<tr>
							
							<td id="colname">제목:</td>
							<td>
								<input type="text" class="form-control" id="sched_event" name="sched_event">
								<input type="hidden"id="sched_num" name="sched_num">
							</td>
						</tr>
						<tr>
							<td id="colname">시작 날짜:</td>
							<td>
								<input type="date" class="form-control" id="sched_someday_date" name="sched_someday_date" required="required" >
							</td>
							<td>	
								<input type="time" class="form-control" id="sched_someday_time" name="sched_someday_time">
							</td>
						</tr>
						<tr>
							<td id="colname">종료 날짜:</td>
							<td>
								<input type="date" class="form-control" id="sched_somedayend_date" name="sched_somedayend_date" required="required">
							</td>
							
							<td>
								<input type="time" class="form-control" id="sched_somedayend_time" name="sched_somedayend_time">
							</td>
						</tr>
						<tr>
							<td id="colname">내용:</td>
						</tr>
						<tr>
							<td colspan="3"><textarea rows="7" cols="60" id="sched_content" name="sched_content"></textarea> </td>
						</tr>
						
					</tbody>
					<tfoot>
						<!-- <tr>
							<td><input class="btn btn-default" type="button" value="추가"></td>
						</tr> -->
					</tfoot>
				</table>
			 
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="scheduler_modify()">일정 수정</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">수정 취소</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="scheduler_delete()">일정 삭제</button>
		        
		      </div>
		
	    </div>
	  </div>
	</div>
</div>