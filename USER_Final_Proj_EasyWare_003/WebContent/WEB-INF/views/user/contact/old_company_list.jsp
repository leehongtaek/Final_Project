<%-- 
    작업 날짜 : 2015. 10. 21.
    구현 내용 :   
  
  @author By KOSTA 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<title>PAGE[company_list]</title>

<div class="container">
	<table class="table table-striped">
		<s:iterator value="list">
			<tr>
				<td><s:property value="comp_name" /></td>
				<td><s:property value="comp_roadaddr" /></td>
				<td><s:property value="comp_tel" /></td>
				<td><s:property value="comp_home" /></td>
			</tr>
		</s:iterator>
	</table>
</div>
