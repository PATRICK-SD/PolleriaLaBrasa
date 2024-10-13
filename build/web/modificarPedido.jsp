<%-- 
    Document   : modificarCliente
    Created on : 11 oct. 2024, 16:32:25
    Author     : PATRICK
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<pedido> ListaPe = (List<pedido>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modifica Clientes</title>
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
                    <form action="ControlerPedido" method="post">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <c:forEach var="pedido" items="${ListaPe}">
                                <h2>EDITAR DATOS DEL PEDIDO ${pedido.id_Pedido}</h2>
                                    <tbody>
                                        <tr>
                                            <th>Id Pedido</th>
                                            <td>${pedido.id_Pedido}</td>
                                    <input type="hidden" name="Id_Pedido" value="${pedido.id_Pedido}">
                                    </tr>
                                    <tr>
                                        <th>Id Cliente</th>
                                        <td><input type="text" class="form-control" name="Id_Cliente" value="${pedido.id_Cliente}"></td>
                                    </tr>
                                    <tr>
                                        <th>Fecha</th>
                                        <td><input type="text" class="form-control" name="Fecha" value="${pedido.fecha}"></td>
                                    </tr>     
                                    <tr>
                                        <th>SubTotal</th>
                                        <td><input type="text" class="form-control" name="SubTotal" value="${pedido.subTotal}"></td>
                                    </tr>        
                                    <tr>
                                        <th>Total Venta</th>
                                        <td><input type="text" class="form-control" name="TotalVenta" value="${pedido.totalVenta}"></td>
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


