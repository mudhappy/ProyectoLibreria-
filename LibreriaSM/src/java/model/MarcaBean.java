/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Administrador
 */
public class MarcaBean {
    private int idmar;
    private String nombre;

    public MarcaBean() {
    }

    public MarcaBean(int idmar, String nombre) {
        this.idmar = idmar;
        this.nombre = nombre;
    }

    public int getIdmar() {
        return idmar;
    }

    public void setIdmar(int idmar) {
        this.idmar = idmar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
    
    
}
