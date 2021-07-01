<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/Styles/style.css' />"/>
<title>Index</title>

<c:if test="${sessionScope.role == null}">
	Ta strona wymaga zalogowania, automatyczne przekierowanie na strone logowania
	nastąpi za 3 sekundy
	<meta http-equiv="refresh" content="3;URL=/System_Bibl/signin.jsp">
</c:if>

</head>
<body>
Witaj:<c:out value="${sessionScope.nick}"/>

<c:if test="${sessionScope.role == 'admin'}">
<nav>
		<form action="/System_Bibl/addnew.jsp">
		<input type="submit" value="Dodaj pozycje">
	</form>
	<br>
	<form action="/System_Bibl/catalog.jsp">
		<input type="submit" value="Katalog">
	</form>
	<br>
	<form action="/System_Bibl/login/SignOut" method="GET">
		<input type="submit" value="Logout">
	</form>
</nav>
</c:if>

<c:if test="${sessionScope.role == 'user'}">
<nav>	
	<form action="/System_Bibl/profile.jsp" method="GET">
		<input type="submit" value="Zobacz profil">
		</form>
	<br>
			<form action="/System_Bibl/catalog.jsp" method="GET">
		<input type="submit" value="Katalog">
	</form>
	<br>
	<form action="/System_Bibl/login/SignOut" method="GET">
		<input type="submit" value="Logout">
	</form>
</nav>
</c:if>

<c:if test="${sessionScope.role == 'guest'}">
<nav>
		<form action="/System_Bibl/catalog.jsp" method="GET">
		<input type="submit" value="Katalog">
	</form>
	<br>
	<form action="/System_Bibl/login/SignOut" method="GET">
		<input type="submit" value="Logout">
	</form>
</nav>
</c:if>

</body>
</html>