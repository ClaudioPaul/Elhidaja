<%-- 
    Document   : RegistroActividades
    Created on : 2 may. 2023, 10:41:38
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
        <h2>REGISTRO DE ACTIVIDADES</h2>
        <hr>
        </center>
        <div class="d-flex">
            <div class="card col-sm-3">
                <div class="card-body">
                    <h5>Datos generales</h5>
                    <form action="ControladorLogin?menu=Empleado" method="POST">
                        <div class="form-group">
                            <label>Cliente:</label>
                            <select class="form-control" name="txtDestino">
                                <option value="Seleccionar">Seleccionar</option>
                                <c:forEach var="tipo" items="${listaTipo}">
                                    <option value="${tipo.getId()}">${tipo.getTipoEmpleado()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Auto:</label>
                            <select class="form-control" name="txtDestino">
                                <option value="Seleccionar">Seleccionar</option>
                                <c:forEach var="tipo" items="${listaTipo}">
                                    <option value="${tipo.getId()}">${tipo.getTipoEmpleado()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Fecha:</label>
                            <input type="date" name="txtApellidos" class="form-control">
                        </div>
                        <center>
                            <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        </center>
                    </form>
                </div>
            </div>
            <div class="card col-sm-3">
                <div class="card-body">
                    <h5>Actividad</h5>
                    <form action="ControladorLogin?menu=Empleado" method="POST">
                        <div class="form-group">
                            <label>Cantidad:</label>
                            <input type="number"  name="txtNombres" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Descripción:</label>
                            <input type="textarea" name="txtApellidos" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Datos Extra:</label>
                            <input type="textarea" name="txtApellidos" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Precio:</label>
                            <input type="text" name="txtApellidos" class="form-control">
                        </div>
                        <center>
                            <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        </center>
                    </form>
                </div>
            </div>
            <div class="col-sm-6">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Cantidad</th>
                            <th>Descripcion</th>
                            <th>Precio</th>
                            <th>Subtotal</th>
                            <th>Aciones</th>
                        </tr>
                    </thead>
                        <tbody>
                            <c:forEach var="per" items="${Personal}">
                                <tr>
                                    <td>${per.getNombres()}</td>
                                    <td>${per.getApellidos()}</td>
                                    <td>${per.getDni()}</td>
                                    <td>${per.getCargo()}</td>
                                    <td>
                                        <a href="ControladorLogin?menu=Empleado&accion=Editar&id=${per.getId()}"><img src="images/edit.png" alt="28" width="28"/></a>                                        
                                        <a href="ControladorLogin?menu=Empleado&accion=Eliminar&id=${per.getId()}"><img src="images/remove.png" alt="28" width="28"/></a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <th></th>
                                    <th></th>
                                    <th>S/. 1000</th>
                                    <th></th>
                                </tr>
                            </c:forEach>
                        </tbody>
                </table>
            </div>
        </div>
                                    <br><!-- Tabla De Actividades -->
        <div class="col-sm-12">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>NOMBRES</th>
                            <th>APELLIDOS</th>
                            <th>DNI</th>
                            <th>CARGO</th>
                            <th>PROCENDENCIA</th>
                            <th>DIRECCIÓN</th>
                            <th>JURUDICCIÓN</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                        <tbody>
                            <c:forEach var="per" items="${Personal}">
                                <tr>
                                    <td>${per.getNombres()}</td>
                                    <td>${per.getApellidos()}</td>
                                    <td>${per.getDni()}</td>
                                    <td>${per.getCargo()}</td>
                                    <td>${per.getProcedencia()}</td>
                                    <td>${per.getDireccion()}</td>
                                    <td>${per.getJuridiccionPolicial()}</td>
                                    <td>
                                        <a href="ControladorLogin?menu=Empleado&accion=Editar&id=${per.getId()}"><img src="images/edit.png" alt="28" width="28"/></a>                                        
                                        <a href="ControladorLogin?menu=Empleado&accion=Eliminar&id=${per.getId()}"><img src="images/remove.png" alt="28" width="28"/></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    </body>
</html>
