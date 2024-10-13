
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nuevo Producto</title>
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
                <h1 class="mb-4">Nuevo Producto</h1>
                <form action="ControlerProducto" method="post">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th>Id Producto</th>
                                <td><input type="hidden" name="Id"></td>
                            </tr>
                            <tr>
                                <th>Descripcion</th>
                                <td><input type="text" class="form-control" name="descripcion"></td>
                            </tr>
                            <tr>
                                <th>Costo</th>
                                <td><input type="text" class="form-control" name="costo"></td>
                            </tr>     
                            <tr>
                                <th>Precio</th>
                                <td><input type="text" class="form-control" name="precio"></td>
                            </tr>        
                            <tr>
                                <th>Cantidad</th>
                                <td><input type="text" class="form-control" name="cantidad"></td>
                            </tr>                 
                        </table>
                    </div>
                    <button type="submit" class="btn btn-primary">Grabar</button>
                </form>
            </div>
            </div>
        </div>
    </body>
</html>

