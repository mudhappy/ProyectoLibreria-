package service;

import dao.SenorSmDao;


public class SenorSmService {

  private SenorSmDao dao;

  public SenorSmService() {
    dao = new SenorSmDao();
  }
  public void addCategoria(int codigo,String nombre){
    dao.addCategoria(codigo,nombre);
  }
  public void addMarca(int codigo,String nombre){
    dao.addMarca(codigo, nombre);
  }
  public void addProducto(int idcat,int idmar,String nombre, double precio, int stock){
    dao.addProducto(idcat, idmar, nombre, precio, stock);
  }
}
