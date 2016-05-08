package service;

import dao.InsertDao;


public class SenorSmService {

  private InsertDao dao;

  public SenorSmService() {
    dao = new InsertDao();
  }
  public void addCategoria(String nombre){
    dao.addCategoria(nombre);
  }
  public void addMarca(String nombre){
    dao.addMarca( nombre);
  }
  public void addProducto(int idcat,int idmar,String nombre, double precio, int stock){
    dao.addProducto(idcat, idmar, nombre, precio, stock);
  }
}
