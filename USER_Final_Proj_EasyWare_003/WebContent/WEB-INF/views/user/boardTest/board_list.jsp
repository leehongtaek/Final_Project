<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>
<div class="panel panel-warning">
	<div class="panel-heading">
		<h2>게시판</h2>
	</div>
</div>
<script>
<!-- Resoures 선언 -->
	function goUrl(url) {
		location = url;
	}
</script>
<html>
<form>
	<div class="col-sm-12">
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<td></td>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>내용</th>
						<th>작성일자</th>
					</tr>
				</thead>

				<c:forEach var="listv" items="${list }">
					<tr>
						<td>${listv.board_num }</td>
						<td><a href="board_list?board_num=${listv.board_num }">${listv.board_title }</a></td>
						<td>${listv.board_hit }</td>
						<td>${listv.board_regdate }</td>
					</tr>
				</c:forEach>
			</table>

			<tr>
				<td colspan="5">
					<form method="post" action="list_search">
						<select name="searchType">
							<option value="">선택</option>
							<option value="1">제목</option>
							<option value="2">내용</option>
						</select> <input type="text" name="searchValue"> &nbsp; 
						<input type="submit" value="search">
					</form>
				</td>
			<tr>
				<td colspan="5"><a href="form">board_write</a> &nbsp; <a
					href="list">board_list</a> &nbsp; <!-- 검색한 부분에서 넘어온 값을 이용 --> <a
					href="downExcel?searchType=${searchType}&searchVal=${searchVal}">excel
						down</a></td>
			</tr>

			<!--글작성  -->
			<div class="clearfix">
				<span class="btn-group"></span>
				<div class="pull-right">
					<a class="btn btn-primary" onclick="goUrl('board_write')"> <span
						class="glyphicon glyphicon-pencil" /></span> 글쓰기
					</a>
				</div>
			</div>



			<!-- 10.30, 단위 보여주기 -->
			<div class="pull-right">
				<select class="form-control">
					<option>10</option>
					<option>20</option>
					<option>30</option>
				</select>
			</div>

			<!--페이징  -->
			<div align="center">
				<ul class="pagination">
					<li><a
						href="/boardTest/board01?currentpage=${pagingData.prev_pageno}">«</a></li>
					<c:forEach var="iter" begin="${pagingData.page_sno}"
						end="${pagingData.page_eno}">
						<li id="pagination${list}"><a
							href="/boardTest/board01?currentpage=${iter}"><b>${iter}</b></a></li>
					</c:forEach>
					<li><a
						href="/boardTest/board01?currentpage=${pagingData.next_pageno}">»</a></li>
				</ul>
			</div>
		</div>
	</div>



</form>
</html>