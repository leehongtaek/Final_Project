<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- JQuery UI -->
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/jquery-ui-1.11.4/jquery-ui.min.css'/> ">
<script
	src="<c:url value='/resources/plugin/jquery-ui-1.11.4/jquery-ui.js' />"></script>

<style type="text/css">
/*	Reset & General
---------------------------------------------------------------------- */
* {
	margin: 0px;
	padding: 0px;
}
#wrapper {
	width: 666px;
	margin: 0 auto;
	position: relative;
}

#sidebar-menu {
	background: #229bdc;
	overflow: hidden;
	border-radius: 5px;
	position: absolute;
	top: 60px;
	left: 0;
	height: 62 0px;
	width: 55px;
	color: #abe2ff;
	font-size: 12px;
	font-weight: 900;
	-webkit-transition: all 200ms ease-out;
	-moz-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
}

#sidebar-menu.animate {
	width: 210px;
	-webkit-transition: all 200ms ease-out;
	-moz-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
}

#toggleMenu {
	background: #1888c4;
	height: 37px;
}

#toggleMenu .list {
	position: absolute;
	top: 12px;
	cursor: pointer;
	right: 8px;;
	height: 30px;
	width: 30px;
	height: 30px;
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/toggle-list.png")
		0 0 no-repeat
}

#toggleMenu .thumbs {
	position: absolute;
	display: none;
	top: 9px;
	cursor: pointer;
	right: 3px;
	height: 30px;
	width: 30px;
	height: 30px;
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/toggle-thumbs.png")
		0 0 no-repeat;
}

#sidebar-menu li {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/sidemenu-sprite.png")
		0 0 no-repeat;
	padding: 15px 0 15px 54px;
	margin: 1px 4px 1px 4px;
	list-style: none;
}

#sidebar-menu ul {
	margin-top: 11px;
}

#sidebar-menu li.DASHBOARD {
	background-position: 7px 14px;
}

#sidebar-menu li.DASHBOARD:hover {
	background-position: -324px 14px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.DASHBOARD {
	background-position: -620px 14px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.USERS {
	background-position: 9px -33px;
}

#sidebar-menu li.USERS:hover {
	background-position: -322px -33px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.USERS {
	background-position: -618px -33px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.PRIORITY {
	background-position: 9px -80px;
}

#sidebar-menu li.PRIORITY:hover {
	background-position: -322px -80px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.PRIORITY {
	background-position: -618px -80px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.COLLECTIONS {
	background-position: 8px -127px;
}

#sidebar-menu li.COLLECTIONS:hover {
	background-position: -323px -127px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.COLLECTIONS {
	background-position: -619px -127px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.ARCHIVED {
	background-position: 8px -175px;
}

#sidebar-menu li.ARCHIVED:hover {
	background-position: -323px -175px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.ARCHIVED {
	background-position: -619px -175px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.DELETED {
	background-position: 8px -223px;
}

#sidebar-menu li.DELETED:hover {
	background-position: -323px -223px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.DELETED {
	background-position: -619px -223px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.TRENDS {
	background-position: 8px -270px;
}

#sidebar-menu li.TRENDS:hover {
	background-position: -323px -270px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.TRENDS {
	background-position: -619px -270px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.TASKS {
	background-position: 7px -319px;
}

#sidebar-menu li.TASKS:hover {
	background-position: -324px -319px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.TASKS {
	background-position: -620px -319px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.FILTERS {
	background-position: 7px -365px;
}

#sidebar-menu li.FILTERS:hover {
	background-position: -324px -365px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.FILTERS {
	background-position: -620px -365px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.STATS {
	background-position: 7px -413px;
}

#sidebar-menu li.STATS:hover {
	background-position: -324px -413px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.STATS {
	background-position: -620px -413px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li.SETTINGS {
	background-position: 7px -507px;
	margin-top: 75px;
	margin-bottom: 4px;
}

#sidebar-menu li.SETTINGS:hover {
	background-position: -324px -507px;
	color: #fff;
	cursor: pointer;
}

#sidebar-menu li.selected.SETTINGS {
	background-position: -620px -507px;
	color: #1888c4;
	cursor: pointer;
}

#sidebar-menu li {
	padding-left: 4px;
	height: 15px;
}

#sidebar-menu.animate li {
	padding-left: 54px;
}

#sidebar-menu li span {
	opacity: 0;
	margin-left: 10px;
}

#sidebar-menu li.selected {
	background-color: #fff;
	color: #1888c4;
	border-radius: 4px;
}

#sidebar-menu li.selected:hover {
	color: #1888c4
}

.sortable-accordion {
	margin: 20px;
	border-radius: 5px;
	background: #1888c4;
	overflow: hidden;
	width: 200px;
	position: absolute;
	top: 365px;
	left: 371px;
}

.sortable-accordion h3 {
	color: #fff;
	cursor: pointer;
	margin: 0;
	padding: 13px 16px 13px 18px;
	background: #229bdc;
	font-size: 12px;
	text-transform: uppercase;
}

.sortable-accordion h3:hover {
	background: #1f96d6;
}

.sortable-accordion h3.current {
	cursor: default
}

.sortable-accordion li {
	font-size: 14px;
	color: #abe2ff;
	font-weight: 400;
	padding: 11px 10px 11px 43px;
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/sort.png")
		17px 13px no-repeat;
	list-style: none;
	position: relative;
}

.sortable-accordion li:hover {
	cursor: pointer;
	background-color: #1784bf;
}

.ui-sortable-helper {
	cursor: move;
	opacity: 0.8;
	background-color: #157eb6;
	box-shadow: 0px 5px 10px -5px rgba(0, 0, 0, 0.3);
}

.ui-sortable-placeholder {
	border: 2px dotted #0e9ce8 !important;
	background: #158bca !important;
	padding: 11px 10px 11px 43px;
	height: 15px;
}

.options {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/options.png")
		0 0 no-repeat;
	width: 26px;
	height: 21px;
	display: block;
	position: absolute;
	top: 10px;
	right: 10px;
}

#submenu {
	background-color: #157eb6;
	position: absolute;
	top: 0px;
	left: 200px;
	width: 100px;
	border-radius: 4px;
	box-shadow: 0px 5px 10px -5px rgba(0, 0, 0, 0.3);
	padding: 2px 5px 2px 1px;
	display: none;
}

#submenu span {
	width: 15px;
	height: 15px;
	display: block;
	background-color: #157eb6;
	position: absolute;
	left: -3px;
	top: 12px;
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	z-index: 1;
}

#submenu a {
	float: left;
	width: 27px;
	height: 20px;
	padding: 8px 3px 8px;
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/submenu-sprite.png")
		8px 9px no-repeat;
	position: relative;
	z-index: 2;
}

#submenu a.compare:hover {
	background-position: 8px -22px
}

#submenu a.revisions {
	background-position: -27px 9px
}

#submenu a.revisions:hover {
	background-position: -27px -22px
}

#submenu a.edit {
	background-position: -64px 9px
}

#submenu a.edit:hover {
	background-position: -64px -22px
}

#dropdown {
	position: absolute;
	top: 60px;
	left: 316px;
}

#drop-select {
	border-radius: 4px;
	background: #229bdc
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/dropdown-arrows.png")
		313px 18px no-repeat;
	text-transform: uppercase;
	color: #fff;
	width: 300px;
	padding: 17px 20px;
	font-weight: 700;
	font-size: 13px;
	cursor: pointer;
}

#dropdown-list {
	border-radius: 4px;
	background: #229bdc;
	padding-bottom: 1px;
	width: 400px;
	margin-left: 0px;
	margin-top: 10px;
	opacity: 0;
	-webkit-transition: all 200ms ease-out;
	-moz-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
}

#dropdown-list.animate {
	margin-top: -3px;
	opacity: 1;
	-webkit-transition: all 200ms ease-out;
	-moz-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 300ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
}

#dropdown-list .header {
	background: #1888c4;
	color: #fff;
	padding: 12px 20px;
	text-transform: uppercase;
	font-weight: 700;
	border-radius: 0 5px 0 0;
}

#dropdown-list li {
	list-style: none;
	padding: 12px 20px;
	color: #abe2ff;
	font-size: 15px;
	font-weight: 500;
	margin: 10px 4px;
	background:    
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/bullet.png")
		374px 17px no-repeat;
}

#dropdown-list li:hover {
	background-color: #fff;
	border-radius: 4px;
	cursor: pointer;
	color: #1888c4;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {

				$(function() {
					//  Accordion Panels
					$(".sortable-accordion div").show();
					$('.sortable-accordion div').slideToggle('slow');
					$(".sortable-accordion h3").click(
							function() {
								$(this).next(".inner").slideToggle().siblings(
										".inner:visible").slideUp();
								$(this).toggleClass("current");
								$(this).siblings("h3").removeClass("current");
							});
				});

				$(".sortable").sortable({
					placeholder : "ui-sortable-placeholder"
				}).find("li").append("<span class='options'></span>");

				$('#submenu a').click(function() {
					return false;
				})

				$('.options').click(function() {
					var childpos = $(this).offset();
					var parentpos = $(this).parent().offset();

					var posLeft = childpos.left - parentpos.left;

					$('#submenu').css({
						'top' : (childpos.top - 10) + "px",
						'left' : (posLeft + 420) + "px"
					}).fadeIn(200);
					$('#submenu').mouseleave(function() {
						$(this).fadeOut(200);
					});
				});

				$('#toggleMenu .list').click(function() {
					$('#sidebar-menu li span').animate({
						'opacity' : 1,
						'margin-left' : '0px'
					});
					$('#sidebar-menu').toggleClass('animate');
					$('#toggleMenu .list').fadeOut();
					$('#toggleMenu .thumbs').fadeIn();

				});

				$('#toggleMenu .thumbs').click(function() {
					$('#sidebar-menu li span').css({
						'opacity' : 0,
						'margin-left' : "10px"
					});
					$('#sidebar-menu').toggleClass('animate');
					$('#toggleMenu .thumbs').fadeOut();
					$('#toggleMenu .list').fadeIn();

				});

				$("#sidebar-menu li").click(function() {
					$("#sidebar-menu li").not(this).removeClass("selected");
					$(this).toggleClass("selected");
				});

				$('#drop-select').click(function() {
					$('#dropdown-list').toggleClass('animate');
				});

				$('#dropdown-list li').click(function() {
					$('#dropdown-list').removeClass('animate');
				});

			}); 
</script>



</head>
<body>
	 <!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href='<c:url value="/timecard"/>' data-toggle="collapse"
			data-target="#list1" aria-expanded="false" aria-controls="list1"
			class="list-group-item active collapsed">타임카드</a></li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->

	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">

		<li><a href='<c:url value="/contact/contact_list"/>'
			data-toggle="collapse" data-target="#list2" aria-expanded="false"
			aria-controls="list2" class="list-group-item active collapsed">주소록</a>
		</li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->

	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href="#" data-toggle="collapse" data-target="#list3"
			aria-expanded="false" aria-controls="list3"
			class="list-group-item active collapsed">보고서 메뉴</a>
			<ul id="list3" class="nav collapse" aria-expanded="false">
				<li><a href="<c:url value='/report/report_form_add'/>"
					class="list-group-item"> 보고서 양식추가 </a></li>
				<li><a href="<c:url value='/report/report_form_list'/>"
					class="list-group-item"> 보고서 양식 수정 </a></li>
				<li><a href="<c:url value='/report/report_list'/>"
					class="list-group-item"> 보고서 작성 </a></li>
				<li><a href="#" class="list-group-item"> 작성된 모든 보고서 </a></li>
				<li><a href="#" class="list-group-item"> 임시 저장 보고서 </a></li>
				<li><a href="#" class="list-group-item"> 승인 중인 보고서 </a></li>
				<li><a href="#" class="list-group-item"> 승인 완료 보고서 </a></li>
				<li><a href="#" class="list-group-item"> 반려 보고서 </a></li>
				<li><a href="<c:url value='/report/report_index'/>"
					class="list-group-item"> View page Test </a></li>
			</ul></li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->

	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href="#" data-toggle="collapse" data-target="#list4"
			aria-expanded="false" aria-controls="list4"
			class="list-group-item active collapsed">게시판</a>
			<ul id="list4" class="nav collapse" aria-expanded="false">
				<li><a href="<c:url value='/board/board_L_list?board_code=1'/>"
					class="list-gorup-item">공지사항</a></li>
				<li><a href="<c:url value='/board/board_L_list?board_code=2'/>"
					class="list-gorup-item">-영업부- 게시판</a></li>
				<li><a href="<c:url value='/board/board_L_list?board_code=3'/>"
					class="list-gorup-item">-경영전략부- 게시판</a></li>
				<li><a href="<c:url value='/board/board_L_list?board_code=4'/>"
					class="list-gorup-item">-인사부- 게시판-</a></li>
				<li><a href="<c:url value='/board/board_L_list?board_code=5'/>"
					class="list-gorup-item">추천 게시판</a></li>
			</ul></li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->

	<!-- 모듈 메뉴바 시작  -->
	<!-- <ul class="nav nav-stacked list-group">
		<li><a href="board_P_list" data-toggle="collapse" data-target="#list4"
			aria-expanded="false" aria-controls="list4"
			class="list-group-item active collapsed">게시판</a>
		</li>
	</ul> -->
	<!-- 모듈 메뉴바 끝  -->

	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href='<c:url value="/scheduler/scheduler_index"/>'
			data-toggle="collapse" data-target="#list5" aria-expanded="false"
			aria-controls="list5" class="list-group-item active collapsed">스케줄러</a>
		</li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->

	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href='<c:url value="/roomrent/room_rent_list"/>'
			data-toggle="collapse" data-target="#list6" aria-expanded="false"
			aria-controls="list6" class="list-group-item active collapsed">시설예약</a>
		</li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->

	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href='<c:url value="/sns/sns"/>' data-toggle="collapse"
			data-target="#list5" aria-expanded="false" aria-controls="list7"
			class="list-group-item active collapsed">SNS</a></li>
	</ul>
	<!-- 모듈 메뉴바 끝  --> 








<%-- 
	<div id="sidebar-menu" class="animate">
		<div id="toggleMenu">
			<div class="list" style="display: none;"></div>
			<div class="thumbs" style="display: block;"></div>
		</div>
		<ul>
			<li class="DASHBOARD">
			<span style="opacity: 1; margin-left: 0px; cursor: pointer;" onclick="location.href='<c:url value="/timecard"/>'" >
			타임카드</span>
			</li>
			<li class="USERS" ><span style="opacity: 1; margin-left: 0px;">USERS</span></li>
			<li class="PRIORITY"><span style="opacity: 1; margin-left: 0px;">PRIORITY</span></li>
			<li class="COLLECTIONS"><span
				style="opacity: 1; margin-left: 0px;">COLLECTIONS</span></li>
			<li class="ARCHIVED"><span style="opacity: 1; margin-left: 0px;">ARCHIVED</span></li>
			<li class="DELETED"><span style="opacity: 1; margin-left: 0px;">DELETED</span></li>
			<li class="TRENDS"><span style="opacity: 1; margin-left: 0px;">TRENDS</span></li>
			<li class="TASKS"><span style="opacity: 1; margin-left: 0px;">TASKS</span></li>
			<li class="FILTERS"><span style="opacity: 1; margin-left: 0px;">FILTERS</span></li>
			<li class="STATS"><span style="opacity: 1; margin-left: 0px;">STATS</span></li>
			<li class="SETTINGS"><span style="opacity: 1; margin-left: 0px;">SETTINGS</span></li>
		</ul>


	</div> --%>
</body>
</html>