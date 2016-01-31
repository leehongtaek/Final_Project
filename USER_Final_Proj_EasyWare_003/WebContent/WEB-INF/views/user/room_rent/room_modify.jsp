<%-- 
    작업 날짜 : 2015. 11. 20.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->


<div class="container">

  <h2>Room Modify</h2>
  <br/>
  <form class="form-horizontal" action="room_Modify" method="post" role="form">
  	
  	<input type="hidden" value="${vo.room_num}" name="room_num">
  	
  	<!-- start room_name -->
    <div class="form-group">
      <label class="col-sm-2 control-label">Name of Room : </label>
      <div class="col-sm-8">
        <input class="form-control" id="focusedInput" name="room_name" type="text" value="${ vo.room_name }">
        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
      </div>
    </div>
    <!-- end room_name -->
    
    <!-- start room_loc -->
    <div class="form-group">
      <label class="col-sm-2 control-label">Location of Room : </label>
      <div class="col-sm-8">
        <input class="form-control" id="focusedInput" name="room_loc" type="text" value="${ vo.room_loc }">
        <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
      </div>
    </div>
    <!-- end room_loc -->
    
    <!-- start room_limit -->
    <div class="form-group">
      <label class="col-sm-2 control-label">Capacity of people : </label>
      <div class="col-sm-8">
        <input class="form-control" id="focusedInput" name="room_limit" type="text" value="${ vo.room_limit}">
        <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
      </div>
    </div>
     <!-- end room_limit -->
    
    <div class="form-group">
   		<div align="left" class="col-sm-6">
			<button type="submit" class="btn btn-warning">Modify</button>
		</div>
    </div>
  </form>
</div>