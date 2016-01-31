<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title"> MEMBER MANAGER LIST</h3>
	</div>
	<div class="panel-body">
		<h3> LOGGING 관리 </h3> 	
		
		
	</div>
</div>

<hr>
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			  
			<th>Log ID</th>
			<th>Log Type </th>
			<th>사원 코드</th>
			<th>사원 이름</th>
			<th>IP</th>
			<th>로그기록일자 </th>
		</tr>
	</thead>
<!-- 	private String log_id;
	private String log_type;
	private String mem_code;
	private String mem_id;
	private String mem_name;
	private String mem_ip;
	private String log_date; -->
	<tbody>
	<c:forEach items="${list}" var="row" >
		<tr> 
			<td>          
			${row.log_id} 
			</td>
			<td>
			<c:if test="${row.log_type == '0'}">
			정상로그인      
			</c:if>   
			<c:if test="${row.log_type == '1'}">                  
			정상로그아웃
			</c:if>         
			<c:if test="${row.log_type == '2'}">
			로그인실패
			</c:if> 
			
			</td>
			<td>${row.mem_code}</td>
			<td>${row.mem_id}</td>   
			<td>${row.mem_ip}</td>
			<td>${row.log_date}</td>
		
		</tr>
	</c:forEach>
	</tbody>
</table> 



<button class="btn btn-primary" type="button" data-toggle="collapse"
	data-target="#collapse_search" aria-expanded="false"
	aria-controls="collapse_search">
	<span class="glyphicon glyphicon-search">검색</span>
</button>  
    
<div class="collapse form-horizontal" id="collapse_search">
	<div class="row">                
		<form action="<c:url value='/logging/connect_search_list'/>" method="get">
	     
			
			<div class="form-group">                        
				<div class="col-sm-2">
					<h6>기간 선택:</h6>  
				</div>
				<div class="col-sm-4">
					<input type="date" class="form-control input-sm" name="start_time" />
				</div>
				<div class="col-sm-1">
					<span>~</span>
				</div>      
				<div class="col-sm-4">  
					<input type="date" class="form-control input-sm" name="end_time" />
				</div>
			</div>
	    
			<div class="form-group" >
				<div class="col-sm-2">
					<h6>로그타입:</h6>  
				</div>          
				<div class="col-sm-4" >               
					<select class="form-control input-sm" name="log_type">
						<option value="3">--선택--</option>
						<option value="0"> 정상 로그인 </option>
						<option value="1"> 정상 로그아웃 </option>
						<option value="2"> 로그인 실패 </option>
					</select>
				</div>
			</div >
			        
			<div class="form-group has-primary">
				<div class="col-sm-2">      
					<h6>MEM_ID :</h6>  
				</div>  
				<div class="has-success col-sm-3">
					<input type="search" class="form-control" name="mem_id" placeholder="Search" >
				</div> 	
				<div class="col-sm-3">  
					<button type="submit" class="btn ">  검 색 </button>
				</div>
			
			</div>
			
		</form>
	</div>
</div>

<!-- paging start -->
<!-- 페이징 시 데이터 없을때는 페이지 하지 않게 함 -->
<c:if test="${pagingData !=null && pagingData.page_sno > 0}">
<div align="center">
	<ul class="pagination">
		<li>
		<a href="<c:url value='/logging/connect_list?currentpage=${pagingData.prev_pageno}'/>">«</a></li>
		<c:forEach var="iter" begin="${pagingData.page_sno}" end="${pagingData.page_eno}">
		<li id="pagination">
		<a href="<c:url value='/logging/connect_list?currentpage=${iter}'/>"><b>${iter}</b></a></li>
		</c:forEach>  
		<li><a href="<c:url value='/logging/connect_list?currentpage=${pagingData.next_pageno}'/>">»</a></li>
		</ul>
		
</div>  
</c:if>
<!-- paging end -->
	

