<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="org.springframework.security.core.GrantedAuthority"%>
<%@page import="java.util.List"%>
<%@page import="com.easyware.common.security.Member_Vo_Security"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->


<div class="bs-component">
	<nav class="navbar navbar-inverse navbar-fixed-top" style="box-shadow:0 0px 0px rgba(0, 0, 0, 0);">
		<input id="session_memcode" type="hidden" value="${sessionScope.mem_code}">
		<!-- /navbar-header Start --> 
		<div class="navbar-header">
			<!-- Top Menu Category : Service Name = Home --> 
			<img style="cursor:pointer; ; padding: 5px 15px; height:65px;line-height: inherit; " class="navbar-brand" 
				onclick="javacript:location='<c:url value="/"/>'" 	
			src="<c:url value="/resources/img/white_clear.png"/>"/>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>							
							<span class="icon-bar"></span>
				</button>
		</div>
		<!-- /navbar-header END -->
			
		<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<!-- Top Menu Category : Home -->
					<li><a href="#" data-toggle="dropdown" class="dropdown-toggle">
						<span class="glyphicon glyphicon-user">
						</span>  관리자 모드 
						 <c:out value="${sessionScope.mem_name}" />  </a>
					</li>				
				</ul>
				
				   
				   
				<ul class="nav navbar-nav navbar-right" style=" margin-right: 15px;">
					<li style="text-align: center;">
						<a style="padding-right: 3px;">
							<span id="alram_glyphicon" class="glyphicon glyphicon glyphicon-bell"></span>Alarm
						</a>
					
					<!-- <a data-toggle="dropdown" class="dropdown-toggle">
					<span id="alram_glyphicon" class="glyphicon glyphicon glyphicon-bell"></span>Alarm
					</a> -->
					<!-- 
						<ul class="dropdown-menu dropdown-messages" style="border-radius: 0px;padding: 0px 0;"> 
							<li class="alram_wrapper" style="height: 100px; width: 200px; float: right;" > 
								<ul id="alarm_box" style="padding: 0px;">
								  		
								</ul>   
							</li>
						</ul>  -->
					</li>
					<li style="padding-top : 18px;padding-left: 0px;">
						<ul class="alarm_bar"style="padding: 0px; margin: 0px;">
							<li style="height: 100%;">
								<ul  id="alarm_box" style="padding: 0px;">
									
								</ul>
							</li>   
						</ul>
					</li> 
					
					<%-- <li><a href="#" data-toggle="dropdown" class="dropdown-toggle" style="width: 100px;">
						<span class="glyphicon glyphicon-user">
						</span>MYPAGE	 </a>
						<ul class="dropdown-menu dropdown-menu-right" style="width: 100px;min-width: 100px; ">
							<li style="width: 100px;">
								<a style="width: 100px;" href="<c:url value='/profile'/>">
									<span id="alram_glyphicon" class="glyphicon glyphicon glyphicon-user"></span>
									Profile
								</a>
							</li>
							<li style="width: 100px;"><a style="width: 100px;" href="<c:url value='/setting'/>">
								<span id="alram_glyphicon" class="glyphicon glyphicon-cog"></span>
								Settings
								</a>
							</li>
						</ul> <!-- Dropdown menu End-->
					</li> --%>
					
					<li><a href="<c:url value='/logout'/>"><span class="glyphicon glyphicon-log-in"></span> Log-Out</a></li>
					</ul> <!-- Dropdown menu End-->
				</ul>
		
								
		</div>
	</nav>

</div>



	   
<hr>
        
       
