<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->

<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/layout/js/common.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	var d = new Date();
	    d = d.toLocaleDateString(); // 브라우저의 현재 시간을 가져옴
	$('#todayinfo').html("  오늘   날짜  : "+d);
	    
	    
	$('#chk_Finish_Work').click(function() {
		$('#btn_chk_finish_Work').removeClass('btn-default');
		$('#btn_chk_finish_Work').addClass('btn-danger');
	});    
});
</script>
<title>PAGE - MENU [NAME]</title>
TIME CARD UI - > 현재 시간 구해서 , 페이징 구현(현재  달의 일수 만큼 출력) , 출근시에는 세션을 연결시 체크 , 퇴근은 근무 확인을  체크시간으로 체크 
<div class="row">
	<div class="col-sm-12">
		<h2>TIME CARD</h2>
		<span id="todayinfo">Today</span>
		<button class="btn btn-info"type="button"><span class="glyphicon glyphicon-chevron-left"></span></button>
		<button class="btn btn-info"type="button">이번달</button>
		<button class="btn btn-info"type="button"><span class="glyphicon glyphicon-chevron-right"></span></button>
		&nbsp; 
	</div>
</div>
<div class="row">
	<div class="col-sm-12 form-group">
		<form action="">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>날짜</th>
						<th>출근</th>
						<th>퇴근</th>
						<th>외출 시작</th>
						<th>외출 종료</th>
						<th>근무 확인</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td><input class="form-control input-sm" type="time" name="" readonly="readonly"/></td>
						<td><input class="form-control input-sm" type="time" name="" /></td>
						<td><input class="form-control input-sm" type="time" name="" />
						<td><input class="form-control input-sm" type="time" name="" /></td>
						<td>
							<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#chkModal"
							id="btn_chk_finish_Work">
	  						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button>
	  					</td>
						<td>
							<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#etcModal">
	  						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
	  					</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

<!-- 근무 확인 Modal Start-->
<div class="modal fade" id="chkModal" tabindex="-1" role="dialog" aria-labelledby="chkModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="chkModalLabel"> 근무확인 체크! </h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label">
            	근무를 완료하겠습니까?
            </label>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">NO</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="chk_Finish_Work" >YES</button>
      </div>
    </div>
  </div>
</div>
<!-- 근무 확인  Modal End-->

<!-- 비고 Modal Start-->
<div class="modal fade" id="etcModal" tabindex="-1" role="dialog" aria-labelledby="etcModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="etcModalLabel"> 비고 사항 </h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label"></label>
            <textarea class="form-control" id="message-text" cols="10" rows="10"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
      </div>
    </div>
  </div>
</div>
<!-- 비고 Modal End-->