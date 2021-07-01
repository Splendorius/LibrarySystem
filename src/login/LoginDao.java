package login;

import java.sql.SQLException;

import db.DBConnection;
import db.LoginBean;

public final class LoginDao {
  
  private LoginDao() {}

  public static String authenticateUser(LoginBean loginBean) {
    
    String userName = loginBean.getUserName();
    String password = loginBean.getPassword();


    var userNameDB = "";
    var passwordDB = "";
    var roleDB = "";
    
    try(
      var con = DBConnection.createConnection();
      var statement = con.createStatement();
      var resultSet = statement.executeQuery("select Nick,password,Role from users");
)
    {
      while (resultSet.next()) {
        userNameDB = resultSet.getString("Nick");
        passwordDB = resultSet.getString("password");
        roleDB = resultSet.getString("Role");

        if (userName.equals(userNameDB) && password.equals(passwordDB) && "admin".equals(roleDB)) 
          return "admin_Role";

        if (userName.equals(userNameDB) && password.equals(passwordDB) && "user".equals(roleDB))
          return "user_Role";
      }
      
    } 
    
      catch (SQLException e) {
      e.printStackTrace();
    }
    return "Invalid user credentials";
  }
}
