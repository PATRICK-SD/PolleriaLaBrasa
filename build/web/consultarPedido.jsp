<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 19/11/2021, 07:15:10 PM
    Author     : Patrick
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.detallePedido"%>
<%@page import="Entidades.pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<pedido> ListaPe = (List<pedido>) request.getAttribute("ListaPe");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Pedido</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f9f9f9;
            }


            .content {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 20px auto;
                width: 100%;
            }
            .container {
                width: 80%;
                max-width: 1000px;
                padding: 20px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                padding: 12px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: black; /* Fondo negro para los encabezados */
                color: white; /* Letras blancas para los encabezados */
            }
            td {
                color: black;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            h2 {
                text-align: center;
            }
        </style>

    </head>
    <body>
        <%@include file="menu.jsp" %>
        <br>
        <br>
        <div class="content">
            <div class="container">
                <table border="1">
                    <c:forEach var="campo" items="${ListaPe}">
                        <h2>INFORMACION DE ${campo.id_Pedido} </h2>
                        <tr>
                            <td>Id Pedido</td>
                            <td>${campo.id_Pedido}</td>
                        </tr>
                        <tr>
                            <td>Id Cliente</td>
                            <td>${campo.id_Cliente}</td>
                        </tr>   
                        <tr>
                            <td>Fecha</td>
                            <td>${campo.fecha}</td>
                        </tr>        
                        <tr>
                            <td>Subtotal</td>
                            <td>${campo.subTotal}</td>
                        </tr>  
                        <tr>
                            <td>Total Venta</td>
                            <td>${campo.totalVenta}</td>
                        </tr>                 
                        <tr>                
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>