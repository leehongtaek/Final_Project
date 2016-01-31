<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->

<script>

$(function() { // document ready
	
		var date = new Date();
		var y = parseInt(date.getFullYear());
		var m = parseInt(date.getMonth()+1);
		var d = parseInt(date.getDate());
		var today = y+"-"+m+"-"+d;
		console.log(today);
		
	  $('#calendar').fullCalendar({
	    resourceAreaWidth: 230,
	    now: today,
	    editable: true,
	    aspectRatio: 1.5,
	    scrollTime: '00:00',
	    header: {
	      left: 'promptResource today prev,next',
	      center: 'title',
	      right: 'timelineDay,timelineThreeDays,agendaWeek,month'
	    },
	    customButtons: {
	      promptResource: {
	        text: '+ room',
	        click: function() {
	          var title = prompt('Room name');
	          if (title) {
	            $('#calendar').fullCalendar(
	              'addResource',
	              { title: title },
	              true // scroll to the new resource?
	            );
	          }
	        }
	      }
	    },
	    eventClick : function(calEvent, jsEvent, view){
			var r = confirm("Delete"+calEvent.title+":"+calEvent._id);
			if(r===true){ // '===' : 자료형까지 비교
				$('#calendar').fullCalendar('removeEvents', calEvent._id);
			}
		},
	    defaultView: 'timelineDay',
	    views: {
	      timelineThreeDays: {
	        type: 'timeline',
	        duration: { days: 3 }
	      }
	    },
	    resourceLabelText: 'Rooms',
	    resources: [
	      { id: 'a', title: 'Auditorium A' },
	      { id: 'b', title: 'Auditorium B', eventColor: 'green' },
	      { id: 'c', title: 'Auditorium C', eventColor: 'orange' },
	      { id: 'd', title: 'Auditorium D', children: [
	        { id: 'd1', title: 'Room D1' },
	        { id: 'd2', title: 'Room D2' }
	      ] },
	      { id: 'e', title: 'Auditorium E' },
	      { id: 'f', title: 'Auditorium F', eventColor: 'red' },
	      { id: 'g', title: 'Auditorium G' },
	      { id: 'h', title: 'Auditorium H' },
	      { id: 'i', title: 'Auditorium I' },
	      { id: 'j', title: 'Auditorium J' },
	      { id: 'k', title: 'Auditorium K' },
	      { id: 'l', title: 'Auditorium L' },
	      { id: 'm', title: 'Auditorium M' },
	      { id: 'n', title: 'Auditorium N' },
	      { id: 'o', title: 'Auditorium O' },
	      { id: 'p', title: 'Auditorium P' },
	      { id: 'q', title: 'Auditorium Q' },
	      { id: 'r', title: 'Auditorium R' },
	      { id: 's', title: 'Auditorium S' },
	      { id: 't', title: 'Auditorium T' },
	      { id: 'u', title: 'Auditorium U' },
	      { id: 'v', title: 'Auditorium V' },
	      { id: 'w', title: 'Auditorium W' },
	      { id: 'x', title: 'Auditorium X' },
	      { id: 'y', title: 'Auditorium Y' },
	      { id: 'z', title: 'Auditorium Z' }
	    ],
	    events: [
	      { id: '1', resourceId: 'b', start: today, end: today, title: 'event 1' },
	      { id: '2', resourceId: 'c', start: '2015-08-07T05:00:00', end: '2015-08-07T22:00:00', title: 'event 2' },
	      { id: '3', resourceId: 'd', start: '2015-08-06', end: '2015-08-08', title: 'event 3' },
	      { id: '4', resourceId: 'e', start: '2015-08-07T03:00:00', end: '2015-08-07T08:00:00', title: 'event 4' },
	      { id: '5', resourceId: 'f', start: '2015-08-07T00:30:00', end: '2015-08-07T02:30:00', title: 'event 5' }
	    ]
	  });
	  
	});
</script>

<div id="calendar" class="container">
</div>