<%-- 
    작업 날짜 : 2015. 11. 18.
    구현 내용 :   
  
  @author By KOSTA 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->

<title>PAGE - MENU [NAME] </title>
<style>
  body {
      position: relative; 
  }
  #section1 {padding-top:50px;height:500px;color: #fff; background-color: #1E88E5;}
  #section2 {padding-top:50px;height:500px;color: #fff; background-color: #673ab7;}
  #section3 {padding-top:50px;height:500px;color: #fff; background-color: #ff9800;}
  #section4 {padding-top:50px;height:500px;color: #fff; background-color: #009688;}
  #section42 {padding-top:50px;height:500px;color: #fff; background-color: #00bcd4;}
  
</style>

<script>


$(function(){
	var url = "room_List";
	$.ajax({
		url: url,
		success: function(list){
			var print = ""; //<li><a href="#section1">제1강의실</a></li>
			$.each(list,function(idx, list){
				print += "";//"<option value="+list.room_num+">"+list.room_name+"</option>";
			});
			$('#room_num').html(print);
		},
		error: function(e){
			alert(e.responseText);
		}
	});
});

</script>


<body data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">1F<span class="caret"></span></a>
          	<ul class="dropdown-menu">
              <li><a href="#section1">제1강의실</a></li>
            </ul>
          </li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">2F<span class="caret"></span></a>
          	<ul class="dropdown-menu">
              <li><a href="#section2">제2강의실</a></li>
            </ul>
          </li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">3F<span class="caret"></span></a>
          	<ul class="dropdown-menu">
              <li><a href="#section3">제3강의실</a></li>
            </ul>
          </li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">4F<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#section4">제4강의실</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>    

<c:forEach items="${loc}" var="loc">
	${loc}
</c:forEach>

<div id="section1" class="container-fluid">
  <h1>1F</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling!</p>
  <table class="table">
    <thead>
      <tr>
      	<th>#</th>
        <th>Purpose of Use</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Room Name</th>
        <th>Subscriber</th>
      </tr>
    </thead>
    <tbody>
 		<c:if test="${ room_loc == '1F'}">
    	<c:forEach items="${list}" var="list" varStatus="stat" >

      <tr>
      	<td>${stat.count}</td>
        <td>${list.rent_reason}</td>
        <td>${list.rent_date_start}</td>
        <td>${list.rent_date_end}</td>
        <td>${list.room_name}</td>
        <td>${list.mem_name}</td>
      </tr>
      </c:forEach>
      </c:if>
    </tbody>
  </table>
</div>
<div id="section2" class="container-fluid">
  <h1>2F</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling!</p>
  <table class="table">
    <thead>
      <tr>
      	<th>#</th>
        <th>Purpose of Use</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Room Name</th>
        <th>Subscriber</th>
      </tr>
    </thead>
    <tbody>
 <%--    	<c:if test="${list.room_loc == '1F' }"> --%>
    	<c:forEach items="${list}" var="list" varStatus="stat" >
      <tr>
      	<td>${stat.count}</td>
        <td>${list.rent_reason}</td>
        <td>${list.rent_date_start}</td>
        <td>${list.rent_date_end}</td>
        <td>${list.room_name}</td>
        <td>${list.mem_name}</td>
      </tr>
      </c:forEach>
<%--       </c:if> --%>
    </tbody>
  </table>
</div>
<div id="section3" class="container-fluid">
  <h1>3F</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling!</p>
  <table class="table">
    <thead>
      <tr>
      	<th>#</th>
        <th>Purpose of Use</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Room Name</th>
        <th>Subscriber</th>
      </tr>
    </thead>
    <tbody>
 <%--    	<c:if test="${list.room_loc == '1F' }"> --%>
    	<c:forEach items="${list}" var="list" varStatus="stat" >
      <tr>
      	<td>${stat.count}</td>
        <td>${list.rent_reason}</td>
        <td>${list.rent_date_start}</td>
        <td>${list.rent_date_end}</td>
        <td>${list.room_name}</td>
        <td>${list.mem_name}</td>
      </tr>
      </c:forEach>
<%--       </c:if> --%>
    </tbody>
  </table>
</div>
<div id="section4" class="container-fluid">
  <h1>4F</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling!</p>
  <table class="table">
    <thead>
      <tr>
      	<th>#</th>
        <th>Purpose of Use</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Room Name</th>
        <th>Subscriber</th>
      </tr>
    </thead>
    <tbody>
 <%--    	<c:if test="${list.room_loc == '1F' }"> --%>
    	<c:forEach items="${list}" var="list" varStatus="stat" >
      <tr>
      	<td>${stat.count}</td>
        <td>${list.rent_reason}</td>
        <td>${list.rent_date_start}</td>
        <td>${list.rent_date_end}</td>
        <td>${list.room_name}</td>
        <td>${list.mem_name}</td>
      </tr>
      </c:forEach>
<%--       </c:if> --%>
    </tbody>
 
  </table>
</div>
</body>
