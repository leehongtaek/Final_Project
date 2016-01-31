<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
</head>
	
	
<form class="form col-md-12 center" method="post" action="<c:url value='/user/passwordSupport/insert'/>" >
	<div id="myModal" class="container" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        	<!-- Modal Body header -->
	            <div class="modal-header">
	                <h3 class="text-center">비밀번호 찾기</h3>
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
							<input type="email" class="form-control" id="mem_email"
								name="mem_email" placeholder="email" required="required">
				 		</div>
						<div class="form-group">
							<button class="btn btn-primary btn-block" type="submit">메일 보내기 </button>
						</div>
					</div>
				</div>
				<!-- Modal Body End -->
				
	        </div>
	    </div>
	</div>
</form>
<!-- 모달 끝 -->		
	
	
	
	
	
	
	
</body>
</html>