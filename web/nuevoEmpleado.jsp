
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nuevo Empleado</title>
        <style>
            .form-container {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="content">
        <div class="container mt-6" style="margin-left: 0px;margin-right: 0px;">
            <div class="form-container">
                <h1 class="mb-4">Nuevo Empleado</h1>
                <form action="ControlerEmpleado" method="post">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <td>Id Usuario</td>
                                <td><input type="hidden" name="Id"></td>
                            </tr>
                            <tr>
                                <td>Nombres</td>
                                <td><input type="text" class="form-control" name="nombres"></td>
                            </tr>
                            <tr>
                                <td>Apellidos</td>
                                <td><input type="text" class="form-control" name="apellidos"></td>
                            </tr>
                            <tr>
                                <td>DNI</td>
                                <td><input type="text" class="form-control" name="DNI"></td>
                            </tr>
                            <tr>
                            <td>Cargo</td>
                            <td>
                                <select class="form-control" name="cargo">
                                    <option value="ADMINISTRADOR">ADMINISTRADOR</option>
                                    <option value="RECURSOS HUMANOS">RECURSOS HUMANOS</option>
                                    <option value="VENDEDOR">VENDEDOR</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Dirección</td>
                            <td><input type="text" class="form-control" name="direccion"></td>
                        </tr>  
                        <tr>
                            <td>Teléfono</td>
                            <td><input type="text" class="form-control" name="telefono"></td>
                        </tr>                 
                        <tr>
                            <td>Password</td>
                            <td><input type="text" class="form-control" name="password"></td>
                        </tr>                
                        </table>
                    </div>
                    <button type="submit" class="btn btn-primary" name="modificar">Grabar</button>
                </form>
            </div>
            </div>
        </div>
    </body>
</html>

