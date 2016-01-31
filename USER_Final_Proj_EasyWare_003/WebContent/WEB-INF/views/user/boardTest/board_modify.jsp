<%-- 
    작업 날짜 : 2015. 11.16.
    구현 내용 :   modify jsp 수정
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<div class="wrapper wrapper-640">
	<script src="resources/layout/js/common.js"></script>


	<form method="post"
		action="<c:url value='/boardTest/modify?num=${vo.num}'/>">
		<div class="header">
			<h2>게시글 수정</h2>
			<br />
		</div>
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">공지사항</a></li>
			<li role="presentation"><a href="#">영업부 게시판</a></li>
			<li role="presentation"><a href="#">경영전략부 게시판</a></li>
			<li role="presentation"><a href="#">인사부 게시판</a></li>
		</ul>
		<!-- end /.header-->

		<div class="content">
			<!-- start name email -->
			<div class="j-row">
				<!-- start subject -->
				<div class="input-group">
					<input type="hidden" value="${vo.num}" name="num" id="num">
					<span class="input-group-addon">제목</span> <input type="text"
						class="form-control" placeholder="${vo.sub}"
						aria-describedby="sizing-addon2" id="sub" name="sub"
						value="${vo.sub}">
				</div>
				<br />

				<!-- <div class="input-group">
					<span class="input-group-addon" id="sizing-addon2">이름</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2" value=" "> <span
						class="input-group-addon" id="sizing-addon2">부서</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2" value=""> <span
						class="input-group-addon" id="sizing-addon2">직급</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2" value=" "> <span
						class="input-group-addon" id="sizing-addon2">메일주소</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2" value="">
				</div> -->
			</div>
			<br />
			<div class="divider gap-bottom-25"></div>

			<!-- start textarea -->
			<div class="unit">
				<textarea class="form-control" rows="25" id="cont"
					name="board_content">${vo.cont}</textarea>
				<script type="text/javascript">
					CKEDITOR.replace('cont');
				</script>

			</div>
			<!-- end textarea -->
		</div>
		<!-- end /.content -->
		<div class="footer">
			<button class='btn btn-info' data-toggle="tooltip" type="submit"
				data-placement="top">완료</button>
			<a class='btn btn-danger' role="button"
				href="<c:url value='/boardTest/board_delete?num=${vo.num}' />">삭제</a>
			<button type="button" class="btn btn-primary" data-toggle="tooltip"
				data-placement="top" title="게시판 목록으로 돌아갑니다."
				onclick="location='board_list'">목록</button>
		</div>
		<!-- end /.footer -->
	</form>


</div>