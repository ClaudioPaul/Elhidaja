/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Login;
import ModeloDao.LoginDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Claudio Cruzado
 */
public class Validar extends HttpServlet {

    Login lo = new Login();
    LoginDao loDao = new LoginDao();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Validar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Validar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if(accion.equalsIgnoreCase("INGRESAR")){
            try {
                String usuario = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");
                lo.setUsuario(usuario);
                lo.setContra(contra);
                List<Login> lista = loDao.listar(lo);
                String nombre = null;
                if(lista.size()>=1){
                    Iterator<Login>iter=lista.iterator();
                    Login tem = null;
                    while(iter.hasNext()){
                        tem=iter.next();
                        nombre = tem.getNombres();
                        request.setAttribute("Usuario", tem);
                    }
                    request.setAttribute("mensaje", "Bienvenido "+nombre);
                    request.getRequestDispatcher("ControladorPrincipal?menu=Principal").forward(request, response);
                }else{
                    request.setAttribute("mensaje", "error");
                    request.getRequestDispatcher("Vista/Login/login.jsp").forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Validar.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else{
            request.getRequestDispatcher("Vista/Login/login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
