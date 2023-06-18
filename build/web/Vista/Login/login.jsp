<%-- 
    Document   : index
    Created on : 24 abr. 2023, 14:57:00
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<title>HELIDAJA S.A.C</title>
	<link rel="stylesheet" type="text/css" href="Vista/Login/estilos.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.cdnfonts.com/css/berlin-sans-fb-demi" rel="stylesheet">
    </head>
    <body>
            <img class="wave" src="images/fondo-elhidaja-removebg-preview.png" alt=""/>
            <div class="container">
                    <div class="img">
                        <img src="images/fondo-elhidajasac.png">
                    </div>
                    <div class="login-content">
                <form action="Validar" method="POST">
                    <img src="images/logoelhidaja-removebg-preview.png">
                    <h2 class="title">BIENVENIDO</h2>
                        <div class="input-div one">
                            <div class="i">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="div">
                                <h5>Usuario</h5>
                                <input type="text" name="txtUsuario" class="input">
                            </div>
                        </div>
                        <div class="input-div pass">
                            <div class="i"> 
                                <i class="fas fa-lock"></i>
                            </div>
                            <div class="div">
                                <h5>Contraseña</h5>
                                <input type="password" name="txtContra" class="input">
                            </div>
                        </div>
                                    <br>
                    <input type="submit" class="btn" name="accion" value="INGRESAR">
                </form>
            </div>
        </div>
        <script src="Vista/Login/script.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <% String mensaje = (String) request.getAttribute("mensaje"); %>
        <% if (mensaje != null && mensaje.equals("error") && !mensaje.isEmpty()) { %>
          <script>
            swal({
              title: "Credenciales incorrectas",
              text: "Verifica Usuario y Contraseña",
              icon: "error",
              buttons: {
                confirm: {
                  className: 'btn btn-danger',
                },
              },
            });
          </script>
        <% } else if (mensaje != null) { %>
          <script>
            swal({
              title: '<%= mensaje %>',
              icon: "success",
              buttons: {
                confirm: {
                  className: 'btn btn-success',
                },
              },
            });
          </script>
        <% } %>
    </body>
</html>
