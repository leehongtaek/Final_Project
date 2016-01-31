<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<META http-equiv="Cache-Control" content="No-Cache">
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/layout/css/common.css'/>"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>

<title>PAGE - MENU [NAME]</title>
<div class="panel panel-warning">
	<div class="panel-heading">
		<h2>글작성</h2>
	</div>
</div>
<legend>글작성</legend>

<body>
	<div id="wrap">
		<form method="post" action="board_write">
			<input type="hidden" name="reip" value="<%=request.getRemoteAddr()%>">
			<table>
				<thead>
					<tr>
						<th colspan="2">board 입력폼</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="fd">제 목</td>
						<td><input name="sub" id="sub"></td>
					</tr>
					<tr>
						<td class="fd">작 성 자</td>
						<td><input name="writer" id="writer"></td>
					</tr>
					<tr>
						<td class="fd">비 밀 번 호</td>
						<td><input name="pwd" id="pwd" type="password" maxlength="10">
						</td>
					</tr>
					<tr>
						<td class="fd">내 용</td>
						<td><textarea rows="20" cols="20" name="cont" id="cont"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2"><input type="submit" value="등록">
							&nbsp; <input type="button" value="list"
							onclick="location='board_list'"></th>
					</tr>
					<tr>
						<!--파일업로드 -->
						<th colspan="2"><input type="file" id="mfile" name="mfile">
							<input type="submit" value="send" onclick="location='board_list'"></th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>