<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<title>PAGE[board_P_detail] </title>
<h2> E그룹웨어 게시판</h2>
<script src="resources/layout/js/common.js"></script>
<script type="text/javascript">
        function goUrl(url) {
           location.href=url;
        }
</script>
<html>

<form>

<div class="col-sm-12">
		
			<div class="panel-body">
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>조회수</th>
							<th>날짜</th>
				</tr>
							
	
					</thead>
					<tbody>
               <tr>
                    <td align="center" colspan="5">등록된 게시물이 없습니다.</td>
               </tr>
               <tr>
                    <td align="center">1</td>
                    <td><a href="boardView.jsp">강남구 신청합니다</a></td>
                    <td align="center">박종문</td>
                    <td align="center">2013.06.24</td>
                    <td align="center">10</td>
               </tr>
           </tbody>

					
					<!-- DB값 뿌려주기 -->  
					
					<tbody>
				<s:iterator value="list">
					<tr>
						<td><s:property value="board_num" /></td>	
						<td><s:property value="board_code" /></td>	
						<td><s:property value="board_title" /></td>
						<td><s:property value="board_content" /></td>
						<td><s:property value="board_hit" /></td>
						<td><s:property value="board_regdate" /></td>
					</tr>
				</s:iterator>
			</tbody>
					
					
					<%-- <tbody>
					<c:forEach items="${boardData}" var="list">
						<tr>
							<td>${list.nid}</td>
							<td>${list.author}</td>
							<td><a href="/boardService/read/${list.nid}" >${list.subject}</a></td>
							<td>${list.r_count}</td>
							<td>${list.c_date}</td>
						</tr>
					</c:forEach>	
					</tbody> --%>
				</table>
				
				<!--글작성  -->
	
		<div class="clearfix">
    	<span class="btn-group"></span>
    	<div class="pull-right">
        <a class="btn btn-primary" onclick="goUrl('board_P_write')">
        <span class="glyphicon glyphicon-pencil" /></span> 글쓰기</a>   
         </div>
		</div>	
				
				<!-- 검색__제목 -->
    <div class="form-inline">
        <select name="sfl" class="form-control input-sm auto pull-left">
            <option value="wr_subject">제목</option>
            <option value="wr_content">내용</option>
            <option value="wr_subject.wr_content">제목+내용</option>
            <option value="mb_id">회원아이디</option>
            <option value="wr_name">글쓴이</option>
        </select>
        
       			 <!--검색__검색  -->
        <div class="span4 pull-left">
            <div class="input-group">
                <input name="stx" class="form-control input-sm" maxlength="15" value="" />
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-sm btn-primary" 
                    onclick="goUrl('board_P_detail')">검색</button>
                </span>
            </div>
        </div>
        </div>
				
				<%-- <!-- 10.30, 단위 보여주기 -->
				<div class="pull-right">
					<select class="form-control">
						<option>10</option>
						<option>20</option>
						<option>30</option>
					</select>	
				</div> --%>
				
				<!--페이징  -->	
				<div align="center">
					<ul class="pagination">
						<li><a href="/board/board01?currentpage=${pagingData.prev_pageno}" >«</a></li>
						<c:forEach var="iter" begin="${pagingData.page_sno}" end="${pagingData.page_eno}">
						<li id="pagination${list}"><a href="/board/board01?currentpage=${iter}" ><b>${iter}</b></a></li>
						</c:forEach>
						<li><a href="/board/board01?currentpage=${pagingData.next_pageno}">»</a></li>
					</ul>
				</div>				
			</div>
			</div>
			

				
</form>
</html>