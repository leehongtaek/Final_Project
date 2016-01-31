<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<script>

var num;
var modal_text
function posit_num_input(n,text) {
	num = n;
	console.log("LOG NUM :::: "+n);
	console.log("LOG text :::: "+text);
	$("#posit_name").val(text);
}

function dept_update() {
	
	var name=$('#posit_name').val();
	console.log("LOG name :::: "+name);
	console.log("LOG num :::"+num );
	$.ajax({
		type : "POST",
		url : "positManager/update",
		data : {
			posit_num : num,
			posit_name : name
			 
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			console.log(resultData);
			
		}

	});	
	 setTimeout(function(){window.location.reload(true);}, 300);
}	

function posit_delate() {
	
	console.log("LOG num :::"+num );
	$.ajax({
		type : "POST",
		url : "positManager/delete",
		data : {
			posit_num : num,
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
		<h3 class="panel-title"> POSITION MANAGER LIST</h3>
	</div>
	<div class="panel-body">
		<h3> 직급 정보 관리 </h3> 
		<form action="<c:url value='/positManager/insert'/>" method="post">
			<span> 직급명 :</span>
			<input type="text" name="posit_name" /> 	
			<button type="submit" class="btn btn btn-success">
		  	<span class="glyphicon glyphicon-plus"></span>직급 추가</button>
		</form>	
	</div>
</div>

<hr>
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th> # </th>
			<th>POSITION NUM</th>
			<th>POSITION NAME</th>
			<th>수정 / 삭제 </th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="row" >
		<tr>
			<td></td>
			<td>${row.POSIT_NUM}</td>
			<td>${row.POSIT_NAME}</td>
			<td>
			<button type="button" class="btn btn-default btn-sm" data-toggle="modal"
			 onclick="posit_num_input('${row.POSIT_NUM}','${row.POSIT_NAME}')"
			 data-target="#posit_Name_Update_Modal">
	  		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
			<button type="button" class="btn btn-default btn-sm" data-toggle="modal"
			 onclick="posit_num_input('${row.POSIT_NUM}')"
			 data-target="#posit_Delate_Modal" >
	  		<span class="glyphicon glyphicon-remove"></span>
	  		</button> 
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<hr>

<!-- 직급 수정 Modal Start-->
<div class="modal fade" id="posit_Name_Update_Modal" tabindex="-1" role="dialog" aria-labelledby="posit_Name_Update_ModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="posit_Name_Update_ModalLabel"> 직급명수정 </h4>
      </div>
      <div class="modal-body">
          
          <div class="form-group">
          	
            <label for="message-text" class="control-label"></label>
            <input type="text" class="form-control" id="posit_name"  />
          </div>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="dept_update()">Save</button>
      </div>
    </div>
  </div>
</div>

<!-- 직급 수정 Modal End-->


<!-- 직급 삭제 Modal Start-->
<div class="modal fade" id="posit_Delate_Modal" tabindex="-1" role="dialog" aria-labelledby="posit_Delate_ModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="posit_Delate_ModalLabel"> 직급 삭제 </h4>
      </div>
      <div class="modal-body">
        단 ,해당 직급에 속한 사원이 있으면 삭제 불가능 
      	<h4> 정말로 직급을 삭제하시겠습니까?</h4>
      		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger" 
        onclick="posit_delate()"
        data-dismiss="modal"  >DELETE</button>
      </div>
    </div>
  </div>
</div>
<!-- 직급 삭제 Modal End-->