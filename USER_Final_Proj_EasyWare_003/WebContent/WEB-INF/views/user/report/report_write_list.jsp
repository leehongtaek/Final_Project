<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<title>PAGE[report_write_list]</title>

<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> REPORT WRITE LIST</span>
			</h3>
		</div>
		<div class="panel-body">

			<!-- 보고서 양식 테이블 시작 -->
			<div class="table-responsive">
				<table class="table table-condensed">
					<thead>
						<tr class="success">
							<th class="col-sm-1">No.</th>
							<th>양식 제목</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="listv" items="${list}">
							<tr>
								<c:choose>
									<c:when test="${listv.doc_num == 1}">

									</c:when>
									<c:otherwise>
										<td class="col-sm-1">${listv.doc_num}</td>
										<td><a
											href="<c:url value='/report/report_write_add/${listv.doc_num}'/>">${listv.doc_name}</a></td>
									</c:otherwise>
								</c:choose>



							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 보고서 양식 테이블 끝 -->


		</div>
	</div>
</div>
