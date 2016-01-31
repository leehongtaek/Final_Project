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

<!-- JQuery UI -->
<script src="<c:url value='/resources/plugin/jquery-ui-1.11.4.custom/external/jquery/jquery.js' />" ></script>
<script src="<c:url value='/resources/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.js' />"></script>

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

<title>PAGE - LAYOUT - [NAME] </title>
</head>
<body>
SIGNUP RESULT 페이지 -> 회원 가입 성공 여부  메시지 출력  
<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3>SIGNUP - Success!</h3></div>
			<div class="panel-body">

			<h2>SIGNUP!<br><br></h2>
			
				<form class="form-horizontal" role="form" action="#" method="post">
					<div class="form-group">
						<div class="col-sm-12">
							<button type="button" class="btn btn-danger btn-block" >Back</button>
						</div>
					</div>
				</form>			

			</div>
		</div>		
	</div>
</body>
</html>