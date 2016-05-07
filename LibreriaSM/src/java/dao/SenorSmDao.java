
package dao;

import db.AccesoDB;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class SenorSmDao {
Connection cn=null;    
  public void addCategoria(int codigo,String nombre){
  
    try {
      cn = AccesoDB.getConnection();
      
      String sql = "insert into categoria(idcat,nombre)"
              + "values(?,?)";
      PreparedStatement pstm = cn.prepareStatement(sql);
      pstm.setInt(1, codigo);
      pstm.setString(2, nombre);
      pstm.executeUpdate();
      pstm.close();
    } catch (Exception e) {
      throw new RuntimeException(e.getMessage());
    } finally{
      try {
        cn.close();
      } catch (Exception e) {
      }
    }
  } 
  public void addMarca(int codigo,String nombre){
     
    try {
      cn = AccesoDB.getConnection();
      
      String sql = "insert into marca(idmar,nombre)"
              + "values(?,?)";
      PreparedStatement pstm = cn.prepareStatement(sql);
      pstm.setInt(1, codigo);
      pstm.setString(2, nombre);
      pstm.executeUpdate();
      pstm.close();
    } catch (Exception e) {
      throw new RuntimeException(e.getMessage());
    } finally{
      try {
        cn.close();
      } catch (Exception e) {
      }
    } 
  }
  public void addProducto(int idcat,int idmar,String nombre, double precio, int stock){
   
    try {
      cn = AccesoDB.getConnection();
      
      String sql = "insert into producto(idcat,"
              + "idmar,nombre,precio,stock) "
              + "values(?,?,?,?,?)";
      PreparedStatement pstm = cn.prepareStatement(sql);
     
      pstm.setInt(1, idcat);
      pstm.setInt(2, idmar);
      pstm.setString(3, nombre);
      pstm.setDouble(4, precio);
      pstm.setInt(5, stock);
      pstm.executeUpdate();
      pstm.close();
    } catch (Exception e) {
      throw new RuntimeException(e.getMessage());
    } finally{
      try {
        cn.close();
      } catch (Exception e) {
      }
    }
  }  
}
