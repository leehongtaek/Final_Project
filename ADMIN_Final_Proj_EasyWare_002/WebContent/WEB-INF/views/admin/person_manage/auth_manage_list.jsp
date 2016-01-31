<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<script>
function auth_input_modal(code,id,auth) {
	$('#mem_code').val(code);
	$('#mem_id').val(id);
	$('#role_auth').val(auth);
}

function auth_update() {
	
	var code =$('#mem_code').val();
	var id =$('#mem_id').val();
	var role = $('#role_auth').val();
		role  = role.toString();
		console.log(role);
	$.ajax({
		type : "POST",
		url : "authManager/update",
		data : {
			mem_code : code,
			mem_id : id,
			role_auth : role
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			 // console.log(resultData);
			
		}

	});	
	setTimeout(function(){window.location.reload(true);}, 300);
	
}

</script>


<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title"> MEMBER MANAGER LIST</h3>
	</div>
	<div class="panel-body">
		<h3> 권한 정보 관리 </h3> 	 
		<form action="<c:url value='/authMangager/insert'/>" method="post">
			<!-- <span> 권한 부여자 :</span>
			<input type="text" name="" placeholder="사원 코드"/> 	 
			<input type="text" name="" placeholder="사원 ID"/> 	
			<input type="text" name="" placeholder="권한 부여"/> 	 
			<button type="submit" class="btn btn btn-success">
		  	<span class="glyphicon glyphicon-plus"></span>권한 부여</button> -->
		</form>
		
	</div>
</div>

<hr>
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th>#</th> 
			<th>부서</th> 
			<th>직급</th>
			<th>사원이름</th>
			<th>사원코드</th>
			<th>사원ID</th>
			<th>권한</th>
			<th>수정</th>
 		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="row" >
		<tr>
			<td></td>
			<td>${row.dept_name}</td>
			<td>${row.posit_name}</td>
			<td>${row.mem_name}</td> 
			<td>${row.mem_code}</td>
			<td>${row.mem_id}</td>
			<td>${row.role_auth}</td>
			<td><button class="btn btn-primary" type="button" 
				onclick="auth_input_modal('${row.mem_code}','${row.mem_id}','${row.role_auth}')" data-toggle="modal" data-target="#auth_update">
				<span class="glyphicon glyphicon-plus" ></span></button>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table> 
<div class="row"> 
<form action="<c:url value='/personManager/search'/>" method="get"> 
		<div class="form-group" >
			<div class="col-sm-2" >
				<select class="form-control" name="searchType">
					<option value="">-- 선택 --</option>
					<option value="1"> 사원이름 </option>
					<option value="2"> 부서명 </option>
					<option value="3"> 직급명 </option>
				</select>
			</div>
			<div class="has-success col-sm-3">
				<input type="search" class="form-control" name="searchValue" placeholder="Search" >
			</div> 	
			<div class="col-sm-3">
				<button type="submit" class="btn btn-success">  검 색 </button>
			</div>
		</div>
</form>
</div>

<!-- paging start -->
<!-- 페이징 시 데이터 없을때는 페이지 하지 않게 함 -->
<c:if test="${pagingData !=null && pagingData.page_sno > 0}">
<div align="center">
	<ul class="pagination">
		<li> 
		<a href="<c:url value='/authManager?currentpage=${pagingData.prev_pageno}'/>">«</a></li>
		<c:forEach var="iter" begin="${pagingData.page_sno}" end="${pagingData.page_eno}">
		<li id="pagination">
		<a href="<c:url value='/authManager?currentpage=${iter}'/>"><b>${iter}</b></a></li>
		</c:forEach>
		<li><a href="<c:url value='/authManager?currentpage=${pagingData.next_pageno}'/>">»</a></li>
		</ul>
		
</div>
</c:if>
<!-- paging end -->
	



<form action="<c:url value='/authManager/update'/>" method="post">
<!-- 권한 수정 Modal Start-->
<div class="modal fade" id="auth_update" tabindex="-1" role="dialog" aria-labelledby="auth_updateLabel" aria-hidden="true">
  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="auth_updateLabel"> 직급명수정 </h4>
	      </div>
	      <div class="modal-body">
	          
	          <div class="form-group">
	          	<input  type="hidden" id="mem_code" name="mem_code"/>
	          	<input  type="hidden" id="mem_id"  name="mem_id"/>
	          	<h5>권 한 :</h5>
	          	<input class="form-control" type="text" id="role_auth" name="role_auth" placeholder="권한 부여"/> 
	          </div>
	         
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="auth_update()">Save</button>
	      </div>
	    </div>
	  </div>
</div>
<!-- 권한 수정 Modal End-->
</form>
