package web;

import data.LibreriaDAO;
import entity.Libros;
import java.awt.Desktop;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servletControlador")
public class ServletControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String accion = req.getParameter("accion");

        if (accion != null) {
            System.out.println(accion + " esto es lo que vino doget");
            switch (accion) {
                case "editar":
                    editarLibro(req,res);
                    
                    break;
                    
                    case "alquilar":
                       int copias = Integer.parseInt(req.getParameter("copias"));
                       System.out.println(copias);
                       if (copias == 0) {
                       accionDefault(req, res);
                       break;
                       }
                    
                    alquilarLibro(req,res);
                    break;
                    
                    case "devolver":
                        int copiasafu = Integer.parseInt(req.getParameter("copiasafu"));
                       System.out.println(copiasafu);
                       if (copiasafu == 0) {
                       accionDefault(req, res);
                       break;
                       }
                                     
                    devolverLibro(req,res);
                    break;
                    
                    
                case "eliminar":
                    
                    eliminarLibro(req,res);
                    break;
                case "retirar":
                    
                    alquilarLibro1(req,res);
                    break;
                case "retornar":
                    devolverLibro1(req, res);
                    break;     
                    
                default:
                    
                    accionDefault(req, res);
                    break;
            }
        } else {
            
            accionDefault(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if (accion != null) {
            System.out.println(accion + " esto es lo que vino dopost");
            switch (accion) {
                case "insertar":
                    guardarLibro(req, res);
                    break;
                case "retirar":
                    alquilarLibro1(req, res);
                    
                    break;
                case "retornar":
                    devolverLibro1(req, res);
                    break;    
                case "modificar":
                    modificarLibro(req,res);
                    break;
                default:
                    accionDefault(req, res);
                    break;

            }
        }
    }

    private void accionDefault(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Libros> libros = new LibreriaDAO().findAll();
        HttpSession sesion = req.getSession();
        sesion.setAttribute("pepe", libros);
        sesion.setAttribute("cantidadLibros", calcularCant(libros));
        sesion.setAttribute("precioTotal", calcularPrecio(libros));
        sesion.setAttribute("cantidadLibrosalq", calcularCantalq(libros));
        //req.getRequestDispatcher("libros.jsp").forward(req, res);
        res.sendRedirect("libros.jsp");
    }

    private void guardarLibro(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String nombre = req.getParameter("nombre");
        String autor = req.getParameter("autor");
        int cantPaginas = Integer.parseInt(req.getParameter("cantPaginas"));
        double precio = Double.parseDouble(req.getParameter("precio"));
        int copias = Integer.parseInt(req.getParameter("copias"));
        int copiasafu = Integer.parseInt(req.getParameter("copiasafu"));
        

        Libros libro = new Libros(nombre, autor, cantPaginas, precio, copias,copiasafu);
        int regMod = new LibreriaDAO().create(libro);
        System.out.println("Insertados: " + regMod);
        accionDefault(req, res);
    }
    
    private void editarLibro(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));
        Libros lib = new LibreriaDAO().findBookById(idLibro);
        req.setAttribute("libro", lib);
        req.getRequestDispatcher("/WEB-INF/paginas/operaciones/editarLibro.jsp").forward(req, res);
    }
    
    private void alquilarLibro(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));
        Libros lib = new LibreriaDAO().findBookById(idLibro);
        req.setAttribute("libro", lib);
        req.getRequestDispatcher("/WEB-INF/paginas/operaciones/alquilar.jsp").forward(req, res);
    }
    private void devolverLibro(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));
        Libros lib = new LibreriaDAO().findBookById(idLibro);
        req.setAttribute("libro", lib);
        req.getRequestDispatcher("/WEB-INF/paginas/operaciones/devolver.jsp").forward(req, res);
    }
    
    private void modificarLibro(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String autor = req.getParameter("autor");
        int cantPaginas = Integer.parseInt(req.getParameter("cantPaginas"));
        double precio = Double.parseDouble(req.getParameter("precio"));
        int copias = Integer.parseInt(req.getParameter("copias"));
        int copiasafu = Integer.parseInt(req.getParameter("copiasafu"));
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));

        Libros lib = new Libros(idLibro, nombre, autor, cantPaginas, precio, copias, copiasafu);

        int regMod = new LibreriaDAO().update(lib);

        System.out.println("SE ACTUALIZARON: " + regMod + " REGISTROS"+ lib );
        System.out.println(copias);
        accionDefault(req, res);
    }
    private void alquilarLibro1(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String autor = req.getParameter("autor");
        int cantPaginas = Integer.parseInt(req.getParameter("cantPaginas"));
        double precio = Double.parseDouble(req.getParameter("precio"));
        int copias = Integer.parseInt(req.getParameter("copias"))-1;
        
        int copiasafu = Integer.parseInt(req.getParameter("copiasafu"))+1;
        
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));

        Libros lib = new Libros(idLibro, nombre, autor, cantPaginas, precio, copias, copiasafu);

        int regMod = new LibreriaDAO().update(lib);

        System.out.println(copias + copiasafu );

        accionDefault(req, res);
    }
     private void devolverLibro1(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String autor = req.getParameter("autor");
        int cantPaginas = Integer.parseInt(req.getParameter("cantPaginas"));
        double precio = Double.parseDouble(req.getParameter("precio"));
        int copias = Integer.parseInt(req.getParameter("copias"))+1;
        
        int copiasafu = Integer.parseInt(req.getParameter("copiasafu"))-1;
        
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));

        Libros lib = new Libros(idLibro, nombre, autor, cantPaginas, precio, copias, copiasafu);

        int regMod = new LibreriaDAO().update(lib);

        System.out.println(copias + copiasafu );

        accionDefault(req, res);
    }
    private void eliminarLibro(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));
        
        int regDel = new LibreriaDAO().delete(idLibro);
        
        System.out.println("REGISTROS ELIMINADOS: "+ regDel);
        
        accionDefault(req, res);
    }
    
    

    private int calcularCant(List<Libros> lista) {
        int cantidad = 0;
        for (int i = 0; i < lista.size(); i++) {
            cantidad += lista.get(i).getCopias();
        }
        return cantidad;
    }

    private double calcularPrecio(List<Libros> lista) {
        double precio = 0;
        for (int i = 0; i < lista.size(); i++) {
            precio += (lista.get(i).getCopias() * lista.get(i).getPrecio());
        }
        return precio;
    }
private int calcularCantalq(List<Libros> lista) {
        int cantidadalq = 0;
        for (int i = 0; i < lista.size(); i++) {
            cantidadalq += lista.get(i).getCopiasafu();
        }
        return cantidadalq;
    }
    
    
    
}
