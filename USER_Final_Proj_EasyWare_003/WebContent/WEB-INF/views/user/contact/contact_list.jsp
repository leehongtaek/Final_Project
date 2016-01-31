<%-- 
    작업 날짜 : 2015. 11. 16.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>
<title>PAGE[contact_list]</title>


<!-- 패널 시작 -->
<div class="panel panel-warning">
	<div class="panel-heading">
		<h1>
			<span class="glyphicon glyphicon-list-alt"> Contact</span>
		</h1>
	</div>
	<div class="panel-body">
	<!-- 검색$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 구현해야함  -->
		<div class="form-inline">
			<label for="select"></label> <select name="searchType"
					class="form-control" id="searchType">
				<option value="">선택</option>
				<option value="1">직급</option>
				<option value="2">이름</option>
				<option value="3">부서명</option>
				</select> <input type="text" class="form-control" name="searchValue"
								id="searchValue" placeholder="Search Value..">
				<button type="button" class="btn btn-warning" id=""> 검색 </button>
		</div>
	<!-- 검색$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 구현해야함  -->
	</div>
</div>
<!-- 패널 끝 -->

<!-- 연락처 테이블 시작 -->
<div class="table-responsive">
	<table class="table table-hover table-responsive">
		<thead>
			<tr class="success">
				<th>직급</th>
				<th>이름</th>
				<th>부서명</th>
				<th>사내번호</th> 
				<th>이메일</th> 
				<th>도로명주소</th>
				<th>상세주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listv" items="${list}">
				<tr>
					<td>${listv.POSIT_NAME}</td>
					<td>${listv.MEM_NAME}</td>  
					<td>${listv.DEPT_NAME}</td>
					<td>${listv.MEM_TEL}</td>
					<td>${listv.MEM_EMAIL}</td>
					<td>${listv.MEM_ROADADDR}</td>
					<td>${listv.MEM_DETAILADDR}</td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>
<!--./연락처 테이블 끝  -->



<!-- 페이징 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
<div align="center">
	<ul class="pagination">
		<li><a href='<c:url value="/contact/contact_list?currentpage=${pagingData.prev_pageno}"/>'>◀◀</a></li>
		<c:set var="pageno" value="${currentpage }" />
		<c:forEach var="iter" begin="${pagingData.page_sno}"
			end="${pagingData.page_eno}">
			<c:if test="${iter == pageno}">
				<li id="pagination" class="active"><a
					href='<c:url value="/contact/contact_list?currentpage=${iter}"/>'><b>${iter}</b></a></li>
			</c:if>
			<c:if test="${iter != pageno}">
				<li id="pagination"><a href='<c:url value="/contact/contact_list?currentpage=${iter}"/>'><b>${iter}</b></a>
				</li>
			</c:if>
		</c:forEach>
		<li><a href='<c:url value="/contact/contact_list?currentpage=${pagingData.next_pageno}"/>'>▶▶</a></li>
	</ul>
</div>


