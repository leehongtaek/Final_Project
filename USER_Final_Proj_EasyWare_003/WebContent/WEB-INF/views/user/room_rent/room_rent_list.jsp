<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 : list view
  
  @author By 유현주 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- JQuery UI -->        
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/jquery-ui-1.11.4/jquery-ui.min.css'/> ">
<script
	src="<c:url value='/resources/plugin/jquery-ui-1.11.4/jquery-ui.js' />"></script>
	
<!-- datetime picker -->                 
<link rel="stylesheet" href="<c:url value='/resources/plugin/datetimepicker/jquery.datetimepicker.css' /> ">
<script src="<c:url value='/resources/plugin/datetimepicker/build/jquery.datetimepicker.full.min.js' />"></script>
<script type="text/javascript">
$(function() {        
	$('.timepicker').datetimepicker({
		datepicker : false,
		format : 'H:i', step:30
	});
	
	$('.datepicker').datetimepicker({
		timepicker:false,
		 format:'Y-m-d',
	});
}); 
</script>
<title>PAGE[room_rent_list] </title>

<style>
	
	/* #calendar{width: 600px; height: 600px;} : 캘린더 크기 */
	.fc-button {color:#1E88E5;} /* 캘린더 버튼 색 */
	/* 캘린더 툴바 스타일 */
	.fc-state-default.fc-corner-right{ border-top-right-radius: 0px;border-bottom-right-radius: 0px;}
	.fc-state-default.fc-corner-left{ border-top-left-radius: 0px;border-bottom-left-radius: 0px;}
	.fc-center h2{color:#2196f3;} /* 캘린더 제목 색 */
	.fc-event {border-radius: 0px;} /* 캘린더 이벤트 스타일 */
	
	.fc-widget-content {cursor: pointer;} /* 캘린터 날짜 커서 변환 */
	
</style>


<script>

// booking시 roomname을 DB로부터 가져와 option으로 만들어줌 - value값으로 roomnum을 가짐(ajax)

$(function(){
	var url = "room_List";
	$.ajax({
		url: url,
		success: function(list){
			var print = "<option> Select Name of Room </option>";
			$.each(list,function(idx, list){
				print += "<option value="+list.room_num+">"+list.room_name+"</option>";
			});
			console.log("list.room_num : " + list.room_num);
			console.log("list.room_name : " + list.room_name);
			$('#room_num').html(print);
		},
		error: function(e){
			alert(e.responseText);
		}
	});
}); 

// booking시 roomname을 DB로부터 가져와 resource로 만들어줌(ajax)

$(function(){
	var url = "room_List";
	$.ajax({
		url: url,
		success: function(list){
			$.each(list,function(idx, item){
				$('#calendar').fullCalendar(
					'addResource',
					{
						id: item.room_num,
						title: item.room_name
					},
					true // scroll to the new resource?
				); 
			});
		
		},
		error: function(e){
			alert(e.responseText);
		}
	});
});

// rent 내용 add 부분

$(function(){
	var url = "rent_List";
	$.ajax({ // 'removeEvents', calEvent._id
		url: url,
		success: function(list){
			$.each(list, function(idx, item){
				var col = '#009688';

				var eventData = {
								title: item.rent_reason,
								start: item.rent_date_start,
								end: item.rent_date_end,
								id: item.rent_num,
								resourceId: item.room_num,
								backgroundColor:col
							};
				$('#calendar').fullCalendar(
					'renderEvent',
					eventData,
					true
				);
			});
		
		},
		error: function(e){
			alert(e.responseText);
		}
	});
});

// calendar 부분

function goUrl(url){
	location = url;
}

$(function() { // document ready
		
		var date = new Date();
		var y = parseInt(date.getFullYear());
		var m = parseInt(date.getMonth()+1);
		var d = parseInt(date.getDate());
		var today = y+"-"+m+"-"+d;
		
	  $('#calendar').fullCalendar({
		height: 500, // 세로 크기 조정
	    resourceAreaWidth: 230,
	    now: today,
	    editable: true,
	    dragable:true,
	    timeFormat: 'hh:mm',
	    aspectRatio: 1.50,
	    scrollTime: '07:00',
	    header: {
	      left: 'promptResource today prev,next',
	      center: 'title',
	      right: 'timelineDay,month'
	    },
	    defaultView: 'month',
	    views: {
	      timelineThreeDays: {
	        type: 'timeline',
	        duration: { days: 3 }
	      }
	    },
	    
	    selectable: true,
		selectHelper: true,
		select: function(start, end, event) { // 선택 날짜의 정보 가져오기(page 이동)
            var rent_date_start = start.format();
            console.log(rent_date_start);
            var urla = "rent_Detail?rent_date_start="+rent_date_start;
            goUrl(urla);
   		},
		
	    editable: false,
		eventLimit: true, // allow "more" link when too many events
	    
		resourceLabelText: 'Rooms',
	    resourceRender:
	    function(resource, cellEls) {
			
	   	},
	    resources: 
	    [ // { id: 'b', title: 'Auditorium B', eventColor: 'green' }
	    ],
	    events: 
	    [ // { id: '5', resourceId: 'f', start: '2015-08-07T00:30:00', end: '2015-08-07T02:30:00', title: 'event 5' }
	    ]
	  });
	   
	});

// 하루 단위로 시설 예약을 받기 위한 날짜 처리

$(function(){
	$('#Booking').click(function(){
		
		var rent_date_start = "";
		var rent_date_end = "";
		
		var $rent_date_start = $('#rent_date_start');
		var $rent_date_end = $('#rent_date_end');
		
		var rent_date = $('#rent_date').val();
		var start_time = $('#start_time').val();
		var end_time = $('#end_time').val();
		
		rent_date_start = rent_date +"T"+ start_time;
		rent_date_end = rent_date +"T"+ end_time;
		
		/* $rent_date_start.text(rent_date_start);
		$rent_date_end.text(rent_date_end); */
		
		document.getElementById("rent_date_start").value = rent_date_start;
		document.getElementById("rent_date_end").value = rent_date_end;
		
	});
	
});

</script>




<div class="col-sm-12">

	<div class="panel panel-default">
		<div class="panel-heading"> 
			<h3><span class="glyphicon glyphicon-home" aria-hidden="true"> RESERVATION </span></h3>    
		</div>  
		<div class="panel-body">
			
			<br/>
			
			<!-- calendar start -->
			<div id="calendar"></div>
			<!-- calendar end -->
			
			<br/>
			
			<!-- Button trigger modal -->
			<div class="row">
				<div class="col-sm-4" >
					<button type="button" class="btn btn-success"
						data-toggle="modal" data-target="#booking">Booking</button>
				</div>
			</div>
			<!--/. Button trigger modal End -->
		
		</div>
	</div>
</div>


<!-- mem_code를 session에서 가져옴 -->
<input type="hidden" id="mem_code" value="${sessionScope.mem_code}">



<!-- Booking Modal Start -->

<div class="container-fluid">
	<div class="modal fade" id="booking" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Booking</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal" action="rent_Insert" method="post" role="form">
						
						<!-- start rent_reason -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Purpose of Use : </label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="rent_reason" name="rent_reason"
									placeholder="Purpose of Use">
								<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
							</div>
						</div>
						<!-- end rent_reason -->
						
						<!-- start date -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Date : </label>
							<div class="col-sm-8">
								<input type="text" class="datepicker form-control" id="rent_date" required="required">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Start Time : </label>
							<div class="col-sm-8">
								<input type="text" class="timepicker form-control" id="start_time" value="08:00">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">End Time : </label>
							<div class="col-sm-8">
								<input type="text" class="timepicker form-control" id="end_time" value="09:00">
							</div>
						</div>
						
						<input type="hidden" id="rent_date_start" name="rent_date_start">
						
						<input type="hidden" id="rent_date_end" name="rent_date_end">
						
						<!-- end date -->
						
						<!-- start room_num -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Select Name of Room : </label>
							<div class="col-sm-8">
								<select class="form-control" id="room_num" name="room_num"></select>
							</div>
						</div>
						<!-- end room_num -->
						
						<br>
						<div class="row">
							<div align="left" class="col-sm-6">
								<button type="submit" class="btn btn-success" id="Booking">Booking</button>
								<button type="button" class="btn btn-danger" data-dismiss='modal'>Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal End -->