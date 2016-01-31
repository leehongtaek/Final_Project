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
		<form method="post" action="fileUpload" enctype="multipart/form-data">
			<!-- file_path : <input type="text" name="file_path" id="file_path"><br/>
			file_type : <input type="text" name="file_type" id="file_type"><br/>
			file_size : <input type="text" name="file_size" id="file_size"><br/> -->
			file : <input type="file" id="file" name="file"> <br/>
			<input type="submit" value="send">
		</form>
	</div>

</div>
