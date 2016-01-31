<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	ADMIN 모드입니다.
		<c:if test="${pageContext.request.userPrincipal.name != null }">
			Hi ${pageContext.request.userPrincipal.name } <br>
		<c:url var="logoutAction" value="/logout"/>	
		<form action="${logoutAction }" method="post">
			<input type="submit" value="Logout">
		</form>	
	</c:if>
</body>
</html>