<%-- 
    Document   : Autos
    Created on : 2 may. 2023, 10:24:56
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <center>
        <h2>REGISTRO DE AUTOS</h2>
        <hr>
    </center>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    
                    <form action="ControladorLogin?menu=Usuarios" method="POST">
                        <div class="form-group">
                            <label>Matricula:</label>
                            <input type="text" value="${Api.getNombres()}${personal.getNombres()}"  name="txtNombres" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Marca:</label>
                            <select class="form-control" name="txtDestino">
                                <option value="Seleccionar">Seleccionar</option>
                                <c:forEach var="tipo" items="${listaTipo}">
                                    <option value="${tipo.getId()}">${tipo.getTipoEmpleado()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Modelo:</label>
                            <select class="form-control" name="txtDestino">
                                <option value="Seleccionar">Seleccionar</option>
                                <c:forEach var="tipo" items="${listaTipo}">
                                    <option value="${tipo.getId()}">${tipo.getTipoEmpleado()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Generación:</label>
                            <input type="text" value="${Api.getNombres()}${personal.getNombres()}"  name="txtNombres" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Empresa:</label>
                            <select class="form-control" name="txtDestino">
                                <option value="Seleccionar">Seleccionar</option>
                                <c:forEach var="tipo" items="${listaTipo}">
                                    <option value="${tipo.getId()}">${tipo.getTipoEmpleado()}</option>
                                </c:forEach>
                            </select>
                        </div>
                            <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                            <input type="submit" name="accion" value="Cancelar" class="btn btn-warning">
                        </center>
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Matricula</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Genración</th>
                            <th>Empresa</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                        <tbody>
                            <c:forEach var="per" items="${Personal}">
                                <tr>
                                    <td>XNV123</td>
                                    <td>Toyota</td>
                                    <td>Hilux</td>
                                    <td>2023</td>
                                    <td>Elhidaja</td>
                                    <td>
                                        <a href="ControladorLogin?menu=Usuarios&accion=Editar&id=${per.getId()}"><img src="images/edit.png" alt="28" width="28"/></a>                                        
                                        <a href="ControladorLogin?menu=Usuarios&accion=Eliminar&id=${per.getId()}"><img src="images/remove.png" alt="28" width="28"/></a>
                                    </td>
                                    <th></th>
                                </tr>
                            </c:forEach>
                        </tbody>
                </table>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    </body>
</html>

