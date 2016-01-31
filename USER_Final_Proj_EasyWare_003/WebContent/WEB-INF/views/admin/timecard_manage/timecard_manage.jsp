<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title"> TIMECARE MANAGER SETTING</h3>
	</div>
	<div class="panel-body">
		<h3>  </h3> 
		<form action="<c:url value='/timecard/insert'/>" method="post">
			
		</form>	
	</div>
</div>

<hr>
<form class="form-group" method="post" action="<c:url value='/timecardManager/insert'/> ">
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th> # </th> 
			<th>TIMECATD SETTING</th>
			<th>TIMECATD SETTING VALUE</th>
		</tr>
	</thead>
	<tbody>
		<tr> 
			<td></td>
			<td>  출근 시간  </td>
			<td><input class="form-control" type="number" name="start_time" min="1" max="24"  value="${prop.start_time}" /></td>
		</tr>
		<tr> 
			<td></td>
			<td>  퇴근 시간  </td>
			<td><input class="form-control" type="number" name="end_time" min="1" max="24" value="${prop.end_time}" /></td>
		</tr>
		<tr>
			<td></td>
			<td>  출근 인정 시간  </td>
			<td><input class="form-control" type="number" name="full_time" min="1" max="24" value="${prop.full_time}"/> </td>
		</tr>
		<tr>
			<td colspan="3"> <button class="btn btn-primary" type="submit">수정</button> 
				 <button class="btn btn-danger" type="button">취소</button> 	
			</td>
		</tr>
	</tbody>
</table>

<hr>
</form>



