<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- struts tag 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>

<title>PAGE[contact_add]</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function postsearch() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('cont_post').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('cont_jibunaddr').value = fullRoadAddr;
						document.getElementById('cont_roadaddr').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}, {
					autoClose : true
				}).open();
	}

	/*Ajax로 회사 검색 버튼  */
	$(function() {
		$('#btn1').click(
				function() {
					var params = "searchType=" + $('#searchType').val()
							+ "&searchValue=" + $('#searchValue').val();
					console.log(params);
					$.ajax({
						url : "searchComp",
						data : params,
						success : function(args) {
							/* 검색 결과 뿌려질 태그  */
							$('#target1').html(args);
						},
						error : function(e) {
							alert(e.responseText);
						}
					});
				});
	});

	/*Ajax로 검색 된 회사이름과 번호를 옮김  */
	 var temp;
	 function test1(args){
		 temp = $('#comp_nameVal'+args);
		 $('#comp_name').val(temp.val());
		 $('#target2').html($('#comp_num'+args));
	 }
	 $(document).ready(test1());
	 

</script>






<!-- Modal Start -->
<div class="container-fluid">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회사 찾기</h4>
				</div>
				<div class="modal-body">

					<!-- 검색$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- 검색-->
					<!-- btn1 : Ajax에서 클릭 이벤트 수행-->
					<div class="form-inline">
						<label for="select"></label> <select name="searchType"
							class="form-control" id="searchType">
							<option value="">선택</option>
							<option value="1">회사명</option>
							<option value="2">주소</option>
							<option value="3">전화번호</option>
							<option value="4">홈페이지</option>
						</select> <input type="text" class="form-control" name="searchValue"
							id="searchValue" placeholder="Search Value..">
							
						<button type="button" class="btn btn-default" id="btn1">선택</button>
					</div>
					<br />
					<!-- 회사 검색 결과 테이블  -->
					<table class="table table-condensed">
						<thead>

							<tr class="success">
								<th>회사이름</th>
								<th>주소</th>
								<th>전화번호</th>
								<th>홈페이지</th>
							</tr>
						</thead>
						<!--이 tbody안으로 결과값 넣어줌-->
						<tbody id="target1">
							<!-- 
						<tr>
			  			    <input type='hidden' name='comp_num' id='comp_num" + vo.getComp_num() + value="vo.getComp_num()"
							<input type='hidden' name='comp_nameVal' id='comp_nameVal" + vo.getComp_num() + "value=vo.getComp_name()+/>
							회사명을 버튼으로 만들어 클릭하면
							input태그에 넣을 수 있게 처리했습니다.
							<td><button type='button' class='btn btn-default' 
							data-dismiss='modal' onclick='test1("+vo.getComp_num()+")'>"
							+ vo.getComp_name() +"</button></td>
							
							<td>"+ vo.getComp_jibunaddr() +"</td>
							<td>"+ vo.getComp_tel() +"</td>
							<td>vo.getComp_home()</td>
						</tr>
								 -->

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End -->




<div class="col-md-12">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3>Contact form</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" action="contact_insert" method="post"
				role="form">

				<div class="form-group">
					<label class="control-label col-sm-3" for="name">이름:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="cont_name"
							name="cont_name" placeholder="Enter name" required="required">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3" for="name">회사명:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="comp_name" readonly
							placeholder="Plase Button Click">
						<div id="target2"></div>
					</div>

					<!-- Button trigger modal -->
					<!-- 회사 검색 팝업창 띄우는 버튼 -->
					<div class="col-sm-2">
						<button type="button" class="btn btn-success btn-block"
							data-toggle="modal" data-target="#myModal">회사 찾기</button>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3" for="name">부서번호:</label>
					<div class="col-sm-4">
						<select class="form-control" name="dept_num">
							<option name="dept_num" value="">-- 선택 --</option>
							<option name="dept_num" value="1">법무팀</option>
							<option name="dept_num" value="2">인사팀</option>
							<option name="dept_num" value="3">영업팀</option>
							<option name="dept_num" value="4">생산팀</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3" for="name">직급번호:</label>
					<div class="col-sm-4">
						<select class="form-control" id="position_num" name="position_num">
							<option name="position_num" value="">-- 선택 --</option>
							<option name="position_num" value="1">사장</option>
							<option name="position_num" value="2">부사장</option>
							<option name="position_num" value="3">차장</option>
							<option name="position_num" value="4">부장</option>
							<option name="position_num" value="5">대리</option>
							<option name="position_num" value="6">인턴</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3" for="name">등록일:</label>
					<div class="col-sm-4">
						<input type="date" class="form-control" id="cont_regdate"
							name="cont_regdate" placeholder="Enter 입사일" required="required">
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-3" for="name">전화번호:</label>
					<div class="col-sm-4">
						<input type="tel" class="form-control" id="cont_tel"
							name="cont_tel" placeholder="Enter 전화번호" required="required">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3" for="name">이메일:</label>
					<div class="col-sm-4">
						<input type="email" class="form-control" id="cont_email"
							name="cont_email" placeholder="Enter 이메일">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3" for="address">도로명 주소:</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="cont_roadaddr"
							name="cont_roadaddr" placeholder="Enter address" readonly
							required="required">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3" for="address">지번 주소:</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="cont_jibunaddr"
							name="cont_jibunaddr" placeholder="Enter address" readonly
							required="required">
					</div>
				</div>


				<div class="form-group">
					<label class="control-label col-sm-3" for="postnum">Post
						number:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="cont_post"
							name="cont_post" placeholder="Search post number" readonly>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-success btn-block"
							onclick="postsearch()">주소검색</button>
					</div>
				</div>


				<div class="form-group">
					<label class="control-label col-sm-3" for="addrdetails">상세주소
						:</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="cont_detailaddr"
							name="cont_detailaddr" placeholder="Enter address detail">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3" for="addrdetails">etc
						:</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="cont_etc" id="cont_etc"></textarea>
					</div>
				</div>





				<br>
				<div class="row">
					<div class="col-sm-3 col-sm-offset-3">
						<button type="submit" class="btn btn-primary btn-block">등록하기</button>
					</div>
					<div class="col-sm-3">
						<button type="button" class="btn btn-danger" onclick="goUrl('contact_list')">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>