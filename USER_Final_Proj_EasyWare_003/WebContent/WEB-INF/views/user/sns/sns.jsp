<%-- 
    작업 날짜 : 2015. 11. 18.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<!-- Resoures 선언 -->

<script>
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
            		console.log(decent);
            	}
            	arr.push({
            		sns_num:dta.sns_num,
            		title:dta.sns_title,
            		writer:dta.mem_name,
            		dept:dta.dept_num,
            		content:dta.sns_content,
            		date:dta.sns_date,
            	});
            	
            	$('#timeline').prepend(
            			'<div class="snscard">'
						+arr[num].date
						+'<br/>'
						+arr[num].title
						+'<br/>'
						+arr[num].content
						+'<br/>'
						+arr[num].writer
						+arr[num].dept
						+'<br/>'
						+'====================='
						+'<br/>'
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
<script>
	function update() {
		var title = $("#title").val();
		var content = $("#content").val();	
		$.ajax({
        	url:"sns_insert.json",
        	dataType: "json",
        	data:{"sns_title":title,
        			"sns_content":content},
        	success: function() {
        	}
		});
		
		setTimeout(function(){refresh();}, 500);
	}
</script>
<script>
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
                		title:dta.sns_title,
                		writer:dta.mem_name,
                		dept:dta.dept_num,
                		content:dta.sns_content,
                		date:dta.sns_date,
                	});
                	
                	$('#timeline').prepend(
                			'<div class="snscard">'
							+arr[num].date
							+'<br/>'
							+arr[num].title
							+'<br/>'
							+arr[num].content
							+'<br/>'
							+arr[num].writer
							+arr[num].dept
							+'<br/>'
							+'====================='
							+'<br/>'
							+'</div>'
					);	
                	num++;
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
		                			'<div class="snscard">'
									+arr_log[num_log].date
									+'<br/>'
									+arr_log[num_log].title
									+'<br/>'
									+arr_log[num_log].content
									+'<br/>'
									+arr_log[num_log].writer
									+arr_log[num_log].dept
									+'<br/>'
									+'====================='
									+'<br/>'
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
<style>
	.container{height: 800px;width: 1100px;}
	.snscard{background-color: white; 
			border-radius:4px;
			position: relative;
			display: flex;
			box-sizing: border-box;
			position: relative;
			white-space: normal;
			margin-bottom: 6px;
		    border-bottom: 1px solid #ccc;
		    max-width: 375px;
		    opacity: 0;
		    /*animation*/
		    transform: translateX(300px);
		    animation: 
		        openspace .3s ease forwards, 
		        restored-item-animation .5s .3s cubic-bezier(.14,.25,.52,1.56) forwards;
			}
	 
@keyframes openspace {
    to {
        height: auto;
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

	.timeline{overflow-y: auto;
		    overflow-x: hidden;
		    margin: 0 4px;
		    width:400px;
		    height: 500px;
		    }
	#timline{  width: 330px;
			
			}
			
			
	.profile{
		border-radius:4px;
		background: #2196f3;
		margin: 0 5px;
	}
			
</style>

<title>PAGE - MENU [NAME] </title>

<div class="container" style="margin: 0 5px;">
	<div class="col-md-5" style="background: #2196f3;border-radius:4px;">
		<div style="border-radius:3px 3px  0 0;color: #8c8c8c;display: block; height: 40px;">
			<input type="button" onclick="refresh()" value="Refresh" class="btn" style="background-color: white;">
		</div>
				<div  class="timeline">
					<div id="timeline"></div>
					<div align="center">
						<a href="#" onclick="log()" style="color: #8c8c8c;display: block;">log</a>
					</div>
				</div>
			<div style="border-radius: 0 0 3px 3px;color: #8c8c8c;display: block; height: 40px;"></div>
	</div>
	
	<div class="col-md-4"  style="height: 800px;">
		<div align="center" class="profile" >
			<div >
					<!-- image -->
				</div>
					<img src="/resources/img/EG.png" class="img-circle">
				<div>
				<input type="text" id="title" name="title"  style=" width:250px; ">
				<textarea class="form-control" id="content" name="content" style=" width:250px; background-color: white;" rows="8"></textarea>
				</div>
				<div align="right">
					<input type="button" onclick="update()" value="입력" id="myButton" class="btn btn-primary" autocomplete="off"><br/>
				
			</div>
		</div>
	</div>
</div>
