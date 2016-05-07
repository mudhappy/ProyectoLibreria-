package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class AccesoDB {

  private AccesoDB() {
  }

  public static Connection getConnection() throws SQLException{
    Connection cn = null;
    try {
      // Datos Mysql
      String driver = "com.mysql.jdbc.Driver";
      String url = "jdbc:mysql://localhost/senorsm";
      String user = "senorsm";
      String pass = "admin";
      // Cargar el driver a memoria
      Class.forName(driver).newInstance();
      // Obtener el objeto Connection
      cn = DriverManager.getConnection(url, user, pass);
    } catch (SQLException e) {
      throw e;
    } catch (ClassNotFoundException e) {
      throw new SQLException("ERROR, no se encuentra el driver.");
    } catch (Exception e) {
      throw new SQLException("ERROR, no se tiene acceso al servidor.");
    }
    return cn;
  }
  
}
