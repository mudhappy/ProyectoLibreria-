<%-- 
    Document   : articulo
    Created on : 06-may-2016, 15:39:26
    Author     : ALUMNO-UCH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Articulos</title>
    </head>
    <body>
        <h1>Insertar Articulo</h1>
    <p>${msg}</p>
    <p>${error}</p>
    
    <form method="post" action="AddCategoria">
      <fieldset>
          <legend>Nueva Categoria</legend>
                <p>Codigo Categoria: <input type="text" name="codigo"/></p>
                <p>Nombre Categoria: <input type="text" name="nombre"/></p>
                <input type="submit" value="Procesar"/>
      </fieldset>
    </form>
    <form method="post" action="AddMarca">
      <fieldset>
          <legend>Nueva Marca</legend>
                <p>Codigo Marca: <input type="text" name="codigo"/></p>
                <p>Nombre Marca: <input type="text" name="nombre"/></p>
                <input type="submit" value="Procesar"/>
      </fieldset>
    </form>
    <form method="post" action="AddProducto">
      <fieldset>
          <legend>Nuevo Articulo</legend>  
                <p>Categoria: <input type="text" name="idcat"/></p>
                
                 <label for="txtCategoria">Categoria:</label>
                    <select name="cboListaCategoria" id="cboListaCategoria">
                        <option value="">Seleccione Categoria</option>
                             <c:forEach var="var" items="${listaCategoria}">
                                 <option value="${var.idcat}">${var.nombre}</option>
                             </c:forEach>
                    </select>                            
                    
                
                <p>Marca: <input type="text" name="idmar"/></p>
                
                
                <label for="txtMarca">Categoria:</label>
                    <select name="cboListaMarca" id="cboListaMarca">
                        <option value="">Seleccione Marca</option>
                             <c:forEach var="var" items="${listaMarca}">
                                 <option value="${var.idmar}">${var.nombre}</option>
                             </c:forEach>
                    </select>  
                
                
                <p>Nombre: <input type="text" name="nombre"/></p>
                <p>Precio: <input type="text" name="precio"/></p>
                <p>Stock: <input type="text" name="stock"/></p>
               
                <input type="submit" value="Procesar"/>
      </fieldset>
                             
            <table border="1">                        
                    <thead>
                        <tr>
                            <th>IdCat</th>
                            <th>NombreCat</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="r" items="${listaCategoria}">
                            <tr>
                                <td>${r.idcat}</td>
                                <td>${r.nombre}</td>                                                                            
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
      
      
                        
    </form>
    </body>
</html>
