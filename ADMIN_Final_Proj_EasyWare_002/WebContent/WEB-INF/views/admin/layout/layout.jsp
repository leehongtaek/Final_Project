<%-- 
    작업 날짜 : 2015.10.18
    구현 내용 : 기본적인 ADMIN 페이지 레이아웃 템플릿 구현
  
  @author By Byeong Gi Kim
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%><!-- tiles 태그 선언  -->
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


<%-- <!-- fullcalendar & scheduler -->
<link href="<c:url value='/resources/plugin/fullcalendar-2.4.0/lib/cupertino/jquery-ui.min.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/plugin/fullcalendar-2.4.0/fullcalendar.min.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/plugin/fullcalendar-2.4.0/fullcalendar.print.css' />" rel="stylesheet" type="text/css" media='print' />
<link href="<c:url value='/resources/plugin/fullcalendar-scheduler-1.0.1/scheduler.css' />" rel="stylesheet" type="text/css" />
<script src="<c:url value='/resources/plugin/fullcalendar-2.4.0/lib/jquery.min.js' />"></script>
<script src="<c:url value='/resources/plugin/fullcalendar-2.4.0/lib/jquery-ui.custom.min.js' />"></script>
<script src="<c:url value='/resources/plugin/fullcalendar-2.4.0/lib/moment.min.js' />"></script>
<script src="<c:url value='/resources/plugin/fullcalendar-2.4.0/fullcalendar.js' />"></script>
<script src="<c:url value='/resources/plugin/fullcalendar-2.4.0/lang/ko.js' />"></script>
<script src="<c:url value='/resources/plugin/fullcalendar-scheduler-1.0.1/scheduler.js' />"></script>
<!-- ckeditor  --> --%>  

<%-- <script type="text/javascript" src="<c:url value='/resources/plugin/ckeditor/ckeditor.js'/>"></script> --%>
<style type="text/css">
	#layout_menu_body{margin-top: 80px;}
</style>
</head>
<body>
	<div class="container-fluid" id="layout_header">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
				<!-- tiles header Start -->
				<tiles:insertAttribute name="header" />
				<!-- tiles header End -->
			</div>
		</div>
	</div>
	<!-- /.well -->

	<div class="container-fluid" id="layout_menu_body">
		<div class="row row-offcanvas row-offcanvas-left">
        
			<div class="col-xs-0 col-sm-0 col-md-2 col-lg-2 sidebar-offcanvas visible-lg-block visible-md-block" id="sidebar">
				<!-- tiles menu Start-->
				<tiles:insertAttribute name="menu" />
				<!-- tiles menu End-->
			</div>
			<!--/.sidebar-offcanvas--> 
                
			<div class="col-xs-8 col-md-8 col-sm-8">
				<!-- tiles body Start-->
				<tiles:insertAttribute name="body" />
				<!-- tiles body Start-->
			</div>
			<!--/.col-xs-12.col-sm-9-->


		</div>
		<!--/row-->

		<hr>
       
		<footer style="text-align: center;">
			<!-- tiles "footer start -->
			<tiles:insertAttribute name="footer" />
			<!-- tiles "footer start -->
		</footer>

	</div>
	<!--/.container-->
</body>
</html>