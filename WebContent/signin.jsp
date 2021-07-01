<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/Styles/style.css' />"/>
<title>Sign-In</title>
</head>
<body>

<h1 ID="title">Logowanie</h1>
	<div class=login-box>

		<div class=login-inside>
			<form action="/System_Bibl/login/SignIn" method="POST">
				<input type="text" class="log_input" name="Nick" placeholder="Nick"/>
				<br> 
				<input type="password" class="log_input" name="password" placeholder="Password">
				<br> 
				<input type="submit" value="Sign-In">
			</form>
		</div>
		
	<c:if test="${requestScope.errMessage != null}">
		<div id="error">
			<c:out value="${requestScope.errMessage}" />
		</div>
	</c:if>
		<br>
		<br>
		<br>
	Continue without login
	<form action="/System_Bibl/login/Guest" method="POST">
		<input type="submit" value="Sign-In">
	</form>
	</div>

</body>
</html>