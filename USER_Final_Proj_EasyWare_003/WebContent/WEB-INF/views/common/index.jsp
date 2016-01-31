<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Favicon -->
<link rel="shortcut icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon" />
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PAGE - LAYOUT - [NAME]</title>
<!-- Jquery 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/plugin/jqurey-2.1.4/jquery-2.1.4.js'/>"></script>

<!-- viewport 설정 반응형 UI 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap css선언 -->
<link
	href="<c:url value='/resources/plugin/bootstrap/css/bootstrap.css' />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<c:url value='/resources/plugin/bootstrap/js/bootstrap.js'/>"></script>

<!-- fullcalendar & scheduler -->
<link
	href="<c:url value='/resources/plugin/fullcalendar-2.4.0/lib/cupertino/jquery-ui.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/resources/plugin/fullcalendar-2.4.0/fullcalendar.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/resources/plugin/fullcalendar-2.4.0/fullcalendar.print.css' />"
	rel="stylesheet" type="text/css" media='print' />
<link
	href="<c:url value='/resources/plugin/fullcalendar-scheduler-1.0.1/scheduler.css' />"
	rel="stylesheet" type="text/css" />
<script
	src="<c:url value='/resources/plugin/fullcalendar-2.4.0/lib/jquery.min.js' />"></script>
<script
	src="<c:url value='/resources/plugin/fullcalendar-2.4.0/lib/jquery-ui.custom.min.js' />"></script>
<script
	src="<c:url value='/resources/plugin/fullcalendar-2.4.0/lib/moment.min.js' />"></script>
<script
	src="<c:url value='/resources/plugin/fullcalendar-2.4.0/fullcalendar.js' />"></script>
<script
	src="<c:url value='/resources/plugin/fullcalendar-2.4.0/lang/ko.js' />"></script>
<script
	src="<c:url value='/resources/plugin/fullcalendar-scheduler-1.0.1/scheduler.js' />"></script>
<!-- ckeditor  -->
<script type="text/javascript"
	src="<c:url value='/resources/plugin/ckeditor/ckeditor.js'/>"></script>
<style type="text/css">
 #section1 {margin-top: 110px;}
 #section2 {margin-top: 110px;}
 .navbar-inverse {
    background-color: #005880;
    box-shadow:0 0px 0px rgba(0, 0, 0, 0);
}	 
body {
	box-shadow:0 0px 0px rgba(0, 0, 0, 0);
}
.btn{
box-shadow:0 0px 0px rgba(0, 0, 0, 0);

}

</style>
</head>
<body>
<div class="bs-component">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="margin-left: 0px ;padding-left: 0px;">
	    <div class="container" style="margin-left: 17px ;padding-left: 0px;">
	    <img style="padding: 5px 15px; height:65px;line-height: inherit; " class="navbar-brand" src="<c:url value="/resources/img/white_clear.png"/>"/>
	        <!-- <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="index">E-GROUP GROUPWARE</a>
	        </div>  --> 
	        <!-- <div class="navbar-collapse collapse" id="navbar-collapsible">
	            <ul class="nav navbar-nav navbar-left">
	                <li><a href="#section1">Home</a></li>
	                <li><a href="#section2">포트폴리오</a></li>
	                <li><a href="#section3">팀 소개 </a></li>
	                <li><a href="#section4">팀원 소개</a></li>
	                <li><a href="#section5">연락처</a></li>
	             
	                <li>&nbsp;</li>
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-heart-o fa-lg"></i></a></li>
	            </ul>
	        </div> -->
	    </div>
	</nav>
</div>

<!-- section1 start -->
<section class="container" id="section1">
    <div class="row v-center">
        <h1 class="text-center"> Kosta 108st </h1>
        <h2 class="text-center lato animate slideInDown">EasyWare <b>Something</b> Unique</h2>
        <div class="col-sm-6 col-sm-offset-3">
	        <p class="text-center">
	            <br>
	            <a href="#" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#myModal"> LOGIN </a>
	        </p>
        </div>
    </div>
</section>
<!-- /.section1 end -->

<!-- section2 start -->
<!-- <section class="container-fluid" id="section2">
    <div class="container v-center">
        <div class="row">
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInLeft animate">
                            <div class="panel-heading">
                            <h3>주요특징</h3></div>
                            <div class="panel-body">
                                <p>구현기능에 대해서 서술</p>
                                <hr>GO
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInUp animate">
                            <div class="panel-heading">
                            <h3>사용된 주요기술들</h3></div>
                            <div class="panel-body">
                                <p>SPIRNG , JQuery , ORACLE</p>
                                <hr>GO
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInRight animate">
                            <div class="panel-heading">
                            <h3>GROUPWARE</h3></div>
                            <div class="panel-body">
                                <p>There is other content and snippets of details or features that can be placed here..</p>
                                <hr>GO
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        /row
        <div class="row">
            <br>
        </div>
    </div>
    /container
</section> -->
<!--/. section2 end -->


<!-- section3 start -->
<!-- <section class="container-fluid" id="section3">
    <h1 class="text-center"> 팀  소개 </h1>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <h3 class="text-center lato slideInUp animate">That <strong>Doesn't</strong> Have to Look Like Bootstrap.</h3>
            <br>
            <div class="row">
                <div class="col-xs-4 col-xs-offset-1">Some brand-tacular designs even have home page content that is taller that 12,000 pixels. That's a lotta content.</div>
                <div class="col-xs-2"></div>
                <div class="col-xs-4 text-right">Anyhoo, this is just some random blurb of text, and Bootply.com is a playground and code editor for Bootstrap.</div>
            </div>
            <br>
            <p class="text-center">
                <img src="//placehold.it/444x222/444/FFF" class="img-responsive thumbnail center-block ">
            </p>
        </div>
    </div>
</section>


<section class="container-fluid" id="section4">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
            <h2 class="text-center lato"> 팀원 소개</h2>
            <hr>
            <div class="media">
                <h3>김선우(팀장)</h3>
                <div class="media-left">
                    <img src="//placehold.it/100">
                </div>
                <div class="media-body media-middle">
                    <p>팀 총괄</p>
                </div>
            </div>
            <hr>
            <div class="media">
                <h3>이홍택</h3>
                <div class="media-body media-middle">
                    <p> UI 디자인 </p>
                </div>
                <div class="media-right">
                    <img src="//placehold.it/100">
                </div>
            </div>
            <hr>
            <div class="media">
                <h3>박종문</h3>
                <div class="media-left">
                    <img src="//placehold.it/100">
                </div>
                <div class="media-body media-middle">
                    <p>웹 기획 , 요구 사항 분석 </p>
                </div>
            </div>
            <hr>
            <div class="media">
                <h3>김병기</h3>
                <div class="media-body media-middle">
                    <p>기술 총괄 </p>
                </div>
                <div class="media-right">
                    <img src="//placehold.it/100">
                </div>
            </div>
            <hr>
            <div class="media">
                <h3>박성민</h3>
                <div class="media-left">
                    <img src="//placehold.it/100">
                </div>
                <div class="media-body media-middle">
                    <p> 플러그인 개발 </p>
                </div>
            </div>
            <hr>
            <div class="media">
                <h3>유현주</h3>
                <div class="media-body media-middle">
                    <p> 캘린터 플러그인 개발 </p>
                </div>
                <div class="media-right">
                    <img src="//placehold.it/100">
                </div>
            </div>

        </div>
    </div>
</section> -->
<!--/. section2 end -->


<section class="container-fluid" id="section5">
    <div class="row">
        <!--fontawesome icons-->
        <div class="col-sm-1 col-sm-offset-3 col-xs-4 text-center">
            <i class="fa fa-github fa-4x"></i>
        </div>
        <div class="col-sm-1 col-xs-4 text-center">
            <i class="fa fa-foursquare fa-4x"></i>
        </div>
        <div class="col-sm-1 col-xs-4 text-center">
            <i class="fa fa-pinterest fa-4x"></i>
        </div>
        <div class="col-sm-1 col-xs-4 text-center">
            <i class="fa fa-google-plus fa-4x"></i>
        </div>
        <div class="col-sm-1 col-xs-4 text-center">
            <i class="fa fa-twitter fa-4x"></i>
        </div>
        <div class="col-sm-1 col-xs-4 text-center">
            <i class="fa fa-dribbble fa-4x"></i>
        </div>
    </div>
</section>

<footer id="footer">
    <div class="container">
       <!--  <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-3 column">
                <h4>Information</h4>
                <ul class="nav">
                    <li><a href="about-us.html">Products</a></li>
                    <li><a href="about-us.html">Services</a></li>
                    <li><a href="about-us.html">Benefits</a></li>
                    <li><a href="elements.html">Developers</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Follow Us</h4>
                <ul class="nav">
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Google+</a></li>
                    <li><a href="#">Pinterest</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Contact Us</h4>
                <ul class="nav">
                    <li><a href="#">Email</a></li>
                    <li><a href="#">Headquarters</a></li>
                    <li><a href="#">Management</a></li>
                    <li><a href="#">Support</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Customer Service</h4>
                <ul class="nav">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Delivery Information</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms &amp; Conditions</a></li>
                </ul>
            </div>
        </div> -->  
        <!--/row-->
        <!-- footer 시작 -->
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
							<button class="btn btn-primary btn-block">Login</button>
						</div>
					</div>
				</div>
				<!-- Modal Body End -->
				<!-- Modal footer Start -->
				<div class="modal-footer">
						<div class="col-md-12">
							<button class="btn" aria-hidden="true" type="button"
								onclick="goUrl()">Register</button>
							<span class="pull-left"><a href="<c:url value='/user/passwordSupport' />">Need help?</a></span>
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