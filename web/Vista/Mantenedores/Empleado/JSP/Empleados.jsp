<%-- 
    Document   : Empresas
    Created on : 26 abr. 2023, 17:12:02
    Author     : CLAUDIO CRUZADO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"href="https://unicons.iconscout.com/release/v4.0.8/css/line.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empleado/CSS/General.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empleado/CSS/BotonModal.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empleado/CSS/Exportar.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empleado/CSS/VentanaModal.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empleado/CSS/FormularioBuscarRuc.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empleado/CSS/FormularioRegistrar.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empleado/CSS/Tabla.css">
        
    </head>
    <body>
        
        <!-- HEAD REGISTRO EMPRESAS Y BOTON NUEVO -->
        <div class="grupo-header-empresa">
            <div class="dato-titulo-empresa">
                <h1 class="Titulo">REGISTRO DE EMPLEADOS</h1>
            </div>
                
            <div class="btn-nueva-empresa">
                <button class="BotonModal" id="AbrirModal"> <span>Nuevo</span><i class="icono uil-plus"></i></button>
                <button id="openModals" hidden="">Nuevo</button>
            </div>
        </div>
    
        <!-- HEAD REGISTRO Y FILTROS DE LA TABLA -->
    
        <div class="Exportar">
            <div class="grupo-btns">
                <button class="btn-exportar Exportar-1">Exportar PDF<i class="icono uil-file-export"></i></button>
                <button class="btn-exportar Exportar-2">Exportar excel<i class="icono uil-file-download"></i></button>
            </div>
            
            <div class="Buscar">
                <form class="Buscar-Empresa" action="" method="POST">
                    <input type="text" name="txtBuscarRazonSocial" placeholder="Ingresar Razon social">
                    <input type="submit" name="accion" value="Buscar">
                </form>
            </div>
        </div>
    
    <!-- PANTALLA MODAL -->
    
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span> 
            <form class="ConsultarRuc" action="ControladorLogin?menu=Empleado" method="POST">
                <input type="text" name="txtBuscarDNI" placeholder="Ingresar DNI">
                <input type="submit" name="accion" value="Buscar" id="buscarBtnModal">
            </form>
    <div class="ContenerdorFormularioRegistro">
        <form class="FormularioRegistro" action="ControladorLogin?menu=Empleado" method="POST">                        
            <div class="Grupos">
                <label>Tipo de Documento:</label>
                <select name="txtTipoDoc">
                    <option value="0"></option>
                    <option value="DNI">DNI</option>
                    <option value="Carnet">Carnet de Extrangeria</option>
                </select>
            </div>
            <div class="Grupos">
                <label>Numero de Documento:</label>
                <input type="text" value="${Api.getDni()}" name="txtDni">
            </div>
            <div class="Grupos">
                <label>Nombres:</label>
                <input type="text" value="${Api.getNombresP()}" name="txtNombres">
            </div>
            <div class="Grupos">
                <label>Apellidos:</label>
                <input type="text" value="${Api.getApellidoP()}" name="txtApellidos">
            </div>
            <div class="Grupos">
                <label>Tipo de Empleado:</label>
                <select name="txtTipoEmpelado">
                    <option value="0"></option>
                    <c:forEach var="tip" items="${listaTipo}">
                        <option value="${tip.getId()}">${tip.getTipoEmpleado()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="Grupos">
                <label>Empresa:</label>
                <select name="txtEmpresa">
                    <option value="0"></option>
                    <c:forEach var="empr" items="${listaEmpresas}">
                        <option value="${empr.getId()}">${empr.getRazonSocial()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="Grupos">
                <label>Telefono:</label>
                <input type="text" name="txtTelefono">
            </div>
            <div class="Grupos">
                <label>Correo:</label>
                <input type="text" name="txtCorreo">
            </div>
            <div class="Grupos">
                <label>Dirección:</label>
                <input type="text" name="txtDireccion">
            </div>
            <center>
            <div class="Botones">
                <input type="submit" name="accion" value="Agregar" id="agregarBtn">
                <input type="submit" name="accion" value="Actualizar" id="actualizarBtn">
            </div>
            </center>
        </form>
    </div>
    </div>
    </div>
            
     <!-- TABLA LISTADO DE DATOS -->
    <div class="Contenedor">
        <div class="Contenedor-Tabla">
            <div class="Tabla-Contenedor">
                <table>
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="empresa" items="${listaEmpelados}">
                        <tr>
                            <td>${empresa.getId()}</td>
                            <td>${empresa.getNombres()}</td>
                            <td>${empresa.getApellidos()}</td>
                            <td>
                                <a href="ControladorLogin?menu=Empresas&accion=Editar&id=${empresa.getId()}" class="btn-acciones btn-editar" id="abrir-modal">
                                    <i class="uil uil-pen"></i>
                                </a>
                                <a href="ControladorLogin?menu=Empresas&accion=Eliminar&id=${empresa.getId()}" class="btn-acciones btn-eliminar" id="aliminar">
                                    <i class="uil uil-trash"></i>
                                </a>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
     
    <div class="Contenedor-2">
        <div class="table-scroll">
            <c:forEach var="empresa" items="${listaEmpelados}">
            <div class="target">

                <div class="lista-datos-empresas">
                    <span>${empresa.getId()}</span>
                    <span>${empresa.getNombres()}</span>
                </div>

                <div class="btns-opciones-listado">
                    <a class="Detalle" href="ControladorLogin?menu=Empresas&accion=Editar&id=${empresa.getId()}">
                            <i class="icono uil-pen"></i>
                    </a>
                    <a class="Detalle" href="ControladorLogin?menu=Empresas&accion=Editar&id=${empresa.getId()}">
                            <i class="uil uil-trash"></i>
                    </a>
                    <a class="Detalle" href="ControladorLogin?menu=Empresas&accion=Editar&id=${empresa.getId()}">
                            <i class="uil uil-eye"></i>
                    </a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
     
    
    <script src="Vista/Mantenedores/Empleado/JS/Empleados.js" type="text/javascript"></script>
    </body>
</html>
