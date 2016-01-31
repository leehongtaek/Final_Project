<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/upload/jquery.form.js'/>"></script>       
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
						document.getElementById('mem_post').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('mem_jibunaddr').value = fullRoadAddr;
						document.getElementById('mem_roadaddr').value = data.jibunAddress;

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
</script>
<script type="text/javascript">
$(function() {
	$("#profile_img_input").change(function(){	
		// 파일 비동기로 보내기 
		var formData = new FormData();
		var $file = $('#profile_img_input')[0].files[0];  
		formData.append("file", $file);    
		console.log($file);  
		
		var reader  = new FileReader();
		
		$.ajax({ 
				url: 'profile/fileUpload',
	     	    data: formData,
	     	    processData: false, 
	     	    contentType: false,
	     	    type: 'POST',
	     	    success: function(data){
	     	    	// var blob = new Blob(data, {type: 'application/octet-binary'});
	     	    	// console.log(blob);      
	     	    	// reader.readAsBinaryString(data);
	     	    	//var bi_data=window.btoa(data);
	     	    	// console.log(bi_data);
	     	    	                 
	     	    	$('#profile_img').attr('src',data);
	     	    	console.log(data);
	     	    }
     	    });  	
	
	
	});
	
});


// $form.appendTo('body');
</script>
<title>PAGE[PROFILE]</title>
<div class="col-sm-12">
	<div class="panel panel-info">
		<div class="panel-heading" style="background-color: #B02753;">
			<h3 style="color: white;">USER INFO UPDATE FORM</h3>
		</div>
		<div class="panel-body"
			style="padding-left: 20px; padding-right: 20px;">
			<form class="form-horizontal"
				action="<c:url value="/profile/update" />" method="post" role="form"
				style="">
				<table class="table">
					<thead>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="3">사진:</td>
							<td rowspan="3">
							<img style="height: 85%;" src="<c:url value="/resources/img/EG.png" />" id="profile_img"><br /> 
							<input style="width: 85%" type="file"  id="profile_img_input" class="btn btn-primary" >	
							</td>
							<td>사원번호:</td>
							<td><input type="text" class="form-control"
								value="${vo.mem_code}" id="mem_code" name="mem_code"
								placeholder="Enter name" readonly="readonly" required="required">
							</td>

						</tr>
						<tr>


							<td>사원이름:</td>
							<td><input type="text" class="form-control"
								value="${vo.mem_name}" id="mem_name" name="mem_name"
								placeholder="Enter name" required="required"></td>
						</tr>
						<tr>
							<td>사원 상태 :</td>
							<td>
								<%-- <input type="text" class="form-control" value="${vo.mem_state}" id="mem_state" placeholder="Enter name" required="required"> --%>
								<c:set var="state" value="대기발령,입사,퇴직" /> 
								<select class="form-control" name="mem_state">
									<option>-- 선택 --</option>
									<c:forEach items="${state}" var="statev" varStatus="status">
										<c:if test="${status.index == vo.mem_state}">
											<option value="${status.index}" selected>${statev}</option>
										</c:if>
										<c:if test="${status.index != vo.mem_state}">
											<option value="${status.index}">${statev}</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td>*Password:</td>
							<td><input type="text" class="form-control"
								value="${vo.mem_pwd}" id="mem_pwd" name="mem_pwd"
								required="required" placeholder="Enter password"></td>

						</tr>
						<tr>
							<td>부서명:</td>
							<td><input type="datetime" class="form-control"
								value="${vo.dept_name}" placeholder="Enter name"
								readonly="readonly"> <input type="hidden"
								value="${vo.dept_num}" name="dept_num"></td>
							<!-- </tr>
							<tr> -->
							<td>입사일:</td>     
							<td><input type="date" class="form-control"
								value="${vo.mem_hiredate}" id="mem_hiredate" name="mem_hiredate"
								placeholder="Enter 입사일" required="required"></td>
						</tr>
						
						<tr>  
							<td>직급:</td>
							<td>
								<input type="text" class="form-control" value="${vo.posit_name}"  placeholder="Enter name" readonly="readonly"> 
								<input type="hidden" class="form-control" value="${vo.posit_num}" name="posit_num"> 
							</td>  
							<td>생년월일:</td>  
							<td><input type="date" class="form-control"
								value="${vo.mem_birthdate}" id="mem_birthdate"
								name="mem_birthdate" placeholder="Enter 생년월일"
								required="required">
							</td>
						</tr>  
						
						<tr>
							<td>전화번호:</td>
							<td><input type="tel" class="form-control"
								value="${vo.mem_tel}" id="mem_tel" name="mem_tel"
								placeholder="Enter 전화번호" required="required"></td>
							<!-- </tr>
							<tr> -->
							<td>이메일:</td>
							<td><input type="email" class="form-control"
								value="${vo.mem_email}" id="mem_email" name="mem_email"
								placeholder="Enter 이메일"></td>
						</tr>
						
						
						
						<tr>
							<td>도로명 주소:</td>
							<td><input type="text" class="form-control"
								value="${vo.mem_roadaddr}" id="mem_roadaddr" name="mem_roadaddr"
								placeholder="Enter address" readonly required="required">
							</td>
							<!-- </tr>
							<tr> -->
							<td>지번 주소:</td>
							<td><input type="text" class="form-control"
								value="${vo.mem_jibunaddr}" id="mem_jibunaddr"
								name="mem_jibunaddr" placeholder="Enter address" readonly
								required="required"></td>
						</tr>
						
						<tr>
							<td>우편번호:</td>
							<td><input type="text" class="form-control"
								value="${vo.mem_post}" id="mem_post" name="mem_post"
								placeholder="Search post number" readonly>
								<button type="button" class="btn btn-success"
									onclick="postsearch()">우편번호 검색</button></td>
							<td>상세주소 :</td>
							<td><input type="text" class="form-control"
								value="${vo.mem_detailaddr}" id="mem_detailaddr"
								name="mem_detailaddr" placeholder="Enter address detail">
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td></td>
							<td align="right">
								<button type="submit" class="btn btn-primary btn-block">UPDATE</button>
							</td>
							<td>
								<button type="button" class="btn btn-danger btn-block"
									onclick="javascript:history.back()">CANCEL</button>
							</td>
						</tr>
					</tfoot>
				</table>










				<%-- <div class="form-group">
						<label class="control-label col-sm-3" for="name">사원번호:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.mem_code}" id="mem_code" name="mem_code" placeholder="Enter name" readonly="readonly" required="required">
						</div>
						<div class="col-sm-4" >
							<div style="width: 245px;height: 245px; ">
								<img src="<c:url value="/resources/img/EG.png" />">
							</div>
							<input type="button" class="btn btn-primary" value="사진 변경" style="width: 100%">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">사원 상태 :</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.mem_state}" id="mem_state" name="mem_state" placeholder="Enter name" required="required">
							<c:set var="state" value="대기발령,입사,퇴직" />
							<select class="form-control" name="mem_state" >
								<option>-- 선택 --</option> 
								<c:forEach items="${state}" var="statev" varStatus="status" >
									<c:if test="${status.index == vo.mem_state}">
									<option value="${status.index}" selected >${statev}</option>
									</c:if>
									<c:if test="${status.index != vo.mem_state}">
									<option value="${status.index}"  >${statev}</option>
									</c:if>
								</c:forEach>
								
						
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">이름:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.mem_name}" id="mem_name" name="mem_name" placeholder="Enter name" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="password" >*Password:</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" value="${vo.mem_pwd}" id="mem_pwd" name="mem_pwd" required="required"  placeholder="Enter password">
						</div>
					</div>
					 
					
					<br>
					
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">부서번호:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.dept_name}" placeholder="Enter name" readonly="readonly" >
							<input type="hidden"  value="${vo.dept_num}" name="dept_num">
							
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">직급번호:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.posit_name}"  placeholder="Enter name" readonly="readonly"> 
							<input type="hidden" class="form-control" value="${vo.posit_num}" name="posit_num"> 
						</div>
					</div>
						
					<div class="form-group">  
						<label class="control-label col-sm-3" for="name">입사일:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.mem_hiredate}" id="mem_hiredate" name="mem_hiredate" placeholder="Enter 입사일" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">생년월일:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.mem_birthdate}" id="mem_birthdate" name="mem_birthdate" placeholder="Enter 생년월일" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">전화번호:</label>
						<div class="col-sm-4">
							<input type="tel" class="form-control" value="${vo.mem_tel}" id="mem_tel" name="mem_tel" placeholder="Enter 전화번호" required="required">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">이메일:</label>
						<div class="col-sm-4">
							<input type="email" class="form-control" value="${vo.mem_email}" id="mem_email" name="mem_email" placeholder="Enter 이메일">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="postnum">우편번호:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.mem_post}" id="mem_post" name="mem_post" placeholder="Search post number" readonly>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-success btn-block" onclick="postsearch()">Search post number</button>
						</div>							
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="address">도로명 주소:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="${vo.mem_roadaddr}" id="mem_roadaddr" name="mem_roadaddr" placeholder="Enter address" readonly required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="address">지번 주소:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="${vo.mem_jibunaddr}" id="mem_jibunaddr" name="mem_jibunaddr" placeholder="Enter address" readonly required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="addrdetails">상세주소 :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" value="${vo.mem_detailaddr}" id="mem_detailaddr" name="mem_detailaddr" placeholder="Enter address detail">
						</div>
					</div>															
					<br>
					
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<button type="submit" class="btn btn-primary btn-block">UPDATE</button>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-danger btn-block" onclick="javascript:history.back()">CANCEL</button>
						</div>
					</div> --%>

			</form>
		</div>
	</div>
</div>