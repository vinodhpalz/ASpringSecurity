<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload='document.loginForm.username.focus();'>
	
	<h1>Spring Security Login Form (DB Authentication)</h1>
	
	<div>
		<h3>Login with Username and Password</h3>
		
		<c:if test="${not empty error}">
			<div>${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div>${msg}</div>
		</c:if>
		
		<form name="loginForm" action="<c:url value='/j_spring_security_check'/>" method="post">
		
			<table>
				<tr>
					<td>User: </td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password: </td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="2"><input name="submit" type="submit" value="submit" /></td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		
	</div>
	
	
</body>
</html>