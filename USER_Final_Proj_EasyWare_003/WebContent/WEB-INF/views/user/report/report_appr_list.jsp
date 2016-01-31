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

	/*총 결재자 넣을 변수  */
	var memVal = "";	
	
	/* 결재자 가져오기  */
	function getApprMember(num){
	$.ajax({
		type : "GET",
		url : "<c:url value='/report/apprMember.json/' />",
		data: {report_num : num},
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			//기존 결재자 삭제
			$("#apprMember"+num+" pre").remove();     
			$.each(resultData, function(index, value) {
				 //결재자 길이값 확인
				console.log("resultData : "+resultData.length);
				memVal = resultData.length;
				//결재자의 결재상태에 따라 태그 입력
				if (value.APPR_STATE == '1') {
					$("#apprMember"+ value.REPORT_NUM).append(
							'<pre>'+ value.MEM_NAME+ '	['+ value.APPR_TURN
											+ ']<br />  <span class="testEle" style="font-weight : bold; color: red"> 결재중 </span></pre>').append('<input type="hidden" id="memCode'+value.MEM_CODE+'" value="'+value.MEM_CODE+'" />');
				}else if(value.APPR_STATE == '2'){
					$("#apprMember"+ value.REPORT_NUM).append(
							'<pre>'+ value.MEM_NAME+ '	['+ value.APPR_TURN
											+ ']<br />  <span style="font-weight : bold; color: #00A2E8;">결재완료</span></pre>').append('<input type="hidden" id="memCode'+value.MEM_CODE+'" value="'+value.MEM_CODE+'" />');
				}else{
					 $("#apprMember" + value.REPORT_NUM).append(
								'<pre>'+ value.MEM_NAME+'	[' +value.APPR_TURN+']</pre>').append('<input type="hidden" id="memCode'+value.MEM_CODE+'" value="'+value.MEM_CODE+'" />');
				}
			});
		}
	});
}
	/* 깜박이는 글씨들  */
	setInterval(function() {
		$(".testEle").toggle();
	}, 250);

	/* 
		레포트 승인버튼 
		승인할 때 알람 처리 
	*/
	 function reportApprovalBtn(){
		 swal({  title: "정말 승인 하시겠습니까?",   
				text: "",    
				type: "info",   
				showCancelButton: true,  
				allowEscapeKey: true,
				allowOutsideClick : true,
				confirmButtonColor: "#2196F3",   
				confirmButtonText: "승인",   
				cancelButtonText:"취소",
				closeOnConfirm: false}, 
				function(){
					 swal({ title: "승인완료!!",
						    text:"",
						    type:"success",
						    allowEscapeKey: false},
						 function(){
						    	var session_memcode = $("#session_memcode").val();
								var myCode = $("#memCode" + session_memcode).val();
								var reportWriter = $("#report_writer").val();
								var nextCode = $("#memCode" + myCode + "+ pre + input").val();
								var apprTurn = $("#appr_turn").val();
								/* memVal 총 결재자수 와 apprTurn 자신의 턴이 같으면 승인 완료 알람  */
								if( apprTurn == memVal) {
									alram_Send('report/'+reportWriter+'/'+'승인 완료/'+'1');
								/* 아니면 다음 사람에게 알람  */
								}else{
									alram_Send('report/'+nextCode+'/'+'승인 할 보고서/'+'0');
								}
								$('#formFun').submit();
						 });
					});
	   	}  
	
	 /* 반려 버튼 및 알람  */
	 function reportRefuseBtn(url){
		 swal({  title: "반려 하시겠습니까?",   
				text: "",    
				type: "warning",   
				showCancelButton: true,  
				allowEscapeKey: true,
				allowOutsideClick : true,
				confirmButtonColor: "#DD6B55",   
				confirmButtonText: "반려",   
				cancelButtonText:"취소",
				closeOnConfirm: false}, 
				function(){
					 swal({ title: "반려완료!!",
						    text:"",
						    type:"success",
						    allowEscapeKey: false},
						 function(){
					    	 var refuseMem = $('#report_writer').val();
							 alram_Send('report/'+refuseMem+'/'+'반려 된 보고서/'+'1');
							 location= url;
						 });
					}); 
		
	 }
	
	     
</script>

<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> REPORT APPR LIST</span>
			</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal"
				action="<c:url value='/report/approval_modify_ok'/>" method="post"
				role="form" id="formFun">

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
								<!-- form 태그 ==============================================================-->

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
									<td>${listv.mem_name}<input type="hidden"
										id="report_writer" value="${listv.report_writer}" />
									</td>

									<td>${listv.report_subdate}</td>
								</tr>
								<tr>
									<td colspan="5">
										<div class="collapse" id="collapse${listv.report_num}">
											<div class="col-sm-12">
												<span class="col-sm-2" id="apprMember${listv.report_num}"
													style="border: 1px solid rgb(172, 204, 214);"> 결재라인
													<br /> <br />

												</span> <span class="col-sm-10"> <input type="hidden"
													name="appr_state" value="${listv.appr_state}" /><input type="hidden"
													name="report_num" value="${listv.report_num}" /> <input
													type="hidden" name="appr_turn" id="appr_turn"
													value="${listv.appr_turn}" /> <input type="hidden"
													name="report_state" value="${listv.report_state}" />

													<button type="button" class="btn btn-success col-sm-2"
														onclick="reportApprovalBtn()">승인</button>
													
													<button type="button"
														onclick="reportRefuseBtn('<c:url value='/report/approval_refuse_ok/refuse/${listv.report_num}'/>')"
														class="btn btn-danger col-sm-2 col-sm-offset-1">반려</button>
													<br /> <br /> ${listv.report_content}
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
			</form>
		</div>
	</div>
</div>
