<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->

<title>PAGE[report_add_list]</title>

<!-- 패널 시작 -->
<div class="panel panel-warning">
	<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> REPORT ADD LIST</span>
			</h3>
	</div>
	<div class="panel-body">
	
		<!-- 임시 저장 보고서 테이블 시작 -->
		<div class="table-responsive">
			<table class="table table-hover table-responsive">
				<thead>
					<tr class="success">
						<th>#</th>
						<th></th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listv" items="${list}">
						<tr>
							<td>${listv.report_num}</td>
							<td><span class="glyphicon glyphicon-file"
								aria-hidden="true"></span></td>
							<td><a
								href="<c:url value='/report/report_add_detail/${listv.report_num}' />">
									${listv.report_title} </a></td>
							<td>${listv.report_regdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 테이블 끝  -->
	</div>
</div>
<!-- 패널 끝 -->
