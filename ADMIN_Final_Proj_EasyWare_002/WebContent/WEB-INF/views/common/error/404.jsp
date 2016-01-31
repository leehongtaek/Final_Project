<%-- 
    작업 날짜 : 2015. 12. 2.
    구현 내용 :   
  
  @author By KOSTA 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->      
<!DOCTYPE html>
<html>
<head>
<title>E-GROUPWARE (ADMIN - MODE)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Jquery 선언 -->
<script type="text/javascript" src="<c:url value='/resources/plugin/jqurey-2.1.4/jquery-2.1.4.js'/>" ></script>
<!-- viewport 설정 반응형 UI 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap css선언 -->
<link href="<c:url value='/resources/plugin/bootstrap/css/bootstrap.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/plugin/bootstrap/js/bootstrap.js'/>" ></script>

<link href="<c:url value='/resources/error/animate.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/error/font-awesome.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/error/style.css' />" rel="stylesheet" type="text/css" />
<title>404</title>
</head>     	         	
<body class="gray-bg">    	

<div class="container">
<div class="middle-box text-center animated fadeInDown">
        <h1>404</h1>
        <h3 class="font-bold">Page Not Found</h3>

        <div class="error-desc">
            Sorry, but the page you are looking for has note been found. Try checking the URL for error, then hit the refresh button on your browser or try found something else in our app.
            <form class="form-inline m-t" role="form">
                <div class="form-group">
                </div>  	
            </form>
        </div>
     </div>
</div>
</body>
</html>