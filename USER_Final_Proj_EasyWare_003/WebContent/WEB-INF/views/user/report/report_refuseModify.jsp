<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/resources/plugin/sweetalert/dist/sweetalert.min.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/sweetalert/dist/sweetalert.css'/>">

<title>PAGE[report_add_detail]</title>

<script>
	$(function() {
		CKEDITOR.replace('report_content', {
			height : '700px'
		});
	});

	/* 보고서 수정 버튼  */
	function reportModifyBtn(){
		swal({  title: "문서를 수정 하시겠습니까?",   
		text: "",    
		type: "info",   
		showCancelButton: true,  
		allowEscapeKey: true,
		allowOutsideClick : true,
		confirmButtonColor: "#2196F3",   
		confirmButtonText: "수정",   
		cancelButtonText:"취소",
		closeOnConfirm: false}, 
		function(){
			 swal({ title: "수정완료!!",
				    text:"",
				    type:"success",
				    allowEscapeKey: false},
				 function(){
			    	
			    	$('#formFun').submit();
				 });
			});
	}
	
</script>
<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> 반려 수정</span>
			</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal"
				action="<c:url value='/report/report_refuseModify_ok'/>" method="post"
				role="form" id="formFun">
				<input type="hidden" class="form-control"
					value="${sessionScope.mem_code}" id="report_writer"
					name="report_writer" /> <input type="hidden" class="form-control"
					value="${vo.report_num}" id="report_num" name="report_num" />

		
				<!-- 지정된 승인자 시작!!!  -->
				<div class="panel panel-default col-sm-12">
					<div class="panel-heading">
						<h5>
							<strong>업무 승인자</strong>
						</h5>
					</div>
					<div class="panel-body">
						<table class="table table-hover table-responsive">
							<thead>
								<tr class="success">
									<th>사원이름</th>
									<th>부서</th>
									<th>직위</th>
									<th>결재라인</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="listv" items="${list}" varStatus="status">
									<tr>
										<td>${listv.MEM_NAME}</td>
										<td>${listv.DEPT_NAME}</td>
										<td>${listv.POSIT_NAME}</td>
										<c:choose>
											<c:when test="${status.last}">
												<td>최종승인자</td>
											</c:when>
											<c:otherwise>
												<td>${listv.APPR_TURN}</td>
											</c:otherwise>
										</c:choose>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 지정된 승인자 시작!!!  -->


				<div class="form-group">
					<div class="col-sm-7">
						<input type="text" class="form-control" id="report_title"
							name="report_title" value="${vo.report_title}"
							required="required">
						<input type="hidden" name="report_num" value="${vo.report_num}" />
					</div>
				</div>

				<!--   start ckeditor -->
				<div class="form-group">
					<div class="col-sm-12">
						<textarea name=report_content id="report_content"
							class="form-control" rows="20">${vo.report_content}</textarea>
					</div>
				</div>
				<!--  end ckeditor -->
				<div class="form-group">
					<div class="col-sm-10">
						<button type="button"
							class="btn btn-warning col-sm-2"
							onclick="reportModifyBtn()">수정</button>
						<button type="button"
							class="btn btn-danger col-sm-2 col-sm-offset-1"
							onclick="goUrl('<c:url value='/report/report_workflow_list/4'/>')">취소</button>
					</div>
				</div>
			</form>



		</div>
	</div>
</div>
