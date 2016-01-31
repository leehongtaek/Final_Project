<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<script>

var num;
var modal_text
function dept_num_input(n,text) {
	num = n;
	$("#dept_name").val(text);
}

function dept_update() {
	
	var name=$('#dept_name').val();
	// console.log("LOG name :::: "+name);
	// console.log("LOG num :::"+num );
	$.ajax({
		type : "POST",
		url : "deptMangager/update",
		data : {
			dept_num : num,
			dept_name : name
			 
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			console.log(resultData);
			
		}

	});	
	 setTimeout(function(){window.location.reload(true);}, 300);
}	

function dept_delate() {
	
	
	
	console.log("LOG num :::"+num );
	$.ajax({
		type : "POST",
		url : "deptMangager/delete",
		data : {
			dept_num : num,
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
		<h3 class="panel-title"> DEPARTMENT MANAGER LIST</h3>
	</div>
	<div class="panel-body">
		<h3> 부서 정보 관리 </h3>
		<form action="<c:url value='/deptMangager/insert'/>" method="post">
			<span> 부서명 :</span>
			<input type="text" name="dept_name" /> 	
			<button type="submit" class="btn btn btn-success">
		  	<span class="glyphicon glyphicon-plus"></span>부서 추가</button>
		</form>
	</div>
</div>

<hr>
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th> # </th>
			<th>DEPT NUM</th>
			<th>DEPT NAME</th>
			<th>수정 / 삭제 </th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="row" >
		<tr>
			<td></td>
			<td>${row.DEPT_NUM}</td>
			<td>${row.DEPT_NAME}</td>
			<td>
			<button type="button" class="btn btn-default btn-sm" data-toggle="modal"
			 onclick="dept_num_input('${row.DEPT_NUM}','${row.DEPT_NAME}')"
			 data-target="#dept_Name_Update_Modal">
	  		<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span></button>
			<button type="button" class="btn btn-default btn-sm" 
			 onclick="dept_num_input('${row.DEPT_NUM}')"
			 data-toggle="modal" data-target="#dept_Delate_Modal" >
	  		<span class="glyphicon glyphicon-remove"></span>
	  		</button> 
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<hr>

<!-- 부서 수정 Modal Start-->
<div class="modal fade" id="dept_Name_Update_Modal" tabindex="-1" role="dialog" aria-labelledby="etcModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="etcModalLabel"> 부서명수정 </h4>
      </div>
      <div class="modal-body">
          
          <div class="form-group">
          	
            <label for="message-text" class="control-label"></label>
            <input type="text" class="form-control" id="dept_name"  />
          </div>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="dept_update()">Save</button>
      </div>
    </div>
  </div>
</div>

<!-- 부서 수정 Modal End-->


<!-- 부서 삭제 Modal Start-->
<div class="modal fade" id="dept_Delate_Modal" tabindex="-1" role="dialog" aria-labelledby="dept_Delate_ModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dept_Delate_ModalLabel"> 부서 삭제 </h4>
      </div>
      <div class="modal-body">
        단 ,해당 부서에 속한 사원이 있으면 삭제 불가능 
      	<h4> 정말로 부서를 삭제하시겠습니까?</h4>
      		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger" 
        onclick="dept_delate()"
        data-dismiss="modal"  >DELETE</button>
      </div>
    </div>
  </div>
</div>
<!-- 부서 삭제 Modal End-->