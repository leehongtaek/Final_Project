<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title"> MEMBER MANAGER LIST</h3>
	</div>
	<div class="panel-body">
		<h3> 사원 정보 관리 </h3> 	
		
		
	</div>
</div>

<hr>
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th>#</th>
			<th>사원 코드</th>
			<th>사원 ID </th>
			<th>부서</th>
			<th>직급</th>
			<th>사원 이름 </th>
			<th>입사일 </th>
			<th>사원 상태 </th>
			<th>수정 / 상세보기</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="row" >
		<tr>
			<td></td>
			<td>${row.MEM_CODE}</td>
			<td>${row.MEM_ID}</td>
			<td>${row.POSIT_NAME}</td>
			<td>${row.DEPT_NAME}</td> 
			<td>${row.MEM_NAME}</td>
			<td>${row.MEM_HIREDATE}</td>
			<c:set var="state" value="대기발령,입사,퇴직" />
			<c:forEach items="${state}" var="statev" varStatus="status" >
			   <c:if test="${status.index == row.MEM_STATE}">
			   <td>${statev} </td>
			   </c:if>
			</c:forEach>
			<td><button class="btn btn-primary" type="button" 
				onclick="javacript:location='<c:url value="/personManager/detail?mem_code=${row.MEM_CODE}"/>'" >
				<span class="glyphicon glyphicon-pencil"></span></button></td>
		</tr>
	</c:forEach>
	</tbody>
</table> 
<div class="row"> 
<form action="<c:url value='/personManager/search'/>" method="get"> 
		<div class="form-group" >
			<div class="col-sm-2" >
				<select class="form-control" name="searchType">
					<option value="">-- 선택 --</option>
					<option value="1"> 사원이름 </option>
					<option value="2"> 부서명 </option>
					<option value="3"> 직급명 </option>
				</select>
			</div>
			<div class="has-success col-sm-3">
				<input type="search" class="form-control" name="searchValue" placeholder="Search" >
			</div> 	
			<div class="col-sm-3">
				<button type="submit" class="btn btn-success">  검 색 </button>
			</div>
		</div>
</form>
</div>


<!-- paging start -->
<!-- 페이징 시 데이터 없을때는 페이지 하지 않게 함 -->
<c:if test="${pagingData !=null && pagingData.page_sno > 0}">
<div align="center">
	<ul class="pagination">
		<li>
		<a href="<c:url value='/personManager/search?currentpage=${pagingData.prev_pageno}&searchValue=${search.searchValue}&searchType=${search.searchType}'/>">«</a></li>
		<c:forEach var="iter" begin="${pagingData.page_sno}" end="${pagingData.page_eno}">
		<li id="pagination">
		<a href="<c:url value='/personManager/search?currentpage=${iter}&searchValue=${search.searchValue}&searchType=${search.searchType}'/>"><b>${iter}</b></a></li>
		</c:forEach>
		<li><a href="<c:url value='/personManager/search?currentpage=${pagingData.next_pageno}&searchValue=${search.searchValue}&searchType=${search.searchType}'/>">»</a></li>
		</ul>
		
</div>
</c:if>
<!-- paging end -->
	

	

