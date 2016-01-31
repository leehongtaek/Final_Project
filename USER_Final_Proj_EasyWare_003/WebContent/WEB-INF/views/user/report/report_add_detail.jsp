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

	/* 직위 가져오기  */
	$(function() {
		$.ajax({
			type : "GET",
			url : "<c:url value='/user/positInfo.json' />",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(resultData) {

				$.each(resultData, function(index, value) {
					$("#posit_num").append(
							'<option value='+value.POSIT_NUM+'>'
									+ value.POSIT_NAME + '</option>');

				});
			}
		});
	});

	/* 부서 가져오기  */
	$(function() {
		$.ajax({
			type : "GET",
			url : "<c:url value='/user/deptInfo.json' />",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(resultData) {

				$.each(resultData, function(index, value) {
					$("#dept_num").append(
							'<option value='+value.DEPT_NUM+'>'
									+ value.DEPT_NAME + '</option>');
				});
			}
		});
	});

	$(function() {

		$('#report_list').click(
				function() {
					return !$('#report_list option:selected').remove()
							.appendTo('#report_list_selected');
				});
		$('#report_list_selected').click(
				function() {
					return !$('#report_list_selected option').remove()
							.appendTo('#report_list');
				});
	});

	/* 승인자 가져오기  */
	function search_user_list() {
		var datas  = {};
		var namev = $('#search_user').val();
		var dept_numv = $('#dept_num option:selected').val();
		var posit_numv = $('#posit_num option:selected').val();
		
		if(namev !="") datas['mem_name']=namev; 
		if(dept_numv !="") datas['dept_num']=dept_numv;          
		if(posit_numv !="") datas['posit_num']=posit_numv; 
		
		$.ajax({
			type : "GET",
			url : "<c:url value='/user/user_search_List.json' />",
			data : datas,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(resultData) {

				$.each(resultData, function(index, value) {
					$("#report_list option:eq(" + index + ")").remove();
					$("#report_list").append(
							'<option value='+value.MEM_CODE+'>'
									+  value.POSIT_NAME + ' | ' + value.MEM_NAME
									+ ' | ' + value.DEPT_NAME + '</option>');
				});
			}
		});

	}
	/*보고서 제출 버튼  */	
	 function reportSubmitBtn(){
		 swal({  title: "작성하신 문서를 제출 하시겠습니까?",   
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
					    	// 첫번째 승인할 member 에게 알람  
					    	var firstMem = $('#report_list_selected option:first').val();
					    	alram_Send('report/'+firstMem+'/'+'승인 할 보고서/');
					    	
					    	//제출하기 버튼 누르면 report_state를 1로 변경하고 submit 수행  
					    	$('#report_state').val('1');
					    	$('#formFun').submit();
						 });
					});
		}
	 
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
	/* 보고서 삭제 버튼  */
	function reportDelteBtn(url){
			swal({  title: "현재 문서를 삭제 하시겠습니까?",   
			text: "",    
			type: "warning",   
			showCancelButton: true,  
			allowEscapeKey: true,
			allowOutsideClick : true,
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "삭제",   
			cancelButtonText:"취소",
			closeOnConfirm: false}, 
			function(){
				 swal({ title: "삭제완료!!",
					    text:"",
					    type:"success",
					    allowEscapeKey: false},
					 function(){
					   	location= url;
					 });
				}); 
	}
	/* 결재자 비우기 버튼  */
	function options_Clean() {
		$('#report_list option').remove();
	}
</script>
<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> REPORT ADD DETAIL</span>
			</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal"
				action="<c:url value='/report/report_add_modify_ok'/>" method="post"
				role="form" id="formFun">
				<input type="hidden" class="form-control"
					value="${sessionScope.mem_code}" id="report_writer"
					name="report_writer" /> <input type="hidden" class="form-control"
					value="${vo.report_num}" id="report_num" name="report_num" />

				<!-- 제출시 report_state 값 1로(승인대기) 변경  -->
				<input type="hidden" name="report_state" id="report_state" value="0" />

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

				<!-- 지정된 승인자 시작!!!  -->
				<div class="panel panel-default col-sm-12">
					<div class="panel-body">
						<h5>
							<strong>결재자 검색</strong>
						</h5>

						<!--결재자 지정 패널 시작  -->
						<div class="alert alert-danger col-sm-4" role="alert">
							<span class="glyphicon glyphicon-exclamation-sign"
								aria-hidden="true"></span> <span class="sr-only">Error:</span>
							선택한 순서대로 결재 순서가 정해지며 마지막에 선택한 사원이 최종 결재자입니다.
						</div>
						<!--승인자 지정 패널 끝 -->
						<br />
						<br />
						<br />
						<br />
						<br />
						<div class="form-group">
							<div class="col-sm-6">
								부서 : <select id="dept_num">
									<option value="">-- 선택 --</option>
								</select> 직급 : <select id="posit_num">
									<option value="">-- 선택 --</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-1" for="name">이름 : </label>

							<div class="col-sm-2">
								<input type="text" id="search_user" class="form-control" />
							</div>
							<button type="button" class="btn btn-primary col-sm-2"
								onclick="search_user_list()">search</button>
						</div>


						<!-- <div class="form-group">
					<label class="control-label col-sm-2" for="name"></label>
				</div> -->

						<div class="form-group">
							<div class="col-sm-5">
								<select id="report_list" multiple="multiple"
									class="form-control" style="background-color: #E4F3F5;">
								</select>
							</div>

							<div class="col-sm-1">
								▶▶ <br /> <br />◀◀

							</div>

							<div class="col-sm-5">
								<select id="report_list_selected" name="mem_code"
									multiple="multiple" class="form-control"
									style="background-color: #E4F3F5;">
									<c:forEach var="listv" items="${list}">
										<option value="${listv.MEM_CODE}" selected="selected">${listv.POSIT_NAME}&nbsp;|&nbsp;${listv.MEM_NAME}&nbsp;|&nbsp;${listv.DEPT_NAME}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<input type="button" class="btn btn-danger" value="비우기"
							onclick="options_Clean()" /> <br />
					</div>
				</div>
				<br /> <br />
				<div class="form-group">
					<div class="col-sm-7">
						<input type="text" class="form-control" id="report_title"
							name="report_title" value="${vo.report_title}"
							required="required">
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
						<button type="button" class="btn btn-success col-sm-2"
							onclick="reportSubmitBtn()">제출하기</button>
						<button type="button"
							class="btn btn-warning col-sm-2 col-sm-offset-1"
							onclick="reportModifyBtn()">수정</button>
						<button type="button"
							class="btn btn-danger col-sm-2 col-sm-offset-1"
							onclick="reportDelteBtn('<c:url value='/report/report_add_delete_ok/${vo.report_num}'/>')">삭제</button>
						<button type="button"
							class="btn btn-danger col-sm-2 col-sm-offset-1"
							onclick="goUrl('<c:url value='/report/report_add_list'/>')">취소</button>
					</div>
				</div>
			</form>



		</div>
	</div>
</div>
