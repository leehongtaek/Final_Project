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
<title>PAGE - LAYOUT - [NAME] </title>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function postsearch(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_jibunaddr').value = fullRoadAddr;
                document.getElementById('mem_roadaddr').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<script type="text/javascript">
function id_Check() {
	var mem_id = $("#mem_id").val();
	
	$.ajax({
		type : "POST",
		url : "idchk",
		data : "mem_id=" + mem_id,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			var ret = parseInt(resultData,10);
			if (ret=="1") {
				alert("아이디가 중복됬습니다!");
				
			} else if(ret=="0"){
				alert("아이디 사용가능합니다.");
				// $("#id").val(id_Check_val);
			}
			
		}

	});

}

$(function() {
		$('#re_pwd').keyup(function () {
			var mem_pwd=$('#mem_pwd').val();
			var re_pwd=$('#re_pwd').val();
			if (mem_pwd==re_pwd) {
				
				$('#re_pwd > span').html('비밀번호가 일치합니다!');
			} else{
				
				$('#re_pwd > span').html('비밀번호가 맞지 않습니다!');
			}
			
			
		});
});
</script>
</head>
<body>
<div class="contatainer">
		<nav class="navbar">

			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index">E-GROUP GROUPWARE</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="index">E-GROUP GROUPWARE</a></li>
						<li><a href="#about">About</a></li>
						<li><a href="#contact">Contact</a></li>
					</ul>
				</div>
				<!-- /.nav-collapse -->
			</div>
			<!-- /.container -->
		</nav>
		<!-- /.navbar -->
	</div>

	<hr>

	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading"><h3>Sing-up form</h3></div>
			<div class="panel-body">
				<form class="form-horizontal" action="signup_insert" method="post" role="form">
					<div class="form-group">
						<label class="control-label col-sm-3" for="id"> * ID:</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="Enter id" required="required">
						</div>
						<div class="col-sm-3">
							<button type="button" onclick="id_Check()" class="btn btn-success btn-block">Check useability</button>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="password" >*패스워드:</label>
						<div class="col-sm-3">
							<input type="password" class="form-control" id="mem_pwd" name="mem_pwd" required="required"  placeholder="Enter password">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="repwd">*패스워드 재입력:</label>
						<div class="col-sm-3">
							<input type="password" class="form-control" id="re_pwd" name="re_pwd" placeholder="Retype password" required="required">
						</div>
						<div class="col-sm-4">
							<div id ="re_pwd" class="alert alert-warning" role="alert" style="padding: 8px 35px 8px 14px;margin-bottom: 18px;"><span style="font-size: 12px;">비밀번호를 동일하게 작성하세요! </span></div>
						</div>
					</div>
					
					<br>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">이름:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="Enter name" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">부서번호:</label>
						<div class="col-sm-4">
							<select class="form-control" name="dept_num">
								<option name="dept_num" value="">-- 선택 --</option>
								<option name="dept_num" value="0">관리부</option>
								<option name="dept_num" value="1">영업부</option>
								<option name="dept_num" value="2">관리부</option>
								<option name="dept_num" value="3">개발부</option>
								<option name="dept_num" value="4">비서부</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">직급번호:</label>
						<div class="col-sm-4">
							<select class="form-control" id="position_num" name="position_num">
								<option name="position_num" value="">-- 선택 --</option>
								<option name="position_num" value="0">관리자모드</option>
								<option name="position_num" value="1">사장</option>
								<option name="position_num" value="2">부사장</option>
								<option name="position_num" value="3">부서장</option>
								<option name="position_num" value="4">차장</option>
								<option name="position_num" value="5">부장</option>
								<option name="position_num" value="6">대리</option>
								<option name="position_num" value="7">인턴</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">입사일:</label>
						<div class="col-sm-4">
							<input type="date" class="form-control" id="mem_hiredate" name="mem_hiredate" placeholder="Enter 입사일" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">생년월일:</label>
						<div class="col-sm-4">
							<input type="date" class="form-control" id="mem_birthdate" name="mem_birthdate" placeholder="Enter 생년월일" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">전화번호:</label>
						<div class="col-sm-4">
							<input type="tel" class="form-control" id="mem_tel" name="mem_tel" placeholder="Enter 전화번호" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">이메일:</label>
						<div class="col-sm-4">
							<input type="email" class="form-control" id="mem_email" name="mem_email" placeholder="Enter 이메일">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="postnum">우편번호:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mem_post" name="mem_post" placeholder="Search post number" readonly>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-success btn-block" onclick="postsearch()">Search post number</button>
						</div>							
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="address">도로명 주소:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="mem_roadaddr" name="mem_roadaddr" placeholder="Enter address" readonly required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="address">지번 주소:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="mem_jibunaddr" name="mem_jibunaddr" placeholder="Enter address" readonly required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="addrdetails">상세주소 :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="mem_detailaddr" name="mem_detailaddr" placeholder="Enter address detail">
						</div>
					</div>															
					<br>
					
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<button type="submit" class="btn btn-primary btn-block">Sign up</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>

	<footer>
	<p>&copy; 2015 KOSTA-108st SEMI-PROJ(E-GOURPWARE)</p>
	</footer>
</body>
</html>