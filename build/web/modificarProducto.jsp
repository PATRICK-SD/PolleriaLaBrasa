<%-- 
    Document   : modificarCliente
    Created on : 11 oct. 2024, 16:32:25
    Author     : PATRICK
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<producto> ListaP = (List<producto>) request.getAttribute("ListaP");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar Producto</title>
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
                    <form action="ControlerProducto" method="post"><!-- Iniciar el formulario -->
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <c:forEach var="campo" items="${ListaP}">
                                <h1 class="mb-4">Modificar datos del producto ${campo.descripcion}</h1>
                                    <tbody>
                                        <tr>
                                            <th>Id Producto</th>
                                            <td>${campo.id}</td>
                                    <input type="hidden" name="Id" value="${campo.id}">
                                    </tr>
                                    <tr>
                                        <th>Descripcion</th>
                                        <td><input type="text" class="form-control" name="descripcion" value="${campo.descripcion}"></td>
                                    </tr>
                                    <tr>
                                        <th>Costo</th>
                                        <td><input type="text" class="form-control" name="costo" value="${campo.costo}"></td>
                                    </tr>     
                                    <tr>
                                        <th>Precio</th>
                                        <td><input type="text" class="form-control" name="precio" value="${campo.precio}"></td>
                                    </tr>        
                                    <tr>
                                        <th>Cantidad</th>
                                        <td><input type="text" class="form-control" name="cantidad" value="${campo.cantidad}"></td>
                                    </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                        </div>
                        <input class="btn btn-primary" type="submit" name="modificar" value="Modificar"> 
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>


