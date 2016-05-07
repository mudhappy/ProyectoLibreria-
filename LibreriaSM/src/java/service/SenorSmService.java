package service;

import dao.SenorSmDao;


public class SenorSmService {

  private SenorSmDao dao;

  public SenorSmService() {
    dao = new SenorSmDao();
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
