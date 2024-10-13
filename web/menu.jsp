
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menú Lateral con Bootstrap</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <button class="toggle-btn">☰</button>
        <div class="sidebar">
            <h2 class="text-center py-4">Menú</h2>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ControlerCliente?Op=Listar"><i class="fas fa-users"></i> Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ControlerProducto?Op=ListarP"><i class="fas fa-box"></i> Producto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ControlerPedido?Op=ListarPe"><i class="fas fa-clipboard-list"></i> Pedidos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ControlerEmpleado?Op=Listar"><i class="fas fa-users"></i> Empleados</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CerrarSesion"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                </li>
            </ul>
        </div>
        <div class="collapsed-bar">
            <ul class="nav flex-column">
                <br><br><br>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ControlerCliente?Op=Listar"><i class="fas fa-users"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ControlerProducto?Op=ListarP"><i class="fas fa-box"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-clipboard-list"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CerrarSesion"><i class="fas fa-sign-out-alt"></i></a>
                </li>
            </ul>
        </div>
        <script>
            $(document).ready(function () {
                $('.toggle-btn').click(function () {
                    $('.sidebar').toggleClass('hide');
                    $('.collapsed-bar').toggleClass('show');
                    $('.content').toggleClass('expanded');
                });
            });
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

