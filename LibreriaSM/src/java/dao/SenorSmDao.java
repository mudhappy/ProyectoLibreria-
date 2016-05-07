
package dao;

import db.AccesoDB;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class SenorSmDao {
Connection cn=null;    
  public void addCategoria(String nombre){
  
    try {
      cn = AccesoDB.getConnection();
      
      String sql = "insert into categoria(nombre)"
              + "values(?)";
      PreparedStatement pstm = cn.prepareStatement(sql);
     
      pstm.setString(1, nombre);
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
  public void addMarca(String nombre){
     
    try {
      cn = AccesoDB.getConnection();
      
      String sql = "insert into marca(nombre)"
              + "values(?)";
      PreparedStatement pstm = cn.prepareStatement(sql);
      pstm.setString(1, nombre);
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
  
  public void addCliente(String nombre,String dni,String apellidopa, String apellidoma,
          String email,String telefono,String celular,String usuario,String clave){
     try {
      cn = AccesoDB.getConnection();
      
      String sql = "insert into cliente(nombre,"
              + "dni,apellidopa,apellidoma,email,telefono,celular,usuario,clave,estado) "
              + "values(?,?,?,?,?,?,?)";
      PreparedStatement pstm = cn.prepareStatement(sql);
     
      pstm.setString(1,nombre);
      pstm.setString(2,dni);
      pstm.setString(3,apellidopa);
      pstm.setString(4,apellidoma);
      pstm.setString(5,email);
      pstm.setString(6,telefono);
      pstm.setString(7,celular);
      pstm.setString(8,usuario);
      pstm.setString(9,clave);
      pstm.setInt(10,1);
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
