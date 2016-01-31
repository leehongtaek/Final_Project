<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- JQuery UI -->
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/jquery-ui-1.11.4/jquery-ui.min.css'/> ">
<script
	src="<c:url value='/resources/plugin/jquery-ui-1.11.4/jquery-ui.js' />"></script>

<style>
.topmenu {
	margin-left: 10px;
}
/* 
.topmenu:hover{
width: 100%;

}

.list-group-item .active{background-color: #3C67B1;} */
.background_white {
	background-color: white;
}

.list-group-item.active {
	border-color: #005880;
	background-color: #005880;
}

.background_white li {
	padding-left: 10px;
}
</style>



<!-- 메뉴바 추가  -->
<!-- 모듈 메뉴바 시작  -->
<ul class="nav nav-pills nav-stacked list-group">

	<li><a href='#' data-toggle="collapse" data-target="#list7"
		aria-expanded="false" aria-controls="list7"
		class="list-group-item active collapsed topmenu"> TASK </a>
		<ul id="list7" class="nav collapse background_white"
			aria-expanded="false">
			<li><a href='<c:url value="/task/add"/>'> TASK 추가 </a></li>
			<li><a href='<c:url value="/task/list"/>'> TASK 조회 </a></li>
			<li><a href='<c:url value="/task/assignee_list"/>'> TASK
					부여받은 리스트 </a></li>
		</ul>
</ul>
<!-- 모듈 메뉴바 끝  -->
    


<ul class="nav nav-pills nav-stacked list-group">
	<li><a href="#" data-toggle="collapse" data-target="#list4"
		aria-expanded="false" aria-controls="list4"
		class="list-group-item active collapsed topmenu">보고서 메뉴</a>
		<ul id="list4" class="nav collapse background_white"
			aria-expanded="false">
			<li><a href="<c:url value='/report/doc_list'/>"> 보고서 양식 관리 </a></li>
			<li><a href="<c:url value='/report/report_appr_list'/>"> 결재할
					보고서<span class="badge" id="reportBadge1"></span>
			</a></li>
			<li><a href="<c:url value='/report/report_write_list'/>">
					보고서 작성</a></li>
			<li><a href="<c:url value='/report/report_add_list'/>"> 임시
					문서함 </a></li>
			<li><a href="<c:url value='/report/report_workflow_list/4'/>">
					보고서 Workflow </a></li>
		</ul></li>
</ul>
<!-- 모듈 메뉴바 끝  -->
        


<!-- 모듈 메뉴바 시작  -->
<ul class="nav nav-pills nav-stacked list-group">
	<li><a href="#" data-toggle="collapse" data-target="#list0"
		aria-expanded="false" aria-controls="list0"
		class="list-group-item active collapsed topmenu"> 개인 기능 </a>
		<ul id="list0" class="nav collapse background_white"
			aria-expanded="false">
			<li><a href='<c:url value="/timecard"/>'>TIMECARD</a></li>
			<li><a href='<c:url value="/contact/contact_list"/>'> 연 락 처 </a></li>
			<li><a href='<c:url value="/roomrent/room_rent_list"/>'>시 설 예 약</a></li>
		</ul></li>
</ul>
<!-- 모듈 메뉴바 끝  -->


<!-- 모듈 메뉴바 시작  -->
<ul class="nav nav-pills nav-stacked list-group">
	<li><a href="#" data-toggle="collapse" data-target="#list1"
		aria-expanded="false" aria-controls="list1"
		class="list-group-item active collapsed topmenu">게시판</a>
		<ul id="list1" class="nav collapse background_white"
			aria-expanded="false">

			<li><a href="<c:url value='/board/board_L_list?board_code=9'/>">공지
					게시판</a></li>


			<c:if test="${sessionScope.dept_num == 1}">
				<li><a href="<c:url value='/board/board_L_list?board_code=1'/>">감사부
						게시판</a></li>
			</c:if>
			<c:if test="${sessionScope.dept_num == 2}">
				<li><a href="<c:url value='/board/board_L_list?board_code=2'/>">인사부
						게시판</a></li>
			</c:if>
			<c:if test="${sessionScope.dept_num == 3}">
				<li><a href="<c:url value='/board/board_L_list?board_code=3'/>">관리부
						게시판</a></li>
			</c:if>
			<c:if test="${sessionScope.dept_num == 4}">
				<li><a href="<c:url value='/board/board_L_list?board_code=4'/>">영업부
						게시판</a></li>
			</c:if>
			<c:if test="${sessionScope.dept_num == 5}">
				<li><a href="<c:url value='/board/board_L_list?board_code=5'/>">연구소
						게시판</a></li>
			</c:if>
			<c:if test="${sessionScope.dept_num == 6}">
				<li><a href="<c:url value='/board/board_L_list?board_code=6'/>">개발부
						게시판</a></li>
			</c:if>
			<c:if test="${sessionScope.dept_num == 7}">
				<li><a href="<c:url value='/board/board_L_list?board_code=7'/>">보수부
						게시판</a></li>
			</c:if>
			<c:if test="${sessionScope.dept_num == 8}">
				<li><a href="<c:url value='/board/board_L_list?board_code=8'/>">운영부
						게시판</a></li>
			</c:if>
			<li><a href="<c:url value='/board/board_L_list?board_code=10'/>">커뮤니티
					게시판</a></li>
		</ul></li>
</ul>
<!-- 모듈 메뉴바 끝  -->




<!-- 인사부와 감사부만  볼수 있 음  그리고 직위가 높은 사람은 메뉴 열람 가능 -->                            
<c:if test="${sessionScope.dept_num == 2 or sessionScope.dept_num == 1 or sessionScope.posit_num <= 4}">
<!-- 모듈 메뉴바 시작  -->    
<ul class="nav nav-pills nav-stacked list-group">
	<li><a href="#" data-toggle="collapse" data-target="#list5"
		aria-expanded="false" aria-controls="list5"
		class="list-group-item active collapsed topmenu">인사부</a></li>
	<ul id="list5" class="nav collapse background_white" 
		aria-expanded="false">
		<li><a href='<c:url value="/personManager"/>'> 사원 관리 </a></li>
	</ul>
</ul>
<!-- 모듈 메뉴바 끝  -->
</c:if>


<!-- 모듈 메뉴바 시작  -->  
<!-- 관리부 와 감사부만  볼수 있음  그리고 직위가 높은 사람은 메뉴 열람 가능  --> 
<c:if test="${sessionScope.dept_num == 3 or sessionScope.posit_num <= 4}" >
<ul class="nav nav-pills nav-stacked list-group">

	<li><a href='#' data-toggle="collapse" data-target="#list6"
		aria-expanded="false" aria-controls="list6"
		class="list-group-item active collapsed topmenu"> 관리부 </a>
		<ul id="list6" class="nav collapse background_white"
			aria-expanded="false">
			<li><a href='<c:url value="/roomrent/manage_rent_List"/>'>
					시설관리 </a></li>
			<li><a href='<c:url value="/board/board_L_admin"/>'> 게시판 관리
			</a></li>
		</ul>
</ul>
</c:if>   
<!-- 모듈 메뉴바 끝  -->
