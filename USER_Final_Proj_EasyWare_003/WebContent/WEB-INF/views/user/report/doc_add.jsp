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

<title>PAGE[doc_add]</title>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace(
		'doc_form',
		{height:'700px'}
	);
	});
</script>


<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="color: white;">
				<span class="glyphicon glyphicon-list-alt"> DOC FORM</span>
			</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" action="/report/doc_add_ok" method="post"
				role="form">
				<div class="form-group">
					<div class="col-sm-10">
						<input type="text" class="form-control" id="doc_name" name="doc_name"
							placeholder="ReportTitle" required="required">
					</div>
				</div>
			
				<div class="form-group">
					<div class="col-sm-12">
						<!-- start ckeditor -->
						<textarea name=doc_form id="doc_form"
							class="form-control" rows="20" >${doc_form}</textarea>
						<!-- end ckeditor -->
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-success col-sm-2">등록하기</button>
						<button type="button" onclick="goUrl('<c:url value='/report/doc_list'/>')" 
														class="btn btn-danger col-sm-2 col-sm-offset-1">취소</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>
