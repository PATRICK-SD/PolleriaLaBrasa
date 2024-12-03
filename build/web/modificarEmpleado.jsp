<%-- 
    Document   : modificarCliente
    Created on : 11 oct. 2024, 16:32:25
    Author     : PATRICK
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.empleados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<empleados> Lista = (List<empleados>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modifica Empleado</title>
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
                    <form action="ControlerEmpleado" method="post">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <c:forEach var="campo" items="${Lista}">
                                    <h1 class="mb-4">Modifica datos de ${campo.nombres} ${campo.apellidos}</h1>
                                    <tbody>
                                        <tr>
                                            <th>Id Empleados</th>
                                            <td>${campo.id}</td>
                                    <input type="hidden" name="Id" value="${campo.id}">
                                    </tr>
                                    <tr>
                                        <th>Nombres</th>
                                        <td><input type="text" class="form-control" name="nombres" value="${campo.nombres}"></td>
                                    </tr>
                                    <tr>
                                        <th>Apellidos</th>
                                        <td><input type="text" class="form-control" name="apellidos" value="${campo.apellidos}"></td>
                                    </tr>     
                                    <tr>
                                        <th>DNI</th>
                                        <td><input type="text" class="form-control" name="DNI" value="${campo.DNI}"></td>
                                    </tr>
                                    <tr>
                                        <th>Cargo</th>
                                        <td><input type="text" class="form-control" name="cargo" value="${campo.cargo}"></td>
                                    </tr>
                                    <tr>
                                        <th>Dirección</th>
                                        <td><input type="text" class="form-control" name="direccion" value="${campo.direccion}"></td>
                                    </tr>  
                                    <tr>
                                        <th>Teléfono</th>
                                        <td><input type="text" class="form-control" name="telefono" value="${campo.telefono}"></td>
                                    </tr>
                                    <tr>
                                        <th>Password</th>
                                        <td><input type="text" class="form-control" name="password" value="${campo.password}"></td>
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


