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

<title>PAGE - MENU [NAME]</title>

<div class="row">
	<div class="col-sm-12">
		<h2> UI TEMPLATE</h2>
	
		<button class="btn btn-info"type="button"><span class="glyphicon glyphicon-chevron-left"></span></button>
		<button class="btn btn-info"type="button"> 버튼 </button>
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
						<th>- </th>
						<th>- -</th>
						<th>- - </th>
						<th>- -</th>
						<th>- - </th>
						<th>수정</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> #  </td>
						<td><input class="form-control input-sm" type="text" name="" /></td>
						<td><input class="form-control input-sm" type="text" name="" /></td>
						<td><input class="form-control input-sm" type="text" name="" />
						<td><input class="form-control input-sm" type="text" name="" /></td>
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
        <h4 class="modal-title" id="chkModalLabel"> 내용 저장  </h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label">
                수정 할 내용 작성 
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
        <h4 class="modal-title" id="etcModalLabel"> 모달 타이틀 </h4>
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