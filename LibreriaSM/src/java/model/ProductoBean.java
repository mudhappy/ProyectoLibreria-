
package model;

public class ProductoBean {
    private int idprod;
    private int idcat;
    private int idmar;
    private String nombre;
    private double precio;
    private int stock;

    public ProductoBean(int idprod, int idcat, int idmar, String nombre, double precio, int stock) {
        this.idprod = idprod;
        this.idcat = idcat;
        this.idmar = idmar;
        this.nombre = nombre;
        this.precio = precio;
        this.stock = stock;
    }

    public ProductoBean() {
    }
    

    public int getIdprod() {
        return idprod;
    }

    public void setIdprod(int idprod) {
        this.idprod = idprod;
    }

    public int getIdcat() {
        return idcat;
    }

    public void setIdcat(int idcat) {
        this.idcat = idcat;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    
    
}
