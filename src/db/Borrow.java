package db;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/db/borrow")
public class Borrow extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    try (
      var con = DBConnection.createConnection();
      var st = con.prepareStatement("INSERT INTO borrow_list (ID_book,Nick) values(?,?)");
      var out = response.getWriter();
){

      st.setInt(1, Integer.parseInt(request.getParameter("ID")));


      var session = request.getSession();
      st.setString(2, (String) session.getAttribute("nick"));

      st.executeUpdate();
      
      response.setHeader("Refresh", "3;url=/System_Bibl/catalog.jsp");
      out.println(
          "<html><body><b>Dodano prosbe o wypozyczenie. Przekierowanie nastapi za 3 sekundy</b></body></html>");
    }
    
    catch (Exception e) {
      e.printStackTrace();
    }

  }
}
