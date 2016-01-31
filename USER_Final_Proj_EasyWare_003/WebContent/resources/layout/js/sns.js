/**
* 작업 날짜 : 2015. 12. 3.
* 구현 내용 :   
*  
* @author By kosta 
*/

//sns first load
var arr=[];//버튼 동시 사용시 중복이나 순서 역전을 방지하기 위해서 사용
var arr_log=[];
var num=0;//배열 번호
var num_log=0;
var recent=0;//sns 창의 글 중의 가장 최근의 번호를 가지고 있다
var decent=0;//sns 글의 가장 오레된 번호를 가지고 있다.
var memc = $('#session_memcode').val();
$(document).ready(function(){
	$.ajax({     
    	url:"scheduler/sns_firstupdate.json",
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
            	var colr = '';
            	if(dta.mem_code==memc){
            		colr='style="background: #45FF6D;"'
            	}
            	
            	$('#timeline').prepend(
            			'<div class="card" '+colr+'>'
	            			+'<div class="card_content"  >'
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

//sns_update
	function update() {//sns 내용을 db에 입력
		var content = $("#sns_content").val();	
		$.ajax({
        	url:"scheduler/sns_insert.json",
        	dataType: "json",
        	data:{"sns_content":content},
        	success: function() {
        	}
		});
		
		/* setTimeout(function(){refresh();}, 500); */
	}


//sns refresh,log 
function refresh() { //sns 
	if((recent!=0)||((decent==0)&&(recent==0)) ){
		
		$.ajax({
        	url:"scheduler/sns_update.json",
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
                	var colr = '';
                	if(dta.mem_code==memc){
                		colr='style="background: #45FF6D;"'
                	}
                	$('#timeline').prepend(
                			'<div class="card" '+colr+'>'
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
	
function log() {//sns과거 내용 5 개 불러오기
			if(decent!=0){
				$.ajax({
		        	url:"scheduler/sns_log.json",
		        	dataType: "json",
		        	data:{"decent":decent},
		        	success: function(list) {
		        		//console.log("LOG "+list);
		                $.each(list,function(idx,dta) {
		                	//console.log(dta.sns_num);
		                	decent = dta.sns_num;
		                	arr_log.push({
		                		sns_num:dta.sns_num,
		                		w_num:dta.mem_code,
		                		title:dta.sns_title,
		                		writer:dta.mem_name,
		                		dept:dta.dept_num,
		                		content:dta.sns_content,
		                		date:dta.sns_date,
		                	});         
		                	var colr = '';
		                	if(dta.mem_code==memc){
		                		colr='style="background: #45FF6D;"'
		                	}
		                	$('#timeline').append(
		                			'<div class="card" '+colr+'>'
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


//schedlue data
$(document).ready(function(){
	$.ajax({ 
    	url:"scheduler/scheduler_event_30.json",
    	dataType: "json",
    	success: function(list) {
            $.each(list,function(idx,dta) {
            	var chk = dta.sched_check;
            	sched_recent=dta.sched_num;
           
            	if (chk==0) {
            	
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


//toggler
function tog() {
	if ($("#sched_list").is( ":hidden" ) ) {
		$( "#sched_list" ).show("slow");
		$("#add_form_btn").show("slow");
	}else {
	    $( "#sched_list" ).slideUp();
	    $("#add_form_btn").slideUp();
	    
	}
}

