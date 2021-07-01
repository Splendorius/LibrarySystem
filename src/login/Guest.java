package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/Guest")
public class Guest extends HttpServlet {
  private static final long serialVersionUID = 1L;


  @Override
  protected void doPost(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {

    var session = request.getSession();
    
    session.setAttribute("nick", "guest");
    session.setAttribute("role", "guest");
    
    request.getRequestDispatcher("/index.jsp").forward(request,response);
  }

}
