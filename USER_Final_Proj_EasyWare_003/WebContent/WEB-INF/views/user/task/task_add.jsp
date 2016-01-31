<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		format : 'H:i'
	});
	
	$('.datepicker').datetimepicker({
		timepicker:false,
		 format:'Y-m-d',
	});
}); 
</script>       
<title>PAGE[PROFILE]</title>
<script type="text/javascript" >   
var wsocket;
function connect() {
	wsocket = new SockJS(
			"<c:url value='/ws/chat.sockjs'/>");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
}

function disconnect() {
	wsocket.close();
}

function onOpen(evt) {
	console.log("연결되었습니다.");
} 

function onMessage(evt) {
	var data = evt.data;
	console.log(data);
}

function onClose(evt) {
	console.log("연결을 끊었습니다.");
}


function send_Soket() {   
	 
	var temp = []; 
	var $list = $('#task_list_selected option');
	$list.each(function(index,mem_code) {
		temp = $(mem_code).val();  
		                                         
		wsocket.send(temp + "/0");  
	});	                  
	
	var flag = true;	       
	if ($list.length == 0 ) flag = false;
	       
	return flag;
}
// connent() 웹 소켓 
window.onload=connect();
</script>
<script>
$(function(){

	
	$.ajax({
		type : "GET",
		url : "<c:url value='/user/positInfo.json' />",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
		
			$.each(resultData, function(index, value) {
				$("#posit_num").append('<option value='+value.POSIT_NUM+'>' +value.POSIT_NAME+'</option>');
				
			});

		}

	});
	
}); 		


$(function(){

	
	$.ajax({
		type : "GET",
		url : "<c:url value='/user/deptInfo.json' />",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
		
			$.each(resultData, function(index, value) {
				$("#dept_num").append('<option value='+value.DEPT_NUM+'>' +value.DEPT_NAME+'</option>');
				
			});
  
		}

	});
	
}); 		                         
 
 
$(function() {                                         
	 $('#task_list').click(function(e){
		 
	/* 	var temp = []; 
		var $list = $('#task_list_selected option');
			$list.each(function(index,mem_code) {
				temp = $(mem_code).val();      	    

			});	  */
		     
	     return !$('#task_list option:selected').remove().appendTo('#task_list_selected');
	 });
	 $('#task_list_selected').click(function () {
	     return !$('#task_list_selected option:selected').remove().appendTo('#task_list');
	 }); 
	 
	
});


function options_Clean1() {
	$('#task_list option').remove();
}
 
function options_Clean2() {
	$('#task_list_selected option').remove();
}


// 실시간 사용자 검색 
function search_user_list() {
	
	var datas  = {};        
	var namev=$('#search_user').val();    	
	var dept_numv=$('#dept_num option:selected').val();
	var posit_numv=$('#posit_num option:selected').val();      
	if(namev !="") datas['mem_name']=namev; 
	if(dept_numv !="") datas['dept_num']=dept_numv;          
	if(posit_numv !="") datas['posit_num']=posit_numv; 
	    
	/* console.log(namev);     
	console.log(dept_numv);
	console.log(posit_numv); 
	console.log(datas);    */
	$.ajax({
		type : "GET",    
		url : "<c:url value='/user/user_search_List.json' />",
		data : datas,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
		 
			$.each(resultData, function(index, value) {
				$("#task_list option:eq("+ index +")").remove();          
				$("#task_list").append('<option value='+'task'+'/'+value.MEM_CODE+'/'+value.DEPT_NUM+'>' + value.DEPT_NAME+','+value.POSIT_NAME+','+value.MEM_NAME+'</option>');
				 
			});

		}

	});
}

</script> 
 
<script type="text/javascript"> 
	$(function() {
		CKEDITOR.replace('task_description');
	});
</script>
<style>               
.btn-danger{ background-color:  rgba(229, 28, 35, 0.86);} 
label strong {font-size: 1.4em;}                                    
.form-horizontal .control-label {padding-top: 1px;  }                                                            
</style> 


<div class="col-sm-12"> 
	<div class="panel panel-success">
		<div class="panel-heading" style="background-color: rgba(18, 173, 24, 0.86);">      
			<h3 style="color: white;">TASK ADD</h3>         
		</div>  
		<div class="panel-body">
			<form class="form-horizontal" onsubmit="return send_Soket()"
				action="<c:url value="/task/insert" />" method="post"
				role="form">  

				<div class="form-group">
					<label class="control-label col-sm-3" for="name"><strong>TASK ORGANIZER</strong></label>
					<div class="col-sm-3">
						<input type="hidden" class="form-control"
							value="${sessionScope.mem_code}" id="task_organizer"
							name="task_organizer" readonly="readonly" /> <input type="text"
							class="form-control" value="${sessionScope.mem_name}"
							readonly="readonly" />
					</div>  
				</div>
  
				<div class="form-group">  
					<label class="control-label col-sm-3" for="name"><strong>TASK 제목 : </strong></label>
					<div class="col-sm-6">                                                        
						<input type="text" class="form-control" id="task_title" maxlength="25" 
							name="task_title" placeholder="Enter task title">
					</div>
				</div>    
				        
				<div class="form-group"> 
					<label class="control-label col-sm-3" for="name"><strong>TASK 시작-종료 :</strong></label>
					<div class="col-sm-3">
						<input type="text" class="form-control datepicker" id="task_start"
							name="task_start" required="required" />
					</div>     
					<label class="control-label col-sm-1" for="name">~ </label>
					<div class="col-sm-3">      
						<input type="text" class="form-control datepicker" id="task_end"
							name="task_end" required="required" />
					</div>
				</div> 
				  
				                  
				<div class="form-group">      
					<label class="control-label col-sm-3" for="name"><strong>TASK 할당자 검색</strong></label>
					<!-- <label class="control-label col-sm-3" for="name"></label> -->
					<div class="col-sm-8" >              
					<label class="control-label" ><strong>부서 :</strong></label>
						<select id="dept_num">
							<option value="" >-- 선택 --</option>
						</select> 
					<label class="control-label" ><strong> 직급 : </strong></label>    
						<select id="posit_num">
		  					<option value="">-- 선택 --</option>            
						</select>   
					</div>  
						
				</div> 
				       
				<div class="form-group">               
					<div class="col-sm-3"><label></label></div>                                                      
							<!-- <label class="control-label" ><strong>사원이름 :</strong> </label>   -->
						<div class="col-sm-3">               
  						 	<input type="text" id="search_user" class="form-control" placeholder="사원이름 입력!"/>  
						</div>
					<div class="col-sm-3">      
						<button class="form-control btn btn-primary input-sm"  type="button" onclick="search_user_list()"
						 		style="background-color:  rgba(33, 150, 243, 0.85);">search</button>
					</div>
		   		</div>    
				
				        
				<div class="form-group">     
					<label class="control-label col-sm-3"><strong>TASK 할당자 지정 :</strong></label> 
					<div class="col-sm-12">                     
						<label class="control-label col-sm-2" ></label>     	 
						<label class="control-label col-offset-sm-4 col-sm-3" for="name"><strong>대기 지정자</strong></label>     	              
						<div class="col-sm-2">  
							<a type="button"  class="btn btn-danger btn-block input-sm" onclick="options_Clean1()">비우기</a>
						</div>  
						        
						<label class="control-label col-sm-2" for="name"><strong>지정자</strong></label>
		           
						<div class="col-sm-2">  
							<a type="button"  class="btn btn-danger btn-block input-sm" onclick="options_Clean2()">비우기</a>
						</div>
		 			</div>        
	  				
				</div>  
				<div class="form-group">    
					<label class="col-sm-3"></label>      
					<div class="col-sm-4">             
						<select  id="task_list" multiple="multiple" class="form-control" style="background-color: #E4F3F5;">
						</select> 
					</div>         
					<div class="col-sm-4">
						<select  id="task_list_selected" name="mem_code" multiple="multiple" style="background-color: #E4F3F5;" class="form-control" required="required">
						</select>
					</div>
				</div>
				  
				<div class="form-group">         
					<label class="control-label col-sm-3" ><strong> 업무 내용 상세사항</strong> </label>
				</div>  
				    
				<div class="form-group">     
					<label class="control-label col-sm-2" ></label>  	
					<div class="col-sm-9">       
						<textarea class="form-control" rows="3" cols="3"   
							id="task_description" name="task_description">
							</textarea>
					</div>           
					<label class="control-label col-sm-2" ></label>  
				</div>

				<div class="form-group">                    
					<div class="col-sm-offset-2 col-sm-2"> 
						<button type="submit"  class="btn btn-success btn-block" >UPDATE</button>
					</div>     
					<div class="col-sm-2">
						<button type="button" class="btn btn-danger btn-block"
							onclick="javascript:history.back()">CANCEL</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>





