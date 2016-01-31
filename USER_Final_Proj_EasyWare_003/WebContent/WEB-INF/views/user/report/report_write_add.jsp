<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->

<title>PAGE[report_write_add]</title>
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/plugin/sweetalert/dist/sweetalert.min.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/sweetalert/dist/sweetalert.css'/>">

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

		var datas = {};
		var namev = $('#search_user').val();
		var dept_numv = $('#dept_num option:selected').val();
		var posit_numv = $('#posit_num option:selected').val();

		if (namev != "")
			datas['mem_name'] = namev;
		if (dept_numv != "")
			datas['dept_num'] = dept_numv;
		if (posit_numv != "")
			datas['posit_num'] = posit_numv;

		$.ajax({
			type : "GET",
			url : "<c:url value='/user/user_search_List.json' />",
			data : datas,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(resultData) {

				$.each(resultData, function(index, value) {
					$("#report_list option:eq(" + index + ")").remove();
					$("#report_list").append(
							'<option value='+value.MEM_CODE+'><pre>'
									+ value.POSIT_NAME + ' | '
									+ value.MEM_NAME + ' | '
									+ value.DEPT_NAME + '</pre></option>');

				});
			}
		});
	}
	/* 보고서 임시저장 버튼 */
	function reportSaveBtn() {
		swal({
			title : "작성하신 문서를 임시문서함에 저장 하시겠습니까?",
			text : "",
			type : "info",
			showCancelButton : true,
			allowEscapeKey : true,
			allowOutsideClick : true,
			confirmButtonColor : "#2196F3",
			confirmButtonText : "저장",
			cancelButtonText : "취소",
			closeOnConfirm : false
		}, function() {
			swal({
				title : "저장완료!!",
				text : "",
				type : "success",
				allowEscapeKey : false
			}, function() {
				$('#formFun').submit();
			});
		});
	}

	/*보고서 제출 버튼  */
	function reportSubmitBtn() {

		var report_title = $('#report_title').val();
		var report_list_selected = $('#report_list_selected').val();

		if (report_title == "") {
			swal("보고서 제목을 입력하세요.");
			return false;
		} else if (report_list_selected == null) {

			swal({
				title : "결재자가 없습니다. 임시문서함으로 저장하시겠습니까?",
				text : "임시문서함으로 이동합니다.",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "임시저장",
				closeOnConfirm : false
			}, function() {
				$('#formFun').submit();
				swal("저장완료!", "", "success");
			});

			return false;
		}

		swal({
			title : "작성하신 문서를 제출 하시겠습니까?",
			text : "",
			type : "info",
			showCancelButton : true,
			allowEscapeKey : true,
			allowOutsideClick : true,
			confirmButtonColor : "#2196F3",
			confirmButtonText : "제출",
			cancelButtonText : "취소",
			closeOnConfirm : false
		}, function() {
			swal({
				title : "제출완료!!",
				text : "",
				type : "success",
				allowEscapeKey : false
			}, function() {
				// 첫번째 승인할 member 에게 알람  
				var firstMem = $('#report_list_selected option:first').val();
				alram_Send('report/' + firstMem + '/' + '승인 할 보고서/' + '0');

				//제출하기 버튼 누르면 report_state를 1로 변경하고 submit 수행  
				$('#report_state').val('1');
				$('#formFun').submit();
			});
		});
	}

	//$(function() {
	//$('#sub').click(function() {
	//	$('#report_state').val('1');
	//	$('#formFun').submit(function() {
	//alert("Handler for .submit() called.");
	// if(('#report_title').val() == ""){
	//event.preventDefault();
	//return;
	//alert('테스트');
	//});
	//});
	//	});

	function options_Clean() {
		$('#report_list option').remove();
	}
</script>
<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> REPORT WRITE ADD</span>
			</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" id="formFun"
				action="<c:url value='/report/report_write_add_ok'/>" method="post"
				role="form">

				<input type="hidden" class="form-control"
					value="${sessionScope.mem_code}" id="report_writer"
					name="report_writer" />

				<!-- 제출시 status 값 변경  -->
				<input type="hidden" name="report_state" id="report_state" value="0" />


				<!--승인자 지정 패널 시작  -->
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
						<br /><br /><br /><br /><br />
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
							<label class="control-label col-sm-2" for="name">사원 이름 :
							</label>
							<div class="col-sm-2">
								<input type="text" id="search_user" class="form-control" />
							</div>
							<button type="button" class="btn btn-primary col-sm-2"
								onclick="search_user_list()">search</button>
						</div>

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
								</select>
						
							</div>
						</div>
						<input type="button" class="btn btn-danger" value="비우기"
							onclick="options_Clean()" /> <br />
						
					</div>
				</div>
				<!--승인자 지정 패널 끝 -->
				<div class="form-group">
					<div class="col-sm-7">
						<input type="text" class="form-control" id="report_title"
							name="report_title" placeholder="제목 입력">
					</div>
				</div>

				<!--   start ckeditor -->
				<div class="form-group">
					<div class="col-sm-12">
						<textarea name=report_content id="report_content"
							class="form-control" rows="20">${vo.doc_form}</textarea>
					</div>
				</div>
				<!--  end ckeditor -->

				<div class="form-group">
					<div class="col-sm-10">
						<input type="button" class="btn btn-warning col-sm-2"
							onclick="reportSaveBtn()" value="임시저장">
						<button type="button"
							class="btn btn-success col-sm-2 col-sm-offset-1"
							onclick="reportSubmitBtn()">제출하기</button>
						<button type="button"
							class="btn btn-danger col-sm-2 col-sm-offset-1"
							onclick="goUrl('<c:url value="/report/report_write_list"/>')">취소</button>

					</div>
				</div>
			</form>

		</div>
	</div>
</div>
