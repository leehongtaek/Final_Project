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
<!-- Favicon -->
<link rel="shortcut icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon" />
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon" />
<title>E-GROUPWARE (ADMIN - MODE)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Jquery 선언 -->
<script type="text/javascript" src="<c:url value='/resources/plugin/jqurey-2.1.4/jquery-2.1.4.js'/>" ></script>
     
<!-- viewport 설정 반응형 UI 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap css선언 -->
<link href="<c:url value='/resources/plugin/bootstrap/css/bootstrap.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/plugin/bootstrap/js/bootstrap.js'/>" ></script>

<!-- fullcalendar & scheduler -->
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
<!-- ckeditor  -->
<script type="text/javascript" src="<c:url value='/resources/plugin/ckeditor/ckeditor.js'/>"></script>
<!--Angular.JS -->
<script src="<c:url value='/resources/plugin/angular-1.4.7/angular.min.js' />"></script>

<!-- bootstrap paging -->
<link href="<c:url value='/resources/layout/css/bootstrap-table.min.css'/>" type="text/css"/>
<script src="<c:url value='/resources/layout/js/bootstrap-table.min.js'/>"/>



<!-- sockjs -->
<script type="text/javascript" src="<c:url value='/resources/plugin/sockjs-client/dist/sockjs-0.3.4.min.js'/>" ></script>

<style type="text/css">
	#layout_menu_body{margin-top: 80px;}
	.navbar-inverse {
    background-color: #005880;
}	 
body {
	box-shadow:0 0px 0px rgba(0, 0, 0, 0);
}
.btn{
box-shadow:0 0px 0px rgba(0, 0, 0, 0);

}


.menu_open_close{
width:10px;
}
#layout_menu_body .panel-heading {
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
    height: 91.5px; 
}
#layout_menu_body .panel{
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
}
.width_zero{width: 0px;}
.width_oe{width: 180px;}
.width_tt{width: 210px;}
.width_zero ul{width: 0px;padding: 0px;height: 0px;}
.width_zero li{width: 0px;padding: 0px;height: 0px;}
.width_zero a{font-size: 0px;padding: 0px;height: 0px;}
#sidebar li{max-width: 170px;}
#sidebar ul{max-width: 170px;}
</style>
<script>
  $(document).ready(function(){ 
	  /* $('#sidebar').addClass( "width_zero" );
		$('#menu_close').addClass( "width_zero" ); */
	  $('#sidebar').toggle( "slide" );
	$('#menu_close').toggle( "slide" );
	 /* $('#menu_bar_total').toggle( "slide" );   */
	 
	 $.ajax({
		 type : "GET",
		 url : "<c:url value='/report/approvalCount.json/' />",
		 contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			 success : function(result, status, xhr) {
			 
				 console.log("테스트");	
				 console.log(result);
				 $('#reportBadge1').html(result);
				 $('#reportBadge2').html(result);
			}
		});	
	 
}); 
function menu_bar_tog() {
		if($('#sidebar').hasClass( "width_zero" )){
			$('#sidebar').removeClass( "width_zero" );
			$('#menu_close').removeClass( "width_zero" );
			$('#sidebar').addClass( "width_oe" );
			$('#menu_close').addClass( "width_tt" );
			
		}
		/* $('#menu_open').toggle( "slide" ); */
		$('#sidebar').toggle( "slide" );
		$('#menu_close').toggle( "slide" );
		
}
</script>



</head>
<body>
	<div class="container-fluid" id="layout_header">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 " style="z-index: 5;">
				<!-- tiles header Start -->
				<tiles:insertAttribute name="header" />
				<!-- tiles header End -->
			</div>
		</div>
	</div>
	<!-- /.well -->

	<div class="container-fluid" id="layout_menu_body">
		<div class="row row-offcanvas row-offcanvas-left">
			<div id="menu_bar_total">
				<div  id="sidebar" class="width_zero" style="z-index: 4;position: absolute;padding-left: 0px;">
					<div class="row" style="background-color:#005880;border-bottom-right-radius:10px;">
					<!-- tiles menu Start-->
						<div style="width: 170px;">
							<tiles:insertAttribute name="menu" />
						</div>
						
					</div>
					
					<!-- tiles menu End-->
				</div>
				<div  id="menu_close"
					class="width_zero"
					style="z-index: 3;top:80;
					background-color:#005880;
					height: 400px;
					position:absolute  ;float: right;left: 0px;
					border-bottom-right-radius:10px;
					border-top-right-radius:10px; cursor: pointer;"
					onclick="menu_bar_tog()">
						<a style="float: right;color: white;">
							<span class="glyphicon glyphicon glyphicon-menu-left" aria-hidden="true"></span> 
						</a>
				</div>
			</div>
			<div  id="menu_open"
				style="z-index: 3;top:80;
				background-color:#005880;
				height: 400px;width: 40px; 
				position:absolute  ;float: right;left: 0px;
				border-bottom-right-radius:10px;
				border-top-right-radius:10px; cursor: pointer;"
				onclick="menu_bar_tog()">
					<a style="float: right;color: white;">
						<span class="glyphicon glyphicon glyphicon-menu-right" aria-hidden="true"></span> 
					</a>
			</div>
			<!--/.sidebar-offcanvas-->
    
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10"  
				style="margin-left: 150px;min-height: 300px; margin-right: 300px" >
				<!-- tiles body Start-->  
				<tiles:insertAttribute name="body"/>
				<!-- tiles body Start-->
			</div>
			<!--/.col-xs-12.col-sm-9--> 

		
		</div>
		<!--/row-->
		
		<br> 
		<br>
		<br>
		<hr>

		<footer style="margin-bottom: 0px;margin-left: 200px;">
			<!-- tiles "footer start -->
			<tiles:insertAttribute name="footer"/>
			<!-- tiles "footer start -->
		</footer>

	</div>
	<!--/.container-->
</body>
</html>