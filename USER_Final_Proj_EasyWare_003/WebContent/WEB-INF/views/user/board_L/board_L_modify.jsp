<%-- 
    작업 날짜 : 2015. 11.16.
    구현 내용 :   이홍택 게시판 글쓰기 폼
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<div class="wrapper wrapper-640">
	<script src="resources/layout/js/common.js"></script>
	<link rel="stylesheet"
		href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">


	<form method="post"
		action="<c:url value='/board/modify?board_num=${bvo.board_num}&board_code=${bvo.board_code}'/>">

		<div class="panel panel-warning">
			<div class="panel-heading">
				<h2>
					<span class="lnr lnr-magic-wand"></span> 게시글 수정
				</h2>
				<br />
			</div>

			<!-- end /.header-->

			<div class="content">
				<!-- start name email -->
				<div class="j-row">
					<!-- start subject -->
					<div class="input-group">
						<input type="hidden" value="${vo.board_num}" name="board_num"
							id="board_num"> <span class="input-group-addon">제목</span>
						<input type="text" class="form-control"
							placeholder="${vo.board_title}" aria-describedby="sizing-addon2"
							id="board_title" name="board_title" value="${vo.board_title}">
					</div>
					<!-- <div class="write_form_option">
					<input type="checkbox" id="notice" name="status" value="notice"><label
						for="notice">공지사항</label> -->
				</div>

			</div>
			<br />
			<div class="divider gap-bottom-25"></div>

			<!-- start textarea -->
			<div class="unit">
				<textarea class="form-control" rows="25" id="board_content"
					name="board_content">${vo.board_content}</textarea>
				<script type="text/javascript">
					CKEDITOR.replace('board_content');
				</script>

			</div>
			<!-- end textarea -->
		</div>
		<br />
		<!-- end /.content -->
		<div class="footer">
			<button class='btn btn-info' data-toggle="tooltip" type="submit"
				data-placement="top">수정</button>
			<a class='btn btn-danger' role="button"
				href="<c:url value='/board/board_L_delete?board_num=${bvo.board_num}&board_code=${bvo.board_code}' />">삭제</a>
			<button type="button" class="btn btn-primary" data-toggle="tooltip"
				data-placement="top" title="게시판 목록으로 돌아갑니다."
				onclick="location='board_L_list?board_code=${bvo.board_code}'">목록으로</button>
		</div>
		<!-- end /.footer -->
	</form>


</div>
