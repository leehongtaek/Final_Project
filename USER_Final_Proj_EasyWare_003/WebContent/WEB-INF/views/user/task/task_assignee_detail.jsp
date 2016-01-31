<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<title>PAGE[PROFILE]</title>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('assignee_comment');
	});
</script>  

<style>               

.btn-danger{ background-color:  rgba(229, 28, 35, 0.86);} 
label strong {font-size: 1.4em;}                                    
.form-horizontal .control-label {padding-top: 1px;  }          
                                                  
</style>    

<div class="col-sm-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="collapsed" role="button" data-toggle="collapse"        
				data-parent="#accordion" href="#collapsetask" aria-expanded="true"
				aria-controls="collapsetask" style="color: white;">TASK 부여 리스트</h3>
		</div>    
		<div id="collapsetask" class="collapse in" role="tabpanel"
			aria-labelledby="headingThree">
			<div class="panel-body">
				<div class="form-horizontal">                     
					<div class="form-group">
						<label class="control-label col-sm-3" for="name"><strong>TASK 제목:</strong></label>
						<div class="col-sm-5">
							<input type="text" class="form-control"
								value="${vo.TASK_TITLE}" readonly="readonly" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3" for="name"><strong>TASK 등록일:</strong></label>
						<div class="col-sm-6">
							<input type="text" class="form-control"
								value="${vo.TASK_DATE}" readonly="readonly" />
						</div>
					</div>

					<br>
					<div class="form-group">
						<label class="control-label col-sm-3" for="name"><strong>TASK 기간</strong> </label>
						<div class="col-sm-2"> 
							<input type="text" class="form-control" id="task_start"
								value="${vo.TASK_START}" readonly="readonly" />
						</div>
						<label class="control-label col-xs-1" for="name"><span>
								~ </span></label>
						<div class="col-sm-2">          
							<input type="text" class="form-control" id="task_end"
								value="${vo.TASK_END}" readonly="readonly" />
						</div>
					</div>

					<br>  
					<div class="form-group">
						<label class="control-label col-sm-3" for="name"><strong>TASK 설명 </strong></label>
						<div class="col-sm-7">
							<textarea class="form-control well" cols="5" rows="5"
								readonly="readonly" id="task_description"
								style="background-color: rgba(203, 230, 204, 0.54);">${vo.TASK_DESCRIPTION}</textarea>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


<form action="<c:url value='/task/assignee_update/' />" method="post">

	<div class="form-group has-success">
		<h5 class="control-label col-sm-12" for="name">업 무 보 고</h5>
		<input type="hidden" name="assignee_num" value="${vo.ASSIGNEE_NUM}">
		<div class="col-sm-12">
			<textarea name="assignee_comment" class="form-control" cols="4"
				rows="5">${vo.ASSIGNEE_COMMENT}</textarea>
		</div>
	</div>

	<hr>
	<br>

 
	<div class="form-group">    
		<div class="col-sm-2">    	
			<button type="submit" class="btn btn-success btn-block input-sm">UPDATE</button>
		</div>      
		<div class="col-sm-2">      
			<button type="button" class="btn btn-danger btn-block input-sm"
				onclick="javascript:history.back()">CANCEL</button>
		</div> 
		
	</div>

</form>


