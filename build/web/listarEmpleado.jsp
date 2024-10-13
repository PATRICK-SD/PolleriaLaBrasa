
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.empleados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<empleados> Lista = (List<empleados>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="content">
            <div class="container mt-6" style="margin-left: 0px;margin-right: 0px;">
                <div class="table-container">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h1>Listado de Empleados</h1>
                        <a class="btn btn-primary" href="ControlerEmpleado?Op=Nuevo">Crear Empleado</a>
                    </div>
                    <table class="table table-hover" style="width:100%" >
                        <thead class="table-dark">  
                            <tr>
                                <th>Id Usuario</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>DNI</th>
                                <th>Cargo</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>Password</th>
                                <th colspan="3">Acciones</th>
                            </tr>
                        </thead>    
                        <c:forEach var="campo" items="${Lista}">
                            <tbody>
                                <tr>
                                    <td>${campo.id}</td>
                                    <td>${campo.nombres}</td>
                                    <td>${campo.apellidos}</td>
                                    <td>${campo.DNI}</td>
                                    <td>${campo.cargo}</td>
                                    <td>${campo.direccion}</td>
                                    <td>${campo.telefono}</td>
                                    <td>${campo.password}</td>
                                    <td><a class="btn btn-info btn-sm" href="ControlerEmpleado?Op=Consultar&Id=${campo.id}">Consultar</a></td>
                                    <td><a class="btn btn-warning btn-sm" href="ControlerEmpleado?Op=Modificar&Id=${campo.id}">Modificar</a></td>
                                    <td><a class="btn btn-danger btn-sm" href="ControlerEmpleado?Op=Eliminar&Id=${campo.id}">Eliminar</a></td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table> 
                </div>
            </div>
        </div>
    </body>
</html>
