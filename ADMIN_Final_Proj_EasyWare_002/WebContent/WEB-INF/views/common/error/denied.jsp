<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<!DOCTYPE html>
<html>
<head>
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
<script>
$(function() {
	setTimeout(function() {
		location = "index";
	}, 2000);
});
</script>
</head>     	         	
<body class="gray-bg">    	

<div class="container">    
<div class="middle-box text-center animated fadeInDown">
        <h2 style="font-size: 80px;">Login Fail!</h2>   
        <h3 class="font-bold">Login Fail</h3>
        <div class="error-desc">
           <h2> 2 초후에 로 이동합니다 ! ^^ </h2>
           <br>
        </div>
    </div>
</div>

</body>
</html>