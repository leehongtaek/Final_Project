<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
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
        },{autoClose: true}).open();
    }
</script>
<title>PAGE[PROFILE]</title>
<div class="col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading"><h3>USER INFO UPDATE FORM</h3></div>
			<div class="panel-body">
				<form class="form-horizontal" action="profile_update" method="post" role="form">
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="password" >*Password:</label>
						<div class="col-sm-3">
							<input type="password" class="form-control" value="${vo.mem_pwd}" id="mem_pwd" name="mem_pwd" required="required"  placeholder="Enter password">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="repwd">*Retype password:</label>
						<div class="col-sm-3">
							<input type="password" class="form-control"  id="re_pwd" name="re_pwd" placeholder="Retype password" required="required">
						</div>
					</div>
					
					<br>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">이름:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" value="${vo.mem_name}" id="mem_name" name="mem_name" placeholder="Enter name" required="required">
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
						<label class="control-label col-sm-3" for="name">입사일:</label>
						<div class="col-sm-4">
							<input type="date" class="form-control" value="${vo.mem_hiredate}" id="mem_hiredate" name="mem_hiredate" placeholder="Enter 입사일" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">생년월일:</label>
						<div class="col-sm-4">
							<input type="date" class="form-control" value="${vo.mem_birthdate}" id="mem_birthdate" name="mem_birthdate" placeholder="Enter 생년월일" required="required">
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
						<label class="control-label col-sm-3" for="postnum">Post number:</label>
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
					</div>
				</form>
			</div>
		</div>
	</div>