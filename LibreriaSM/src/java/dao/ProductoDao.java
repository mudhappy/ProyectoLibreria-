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
import model.ProductoBean;

/**
 *
 * @author Windows7
 */
public class ProductoDao {
    public List<ProductoBean> listar() throws SQLException {
        Connection cn = null;
        List<ProductoBean> lista = new ArrayList<ProductoBean>();

        cn = AccesoDB.getConnection();
        String sql = "SELECT * FROM PRODUCTO";
        CallableStatement cstm = cn.prepareCall(sql);
        ResultSet rs = cstm.executeQuery();
        while (rs.next()) {
            ProductoBean t = new ProductoBean();
            t.setIdprod(rs.getInt("idprod"));
            t.setIdcat(rs.getInt("idcat"));
            t.setIdmar(rs.getInt("idmar"));
            t.setNombre(rs.getString("nombre"));
            t.setPrecio(rs.getDouble("precio"));
            t.setStock(rs.getInt("stock"));
            lista.add(t);
        }
        cstm.close();

        return lista;
    }
}
