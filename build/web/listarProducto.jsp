
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<producto> ListaP = (List<producto>) request.getAttribute("ListaP");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
        
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="content">
            <div class="container mt-6" style="margin-left: 0px;margin-right: 0px;">
                <div class="table-container">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h1>Listado de Productos</h1>
                        <a class="btn btn-primary" href="ControlerProducto?Op=NuevoProducto">Crear Producto</a>
                    </div>
                    <table class="table table-hover" style="width:100%; border: 1px solid #ddd;" >
                        <thead class="table-dark">  
                            <tr>
                                <th>Id Producto</th>
                                <th>Descripcion</th>
                                <th>Costo</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th colspan="3">Acciones</th>
                            </tr>
                        </thead>    
                        <c:forEach var="campo" items="${ListaP}">
                            <tbody>
                                <tr>
                                    <td>${campo.id}</td>
                                    <td>${campo.descripcion}</td>
                                    <td>${campo.costo}</td>
                                    <td>${campo.precio}</td>
                                    <td>${campo.cantidad}</td>
                                    <td><a class="btn btn-info btn-sm" href="ControlerProducto?Op=Consultar&Id=${campo.id}">Consultar</a>
                                    <td><a class="btn btn-warning btn-sm" href="ControlerProducto?Op=Modificar&Id=${campo.id}">Modificar</a></td>
                                    <td><a class="btn btn-danger btn-sm" href="ControlerProducto?Op=Eliminar&Id=${campo.id}">Eliminar</a></td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table> 
                </div>
            </div>
        </div>
    </body>
</html>
