/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CategoriaBean;
import db.AccesoDB;


/**
 *
 * @author Administrador
 */
public class CategoriaDao {
    
    
    public List<CategoriaBean> listar() throws SQLException {
        Connection cn = null;
        List<CategoriaBean> lista = new ArrayList<CategoriaBean>();

        cn = AccesoDB.getConnection();
        String sql = "SELECT * FROM CATEGORIA";
        CallableStatement cstm = cn.prepareCall(sql);
        ResultSet rs = cstm.executeQuery();
        while (rs.next()) {
            CategoriaBean t = new CategoriaBean();
            t.setIdcat(rs.getInt("idcat"));
            t.setNombre(rs.getString("nombre"));

            lista.add(t);
        }
        cstm.close();

        return lista;
    }

   /* public CategoriaBean buscar(int id) throws SQLException {
        Connection cn = null;
        CategoriaBean objeto = new CategoriaBean();

        cn = AccesoBD.getConnection();
        String sql = "SELECT * FROM TIPO_CLIENTE WHERE idTipoCliente=" + id;
        CallableStatement cstm = cn.prepareCall(sql);
        ResultSet rs = cstm.executeQuery();
        while (rs.next()) {
            objeto = new CategoriaBean();
            objeto.setId(rs.getInt("idTipoCliente"));
            objeto.setCodigo(rs.getString("codTipoCliente"));
            objeto.setDescripcion(rs.getString("nomTipoCliente"));
        }
        cstm.close();

        return objeto;
    }

    public boolean Insert(CategoriaBean objeto) throws SQLException {
        Connection cn = null;
        boolean rpta = false;

        cn = AccesoBD.getConnection();
        String sql = "INSERT INTO TIPO_CLIENTE(codTipoCliente,nomTipoCliente)VALUES(?,?)";
        CallableStatement cstm = cn.prepareCall(sql);
        cstm.setString(1, objeto.getCodigo());
        cstm.setString(2, objeto.getDescripcion());
        rpta = cstm.executeUpdate() == 1 ? true : false;
        cstm.close();

        return rpta;
    }

    public boolean Update(CategoriaBean objeto) throws SQLException {
        Connection cn = null;
        boolean rpta = false;

        cn = AccesoBD.getConnection();
        String sql = "UPDATE TIPO_CLIENTE SET codTipoCliente=?,nomTipoCliente=? WHERE idTipoCliente = ?";
        CallableStatement cstm = cn.prepareCall(sql);
        cstm.setString(1, objeto.getCodigo());
        cstm.setString(2, objeto.getDescripcion());
        cstm.setInt(3, objeto.getId());
        rpta = cstm.executeUpdate() == 1 ? true : false;
        cstm.close();

        return rpta;
    }

    public boolean Delete(CategoriaBean objeto) throws SQLException {
        Connection cn = null;
        boolean rpta = false;

        cn = AccesoBD.getConnection();
        String sql = "DELETE FROM TIPO_CLIENTE WHERE idTipoCliente = ?";
        CallableStatement cstm = cn.prepareCall(sql);
        cstm.setInt(1, objeto.getId());
        rpta = cstm.executeUpdate() == 1 ? true : false;
        cstm.close();

        return rpta;
    }
    
    */
    
}
