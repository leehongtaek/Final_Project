	<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<script type="text/javascript">
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

</script> 
<title>PAGE - MENU [NAME]</title>
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
<div class="col-sm-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">TASK LIST</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive col-sm-12">
				<table class="table table-hover table-striped table-condensed">
					<thead>    
						<tr class="warning">
							<th>번호</th>
							<th>제목</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>상태</th>
							<th>등록일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="row">
							<tr> 
								<td>${row.task_num}</td>    
								<td><a href="<c:url value='/task/detail?task_num=${row.task_num}' />">
						 				<strong>${row.task_title}</strong></a>
						 		</td>
								<td>${row.task_start}</td>
								<td>${row.task_end}<td> 
								<c:if test="${row.task_state == 'Y'}">
								<a class="btn"><span class="glyphicon glyphicon-ok-circle"></span></a>
					 			</c:if>   
								<c:if test="${row.task_state == 'N'}">
								<a class="btn"><span class="glyphicon glyphicon-remove-circle"></span></a> 
								</c:if>
								</td>
								<td>${row.task_date}</td> 
								<td> 
								<form action='<c:url value="/task/task_delete"/>' method="post"> 
								<input type="hidden" name="task_num" value="${row.task_num}">  
								<button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
								</form>
								</td>
 

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
           
                      
<button class="btn btn-primary" type="button" data-toggle="collapse"
	data-target="#collapse_search" aria-expanded="false"
	aria-controls="collapse_search">
	<span class="glyphicon glyphicon-search">검색</span>
</button>  

<form action="<c:url value='/task/search_task'/>" method="get">
<div class="collapse" id="collapse_search">
	<div class="panel panel-primary">         
		<div class="panel-heading">     
			 <h6 style="color: white;">상세 검색</h6> 
		</div>
		<div class="panel-body"> 
			<div class="row">
				<div class="form-group form-horizontal has-primary">
	   			
					<div class="col-sm-12">
						
						<div class="col-sm-5">
							<h6> 업무 승인 여부: <input type="checkbox" name="task_state">  </h6>
						</div> 
					</div>
	
	                
					
					<div class="col-sm-12">
						<div class="col-sm-1">
							<h6>기간:</h6>  
						</div>     
						<div class="col-sm-4">
							<input type="text" class="datepicker form-control" name="start_time"/>
						</div>
						<div class="col-sm-1">  
							<span>~</span> 
						</div>
						<div class="col-sm-4">  
							<input type="text" class="datepicker form-control" name="end_time"/>
						</div>
					</div>  
					
					
					<div class="col-sm-12">                   
				 		<div class="col-sm-2">
							<h6>검색어: </h6>      
						</div>                          
						<div class="col-sm-4">
							<select class="form-control" name="searchType">
								<option value="0">-- 선택 --</option>
								<option value="1">제목</option>
								<option value="2">내용</option>  
								<option value="3">제목+내용</option>
							</select>
						</div>
						<div class="has-primary col-sm-3">
							<input type="search" class="form-control" name="searchValue"
								placeholder="Search">
						</div>
						<div class="col-sm-3">
							<button type="submit" class="btn btn-primary">검 색</button>
						</div>  
					</div>
	
				</div>
			</div>
		</div>
	</div>
</div>

</form>




<!-- PAGING START -->
<c:if test="${pagingData !=null && pagingData.page_sno > 0}">
	<div align="center">
		<ul class="pagination">
			<li><a href="<c:url value='/task/list?currentpage=${pagingData.prev_pageno}'/>" >«</a></li>
				<c:forEach var="iter" begin="${pagingData.page_sno}" end="${pagingData.page_eno}">
				<li id="pagination"><a href="<c:url value='/task/list?currentpage=${iter}' />" ><b>${iter}</b></a></li>
				</c:forEach>
				<li><a href="<c:url value='/task/list?currentpage=${pagingData.next_pageno}'/>">»</a></li>
			</ul>
	</div>
</c:if>
<!-- /.PAGING END -->	
