
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<pedido> ListaPe = (List<pedido>) request.getAttribute("ListaPe");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="content">
            <div class="container mt-6" style="margin-left: 0px;margin-right: 0px;">
                <div class="table-container">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h1>Listado de Pedido</h1>
                        <form action="ControlerPedidoN?menu=NuevaVenta" method="POST">
                            <a class="btn btn-primary" href="nuevoPedido.jsp">Crear Pedido</a>
                        </form>
                    </div>
                    <table class="table table-hover" style="width:100%" >
                        <thead class="table-dark">  
                            <tr>
                                <th>Id Pedido</th>
                                <th>Id Cliente</th>
                                <th>Fecha</th>
                                <th>Subtotal</th>
                                <th>Total de Venta</th>
                                <th colspan="3">Acciones</th>
                            </tr>
                        </thead>    
                        <c:forEach var="campo" items="${ListaPe}">
                            <tbody>
                                <tr>
                                    <td>${campo.id_Pedido}</td>
                                    <td>${campo.id_Cliente}</td>
                                    <td>${campo.fecha}</td>
                                    <td>${campo.subTotal}</td>
                                    <td>${campo.totalVenta}</td>
                                    <td><a class="btn btn-info btn-sm" href="ControlerPedido?Op=Consultar&Id_Pedido=${campo.id_Pedido}">Consultar</a>
                                    <td><a class="btn btn-warning btn-sm" href="ControlerPedido?Op=Modificar&Id_Pedido=${campo.id_Pedido}">Modificar</a>
                                    <td><a class="btn btn-danger btn-sm" href="ControlerPedido?Op=Eliminar&Id_Pedido=${campo.id_Pedido}">Eliminar</a>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table> 
                </div>
            </div>
        </div>
    </body>
</html>
