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
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css">
  <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
  <body>

  <!-- Always shows a header, even in smaller screens. -->
  <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header mi-header">
      <div class="mdl-layout__header-row">
        <!-- Title -->
        <button class="mdl-button mdl-js-button mdl-button--icon btn-atras">
          <i class="material-icons">arrow_back</i>
        </button>
        <span class="mdl-layout-title">Panel de administración</span>
        <!-- Add spacer, to align navigation to the right -->
        <div class="mdl-layout-spacer"></div>
        <!-- Navigation. We hide it in small screens. -->
        <nav class="mdl-navigation mdl-layout--large-screen-only">
          <a class="mdl-navigation__link" href="">Inicio</a>
          <a class="mdl-navigation__link" href="">Control</a>
          <a class="mdl-navigation__link" href="">Soporte</a>
          <a class="mdl-navigation__link" href="">Salir</a>
        </nav>
      </div>
    </header>
    <main class="mdl-layout__content">
      <div class="page-content">





        <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">

          <div class="mdl-grid">

            <div class="mdl-cell mdl-cell--1-col menu-tabla">
              <a href="#starks-panel" class="mdl-tabs__tab is-active">Producto</a>
              <a href="#lannisters-panel" class="mdl-tabs__tab">Categoria</a>
              <a href="#targaryens-panel" class="mdl-tabs__tab">Marca</a>
            </div>

            <div class="mdl-cell mdl-cell--11-col contenido-tabla">
              <div class="mdl-tabs__panel is-active" id="starks-panel">
                <h4 class="titulo-configuracion">Agregar producto</h4>
                

                <form method="post" action="AddProducto">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input name="nombre" class="mdl-textfield__input" type="text" id="sample3">
                    <label class="mdl-textfield__label" for="sample3">Nombre</label>
                  </div>
                  <br>
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input name="precio" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                    <label class="mdl-textfield__label" for="sample4">Precio</label>
                    <span class="mdl-textfield__error">Eso no es un número!</span>
                  </div>
                  <br>
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input name="stock" class="mdl-textfield__input" type="text" pattern="[0-9]*"  id="sample4">
                    <label class="mdl-textfield__label" for="sample4">Stock</label>
                    <span class="mdl-textfield__error">Solo números enteros!</span>
                  </div>
                  <br>
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <select name="idcat" id="example" class="mdl-textfield__input">
                     <c:forEach var="var" items="${listaCategoria}">
                        <option value="${var.idcat}">${var.nombre}</option>
                    </c:forEach>
                    </select>
                    <label class="mdl-textfield__label is-dirty" for="example">Categoria</label>
                  </div>
                  <br>
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <select name="idmar" id="example" class="mdl-textfield__input">
                      <c:forEach var="var" items="${listaMarca}">
                        <option value="${var.idmar}">${var.nombre}</option>
                    </c:forEach>
                    </select>
                    <label class="mdl-textfield__label is-dirty" for="example">Marca</label>
                  </div>
                  <br>
                  <label for="img">Seleccionar imagen</label>
                  <br><br>
                  <input type="file" accept="image/*" name="img">
                  <br><br>
                  <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Agregar producto
                  </button>

                </form>

                <table class="mdl-data-table mdl-js-data-table">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Categoria</th>
                      <th>Marca</th>
                      <th>Nombre</th>
                      <th>Precio</th>
                      <th>Stock</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="u" items="${listaProducto}">
                            <tr>
                                <td>${u.idprod}</td>
                                <td>${u.idcat}</td>
                                <td>${u.idmar}</td>
                                <td>${u.nombre}</td>
                                <td>${u.precio}</td>
                                <td>${u.stock}</td>
                            </tr>
                        </c:forEach>
                  </tbody>
                </table>



              </div>
              <div class="mdl-tabs__panel" id="lannisters-panel">
                  
                  
                <h4 class="titulo-configuracion">Agregar categoria</h4>
                <form method="post" action="AddCategoria">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input name="nombre" class="mdl-textfield__input" type="text" id="sample3">
                    <label class="mdl-textfield__label" for="sample3">Nombre</label>
                  </div>
                  <br>
                  <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Agregar categoria
                  </button>

                </form>

                <table class="mdl-data-table mdl-js-data-table">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Categoría</th>
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
                  
                  
                  
                  
                  
                  
                  
                  
                  
              </div>
              <div class="mdl-tabs__panel" id="targaryens-panel">
                  
                   
                  
                <h4 class="titulo-configuracion">Agregar marca</h4>
                  
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in metus euismod, luctus sem ut, finibus eros. Vivamus at urna eget urna interdum vehicula. Etiam ullamcorper sem et neque semper, quis vestibulum metus feugiat.</p>
                

                <form method="post" action="AddMarca">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input name="nombre" class="mdl-textfield__input" type="text" id="sample3">
                    <label class="mdl-textfield__label" for="sample3">Nombre</label>
                  </div>
                  <br>
                  <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Agregar marca
                  </button>

                </form>

                <table class="mdl-data-table mdl-js-data-table">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Marca</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="v" items="${listaMarca}">
                            <tr>
                                <td>${v.idmar}</td>
                                <td>${v.nombre}</td>                                                                            
                            </tr>
                        </c:forEach>
                  </tbody>
                </table>
                
                
              </div>
            </div>
          </div> 
        </div>


      </div>
    </main>
  </div>


</body>
</html>