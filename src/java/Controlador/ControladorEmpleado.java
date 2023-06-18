/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ApiReniecSunat;
import Modelo.Empleados;
import Modelo.Empresas;
import Modelo.TipoEmpleado;
import ModeloDao.ApiDNIRUC;
import ModeloDao.EmpleadosDao;
import ModeloDao.EmpresasDao;
import ModeloDao.TipoEmpleadoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 *
 * @author Claudio Cruzado
 */
public class ControladorEmpleado extends HttpServlet {

    
    ApiDNIRUC apiD = new ApiDNIRUC();
    TipoEmpleado tipo = new TipoEmpleado();
    TipoEmpleadoDao tipoDao = new TipoEmpleadoDao();
    Empresas empresas = new Empresas();
    EmpresasDao empresasDao = new EmpresasDao();
    Empleados empleado = new Empleados();
    EmpleadosDao empleadoDao = new EmpleadosDao();
            
    int id;
    String BuscarDNI;
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
            String menu = request.getParameter("menu");
            String accion = request.getParameter("accion");
            if(menu.equals("Empleado")){
                switch(accion){
                    case "Listar":
                        List listaEmpelado = empleadoDao.listar();
                        request.setAttribute("listaEmpelados", listaEmpelado);
                        List listaTipo= tipoDao.listar();
                        request.setAttribute("listaTipo", listaTipo);
                        List lista = empresasDao.listar();
                        request.setAttribute("listaEmpresas", lista);
                    break;
                    case "Buscar":
                        BuscarDNI = request.getParameter("txtBuscarRuc");
                        ApiReniecSunat api = apiD.ConsultarRUC(BuscarDNI);
                        request.setAttribute("Api", api);
                        request.getRequestDispatcher("ControladorEmpleado?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                    case "Agregar":
                        String Nombres  = request.getParameter("txtNombres");
                        String Apellidos  = request.getParameter("txtApellidos");
                        String TipoEmpleado  = request.getParameter("txtTipoEmpelado");
                        String Empresa  = request.getParameter("txtEmpresa");
                        String TipoDoc  = request.getParameter("txtTipoDoc");
                        String NumeroDoc  = request.getParameter("txtDni");
                        String Telefono  = request.getParameter("txtTelefono");
                        String Correo  = request.getParameter("txtCorreo");
                        String Direccion  = request.getParameter("txtDireccion");
                        String tipoLicencia = "Ninguna";
                        String numeroLicencia = "123456789";
                        empleado.setNombres(Nombres);
                        empleado.setApellidos(Apellidos);
                        empleado.setIdTipoEmpleado(Integer.parseInt(TipoEmpleado));
                        empleado.setIdEmpresaTerciaria(Integer.parseInt(Empresa));
                        empleado.setTipoDocumento(TipoDoc);
                        empleado.setNumeroDocumento(NumeroDoc);
                        empleado.setTelefono(Telefono);
                        empleado.setCorreo(Correo);
                        empleado.setDireccion(Direccion);
                        empleado.setTipoLicencia(tipoLicencia);
                        empleado.setNumeroLicencia(numeroLicencia);
                        empleadoDao.Registrar(empleado);
                        request.getRequestDispatcher("ControladorEmpleado?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                    case "Editar":                        
                    break;
                    case "Actualizar":
                    break;
                    case "Eliminar":
                    break;
                    case "Cancelar":
                    break;
                }
                request.getRequestDispatcher("Vista/Mantenedores/Empleado/JSP/Empleados.jsp").forward(request, response);
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
        processRequest(request, response);
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
