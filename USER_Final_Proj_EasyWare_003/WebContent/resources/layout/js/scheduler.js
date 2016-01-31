/**
* 작업 날짜 : 2015. 12. 3.
* 구현 내용 :   
*  
* @author By kosta 
*/

//scheduler insert,check
function goUrl(url) {
	location = url;
}  

function playBeep_sns() {   
	 var _beep = new Audio("resources/sound/button-37.mp3");
	 _beep.play();
}
function scheduler_check(num) {
		$.ajax({
	   	 type:"POST", 	
	   	 url:"scheduler/scheduler_check",
	   	data:{sched_num:num},
		success:function(){ 
			/* $('#'+num).closest('tr').remove(); */
			$('#'+num).text('완료됨');
			$('#'+num).addClass('color_red');
		}
		});	
}

var sched_recent;
function scheduler_insert() {//스케쥴러 입력
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
	   	 url:"scheduler/scheduler_insert.json",
	   	data:{
	   		sched_event:event,
	   		sched_content:content,
	   		sched_someday_date:daystart_date,
	   		sched_somedayend_date:dayend_date,
	   		sched_someday_time:daystart_time,
	   		sched_somedayend_time:dayend_time	
	   	},
		success:function(){ //입력 성공시 입력창 내용 초기화
			$('#sched_event').val('');
			$('#sched_content').val('');
			$('#sched_someday_date').val('');
			$('#sched_someday_time').val('');
			$('#sched_somedayend_date').val('');
			$('#sched_somedayend_time').val('');
			tog();
			setTimeout(function(){scheduler_update();}, 1000);//db입력을 기다렸다가 입력한 스케쥴 불러오기
		}
		});
	}else {
		swal({
			title : "시작 날짜, 시작 시간은 필수 입력입니다",
			type : "warning",
			
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "확인",
			
		}, function() {
			
		});
	}
}
function scheduler_update(){
	$.ajax({
    	url:"scheduler/scheduler_update.json",
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


