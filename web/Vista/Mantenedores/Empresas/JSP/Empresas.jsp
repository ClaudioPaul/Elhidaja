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
        
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empresas/CSS/General.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empresas/CSS/BotonModal.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empresas/CSS/Exportar.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empresas/CSS/VentanaModal.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empresas/CSS/FormularioBuscarRuc.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empresas/CSS/FormularioRegistrar.css">
        <link rel="stylesheet" type="text/css" href="Vista/Mantenedores/Empresas/CSS/Tabla.css">
        
    </head>
    <body>
        
        <!-- HEAD REGISTRO EMPRESAS Y BOTON NUEVO -->
        <div class="grupo-header-empresa">
            <div class="dato-titulo-empresa">
                <h1 class="Titulo">REGISTRO DE EMPRESAS</h1>
            </div>
                
            <div class="btn-nueva-empresa">
                <button class="BotonModal" id="AbrirModal"> <span>Nuevo</span><i class="icono uil-plus"></i></button>
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
            <form class="ConsultarRuc" action="ControladorEmpresas?menu=Empresas" method="POST">
                <input type="text" name="txtBuscarRuc" placeholder="Ingresar RUC">
                <input type="submit" name="accion" value="Buscar" id="buscarBtnModal">
            </form>
    <div class="ContenerdorFormularioRegistro">
        <form class="FormularioRegistro" action="ControladorEmpresas?menu=Empresas" method="POST">                        
            <div class="Grupos">
                <label>Ruc:</label>
                <input type="text" value="${Api.getRuc()}${listaEmpresa.getRuc()}" name="txtRuc" required disabled>
            </div>
            <div class="Grupos">
                <label>Razón Social:</label>
                <input type="text" value="${Api.getRasonsocial()}${listaEmpresa.getRazonSocial()}" name="txtRazonsocial"required disabled>
            </div>
            <div class="Grupos">
                <label>Dirección de la Empresa:</label>
                <input type="text" value="${Api.getDireccion()}${listaEmpresa.getDireccion()}" name="txtDireccion"required>
            </div>
            <div class="Grupos">
                <label>Nombre del Representante Legal:</label>
                <input type="text" value="${listaEmpresa.getNombreRepresentante()}" name="txtNombre"required>
            </div>
            <div class="Grupos">
                <label>Apellidos del Representante Legal:</label>
                <input type="text" value="${listaEmpresa.getApellidoRepresentante()}" name="txtApellidos"required>
            </div>
            <div class="Grupos">
                <label>Telefono:</label>
                <input type="number" value="${listaEmpresa.getTelefono()}" name="txtTelefono" required oninput="limitarDigitos(this, 9)">
            </div>
            <div class="Grupos">
                <label>Correo:</label>
                <input type="email" value="${listaEmpresa.getCorreo()}" name="txtCorreo"required>
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
                            <th>Ruc</th>
                            <th>Razón Social</th>
                            <th>Representante</th>
                            <th>Dirección</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="empresa" items="${listaEmpresas}">
                        <tr>
                            <td>${empresa.getRuc()}</td>
                            <td>${empresa.getRazonSocial()}</td>
                            <td>${empresa.getNombreRepresentante()}</td>
                            <td>${empresa.getDireccion()}</td>
                            <td>${empresa.getTelefono()}</td>
                            <td>${empresa.getCorreo()}</td>
                            <td>
                                <a id="EditarEmpresas" href="ControladorEmpresas?menu=Empresas&accion=Editar&id=${empresa.getId()}" class="btn-acciones btn-editar">
                                    <i class="uil uil-pen"></i>
                                </a>
                                <a id="EliminarEmpresas" href="ControladorEmpresas?menu=Empresas&accion=Eliminar&id=${empresa.getId()}" class="btn-acciones btn-eliminar">
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
            <c:forEach var="empresa" items="${listaEmpresas}">
            <div class="target">

                <div class="lista-datos-empresas">
                    <span>${empresa.getRuc()}</span>
                    <span>${empresa.getRazonSocial()}</span>
                </div>

                <div class="btns-opciones-listado">
                    <a class="Detalle" href="ControladorEmpresas?menu=Empresas&accion=Editar&id=${empresa.getId()}">
                            <i class="icono uil-pen"></i>
                    </a>
                    <a class="Detalle" href="ControladorEmpresas?menu=Empresas&accion=Eliminar&id=${empresa.getId()}">
                            <i class="uil uil-trash"></i>
                    </a>
                    <a class="Detalle" href="ControladorEmpresas?menu=Empresas&accion=Detalle&id=${empresa.getId()}">
                            <i class="uil uil-eye"></i>
                    </a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
    <script src="Vista/Mantenedores/Empresas/JS/Empresas.js" type="text/javascript"></script>
    </body>
</html>
