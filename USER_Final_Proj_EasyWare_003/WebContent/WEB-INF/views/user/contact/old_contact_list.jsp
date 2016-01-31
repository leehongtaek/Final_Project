<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- struts tag 선언 -->
<!-- Resoures 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>
<title>PAGE[contact_list]</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	function postsearch() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('comp_post').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('comp_roadaddr').value = fullRoadAddr;
						document.getElementById('comp_jibunaddr').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>

<!-- Modal Start -->
<div class="container-fluid">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회사 등록</h4>
				</div>
				<div class="modal-body">




					<form class="form-horizontal" action=company_insert method="post"
						role="form">


						<div class="form-group">
							<label class="control-label col-sm-3" for="name">회사명:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="comp_name"
									name="comp_name" placeholder="회사명">
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-sm-3" for="name">전화번호:</label>
							<div class="col-sm-4">
								<input type="tel" class="form-control" id="comp_tel"
									name="comp_tel" placeholder="Enter 전화번호" required="required">
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-sm-3" for="address">도로명
								주소:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="comp_roadaddr"
									name="comp_roadaddr" placeholder="Enter address" readonly
									required="required">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3" for="address">지번
								주소:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="comp_jibunaddr"
									name="comp_jibunaddr" placeholder="Enter address" readonly
									required="required">
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-sm-3" for="postnum">Post
								number:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="comp_post"
									name="comp_post" placeholder="Search post number" readonly>
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-success btn-block"
									onclick="postsearch()">주소검색</button>
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-sm-3" for="addrdetails">상세주소
								:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="comp_detailaddr"
									name="comp_detailaddr" placeholder="Enter address detail">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3" for="name">홈페이지:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="comp_home"
									name="comp_home" placeholder="홈페이지주소">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-3 col-sm-offset-3">
								<button type="submit" class="btn btn-primary btn-block">등록하기</button>
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-danger"
									data-dismiss='modal'>취소</button>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Modal End -->




<!-- 패널 시작 -->
<div class="panel panel-warning">
		<div class="panel-heading">
			<h1><span class="glyphicon glyphicon-list-alt"> Contact List </span></h1>
		</div>
		<div class="panel-body">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-success"
					data-toggle="modal" data-target="#myModal">회사등록</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-default"
					onclick="goUrl('contact_add')">연락처등록</button>
		</div>
</div>
<!-- 패널 끝 -->

<!-- 연락처 테이블 시작 -->
<div class="table-responsive">
<table class="table table-condensed">
	<thead>
		<tr class="success">
			<th>회원번호</th>
			<th>회사명</th>
			<th>직급</th>
			<th>사원명</th>
			<th>전화번호</th>
			<th>이메일</th>					
		</tr>
	</thead>
	<tbody>
		<s:iterator value="list">
		<tr>
		<td><s:property value="cont_num" /></td>
		<td><s:property value="comp_name" /></td>
		<c:if test="${position_num == 1}">
		<td>사장</td>
		</c:if>
		<c:if test="${position_num == 2}">
		<td>부사장</td>
		</c:if>
		<c:if test="${position_num == 3}">
		<td>차장</td>
		</c:if>
		<c:if test="${position_num == 4}">
		<td>부장</td>
		</c:if>
		<c:if test="${position_num == 5}">
		<td>대리</td>
		</c:if>
		<c:if test="${position_num == 6}">
		<td>인턴</td>
		</c:if>	
		<td>
		<a href="contact_detail?cont_num=${cont_num}"> 
		<s:property value="cont_name" />
		</a>
		</td>
		<td><s:property value="cont_tel" /></td>
		<td><s:property value="cont_email" /></td>
		</tr>
		</s:iterator>
	</tbody>
</table>
</div>
<!--./연락처 테이블 끝  -->
					
	<!-- 구현해야함!!! -->
	<!-- 검색$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					
	<div class="form-inline">
		<label for="select"></label> <select name="searchType"
				class="form-control" id="searchType">
			<option value="">선택</option>
			<option value="1">회사명</option>
			<option value="2">사원명</option>
			<option value="3">전화번호</option>
			<option value="4">이메일</option>
			</select> <input type="text" class="form-control" name="searchValue"
							id="searchValue" placeholder="Search Value..">
			<button type="button" class="btn btn-warning" id=""> 검색 </button>
	</div>
					
	<!-- 검색$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->


	<div align="center">
		<ul class="pagination">
			<li><a href="contact_list?currentpage=${pagingData.prev_pageno}">«</a></li>
				<c:forEach var="iter" begin="${pagingData.page_sno}"
					end="${pagingData.page_eno}">
					<li id="pagination"><a href="contact_list?currentpage=${iter}"><b>${iter}</b></a></li>
				</c:forEach>
					<li><a href="contact_list?currentpage=${pagingData.next_pageno}">»</a></li>
		</ul>
	</div>		


