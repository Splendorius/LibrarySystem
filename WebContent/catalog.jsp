<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="db.DBConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<c:if test="${sessionScope.role == null}">
	Ta strona wymaga zalogowania, automatyczne przekierowanie na strone logowania
	nastąpi za 3 sekundy
	<meta http-equiv="refresh" content="3;URL=/System_Bibl/signin.jsp">
</c:if>
<meta charset="UTF-8">
<%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" +     
            request.getServerPort() + path + "/";
    %>
<base href="<%=basePath%>">
<link rel="stylesheet" href="Styles/style.css">
<title>Katalog</title>
</head>
<body>
<c:out value="${sessionScope.role}"/>

    <%
    try (var con = DBConnection.createConnection();
        Statement st =con.createStatement();
        ResultSet rs =st.executeQuery("select * from ksiazki;");)
    {
    %>
    <table border=1 style="text-align:center">
    <caption>Książki</caption>
      <thead>
          <tr>
             <th scope="col">ID</th>
             <th scope="col">Tytul</th>
             <th scope="col">Autor</th>
             <th scope="col">Rok</th>
             <th scope="col">Dostępność</th>
          </tr>
      </thead>
      <tbody>
        
        <%
        JspWriter out2 = pageContext.getOut();
        while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getInt("ID")%></td>
                <td><%=rs.getString("Tytul") %></td>
                <td><%=rs.getString("Autor") %></td>
                <td><%=rs.getInt("Rok")%></td>
                <td><%=rs.getInt("Kopie") - rs.getInt("Wypożyczone")%></td>
	
	<c:if test="${sessionScope.role == 'user'}">
	
                <td> 
					<FORM Action="/System_Bibl/db/Borrow" NAME="form1" METHOD="POST" >
        			<input type='hidden' type='number' name='ID' value='<%out2.print(rs.getInt("ID"));%>' />
					<input type='submit' value='Wypożycz' />	
					</FORM></td>
       </c:if>         
            </tr>
            <%
            }
            %>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%>
        
        <br><%
    }
    %>
    
    	<c:if test="${sessionScope.role == 'admin'}">
		<form action="/System_Bibl/addnew.jsp" method="GET">
		<input type="submit" value="Dodaj pozycje">
	</form>
    </c:if>
    
		<form action="/System_Bibl/index.jsp" method="GET">
		<input type="submit" value="Index">
	</form>

	<c:if test="${sessionScope.role == 'user'}">
				<form action="/System_Bibl/profile.jsp" method="GET">
		<input type="submit" value="Zobacz profil">
		</form>
	
	<form action="/System_Bibl/login/SignOut" method="GET">
		<input type="submit" value="Logout">
	</form>

</c:if>
</body>
</html>