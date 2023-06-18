<%-- 
    Document   : Principals
    Created on : 8 may. 2023, 22:54:29
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELHIDAJA</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="Vista/Principal/estilos.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
  </head>
  <body>
    <nav class="sidebar">
        <img src="images/logo-elhidaja.png" class="imgRedonda"/>
      <a href="#" class="logo">
          Elhidaja
      </a>
        <hr/>
        <br>
      <div class="menu-content">
        <ul class="menu-items">
          <li class="item">
            <a href="#" target="myFrame">
                <img src="Iconos/home.png" alt=""/>
                Inicio
            </a>
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>
                  <img src="Iconos/account-service.png" alt=""/>
                  Mantenedores
              </span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>
            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Mantenedores
              </div>
              <li class="item">
                <a href="ControladorEmpresas?menu=Empresas&accion=Listar" target="myFrame">
                    <img src="Iconos/building-fill.png" alt=""/>
                    Empresas
                </a>
              </li>
              <li class="item">
                <a href="ControladorEmpleado?menu=Empleado&accion=Listar" target="myFrame">
                    <img src="Iconos/users-three-fill.png" alt=""/>
                    Empleados
                </a>
              </li>
              <li class="item">
                <a href="ControladorLogin?menu=Usuarios&accion=Listar" target="myFrame">
                    <img src="Iconos/user-circle.png" alt=""/>
                    Usuarios
                </a>
              </li>
              <li class="item">
                <a href="ControladorLogin?menu=Autos&accion=Listar" target="myFrame">
                      <img src="Iconos/truck-minus.png" alt=""/>
                      Autos
                </a>
              </li>
              <li class="item">
                <a href="#" target="myFrame">
                    <img src="Iconos/shipping-box-02.png" alt=""/>
                    Materiales
                </a>
              </li>
            </ul>
          </li>
          <li class="item">
            <a href="#" target="myFrame">
                <img src="Iconos/store-edit.png" alt=""/>
                Compras
            </a>
          </li>
          <li class="item">
            <a href="ControladorLogin?menu=Actividades&accion=Listar" target="myFrame">
                <img src="Iconos/round-shopping-basket.png" alt=""/>
                Actividades
            </a>
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>
                  <img src="Iconos/reports.png" alt=""/>
                  Reportes
              </span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>
            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Reportes
              </div>
              <li class="item">
                <a href="#" target="myFrame">
                    <img src="Iconos/reports.png" alt=""/>
                    Kardex
                </a>
              </li>
              <li class="item">
                <a href="#" target="myFrame">
                    <img src="Iconos/tasks-app-24-filled.png" alt=""/>
                    R. Actividades
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
    <nav class="navbar">
      <div class="container-fluid">
            <div class="navbar-right">
              <div class="dropdown">
                <button style="border: none" class="btn" 
                        type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  ${Usuario.getNombres()}
                </button>
                <center>
                <div class="Logueo" aria-labelledby="dropdownMenuButton">
                    <a href="#">
                        <img src="images/usuario.png" alt="60" width="60"/>
                    </a>
                  <a  href="#">Usuario</a>
                  <input type="hidden" value="${Usuario.getId()}" name="txtPersonalLogeado">
                  <a  href="#">${Usuario.getUsuario()}</a>
                  <form action="Validar" method="POST">
                      <button class="botonsalir" name="accion" value="Salir" href="Vistas/Login/Login.jsp">Cerrar Sesión</button>
                  </form>
                </div>
                </center>
              </div>
            </div>
        </div>
      <i class="fa-solid fa-bars" id="sidebar-close"></i>
    </nav>
    <div class="mensaje">
    </div>
    <main class="main">
      <iframe
        name="myFrame"
        style="height: 100%; width: 100%; border: none">
      </iframe>
    </main>
      <script src="Vista/Principal/script.js" type="text/javascript"></script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <% String mensaje = (String) request.getAttribute("mensaje"); %>
        <% if (mensaje != null && mensaje.equals("error") && !mensaje.isEmpty()) { %>
          <script>
            swal({
              title: "Credenciales incorrectas",
              text: "Verifica Usuario y Contraseña",
              icon: "error",
            });
          </script>
        <% } else if (mensaje != null) { %>
          <script>
            swal({
            title: '<%= mensaje %>',
            text: "Mensaje de Bienvenida",
            icon: "images/iconmensaje.gif",
            button: "OK",
            }).then((value) => {
              if (value) {
                // Aquí puedes redirigir a otra página o realizar alguna acción adicional
              }
            });
          </script>
        <% } %>
  </body>
</html>
