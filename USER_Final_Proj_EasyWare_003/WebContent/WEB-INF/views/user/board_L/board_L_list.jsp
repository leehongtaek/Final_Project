<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<title>EGWare Board</title>
<script src="resources/layout/js/common.js"></script>
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">


<div class="panel panel-warning">
	<div class="panel-heading">
		<h2>
			<span class="lnr lnr-users"></span> 게시판
		</h2>

	</div>
	<ul class="nav nav-pills">
		<li><a href="<c:url value='/board/board_L_list?board_code=9'/>">공지사항</a></li>
		<c:if test="${sessionScope.dept_num == 1}">
			<li><a href="<c:url value='/board/board_L_list?board_code=1'/>">감사부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 2}">
			<li><a href="<c:url value='/board/board_L_list?board_code=2'/>">인사부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 3}">
			<li><a href="<c:url value='/board/board_L_list?board_code=3'/>">관리부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 4}">
			<li><a href="<c:url value='/board/board_L_list?board_code=4'/>">영업부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 5}">
			<li><a href="<c:url value='/board/board_L_list?board_code=5'/>">연구소
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 6}">
			<li><a href="<c:url value='/board/board_L_list?board_code=6'/>">개발부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 7}">
			<li><a href="<c:url value='/board/board_L_list?board_code=6'/>">보수부
					게시판</a></li>
		</c:if>
		<c:if test="${sessionScope.dept_num == 8}">
			<li><a href="<c:url value='/board/board_L_list?board_code=6'/>">운영부
					게시판</a></li>
		</c:if>
		<li><a href="<c:url value='/board/board_L_list?board_code=10'/>">커뮤니티</a></li>
	</ul>

	<!-- board table start-->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				<c:if test="${board_code != 9}">
					<th>추천수</th>
				</c:if>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="listv" items="${list}">
					<tr>
						<td>${listv.board_num}</td>
						<td><c:if test="${board_code == 9}">
								<img
									src="${pageContext.request.contextPath}/resources/img/notice_icon.png">
							</c:if><a
							href="board_L_detail?board_num=${listv.board_num}&board_code=${board_code}">${listv.board_title}</a></td>
						<td>${listv.mem_name}</td>
						<td>${listv.board_hit}</td>
					<c:if test="${board_code != 9}">
						<td>${listv.board_likenum}</td>
					</c:if>
						<td>${listv.board_regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- board table end-->
</div>
<!-- panel end -->
<!-- form start -->
<form method="POST" action="/board/search">
	<div class="form-inline">
	<c:if test="${board_code != 9}">
			<button class="btn btn-primary" type="button" value="write"
			onclick="location='board_L_write?board_code=${board_code}'">
			<span class="glyphicon glyphicon-pencil"></span>
			</button>
		</c:if>
		<c:if test="${board_code == 9 and sessionScope.posit_num <=4}">
			<button class="btn btn-primary" type="button" value="write"
			onclick="location='board_L_write?board_code=${board_code}'">
			<span class="glyphicon glyphicon-pencil"></span>
		</button>
			
		</c:if>
		

		<select class="form-control" name="searchType">
			<option value="">-선택-</option>
			<option value="1">제목</option>
			<option value="2">내용</option>
			<option value="3">작성자</option>
		</select> <input type="search" name="searchValue" class="form-control">
		<button type="submit" class="form-control btn btn-default">검색</button>
	</div>
</form>
<!-- form end -->


<!-- paging start -->
<center>
	<tfoot>
		<tr>
			<td colspan="6" style="text-align: center">
				<%--Page 이전 페이지 구현 --%> <c:choose>
					<c:when test="${searchType == null}">
						<c:choose>
							<c:when test="${pageInfo.currentBlock eq 1}">
                    ◀
                           </c:when>
							<c:otherwise>
								<a
									href="board_L_list?page=
         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }&board_code=${board_code}">
									◀</a>
							</c:otherwise>
						</c:choose>

						<%--Page  페이지 구현 --%>
						<c:choose>
							<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
								<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
									varStatus="num">
                        [<a
										href="board_L_list?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&board_code=${board_code}">
										${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a> ]
                       </c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach
									begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
									end="${pageInfo.totalPages}" varStatus="num">
                        [<a
										href="board_L_list?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&board_code=${board_code}">
										${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a> ]
                    </c:forEach>
							</c:otherwise>
						</c:choose>


						<%--Page 다음 페이지 구현 --%>
						<c:choose>
							<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
               ▶
                </c:when>
							<c:otherwise>
								<a
									href="board_L_list?page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }&board_code=${board_code}">
									▶</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>

						<c:choose>
							<c:when test="${pageInfo.currentBlock eq 1}">
                    ◀◀
                           </c:when>
							<c:otherwise>
								<a
									href="board_L_list?searchType=${searchType}&searchValue=${searchValue}&page=
         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }&board_code=${board_code}">
									◀</a>
							</c:otherwise>
						</c:choose>

						<%--Page  페이지 구현 --%>
						<c:choose>
							<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
								<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
									varStatus="num">
                        [<a
										href="board_L_list?searchType=${searchType}&searchValue=${searchValue}&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&board_code=${board_code}">
										${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a> ]
                       </c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach
									begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
									end="${pageInfo.totalPages}" varStatus="num">
                        [<a
										href="board_L_list?searchType=${searchType}&searchValue=${searchValue}&page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&board_code=${board_code}">
										${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a> ]
                    </c:forEach>
							</c:otherwise>
						</c:choose>


						<%--Page 다음 페이지 구현 --%>
						<c:choose>
							<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
               ▶▶
                </c:when>
							<c:otherwise>
								<a
									href="board_L_list?searchType=${searchType}&searchValue=${searchValue}&page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
									▶</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</tfoot>
</center>



<!-- paging end -->