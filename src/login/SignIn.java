package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.LoginBean;

@WebServlet("/login/SignIn")
public final class SignIn extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    {
      var userName = request.getParameter("Nick");
      var password = request.getParameter("password");

      var loginBean = new LoginBean();

      loginBean.setUserName(userName);
      loginBean.setPassword(password);

      try {
        var userValidate = LoginDao.authenticateUser(loginBean);

        if ("admin_Role".equals(userValidate)) {
          var session = request.getSession();

          session.setAttribute("nick", userName);
          session.setAttribute("role", "admin");
          request.getRequestDispatcher("/index.jsp").forward(request,
              response);

        } else if ("user_Role".equals(userValidate)) {
          var session = request.getSession();

          session.setAttribute("nick", userName);
          session.setAttribute("role", "user");
          request.getRequestDispatcher("/index.jsp").forward(request, response);

        } else {
          System.err.println("Error message = " + userValidate);
          request.setAttribute("errMessage", userValidate);
          request.getRequestDispatcher("/signin.jsp").forward(request,
              response);

        }
      } catch (Exception e2) {
        e2.printStackTrace();
      }
    } // End of doPost()
  }

}

