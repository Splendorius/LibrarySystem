package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBConnection {

  private DBConnection() {}
  public static Connection createConnection() {
    Connection con = null;
    var url = "jdbc:mysql://localhost:3306/Biblio";
    var username = "CHANGE_ME";
    var password = "CHANGE_ME";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
      
      con = DriverManager.getConnection(url, username, password);
    

      System.out.println("Post establishing a db connection - " + con);
    }
      catch(ClassNotFoundException e) {
        e.printStackTrace();
      }
    
      catch(SQLException e) {
        System.err.println("An error occurred. Maybe user/password is invalid");
        e.printStackTrace();
      }
    
    return con;
  }
}
