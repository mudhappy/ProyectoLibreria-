package servlets;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.SenorSmService;

import model.CategoriaBean;
import dao.CategoriaDao;
import dao.MarcaDao;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import model.MarcaBean;


@WebServlet({"/AddProducto","/AddCategoria","/AddMarca","/Usuario","/Main"})
public class SenorSmController extends HttpServlet {
  private SenorSmService es;

  @Override
  public void init() throws ServletException {
    es = new SenorSmService();
  }

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String path = request.getServletPath();
    if (path.equals("/AddProducto")) {
      addProducto(request, response);
    }else if (path.equals("/AddCategoria")){
        addCategoria(request, response);
    }else if (path.equals("/AddMarca")){
        addMarca(request,response);
    }else if (path.equals("/Usuario")){
        Usuario(request,response);
    }else if (path.equals("/Main")){
        Listado(request,response);
    }
    
  }

  
  private void addProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      // Datos
      int idcat=Integer.parseInt(request.getParameter("idcat"));
      int idcar=Integer.parseInt(request.getParameter("idmar"));
      String nombre = request.getParameter("nombre");
      Double precio = Double.parseDouble(request.getParameter("precio"));
      int stock = Integer.parseInt(request.getParameter("stock"));
      // Proceso
      es.addProducto(idcat, idcar, nombre, precio, stock);
      // Salida
      request.setAttribute("msg", "Proceso ok.");
    } catch (Exception e) {
      request.setAttribute("error", e.getMessage());
    }

    // Forward
    RequestDispatcher rd;
    rd = request.getRequestDispatcher("articulo.jsp");
    rd.forward(request, response);
  }

    private void addCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
      // Datos
      String nombre = request.getParameter("nombre");
      // Proceso
      es.addCategoria(nombre);
      // Salida
      request.setAttribute("msg", "Proceso ok.");
    } catch (Exception e) {
      request.setAttribute("error", e.getMessage());
    }

    // Forward
    RequestDispatcher rd;
    rd = request.getRequestDispatcher("articulo.jsp");
    rd.forward(request, response);
    }

    private void addMarca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       try {
      // Datos
      String nombre = request.getParameter("nombre");
      // Proceso
      es.addMarca(nombre);
      // Salida
      request.setAttribute("msg", "Proceso ok.");
    } catch (Exception e) {
      request.setAttribute("error", e.getMessage());
    }

    // Forward
    RequestDispatcher rd;
    rd = request.getRequestDispatcher("articulo.jsp");
    rd.forward(request, response);
    }
    
    private void Listado(HttpServletRequest request, HttpServletResponse response){
       try {
            CategoriaDao tcDao = new CategoriaDao();
            List<CategoriaBean> listaCategoria = new ArrayList<CategoriaBean>();
            listaCategoria = tcDao.listar();
            request.setAttribute("listaCategoria", listaCategoria);
            
            
             MarcaDao LMarca = new MarcaDao();
            List<MarcaBean> listaMarca = new ArrayList<MarcaBean>();
            listaMarca = LMarca.listar();
            request.setAttribute("listaMarca", listaMarca);
            
            
            request.getRequestDispatcher("articulo.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }
    }

   public void Usuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String sLogin = request.getParameter("txtLogin");
            String sPassword = request.getParameter("txt-password");
            if(sLogin==null){
                sLogin=session.getAttribute("login").toString();                
            }
            if(sPassword==null){
                sPassword=session.getAttribute("password").toString();                
            }
            
            if (sLogin.equals("admin") && sPassword.equals("123")) {
                session.setAttribute("login", sLogin);
                session.setAttribute("password", sPassword);            
                  
                Listado(request, response);
                
            } else {
               
            }

        }
    }
       

   }


