<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message: ${message}</h1>
	<c:url value="/j_spring_security_logout" var="logoutUrl"/>
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	<script>
		function formSubmit()
		{
			document.getElementById("logoutForm").submit();
		}
	</script>
	
	<c:if test="${pageContext.request.userPrincipal.name != null }">
		<h2>
			User : ${pageContext.request.userPrincipal.name} | <a href="javascript:formSubmit()">Logout</a>
		</h2>
	</c:if>
</body>
</html>