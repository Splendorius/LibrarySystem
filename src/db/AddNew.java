package db;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/db/AddNew")
public class AddNew extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {

    try (var con = DBConnection.createConnection();
        var st = con.prepareStatement(
            "insert into ksiazki (Tytul,Autor,Rok,Kopie,Wypożyczone) values(?,?,?,?,?)");
        var out = response.getWriter();) {
      st.setString(1, request.getParameter("Tytul"));
      st.setString(2, request.getParameter("Autor"));
      st.setInt(3, Integer.parseInt(request.getParameter("Rok")));
      st.setInt(4, Integer.parseInt(request.getParameter("Kopie")));
      st.setInt(5, 0);
      st.executeUpdate();
      
      response.setHeader("Refresh", "3;url=/System_Bibl/addnew.jsp");
      out.println(
          "<html><body><b>Pomyslnie dodano nowa pozycje</b></body></html>");
      
     
    } catch (Exception e) {
      e.printStackTrace();
    }

  }
}
