<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/[필요한 JS파일경로명]'/>" ></script>

<title>PAGE[board_P_detail] </title>
<h2> 상세게시판</h2>

<form>
<div class="col-sm-12">
    <div class="clearfix">
        <div class="col-md-10 wrap_content"><div class="page-header">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4 class="panel-title">게시판자세히보기　
            <small><span class="glyphicon glyphicon-calendar"></span> 작성일 : 15-10-02 18:10 / 조회 : 33</small></h4>
        </div>
        <div class="panel-body">
            <span class="glyphicon glyphicon-user"></span> 글쓴이 : <a href="javascript:;" onclick="javascript:showSideView(this, '', &quot;테스터&quot;);" title="[비회원] 테스터"><span class="text-muted">샤오미</span></a>          </div>
    </div>
    </div>
    </div>
</div>
</div>

<!--텍스트에어리어-->
<textarea class="col-md-10 wrap_content" rows="15">
이준석 코마트레이드 대표이사가 20일 JW 메리어트 호텔에서 자사 전략을 설명하고 있다.
</textarea>
<hr />

		<!-- 이전글 다음글 -->
	<div class="clearfix">
    <ul class="pager pull-left" style="margin:0px;">
        <li><a href='/board/test/view/wr_id/162/page/3' title='ㅁㄴㅇㄻㄴㄹ'>&larr; 이전글</a></li>
        <li><a href='/board/test/view/wr_id/161/page/3' title='aa'>다음글 &rarr;</a></li>
    </ul>
    </div>

		<!-- 버튼목록 -->
 <div class="pull-right">
        <span class="btn-group">
        <a href='http://localhost:8090/Semi_Proj_GroupWare_003/board_P_list' class='btn btn-warning' role="button">목록</a>
        <a href='http://localhost:8090/Semi_Proj_GroupWare_003/board_P_write' class='btn btn-info' role="button">수정</a>
        <a href='http://localhost:8090/Semi_Proj_GroupWare_003/board_P_list' class='btn btn-danger' role="button">삭제</a>
        </span>
	</div>

		<!-- 댓글 -->
		<br>
		<br>	
		<div class="row3">
		 <textarea class="col-md-8" placeholder="여러분의 의견을 주세요"></textarea>
 		<!--  <button type="submit" class="btn btn-default">확인</button> -->
 		 <button type="submit" class="btn btn-primary">확인</button>
		</div>
</form>

		


