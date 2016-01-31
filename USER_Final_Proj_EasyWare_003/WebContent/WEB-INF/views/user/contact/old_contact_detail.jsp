<%-- 
    작업 날짜 : 2015. 10. 23.
    구현 내용 :   
  
  @author By KOSTA 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- struts tag 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>

<title>PAGE - Contact_Detail</title>
<script type="text/javascript">

	$(function(){
		$('#btn1').click(function(){
			$('#comp_name').attr("readonly",false);
			$('#comp_jibunaddr').attr("readonly",false);
			$('#comp_roadaddr').attr("readonly",false);
			$('#comp_detailaddr').attr("readonly",false);
			$('#comp_tel').attr("readonly",false);
			$('#comp_home').attr("readonly",false);
			
			$('#modifyBtn').html("<button type='submit' class='btn btn-success btn-block'>확인</button>");
			
		});
	});
	
	

</script>
<div class="col-md-12">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3>Contact Detail</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" action="company_update" method="post" role="form">
				<input type="hidden" name="comp_num" id="comp_num" value="${contactvo.comp_num}" />
				<input type="hidden" name="cont_num" id="cont_num" value="${contactvo.cont_num}" />

				<div class="bg-info">
					<span class="glyphicon glyphicon-bishop" aria-hidden="true">Company
						Info</span><br /> <br />


					<div class="form-group">
						<label class="control-label col-sm-2" for="name">회사명:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="comp_name"
								name="comp_name" required="required" readonly="readonly"
								value="${contactvo.comp_name}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="name">회사주소:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="comp_jibunaddr"
								name="comp_jibunaddr" required="required" readonly="readonly"
								value="${contactvo.comp_jibunaddr} ${contactvo.comp_post}">
								<input type="text" class="form-control" id="comp_roadaddr"
								name="comp_roadaddr" required="required" readonly="readonly"
								value="${contactvo.comp_roadaddr}">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">상세주소:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="comp_detailaddr"
								name="comp_detailaddr" required="required" readonly="readonly"
								value="${contactvo.comp_detailaddr}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="name">회사Tel:</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="comp_tel"
								name="comp_tel" required="required" readonly="readonly"
								value="${contactvo.comp_tel}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="name">HomePage:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="comp_home"
								name="comp_home" required="required" readonly="readonly"
								value="${contactvo.comp_home}">
						</div>
					</div>
					<br />

				</div>



				<div class="bg-warning">
					<br /><span class="glyphicon glyphicon-user" aria-hidden="true">Member
						Info</span><br /> <br />


					<div class="form-group">
						<label class="control-label col-sm-2" for="name">사원이름:</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="cont_name"
								name="cont_name" required="required" readonly="readonly"
								value="${contactvo.cont_name}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="name">부서:</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="dept_name"
								name="dept_name" required="required" readonly="readonly"
								value="${contactvo.dept_name}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="name">직급:</label>
						<div class="col-sm-2">
						
						<c:if test="${contactvo.position_num == 1}">
							<input type="text" class="form-control" id="position_num1"
							name="position_num1" required="required" readonly="readonly"
							value="사장">
						</c:if>
						<c:if test="${contactvo.position_num == 2}">
							<input type="text" class="form-control" id="position_num2"
							name="position_num2" required="required" readonly="readonly"
							value="부사장">
						</c:if>
							<c:if test="${contactvo.position_num == 3}">
							<input type="text" class="form-control" id="position_num3"
							name="position_num3" required="required" readonly="readonly"
							value="차장">
						</c:if>
						<c:if test="${contactvo.position_num == 4}">
							<input type="text" class="form-control" id="position_num4"
							name="position_num4" required="required" readonly="readonly"
							value="부장">
						</c:if>
						<c:if test="${contactvo.position_num == 5}">
							<input type="text" class="form-control" id="position_num5"
							name="position_num5" required="required" readonly="readonly"
							value="대리">
						</c:if>
							<c:if test="${contactvo.position_num == 6}">
							<input type="text" class="form-control" id="position_num6"
							name="position_num6" required="required" readonly="readonly"
							value="인턴">
						</c:if>
							
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="name">전화번호:</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="cont_tel"
								name="cont_tel" required="required" readonly="readonly"
								value="${contactvo.cont_tel}">
						</div>
					</div>
					
						<div class="form-group">
						<label class="control-label col-sm-2" for="name">사원주소:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="cont_jibunaddr"
								name="cont_jibunaddr" required="required" readonly="readonly"
								value="${contactvo.cont_jibunaddr} ${contactvo.cont_post}">
								
							<input type="text" class="form-control" id="cont_roadaddr"
								name="cont_roadaddr" required="required" readonly="readonly"
								value="${contactvo.cont_roadaddr}">
								
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">상세주소:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="cont_detailaddr"
								name="cont_detailaddr" required="required" readonly="readonly"
								value="${contactvo.cont_detailaddr}">
						</div>
					</div>
					
						<div class="form-group">
						<label class="control-label col-sm-2" for="name">이메일:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="cont_email"
								name="cont_email" required="required" readonly="readonly"
								value="${contactvo.cont_email}">
						</div>
					</div>
					
						<div class="form-group">
						<label class="control-label col-sm-2" for="name">etc:</label>
						<div class="col-sm-7">
							<textarea class="form-control" name="cont_etc" id="cont_etc" readonly="1">${contactvo.cont_etc}</textarea>
						</div>
					</div>
					

					<br />
				</div>


			
				
				
				

				<br>
				<div class="row">
				
				<c:if test="${sessionScope.mem_role == 0}" >
					<div class="col-sm-2">
						<button type="button" class="btn btn-info btn-block" id="btn1">수정</button>
					</div>
					<div class="col-sm-2" id="modifyBtn">
					<!-- 확인버튼자리!! -->
					</div>
					
					<div class="col-sm-2">
						<button type="button" class="btn btn-danger btn-block">삭제</button>
					</div>
				</c:if>
					<div class="col-sm-2">
						<button type="button" class="btn btn-warning btn-block"
							onclick="goUrl('contact_list')">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
