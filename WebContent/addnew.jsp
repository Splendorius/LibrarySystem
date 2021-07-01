<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>

<meta charset="UTF-8">
<%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" +     
            request.getServerPort() + path + "/";
    %>
<base href="<%=basePath%>">
<link rel="stylesheet" href="Styles/style.css">
<title>Nowa pozycja</title>
</head>
<body>

	<form action="/System_Bibl/db/AddNew" method="POST">
		<p>Tytul</p>
		<input type="text" name="Tytul" /> 
		<p>Autor</p>
		<input type="text" name="Autor" />

		<p>Rok</p>
		<input type="number" name="Rok" />
	
		<p>Kopie</p>
		<input type="number" name="Kopie" />
<br/>
		<br/> <input type="submit" value="Dodaj Książke"/>
	</form>
<br><br><br>

		<form action="/System_Bibl/index.jsp" method="GET">
		<input type="submit" value="Index">
	</form>

<br>
	<c:if test="${sessionScope.role == 'user'}">
				<form action="/System_Bibl/profile.jsp" method="GET">
		<input type="submit" value="Zobacz profil">
		</form>
		
	</c:if>

		<form action="/System_Bibl/catalog.jsp" method="GET">
		<input type="submit" value="Katalog">
	</form>
	

	<form action="/System_Bibl/login/SignOut" method="GET">
		<input type="submit" value="Logout">
	</form>



</body>
</html>