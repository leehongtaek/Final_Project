<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<title>PAGE[report_workflow_list]</title>
<!-- Resoures 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/resources/plugin/sweetalert/dist/sweetalert.min.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/sweetalert/dist/sweetalert.css'/>">
	
<script type="text/javascript">
/* 승인자 가져오기  */
 function getApprMember(num){
	$.ajax({
		type : "GET",
		url : "<c:url value='/report/apprMember.json/' />",
		data: {report_num : num},
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			
			$("#apprMember"+num+" pre").remove();     
			$.each(resultData, function(index, value) {
				console.log(value.APPR_STATE);
				if (value.APPR_STATE == '1') {
					$("#apprMember"+ value.REPORT_NUM).append(
							'<pre>'+ value.MEM_NAME+ '	['+ value.APPR_TURN
						+ ']<br />  <span class="testEle" style="font-weight : bold; color: red"> 결제중 </span></pre>');
				}else if(value.APPR_STATE == '2'){
					$("#apprMember"+ value.REPORT_NUM).append(
							'<pre>'+ value.MEM_NAME+ '	['+ value.APPR_TURN
						+ ']<br />  <span style="font-weight : bold; color: #00A2E8;">결제완료</span></pre>');
				}else if(value.APPR_STATE == '3'){
					$("#apprMember"+ value.REPORT_NUM).append(
							'<pre>'+ value.MEM_NAME+ '	['+ value.APPR_TURN
						+ ']<br />  <span class="testEle" style="font-weight : bold; color: #FF7F27;">반려</span></pre> <input type="hidden" id="mem_code" value="'+value.MEM_CODE+'"/>');
				}else{
					 $("#apprMember" + value.REPORT_NUM).append(
								'<pre>'+ value.MEM_NAME+'	[' +value.APPR_TURN+']</pre>');
				}
			});
		}
	});
}
 setInterval(function() {
		$(".testEle").toggle();
 }, 250);
 
 /* 전체문서 선택하면 선택값 남게 */
 $(function(){
	var workflowType = $("#workflowType").val();
	if(workflowType == 1) {
		$("#dropdown button span").remove();
		$("#dropdown button").append('<span class="glyphicon glyphicon-play" aria-hidden="true"></span>진행중인 문서');
	}else if (workflowType == 2) {
		$("#dropdown button span").remove();
		$("#dropdown button").append('<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>최종승인 문서');
	}else if (workflowType == 3) {
		$("#dropdown button span").remove();
		$("#dropdown button").append('<span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>반려 문서');	
	}else if (workflowType == 4) {
		$("#dropdown button span").remove();
		$("#dropdown button").append('<span class="glyphicon glyphicon-file" aria-hidden="true"></span>전체문서');
	}
	

 });
 
 
 
 
 
 //다시 제출 버튼
 function reApprovalBtn(url){
	 swal({  title: "다시 제출 하시겠습니까?",   
			text: "",    
			type: "info",   
			showCancelButton: true,  
			allowEscapeKey: true,
			allowOutsideClick : true,
			confirmButtonColor: "#2196F3",   
			confirmButtonText: "제출",   
			cancelButtonText:"취소",
			closeOnConfirm: false}, 
			function(){
				 swal({ title: "제출완료!!",
					    text:"",
					    type:"success",
					    allowEscapeKey: false},
					 function(){
					     //제출자 memCode
					   	 var reApprovalMem = $('#mem_code').val();
					   	 alram_Send('report/'+reApprovalMem+'/'+'승인 할 보고서/'+'0');
					   	 location= url;
					 });
				}); 
	
 }
 
 /* 기안 취소 버튼  */
 function approvalCanceBtn(url){
	 swal({  title: "기안 취소 하시겠습니까?",   
			text: "",    
			type: "warning",   
			showCancelButton: true,  
			allowEscapeKey: true,
			allowOutsideClick : true,
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "기안 취소",   
			cancelButtonText:"취소",
			closeOnConfirm: false}, 
			function(){
				 swal({ title: "취소완료!!",
					    text:"",
					    type:"success",
					    allowEscapeKey: false},
					 function(){
					   	location= url;
					 });
				}); 
 }
 
</script>
<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> REPORT WORKFLOW LIST</span>
			</h3>
		</div>
				<input type="hidden" id="workflowType" value="${workflowType}" />
			
		
		<div class="panel-body">
			<!-- 드랍 다운 -->
			<div class="dropdown" id="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button"
					id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					<span class="glyphicon glyphicon-file" aria-hidden="true">전체문서
					</span>
				</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="<c:url value='/report/report_workflow_list/4'/>"><span
							class="glyphicon glyphicon-file" aria-hidden="true"></span>전체문서</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="<c:url value='/report/report_workflow_list/1'/>"><span
							class="glyphicon glyphicon-play" aria-hidden="true"></span>진행중인
							문서</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="<c:url value='/report/report_workflow_list/2'/>"><span
							class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>최종승인
							문서</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="<c:url value='/report/report_workflow_list/3'/>"><span
							class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>반려
							문서</a></li>
				</ul>
			</div>

			<!-- 드랍다운 -->




			<!-- 임시 저장 보고서 테이블 시작 -->
			<div class="table-responsive">
				<table class="table table-responsive">
					<thead>
						<tr class="success">
							<th>#</th>
							<th></th>
							<th>제목</th>
							<th>작성자</th>
							<th>제출일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="listv" items="${list}">
							<tr>
								<td>${listv.report_num}</td>

								<c:if test="${listv.report_state == 1}">
									<td><button class="btn btn-primary" type="button"
											data-toggle="collapse"
											data-target="#collapse${listv.report_num}"
											aria-expanded="false"
											aria-controls="collapse${listv.report_num}" 
											onclick="getApprMember('${listv.report_num}')">
											<span class="glyphicon glyphicon-play" aria-hidden="true"
												data-toggle="tooltip" data-placement="top" title="진행중"></span>
										</button></td>
								</c:if>
								<c:if test="${listv.report_state == 2}">
									<td><button class="btn btn-success" type="button"
											data-toggle="collapse"
											data-target="#collapse${listv.report_num}"
											aria-expanded="false"
											aria-controls="collapse${listv.report_num}"
											onclick="getApprMember('${listv.report_num}')">
											<span class="glyphicon glyphicon-ok-circle"
												aria-hidden="true" data-toggle="tooltip"
												data-placement="top" title="완료"></span>
										</button></td>
								</c:if>
								<c:if test="${listv.report_state == 3}">
									<td><button class="btn btn-danger" type="button"
											data-toggle="collapse"
											data-target="#collapse${listv.report_num}"
											aria-expanded="false"
											aria-controls="collapse${listv.report_num}"
											onclick="getApprMember('${listv.report_num}')">
											<span class="glyphicon glyphicon-ban-circle"
												aria-hidden="true" data-toggle="tooltip"
												data-placement="top" title="반려"></span>
										</button></td>
								</c:if>
								<td>${listv.report_title}</td>
								<td>${listv.mem_name}</td>
								<td>${listv.report_subdate}</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="collapse" id="collapse${listv.report_num}">
										<div class="col-sm-12" >
										<span class="col-sm-2" id="apprMember${listv.report_num}" 
										style="border: 1px solid rgb(172, 204, 214);">
											결제라인
											<br />
											<br />
											
												
													<!-- <pre>김선우	[1]<strong style="color: red">결제중</strong></pre>
														<pre>김병기	[2]</pre>
														<pre>이홍택	[3]</pre> -->
														
										</span>
											
											<span class="col-sm-10">
												<c:choose>
													<c:when test="${listv.report_state == 1}"> 
														<button type="button" class="btn btn-danger col-sm-2" 
														onclick="approvalCanceBtn('<c:url value='/report/approval_refuse_ok/approvalCance/${listv.report_num}'/>')">기안 취소</button>
														
													</c:when>
													<c:when test="${listv.report_state == 2}">
														<button type="submit" class="btn btn-primary col-sm-2" 
														onclick="goUrl('')">완료된 보고서</button>
														
													</c:when>
													<c:when test="${listv.report_state == 3}">
														<button type="button" class="btn btn-primary col-sm-2" 
														onclick="reApprovalBtn('<c:url value='/report/approval_refuse_ok/refuseCancel/${listv.report_num}'/>')">다시 제출</button>
														
														<button type="button" onclick="goUrl('<c:url value='/report/approval_refuse_ok/reportModify/${listv.report_num}'/>')" 
														class="btn btn-success col-sm-2 col-sm-offset-1">수정</button>
														
														<button type="button" class="btn btn-danger col-sm-2 col-sm-offset-1" 
														onclick="approvalCanceBtn('<c:url value='/report/approval_refuse_ok/approvalCance/${listv.report_num}'/>')">기안 취소</button>
														
													</c:when>
													<c:otherwise></c:otherwise>
													
												</c:choose>
												<br /><br />
												${listv.report_content}
											</span>	
										</div>
									</div>
								</td>

							</tr>


						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 테이블 끝  -->

		</div>
	</div>
</div>
