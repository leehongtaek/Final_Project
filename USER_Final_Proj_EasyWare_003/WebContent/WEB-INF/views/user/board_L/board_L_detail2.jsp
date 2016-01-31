<%-- 
    작업 날짜 : 2015. 11.16.
    구현 내용 :   이홍택 게시판 글쓰기 폼
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<link rel="stylesheet" href="j-folder/css/demo.css">
<link rel="stylesheet" href="j-folder/css/font-awesome.min.css">
<link rel="stylesheet" href="j-folder/css/j-forms.css">
<c:choose>
	<c:when test="${pageContext.request.userPrincipal.name != null}">
		<c:set var="mem_code"
			value="${pageContext.request.userPrincipal.name}"></c:set>
	</c:when>
</c:choose>
<!-- Scripts -->
<script type="text/javascript">
	function goUrl(url) {
		location = url;
	}
</script>
<script src="j-folder/js/jquery.1.11.1.min.js"></script>
<div class="header">
	<h2>게시판</h2>
	<br />
</div>
<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a
		href="<c:url value='/board/board_L_list?board_code=1'/>">공지사항</a></li>
	<li role="presentation"><a
		href="<c:url value='/board/board_L_list?board_code=2'/>">영업부 게시판</a></li>
	<li role="presentation"><a
		href="<c:url value='/board/board_L_list?board_code=3'/>">경영전략부 게시판</a></li>
	<li role="presentation"><a
		href="<c:url value='/board/board_L_list?board_code=4'/>">인사부 게시판</a></li>
	<li role="presentation"><a
		href="<c:url value='/board/board_L_list?board_code=5'/>">추천 게시판</a></li>
</ul>
<!-- end /.header-->

<tr>
	<td valign="top" style="padding: 0 8 0 8">
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			style="table-layout: fixed">
			<tbody>
				<tr>
				
					<td valign="top" class="han" width="120" align="right">
					<img src="${pageContext.request.contextPath}/resources/img/no-profile.png" border="0"></td>
					<td width="6"></td>
					<td class="separator2" width="3"></td>
					<td width="3"></td>
					<td valign="top" nowrap=""
						style="padding-left: 6px; line-height: 140%;" class="han">
						제목: <font class="view_title2"> <!--DCM_TITLE-->${vo.board_title}<!--/DCM_TITLE-->
					</font>&nbsp;<sup><span class="list_comment">댓글 수[ ]</span></sup><br> <!-- 분류: <br> -->
						이름: <a href="" onclick="return false">${mem_code}</a><br>
						<br> <br> 등록일:${vo.board_regdate}<br> 조회수: ${vo.board_hit} / 추천수: ${vo.board_likenum}<br>
</td></tr></tbody></table></td></tr>

						
							<!-- start name email -->

							<%-- <input id="board_title" name="board_title" class="form-control"
								type="text" readonly placeholder="${vo.board_title}"><br /> --%>

						<div class="divider gap-bottom-25"></div> <br /> <!-- start textarea -->
						<div class="unit">
							<textarea class="form-control" rows="25" id="board_content"
								name="board_content" readonly>${vo.board_content}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace('board_content');
							</script>

							<br />
						</div> <!-- end textarea --> <br /> <%-- <!-- end /.content -->
<form method="post" action="bbs1Comm">
	<input type="hidden" name="kcode" value="${vo.num}"> <input
		type="hidden" name="reip" value="${pageContext.request.remoteAddr}">
	<table>
		<tr>
			<td>
				<!-- ☆ ★  --> <select name="cnt">
					<option value="5">★★★★★</option>
					<option value="4">★★★★☆</option>
					<option value="3" selected="selected">★★★☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="1">★☆☆☆☆</option>
			</select>
			</td>
			<td><input name="writer" size="15" value="${writer }"></td>
			<td><textarea rows="3" cols="30" name="comm"></textarea></td>
			<td><input type="submit" value="작성"></td>
		</tr>
	</table>
</form>
<table>
	<c:forEach var="coList" items="${cList}">
		<tr>
			<td><c:choose>
					<c:when test="${coList.cnt == 5}">★★★★★ </c:when>
					<c:when test="${coList.cnt == 4}">★★★★☆ </c:when>
					<c:when test="${coList.cnt == 3}">★★★☆☆ </c:when>
					<c:when test="${coList.cnt == 2}">★★☆☆☆ </c:when>
					<c:when test="${coList.cnt == 1}">★☆☆☆☆ </c:when>
				</c:choose></td>
			<td>${coList.comm}</td>
			<td>${coList.writer}</td>
			<td>${coList.regdate}/${coList.reip}</td>
		</tr>
	</c:forEach>

</table> --%>
						<form action="/board/board_L_modify" method="get">
							<input type="hidden" id="board_num" name="board_num"
								value="${vo.board_num}"> <input type="hidden"
								id="board_code" name="board_code" value="${board_code}">
							<div class="footer">
								<button class='btn btn-info' type="submit">수정</button>
								<!-- <button  class='btn btn-danger'>삭제</button> -->
								<button type="button" class="btn btn-primary"
									data-toggle="tooltip" data-placement="top"
									title="게시판 목록으로 돌아갑니다."
									onclick="goUrl('board_L_list?board_code=${board_code}')">목록으로</button>


							</div>

						</form>
						<div ng-app="myApp" ng-controller="myCtrl" align="right">
							<br>
							<button class="btn btn-success" ng-mouseenter="count = count + 1">마우스를
								갖다대면 자동으로 이 글을 추천합니다.</button>
							<p>추천 수 : {{ count }}</p>
						</div> <script>
							var app = angular.module('myApp', []);
							app.controller('myCtrl', function($scope) {
								$scope.count = 0;
							});
						</script> <!-- end /.footer -->