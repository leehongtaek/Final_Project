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
  #home {padding-top:30px; padding-left: 20px; padding-right:20px; height:700px; color: #fff; background-color: #FF5722;}
  #menu1 {padding-top:30px; padding-left: 20px; padding-right:20px; height:700px; color: #fff; background-color: #ff9800;}
  #menu2 {padding-top:30px; padding-left: 20px; padding-right:20px; height:700px; color: #fff; background-color: #0DBBD2;}
  #menu3 {padding-top:30px; padding-left: 20px; padding-right:20px; height:700px; color: #fff; background-color: #4FA0E6;}
  #menu4 {padding-top:30px; padding-left: 20px; padding-right:20px; height:700px; color: #fff; background-color: #009688;}
  #menu5 {padding-top:30px; padding-left: 20px; padding-right:20px; height:700px; color: #fff; background-color: #8868C1;}
  .table thead { text-align: center; size: 500px; margin: auto;}
  .form-control {color: #1F0303;}
  .pagination > .active > a { background-color: #8BC34A; border-color: #4CAF50;}
  
  .table tr:HOVER {
	background-color: transparent;
	color: black;
}
 
  
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


<div class="col-sm-12">

	<div class="panel panel-primary">
		<div class="panel-heading"> 
			<h3 style="color: white;"><span class="glyphicon glyphicon-home" aria-hidden="true"> RESERVATION </span></h3>    
		</div>  
		<div class="panel-body">
			<ul class="nav nav-tabs">
	    		<li class="active"><a data-toggle="tab" href="#home">Floor</a></li>
	   			<li><a data-toggle="tab" href="#menu1">1F</a></li>
	    		<li><a data-toggle="tab" href="#menu2">2F</a></li>
    			<li><a data-toggle="tab" href="#menu3">3F</a></li>
    			<li><a data-toggle="tab" href="#menu4">4F</a></li>
    			<li><a data-toggle="tab" href="#menu5">5F</a></li>
  			</ul>

  	<div class="tab-content">
  
    	<div id="home" class="tab-pane fade in active" style="overflow: scroll;">
		
		<h1 style="color: white;">Room</h1>
		
		<br>
		
		<form class="form-horizontal" action="manage_rent_List" method="get" role="form">
		    <div class="col-sm-2">
				<select name="searchType" class="form-control input-md">
					<option value="">선택</option>
					<option value="1">Room Name</option>
					<option value="2">Location</option>
				</select>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<input  class="form-control input-md" name="searchValue" type="text">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-warning">Search</button>
					</span>
				</div>
			</div>
		</form>
			
			<div class="col-sm-7" align="right">
				<button type="button" class="btn btn-success"
					data-toggle="modal" data-target="#roomadd"><span class="glyphicon glyphicon-plus"> Room </span></button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary"
				onclick="location='room_List_Excel?searchType=${searchType}&searchValue=${searchValue}'">
					<span class="glyphicon glyphicon-modal-window"> Excel </span></button>
			</div>	
	    
			<br>
			<br>
			<br>
		
      <table class="table" id="table-pagination" data-toggle="table" data-pagination="true">
   			<thead>
    	  		<tr>
    	  			<th>#</th>
       				<th>Name of Room</th>
       				<th>Location of Room</th>
        			<th>Capacity of people</th>
        			<th>Modify</th>
					<th>Delete</th>
      	 		</tr>
    	 	</thead>
    	 	<tbody>
    			<c:forEach items="${room}" var="room" varStatus="stat">
     		 		<tr>
        				<td>${stat.count}</td>
        				<td>${room.room_name}</td>
        				<td>${room.room_loc}</td>
        				<td>${room.room_limit}</td>
        				<td>
        					<button type="button" onclick="location='room_Modify_Detail?room_num='+${room.room_num}" class="btn btn-primary btn-xs" >수정</button>
        				</td>
        				<td>
        					<button type="button" onclick="location='room_Delete?room_num='+${room.room_num}" class="btn btn-danger btn-xs" >삭제</button>
        				</td>
      				</tr>
      			</c:forEach>
    		</tbody>
  			</table>
      
    </div>
    
    <div id="menu1" class="tab-pane fade" style="overflow: scroll;">
  		<h1 style="color: white;">1F</h1>
  		<br>
  		<table class="table" id="table-pagination" data-toggle="table" data-pagination="true">
   			<thead>
    	  		<tr>
    	  			<th>#</th>
       				<th>Purpose of Use</th>
       				<th>Start Date</th>
        			<th>End Date</th>
        			<th>Room Name</th>
        			<th>Subscriber</th>
        			<th>Delete</th>
      	 		</tr>
    	 	</thead>
    	 	<tbody>
    			<c:forEach items="${list}" var="list" >
				<c:if test="${ '1F' == list.room_loc }">
     		 		<tr>
     		 			<td>${list.rent_num}</td>
        				<td>${list.rent_reason}</td>
        				<td>${list.rent_date_start}</td>
        				<td>${list.rent_date_end}</td>
        				<td>${list.room_name}</td>
        				<td>${list.mem_name}</td>
        				<td>
        					<button type="button" onclick="location='manage_rent_Delete?rent_num='+${list.rent_num}" class="btn btn-danger btn-xs" >삭제</button>
        				</td>
      				</tr>
     			</c:if>
      			</c:forEach>
    		</tbody>
  			</table>
	</div>
 
    <div id="menu2" class="tab-pane fade" style="overflow: scroll;">
    	<h1 style="color: white;">2F</h1>
    	<br>
  		<table class="table" id="table-pagination" data-toggle="table" data-pagination="true">
    		<thead>
      			<tr>
      				<th>#</th>
        			<th>Purpose of Use</th>
       				<th>Start Date</th>
        			<th>End Date</th>
        			<th>Room Name</th>
        			<th>Subscriber</th>
        			<th>Delete</th>
      			</tr>
    		</thead>
    		<tbody>
    			<c:forEach items="${list}" var="list" >
    			<c:if test="${ '2F' == list.room_loc }">
     			<tr>
     				<td>${list.rent_num}</td>
        			<td>${list.rent_reason}</td>
        			<td>${list.rent_date_start}</td>
        			<td>${list.rent_date_end}</td>
        			<td>${list.room_name}</td>
        			<td>${list.mem_name}</td>
        			<td>
        				<button type="button" onclick="location='manage_rent_Delete?rent_num='+${list.rent_num}" class="btn btn-danger btn-xs" >삭제</button>
        			</td>
      			</tr>
      			</c:if>
      			</c:forEach>
    		</tbody>
  		</table>
    </div>
    
    <div id="menu3" class="tab-pane fade" style="overflow: scroll;">
      <h1 style="color: white;">3F</h1>
      <br>
  <table class="table" id="table-pagination" data-toggle="table" data-pagination="true">
    <thead>
      <tr>
      	<th>#</th>
        <th>Purpose of Use</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Room Name</th>
        <th>Subscriber</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="list" >
    	<c:if test="${ '3F' == list.room_loc }">
      <tr>
      	<td>${list.rent_num}</td>
        <td>${list.rent_reason}</td>
        <td>${list.rent_date_start}</td>
        <td>${list.rent_date_end}</td>
        <td>${list.room_name}</td>
        <td>${list.mem_name}</td>
        <td>
        	<button type="button" onclick="location='manage_rent_Delete?rent_num='+${list.rent_num}" class="btn btn-danger btn-xs" >삭제</button>
        </td>
      </tr>
      </c:if>
      </c:forEach>
    </tbody>
  </table>
    </div>
    
    <div id="menu4" class="tab-pane fade" style="overflow: scroll;">
       <h1 style="color: white;">4F</h1>
       <br>
  <table class="table" id="table-pagination" data-toggle="table" data-pagination="true">
    <thead>
      <tr>
      	<th>#</th>
        <th>Purpose of Use</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Room Name</th>
        <th>Subscriber</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="list" >
    	<c:if test="${ '4F' == list.room_loc }">
      <tr>
      	<td>${list.rent_num}</td>
        <td>${list.rent_reason}</td>
        <td>${list.rent_date_start}</td>
        <td>${list.rent_date_end}</td>
        <td>${list.room_name}</td>
        <td>${list.mem_name}</td>
        <td>
        	<button type="button" onclick="location='manage_rent_Delete?rent_num='+${list.rent_num}" class="btn btn-danger btn-xs" >삭제</button>
        </td>
      </tr>
      </c:if>
      </c:forEach>
    </tbody>
  </table>
    </div>
    
   <div id="menu5" class="tab-pane fade" style="overflow: scroll;">
   	<h1 style="color: white;">5F</h1>
   	<br>
  		<table class="table" id="table-pagination" data-toggle="table" data-pagination="true">
   		 <thead>
    	  <tr>
    	  	<th>#</th>
       		<th>Purpose of Use</th>
       	 	<th>Start Date</th>
        	<th>End Date</th>
        	<th>Room Name</th>
        	<th>Subscriber</th>
        	<th>Delete</th>
      	  </tr>
   		</thead>
    	<tbody>
    	<c:forEach items="${list}" var="list" >
    	<c:if test="${ '5F' == list.room_loc }">
      <tr>
      	<td>${list.rent_num}</td>
        <td>${list.rent_reason}</td>
        <td>${list.rent_date_start}</td>
        <td>${list.rent_date_end}</td>
        <td>${list.room_name}</td>
        <td>${list.mem_name}</td>
        <td>
        	<button type="button" onclick="location='manage_rent_Delete?rent_num='+${list.rent_num}" class="btn btn-danger btn-xs" >삭제</button>
        </td>
      </tr>
      </c:if>
     	</c:forEach>
    </tbody>
  </table>
    </div>
    
  </div>
</div>
</div>
</div>

<!-- Room Modal Start -->

<div class="container-fluid">
	<div class="modal fade" id="roomadd" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Room Add</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal" action="room_Insert" method="post" role="form">
						
						<!-- start name -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Name of Room : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="room_name" name="room_name"
									placeholder="Name of room">
							</div>
						</div>
						<!-- end name -->
						
						<!-- start location -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Location of Room : </label>
							<div class="col-sm-6">
								<select class="form-control" id="room_loc" name="room_loc">
									<option value=""> Location of Room </option>
									<option value="1F">1F</option>
									<option value="2F">2F</option>
									<option value="3F">3F</option>
									<option value="4F">4F</option>
									<option value="5F">5F</option>
								</select>
							</div>
						</div>
						<!-- end location -->
						
						<!-- start Capacity -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Capacity of people : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="room_limit" name="room_limit"
									placeholder="Name of room">
							</div>
						</div>
						<!-- end Capacity -->
						
						<br>
						<div class="row">
							<div align="left" class="col-sm-6">
								<button type="submit" class="btn btn-success">Add</button>
								<button type="button" class="btn btn-danger" data-dismiss='modal'>Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal End -->
