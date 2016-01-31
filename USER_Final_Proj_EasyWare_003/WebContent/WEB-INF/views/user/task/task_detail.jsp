<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<title>PAGE[PROFILE]</title>
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
<style>               
.btn-danger{ background-color:  rgba(229, 28, 35, 0.86);} 
label strong {font-size: 1.4em;}                                    
.form-horizontal .control-label {padding-top: 1px;  }                                                            
</style> 

<form class="form-horizontal"
				action="<c:url value="/task/task_update" />" method="post"
				role="form">
   
<div class="col-sm-12">
    
	<div class="panel panel-success">
		<div class="panel-heading" role="tab" id="headingThree">
			<h4 class="panel-title">
				<h3 class="collapsed" role="button" data-toggle="collapse"             
					data-parent="#accordion" href="#collapsetask" aria-expanded="true" 
					aria-controls="collapsetask" style="color: white;" ><strong> TASK 상세사항 및 진행  </strong></h3> 
			</h4>
		</div>              
		<div id="collapsetask" class="collapse in" role="tabpanel"
			aria-labelledby="headingThree">
			<div class="panel-body">
				<input type="hidden" value="${vo.task_num}" name="task_num"
					id="task_num">

				<div class="form-group">
					<label class="control-label col-sm-2" for="name"><strong>TASK 등록일:</strong></label>
					<div class="col-sm-3">
						<input type="text" class="form-control"
							value="${vo.task_date}" readonly="readonly" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="name"><strong>TASK 기간:</strong> </label>
					<div class="col-sm-3">
						<input type="text" class="datepicker form-control" id="task_start"
							value="${vo.task_start}" name="task_start" />
					</div>
					<label class="control-label col-xs-1" for="name"><span>
							~ </span></label>
					<div class="col-sm-3">
						<input type="text" class="datepicker form-control" id="task_end"
							value="${vo.task_end}" name="task_end" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="name"><strong>TASK 제목:</strong></label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="task_title"
							value="${vo.task_title}" name="task_title" maxlength="25" >
					</div>
				</div>    
    
				<div class="form-group">
					<label class="control-label col-sm-2" for="name"><strong>TASK 설명:</strong> </label>
					<div class="col-sm-9">
						<textarea class="form-control" rows="3"
							id="task_description" name="task_description">${vo.task_description}</textarea>
					</div>
				</div>
  
				<div class="form-group"> 
					<div class="col-sm-offset-4 col-sm-2">
						<button type="submit" class="btn btn-success btn-block">UPDATE</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-danger btn-block"
							onclick="javascript:history.back()">CANCEL</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
 
</form>


 

<hr>    
  

   
             
  
	<div class="table-responsive col-sm-12"> 
		<table class="table table-hover">
			<thead> 
				<tr class="danger" >
					<th>ASSIGNEE_NUM</th>
					<th>DEPT_NAME</th>
					<th>POSIT_NAME</th>
					<th>MEM_NAME</th> 
					<th>ASSIGNEE_STATE</th>
					<th>업무 승인 처리</th>
					<th></th>
				</tr> 
			</thead>
			<tbody> 
				<c:forEach items="${alist}" var="row">
				<tr>
				<td>${row.ASSIGNEE_NUM}</td>
				<td>${row.DEPT_NAME}</td>
				<td>${row.POSIT_NAME}</td>
				<td>${row.MEM_NAME}</td>   
				<td>${row.ASSIGNEE_STATE}</td>  
				<td> 
				<button data-toggle="collapse" data-parent="#accordion" href="#collapse${row.ASSIGNEE_NUM}" class="form-control btn btn-primary">상세보기</button>           
				</td>
				<td>    
					<form action='<c:url value="/task/assignee_update_state" />' onsubmit="return alram_Send('task/${row.ASSIGNEE_ASSIGNEE}//1');">
						<input type="hidden" name="assignee_num" value="${row.ASSIGNEE_NUM}">  
						<input type="hidden" name="task_num" value="${vo.task_num}" />
						<button class="form-control btn btn-primary" type="submit">승인</button>           
					</form>
				</td>
				</tr>
		 		<!-- detail -->     
				<tr>         
				<td colspan="7">           
		            <div id="collapse${row.ASSIGNEE_NUM}" class="panel-collapse collapse well well-lg" style="background-color: rgba(188, 214, 234, 0.5)">
		            <%-- <textarea rows="5"  class="form-control has-success" readonly="readonly">${row.ASSIGNEE_COMMENT}</textarea>  --%>
		            ${row.ASSIGNEE_COMMENT}
		            </div>
				</td>
				</tr>
					
				</c:forEach>
				</tbody>
		</table>
	</div>   
			    
	
 
<!--/. table-responsive  -->
<div class="col-sm-12">
	<div class="form-group">      
		<a href="<c:url value='/task/list'/>"  class="btn btn-primary">LIST 이동</a>
	</div>
</div>