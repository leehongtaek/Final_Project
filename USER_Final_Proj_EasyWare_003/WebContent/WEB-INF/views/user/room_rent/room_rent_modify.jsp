<%-- 
    작업 날짜 : 2015. 11. 20.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->

<script>

$(function(){
	var url = "room_List";
	$.ajax({
		url: url,
		success: function(list){
			var print = "<option value = '${ vo.room_num }' selected='selected'>${ vo.room_name }</option>"
			print += "<option> Select Name of Room </option>";
			$.each(list,function(idx, list){
				print += "<option value=" + list.room_num + ">" + list.room_name + "</option>";
			});
			$('#room_num').html(print);
		},
		error: function(e){
			alert(e.responseText);
		}
	});
});

</script>

<div class="container">

  <h2>Reserving Room Modify</h2>
  <br/>
  <form class="form-horizontal" action="rent_Modify" method="post" role="form">
  	
  	<input type="hidden" value="${vo.rent_num}" name="rent_num">
  	
  	<!-- start rent_reason -->
    <div class="form-group">
      <label class="col-sm-2 control-label">Purpose of Use : </label>
      <div class="col-sm-8">
        <input class="form-control" id="focusedInput" name="rent_reason" type="text" value="${ vo.rent_reason }">
        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
      </div>
    </div>
    <!-- end rent_reason -->
    
    <!-- start date -->
    <div class="form-group">
      <label class="col-sm-2 control-label">Start Date : </label>
      <div class="col-sm-8">
        <input class="form-control" id="focusedInput" name="rent_date_start" type="text" value="${ vo.rent_date_start }">
        <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-sm-2 control-label">End Date : </label>
      <div class="col-sm-8">
        <input class="form-control" id="focusedInput" name="rent_date_end" type="text" value="${ vo.rent_date_end }">
        <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
      </div>
    </div>
    <!-- end date -->
    
    <!-- start room_num -->
    <div class="form-group">
      <label for="room_num" class="col-sm-2 control-label">Name of Room : </label>
      <div class="col-sm-8">
        <select id="room_num" name="room_num" class="form-control">
        	<option selected="selected">
        </select>
      </div>
    </div>
<%--       
    <div class="form-group">
      <label for="disabledTextInput" class="col-sm-2 control-label">State of Room : </label>
      <div class="col-sm-8">
        <input type="text" id="disabledTextInput" class="form-control" value="${ vo.room_name }" disabled>
      </div>
    </div> --%>
    <!-- end room_num -->
    
   	<!-- start mem_name -->
   	<div class="form-group">
     <label for="inputPassword" class="col-sm-2 control-label">Subscriber : </label>
     <div class="col-sm-7">
       <input class="form-control" id="disabledInput" type="text" value="${ vo.mem_name }" disabled>
       <input type="hidden" name="mem_code" value="vo.mem_code">
     </div>
    </div>
   	<!-- end mem_name -->
    
    <div class="form-group">
   		<div align="left" class="col-sm-6">
			<button type="submit" class="btn btn-warning">Modify</button>
		</div>
    </div>
  </form>
</div>