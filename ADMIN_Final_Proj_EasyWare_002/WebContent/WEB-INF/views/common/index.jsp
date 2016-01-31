<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PAGE - LAYOUT - [NAME]</title>
<!-- Jquery 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/plugin/jqurey-2.1.4/jquery-2.1.4.js'/>"></script>

<!-- viewport 설정 반응형 UI 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap css선언 -->                     
<%-- <link href="<c:url value='/resources/plugin/bootstrap/css/bootstrap.css' />" rel="stylesheet" type="text/css" /> --%>
<link href="<c:url value='/resources/layout/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/plugin/bootstrap/js/bootstrap.js'/>"></script>
    
<link href="<c:url value='/resources/layout/css/default/default.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/layout/css/style.min.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/layout/css/animate.min.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/layout/css/style-responsive.min.css' />" rel="stylesheet" type="text/css" />
       
<!-- JQuery UI -->
<script src="<c:url value='/resources/plugin/jquery-ui-1.11.4.custom/external/jquery/jquery.js' />"></script>
<script src="<c:url value='/resources/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.js' />"></script>

<script src="<c:url value='/resources/plugin/easy-pie-chart-master/dist/jquery.easypiechart.js' />"></script>

<style type="text/css">
 #section1 {margin-top: 110px;}
 #section2 {margin-top: 110px;}
</style>
</head>
<body>
<div class="bs-component">
	<nav class="navbar navbar-inverse navbar-fixed-top" style="box-shadow:0 0px 0px rgba(0, 0, 0, 0);">
		<input id="session_memcode" type="hidden" value="${sessionScope.mem_code}">
		<!-- /navbar-header Start --> 
		<div class="navbar-header">
			<!-- Top Menu Category : Service Name = Home --> 
			<img style="width:30px; cursor:pointer; ; padding: 5px 15px; height:65px;line-height: inherit; " class="navbar-brand"  	
			src="<c:url value="/resources/img/white_clear.png"/>"/>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>							
							<span class="icon-bar"></span>
				</button>
		</div>
		<!-- /navbar-header END -->
			
		<div class="collapse navbar-collapse" id="myNavbar">
				
				<ul class="nav navbar-nav navbar-right" style=" margin-right: 15px;">
		
		</div>
	</nav>
</div>


<form class="form col-md-12 center-block" method="post"  
				action="<c:url value='/loginAuth'/>" >    
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in hide"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<div class="login-cover">
	    <div class="login-cover-bg"></div>
	</div>
	<!-- begin #page-container -->
	<div id="page-container" class="fade in">
	    <!-- begin login -->
        <div class="login login-v2 animated fadeIn" data-pageload-addclass="animated fadeIn">
            <!-- begin brand -->
            <div class="login-header">  
                <div class="brand" style="text-align: center;">  
                     <h1>Admin Mode</h1>           
                </div>
                <div class="icon">  
                    <i class="fa fa-sign-in"></i>
                </div>
            </div>
            <!-- end brand -->
            <div class="login-content">
               
                    <div class="form-group m-b-20">
                        <!-- <input type="text" class="form-control input-lg" placeholder="Email Address"> -->
                        <input type="text" class="form-control input-lg" id="mem_id" name="mem_id"
								placeholder="ID" required="required">
                    </div>      
                    <div class="form-group m-b-20">
                       <!--  <input type="text" class="form-control input-lg" placeholder="Password"> -->
                    	<input type="password" class="form-control input-lg" id="mem_pwd"
								name="mem_pwd" placeholder="Password" required="required">
                    </div>  
                    <div class="checkbox m-b-20">
                        <label>
                           <!--  <input type="checkbox"> Remember Me -->
                        </label>
                    </div>
                    <div class="login-buttons">
                        <button type="submit" class="btn btn-success btn-block btn-lg">Sign In</button>
                    </div>
                    <div class="m-t-20">
					</div>            
               
            </div>
        </div>    
        <!-- end login -->
	</div>
	<!-- end page container -->
</form>	
	















<!-- section1 start -->
<!-- <section class="container" id="section1">
    <div class="row v-center">
        <h1 class="text-center"> Kosta 108st </h1>
        <h2 class="text-center lato animate slideInDown">EasyWare <b>Something</b> Unique</h2>
        <div class="col-sm-6 col-sm-offset-3">
	        <p class="text-center">
	            <br>
	            <a href="#" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#myModal"> LOG IN </a>
	        </p>
        </div>
    </div>
</section> -->    
<!-- /.section1 end -->





	<hr>
	<div class="container">
			<footer>
				<p>&copy; 2015 KOSTA-108st SEMI-PROJ(E-GOURPWARE)</p>
			</footer>
	</div>
		<!-- footer 끝 -->
    </div>
</footer>


<!-- 모달 시작 -->
<form class="form col-md-12 center-block" method="post"
				action="<c:url value='/loginAuth'/>" >
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        	<!-- Modal Body header -->
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h3 class="text-center">Login</h3>
	            </div>
	            <!-- / Modal Body header -->
	            
	            <!-- Modal Body Start -->
				<div class="modal-body row">
					<div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
						<div class="form-group">
							<input type="text" class="form-control" id="mem_id" name="mem_id"
								placeholder="ID" required="required">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="mem_pwd"
								name="mem_pwd" placeholder="Password" required="required">
						</div>
						<div class="form-group">
							<button class="btn btn-primary btn-block">Sign In</button>
						</div>
					</div>
				</div>
				<!-- Modal Body End -->
				<!-- Modal footer Start -->
				<div class="modal-footer">
						<div class="col-md-12">
							<button class="btn" aria-hidden="true" type="button"
								onclick="goUrl()">Register</button>
							<span class="pull-left"><a href='<c:url value="/user"/>' >Need help?</a></span>
							<script type="text/javascript">
								function goUrl() {
									location = "signup";
								}
							</script>
					</div>
				</div>
				<!-- Modal footer End -->
	        </div>
	    </div>
	</div>
</form>
<!-- 모달 끝 -->	




</body>
</html>






