<%-- 
    작업 날짜 : 2015. 12. 3.
    구현 내용 :   
  
  @author By KOSTA 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/[필요한 JS파일경로명]'/>" ></script>

<title>PAGE - MENU [NAME] </title>

<div class="container">

<div id="wrap">
		<table>
			<thead>
			<tr>
				<th class="file_name">file_name</th>
				<th class="file_path">file_path</th>
				<th class="file_type">file_type</th>
				<th class="file_size">file_size</th>
				<th class="file">file</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td class="file_name">${vo.file_name}</td>
						<td class="file_path">${vo.file_path}</td>
						<td class="file_type">${vo.file_type}</td>
						<td class="file_size">${vo.file_size}</td>
						<td><img src="${pageContext.request.contextPath}/file/${vo.file_name}">
						<a href="fileDown?file_name=${vo.file_name}">다운로드</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			<tr>
				<th colspan="5">
				<input type="button" value="글작성" onclick="location='fileForm'">
				</th>
			</tr>
			</tfoot>
		</table>
	</div>

</div>
