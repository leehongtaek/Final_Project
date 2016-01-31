<%-- 
    작업 날짜 : 2015. 12. 1.
    구현 내용 :   
  @author By KOSTA 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<c:url value='/resources/[필요한 JS파일경로명]'/>"></script>
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">


<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title"></h2>
			BBS Configuration
			<h3>
				<span class="lnr lnr-cog"></span> 게시판 관리
			</h3>


		</div>
		<div class="panel-body">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#boardlist"
					aria-controls="boardlist" role="tab" data-toggle="tab">사용중인 게시판</a></li>
				<li role="presentation"><a href="#notice"
					aria-controls="notice" role="tab" data-toggle="tab">공지사항 관리</a></li>
				<li role="presentation"><a href="#messages"
					aria-controls="messages" role="tab" data-toggle="tab">사용자 권한 관리</a></li>
				<li role="presentation"><a href="#settings"
					aria-controls="settings" role="tab" data-toggle="tab">게시물 관리</a></li>
				<li role="presentation"><a href="#settings"
					aria-controls="manage" role="tab" data-toggle="tab"></a></li>
			</ul>
			<div role="tabpanel">



				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="boardlist">
						<!-- 게시판 생성modal -->
						<br>
						<!--새로운 게시판 생성-->
						<button type="button" class="btn btn-primary btn"
							data-toggle="modal" data-target="#myModal">
							<p class="glyphicon glyphicon-plus"></p>
						</button>
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">새로운 게시판을 생성합니다.</h4>
									</div>
									<div class="modal-body">
										<!--게시판 생성 디테일 -->
										<form>
											<div class="form-group">
												<label for="recipient-name" class="control-label">게시판
													카테고리:</label> <input type="text" class="form-control"
													id="recipient-name">
											</div>
											<div class="form-group">
												<label for="recipient-name" class="control-label">게시판
													이름:</label> <input type="text" class="form-control"
													id="recipient-name">
											</div>
											<div class="form-group">
												<label for="message-text" class="control-label">게시판
													설명:</label>
												<textarea class="form-control" id="message-text"></textarea>
											</div>
										</form>



									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Create</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 게시판 리스트 -->
						<table class="table table-condensed">

							<thead>
								<tr>
									<th>게시판 관리코드</th>
									<th>카테고리 번호</th>
									<th>게시판 이름</th>
									<th>게시판 설명</th>
									<th>게시판 수정</th>
									<th>게시판 삭제</th>
								</tr>
							</thead>

							<!--  -->

							<tbody>
								<c:forEach items="${list}" var="row">
									<tr>
										<td>${row.board_code}</td>
										<td>${row.board_kindof}</td>
										<td>${row.board_name}</td>
										<td>${row.board_comment}</td>
										<td><button class="btn btn-primary" type="button"
												onclick="javacript:location='<c:url value=""/>'">
												<span class="glyphicon glyphicon-wrench"></span>
											</button></td>
										<td><button class="btn btn-danger" type="button"
												onclick="javacript:location='<c:url value=""/>'">
												<span class="glyphicon glyphicon-trash"></span>
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 게시판 리스트 끝 -->
					</div>
					<div role="tabpanel" class="tab-pane" id="notice">

						<button class="btn btn-default" type="button" value="write"
							onclick="location='board_L_write?board_code=1'">
							<span class="lnr lnr-bullhorn">공지등록</span>
						</button><span></span>

					</div>
					<div role="tabpanel" class="tab-pane" id="messages"></div>
					<div role="tabpanel" class="tab-pane" id="settings">ㅇㅇ</div>
					<div role="tabpanel" class="tab-pane" id="manage">ㅇㅇ</div>
				</div>

			</div>



		</div>



	</div>
</div>





















































<!--Style-->
<style>
.lnr-bullhorn {
	color: #0F52BA;
	font-size: 50px;
}

.lnr-cog {
	font-size: 30px;
	/* To get crisp results, use sizes that are
  a multiple of 20; because Linearicons was
  designed on a 20 by 20 grid. */
}
</style>