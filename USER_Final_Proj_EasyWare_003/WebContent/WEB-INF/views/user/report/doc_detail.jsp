<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->

<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>

<title>PAGE[doc_detail]</title>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('doc_form');
		CKEDITOR.config.height = "700px";
	});
</script>
<!-- 패널 시작 -->
<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> DOC DETAIL</span>
			</h3>
		</div>
		<div class="panel-body">

			<!-- 보고서 추가 form -->
			<form class="form-horizontal" action="/report/doc_modify_ok" 
			method="post" role="form">
				<div class="form-group">
					<div class="col-sm-10">
						<input type="hidden" name="doc_num" id="doc_num" value="${vo.doc_num}"/>
						<input type="text" class="form-control" id="doc_name"
							name="doc_name" value="${vo.doc_name}">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-12">
						<!-- start ckeditor -->
						<textarea name=doc_form id="doc_form" class="form-control"
							rows="20">${vo.doc_form}</textarea>
						<!-- end ckeditor -->
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-success">수정</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger" 
						
						onclick="goUrl('<c:url value='/report/doc_delete_ok/${vo.doc_num}'/>')">삭제</button>
						<button type="button" class="btn btn-danger" 
						onclick="goUrl('<c:url value='/report/doc_list'/>')">취소</button>
					</div>
				</div>
			</form>
			<!-- 보고서 추가 form -->
			 
		</div>
	</div>
</div>
<!-- 패널 시작 -->
