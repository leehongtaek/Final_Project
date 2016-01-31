<%-- 
    작업 날짜 : 2015. 10. 21.
    구현 내용 :   
  
  @author By KOSTA 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/layout/css/common.css'/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/layout/js/common.js'/>" ></script>

<title>PAGE - MENU [NAME] </title>

<legend>글쓰기</legend>

	<!--타이틀  -->
<form class="form-inline">
  <div class="form-group">
    <label for="exampleInputName2">TITLE</label>
    <input type="text" class="form-control" id="TITLE" placeholder="제목을 입력하세요">
  </div>
</form>
		<br>
		
		<!-- 작성자 (DB값 가져오기 )-->	
<form class="form-inline">
  	<div class="form-group">
   	 	<label for="exampleInputName2">작성자</label>
   		 <input type="text" class="form-control" id="Name" placeholder="작성자">
  	</div>
  
  	<div class="form-group">
   		 <label for="exampleInputEmail2">비밀번호</label>
   		 <input type="password" class="form-control" id="pwd" placeholder="비밀번호">
  	</div>
  	<br>
</form>

	<!-- contents -->
	<form>
	<br>
	<textarea class="form-control" rows="15"  placeholder="내용을 입력하세요"></textarea>
	</form>
    
    <!--등록 및 취소  -->
    <input class="btn btn-default" type="submit" value="등록">
    <button class="btn btn-default" type="submit" onclick="goUrl('board_P_list')">취소</button>
    
    

