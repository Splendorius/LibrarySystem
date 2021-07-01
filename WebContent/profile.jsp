<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="db.DBConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="pl">
<head>

<c:if test="${(sessionScope.role == 'admin') or (sessionScope.role == 'admin') or (sessionScope.role == null)}">
	Ta strona wymaga zalogowania, automatyczne przekierowanie na strone logowania
	nastąpi za 3 sekundy
	<meta http-equiv="refresh" content="3;URL=/System_Bibl/signin.jsp">
</c:if>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/Styles/style.css' />"/>
<title>Profil</title>
</head>
<body>

<c:if test="${sessionScope.role == 'user'}">

Profil:<c:out value="${sessionScope.nick}"/>

<%
try(
var con = DBConnection.createConnection();
Statement st =con.createStatement();
ResultSet rs =st.executeQuery("SELECT users.nick,wypozyczenia.Id_wyp, ksiazki.Tytul, wypozyczenia.data FROM wypozyczenia INNER JOIN users ON wypozyczenia.ID_user=users.ID INNER JOIN ksiazki ON wypozyczenia.ID_book=ksiazki.ID where nick='"+ String.valueOf(session.getAttribute("nick")) + "';");
)

{
%>

<table border=1 style="text-align:center">
<caption>Wypożyczone książki</caption>
      <thead>
          <tr>
             <th scope="col">Tytul</th>
             <th scope="col">Data wypożyczenia</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("Tytul") %></td>
                <td><%=rs.getString("data")%></td>
            </tr>
            <% }}

catch(Exception e){
  out.print(e.getMessage());
  }%>
        </tbody>
        </table><br>
		<form action="/System_Bibl/index.jsp" method="GET">
		<input type="submit" value="Index">
	</form>
		<form action="/System_Bibl/catalog.jsp" method="GET">
		<input type="submit" value="Katalog">
	</form>
	<form action="/System_Bibl/login/SignOut" method="GET">
		<input type="submit" value="Logout">
	</form>
	
</c:if>
</body>
</html>