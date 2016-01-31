<%-- 
    작업 날짜 : 2015. 11.16.
    구현 내용 :   이홍택 게시판 글쓰기 폼
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->

<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

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

<div class="panel panel-warning">
	<div class="panel-heading">

		<h2>
			<span class="lnr lnr-users"></span> 게시판
		</h2>
		<br />

	</div>
	<ul class="nav nav-pills">
		<li><a href="<c:url value='/board/board_L_list?board_code=9'/>">공지사항</a></li>
		<c:if test="${sessionScope.dept_num == 1}">
			<li><a href="<c:url value='/board/board_L_list?board_code=1'/>">감사부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 2}">
			<li><a href="<c:url value='/board/board_L_list?board_code=2'/>">인사부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 3}">
			<li><a href="<c:url value='/board/board_L_list?board_code=3'/>">관리부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 4}">
			<li><a href="<c:url value='/board/board_L_list?board_code=4'/>">영업부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 5}">
			<li><a href="<c:url value='/board/board_L_list?board_code=5'/>">연구소
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 6}">
			<li><a href="<c:url value='/board/board_L_list?board_code=6'/>">개발부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 7}">
			<li><a href="<c:url value='/board/board_L_list?board_code=6'/>">보수부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 8}">
			<li><a href="<c:url value='/board/board_L_list?board_code=6'/>">운영부
					게시판</a></li>
		</c:if>
		<li><a href="<c:url value='/board/board_L_list?board_code=10'/>">커뮤니티</a></li>
	</ul>

	<!-- end /.header-->

	<tr>
		<td valign="top" style="padding: 0 8 0 8">
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				style="table-layout: auto;">
				<tbody>
					<tr>

						<td valign="top" class="han" width="150px;" align="left"><img
							src="${pageContext.request.contextPath}/resources/img/no-profile.png"
							border="1"></td>
						<td width="6"></td>
						<td class="separator2" width="3"></td>
						<td width="3"></td>
						<td valign="top" nowrap=""
							style="padding-left: 6px; line-height: 140%;" class="han"><c:if
								test="${board_code == 1}">
								<img
									src="${pageContext.request.contextPath}/resources/img/notice_icon.png">
							</c:if>
							<h4>제목: ${vo.board_title}</h4> <span class="list_comment">댓글
								수[${comm_count}]</span><br>이름: <a href="" onclick="return false">${mem_name}</a>&nbsp;
							등록일:${vo.board_regdate}<br> 조회수: ${vo.board_hit} / 추천수:
							${vo.board_likenum}</td>
					</tr>
				</tbody>
			</table>
		</td>
	</tr>

	<!-- grid test -->
	<!-- grid endline -->

	<!-- start name email -->

	<%-- <input id="board_title" name="board_title" class="form-control"
								type="text" readonly placeholder="${vo.board_title}"><br /> --%>

	<div class="divider gap-bottom-25"></div>
	<br />
	<!-- start textarea -->
	<div class="unit">
		<textarea class="form-control" rows="25" id="board_content"
			name="board_content" readonly>${vo.board_content}</textarea>
		<script type="text/javascript">
			CKEDITOR.replace('board_content');
		</script>
	</div>
	<!-- end textarea -->

	</form>
	<br>
	<form action="/board/board_L_modify" method="get">
		<input type="hidden" id="board_num" name="board_num"
			value="${vo.board_num}"> <input type="hidden" id="board_code"
			name="board_code" value="${board_code}">
		<div class="footer">
			<c:if test="${sessionScope.mem_code == vo.mem_code}">
				<button class='btn btn-info' type="submit">수정</button>
			</c:if>
			<c:if test="${sessionScope.mem_code != vo.mem_code}">
				<c:if test="${sessionScope.posit_num <= 3}">	
					<button class='btn btn-info' type="submit">수정</button>
				</c:if>
			</c:if>
			
			
			<!-- <button  class='btn btn-danger'>삭제</button> -->
			<button type="button" class="btn btn-primary" data-toggle="tooltip"
				data-placement="top" title="게시판 목록으로 돌아갑니다."
				onclick="goUrl('board_L_list?board_code=${board_code}')">목록으로</button>
		</div>
	</form>
	<br>
<c:if test="${board_code != 9}">
	<center>
		<form action="/board/likenum" method="get">
			<input type="hidden" value="${vo.board_num}" name="board_num" /> <input
				type="hidden" id="board_code" name="board_code"
				value="${board_code}">
			<button type="submit" class="btn btn-lg btn-success"
				data-toggle="popover" title="버튼을 누르면 상위 게시글을 추천합니다."
				data-content="게시자를 위한 댓글도 달아보세요.">
				<span class="lnr lnr-thumbs-up"></span>
			</button>
		</form>
	</center>
	<br>
</div>
<!-- end pa -->



<div class="panel panel-warning">
	<div>
		<table id="commentTable" class="table table-condensed">
			<tr>
				<td><span class="form-inline" role="form"> <textarea
							style="width: 46%; box-shadow: 10px 10px 5px #888888;"
							placeholder="    댓글 내용을 입력하세요. 바른 말, 고운 말을 사용합시다."
							name="comm_content" id="comm_content" class="form-control col-1"
							rows="3"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<button type="button" id="comm_submit" name="comm_submit"
								value="작성" class="btn btn-lg primary">
								<span class="lnr lnr-pencil"></span>
							</button>
						</div>
				</span></td>
			</tr>
		</table>
	</div>
	<br />

	<!-- 댓글2호 -->
	<div class="panel-group">
		<div class="panel panel-danger">
			<div class="panel-heading" align="center"
				style="height: 50px; width: 300px;">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">댓글 펼치기<br>총
						${comm_count}개의 댓글이 있습니다.
					</a>

				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse">
				<c:forEach var="coList" items="${coList}">
					<ul class="list-group">
						<li class="list-group-item"><span class="lnr lnr-user"></span>${coList.mem_name}<a>
						</a><span class="lnr lnr-clock"></span>${coList.comm_regdate}</li>
						<li class="list-group-item">${coList.comm_content}</li>
					</ul>
				</c:forEach>
				<div class="panel-footer" data-toggle="collapse" href="#collapse1"
					align="center">댓글 접기</div>
			</div>
		</div>
	</div>
	<!-- 2호 꼬리 -->
</div>
</c:if>


<script>
	$('.collapse').collapse()
</script>
<script>
	$(function() {

		//제일 하단에 있는 depth1의 댓글을 다는 이벤트
		$("#comm_submit").click(function(event) {

			//ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
			var comm_content = $("#comm_content").val();
			var board_num = $("#board_num").val();

			/* if ($.trim(pName.val()) == "") {
				alert("이름을 입력하세요.");
				pName.focus();

			} else if ($.trim(pText.val()) == "") {
				alert("내용을 입력하세요.");
				pText.focus();
			} */

			$.ajax({
				url : "insertcomm.json",
				type : "POST",
				data : {
					board_num : board_num,
					comm_content : comm_content,
				},
				success : function() {

					location.href = ""

				}

			});
			/* var commentParentText = '<tr id="r1" name="commentParentCode">'
					+ '<td colspan=2>'
					+ '<strong>'
					+ '| <a style="cursor:pointer;" name="pDel">삭제</a><p>'
					+ comm_content;
			+'</p>' + '</td>' + '</tr>';

			//테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
			if ($('#commentTable').contents().size() == 0) {
				$('#commentTable').append(commentParentText);
			} else {
				$('#commentTable tr:last').after(
						commentParentText);
			} */

		});
	});
</script>
<!-- end /.footer -->