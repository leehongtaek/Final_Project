<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	#wrap { width: 500px; margin: auto; }
	#wrap table { width: 100% }
	.txt {  background-color: olive; color: white;  width: 100px; text-align: center;}
	.title{ font-size: large; font-weight: bold; text-align: center; background-color: navy; color: white;}
</style>
</head>
<body>
	<div id="wrap">
		<table>
			<tr><td colspan="3" class="title">"${vo.writer }"���� "${vo.sub }"��</td></tr>
			<tr>
				<td class="txt">������</td>
				<td colspan="2">${vo.board_title }</td>
			</tr>
			<tr>
				<td class="txt">�ۼ��� / IP</td>
				<td colspan="2">${vo.writer } / ${vo.reip }</td>
			</tr>
			<tr>
				<td class="txt">��ȸ��</td>
				<td colspan="2">${vo.board_hit }</td>
			</tr>
			<tr>
				<td class="txt">�ۼ���</td>
				<td colspan="2">${vo.board_regdate }</td>
			</tr>
			<tr>
				<td class="txt">����</td>
				<td colspan="2">${vo.board_content }</td>
			</tr>
			<tr><td colspan="3" class="title">��� ���</td></tr>
			<tr>
				<td class="txt">�ۼ���</td>
				<td class="txt">���</td>
				<td class="txt">�ۼ��� / IP</td>
			</tr>
			<c:forEach var="listv" items="${list }">
				<tr>
					<td>${listv.writer }</td>
					<td>${listv.board_content }</td>
					<td>${listv.board_regdate } / ${listv.reip }</td>
				</tr>			
			</c:forEach>
		</table>
		<form method="post" action="addComm">
		<table>
			<tr>
				<td><input type="text" name="writer"></td>
				<td><input type="text" name="comm"></td>
				<td>
					<input type="hidden" name="kcode" value="${vo.num }">
					<input type="hidden" name="reip" value="<%=request.getRemoteAddr() %>">
					<input type="submit" value="Insert">
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<a href="form">write</a> &nbsp;
				<a href="list">list</a>
				</td>
			</tr>		
		</table>
		</form>	
	</div>
</body>
</html>