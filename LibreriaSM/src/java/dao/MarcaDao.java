/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.AccesoDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.MarcaBean;

/**
 *
 * @author Administrador
 */
public class MarcaDao {
    
    
     public List<MarcaBean> listar() throws SQLException {
        Connection cn = null;
        List<MarcaBean> lista = new ArrayList<MarcaBean>();

        cn = AccesoDB.getConnection();
        String sql = "SELECT * FROM MARCA";
        CallableStatement cstm = cn.prepareCall(sql);
        ResultSet rs = cstm.executeQuery();
        while (rs.next()) {
            MarcaBean t = new MarcaBean();
            t.setIdmar(rs.getInt("idmar"));
            t.setNombre(rs.getString("nombre"));

            lista.add(t);
        }
        cstm.close();

        return lista;
    }
    
}
