<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>room_rent_detail.jsp</title>

<div class="container">
<h2>Reserving Room List</h2>
    
	<!-- <form class="form-horizontal" action="rent_Search" method="get" role="form">
  	
  		<input type="hidden" value="" name="rent_date_start">
  	
  		<div class="form-group">
  			<div class="col-sm-2">
				<select name="searchType" class="form-control input-md">
					<option value="">선택</option>
					<option value="1">Purpose</option>
					<option value="2">Room Name</option>
					<option value="3">Subscriber</option>
				</select>
			</div>
	 	</div>
	 	
  		<input  class="form-control input-md" name="searchValue" type="text">
  		
  		<div class="form-group">
   			<div class="col-sm-5">
				<button type="submit" class="btn btn-primary">Search</button>
			</div>
   		</div>
	</form> -->
  		                                                                               
  <div class="table-responsive">          
  <table class="table" id="table-pagination" data-toggle="table" data-pagination="true">
    <thead>
      <tr>
      	<th>#</th>
        <th>Purpose of Use</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Room Name</th>
        <th>Subscriber</th>
        <th>Modify</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="list" varStatus="stat">
      <tr>
      	<td>${stat.count}</td>
        <td>${list.rent_reason}</td>
        <td>${list.rent_date_start}</td>
        <td>${list.rent_date_end}</td>
        <td>${list.room_name}</td>
        <td>${list.mem_name}</td>
        <td>
        	<button type="button" onclick="location='rent_Modify_Detail?rent_num='+${list.rent_num}" class="btn btn-primary btn-xs">수정</button>
        </td>
        <td>
        	<button type="button" onclick="location='rent_Delete?rent_num='+${list.rent_num}" class="btn btn-danger btn-xs" >삭제</button>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>
</div>