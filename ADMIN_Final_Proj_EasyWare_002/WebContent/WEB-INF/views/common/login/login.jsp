<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
		Login Page!
		<c:url var="loginUrl" value="/j_spring_security_check" />
		<form action="${loginUrl }" method="post" >
			<table>
				<tr> ID:
					<td><input type="text" name="username" /></td>
				</tr>
				<tr> PASSWORD:
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Login" /></td>
				</tr>
			</table>
		</form>
	</h3>
</body>
</html>