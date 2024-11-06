
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<cliente> Lista = (List<cliente>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <style>
            tr:nth-child(even){
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            
            .confirm-dialog {
                display: none; /* Oculto por defecto */
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: white;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                z-index: 1000;
                text-align: center;
            }

            .confirm-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }

            .confirm-buttons {
                margin-top: 20px;
            }

            .confirm-button {
                padding: 10px 20px;
                margin: 0 10px;
                cursor: pointer;
                border: none;
                color: white;
                font-weight: bold;
            }

            .confirm-button.si {
                background-color: green;
            }

            .confirm-button.no {
                background-color: red;
            }
            
            .success-dialog {
            display: none; /* Oculto por defecto */
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #dff0d8;
            border: 1px solid #3c763d;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1001;
            text-align: center;
            color: #3c763d;
            }

            .success-dialog img {
            width: 50px;
            height: 50px;
            margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="content">
            <div class="container mt-6" style="margin-left: 0px;margin-right: 0px;">
                <div class="table-container">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h1>Listado de Clientes</h1>
                        <a class="btn btn-primary" href="ControlerCliente?Op=Nuevo">Crear Cliente</a>
                    </div>
                    <table class="table table-hover" style="width:100%; border: 1px solid #ddd;" >
                        <thead class="table-dark">  
                            <tr>
                                <th>Id Cliente</th>
                                <th>Apellidos</th>
                                <th>Nombres</th>
                                <th>DNI</th>
                                <th colspan="3">Acciones</th>
                            </tr>
                        </thead>    
                        <c:forEach var="campo" items="${Lista}">
                            <tbody>
                                <tr>
                                    <td>${campo.id}</td>
                                    <td>${campo.apellidos}</td>
                                    <td>${campo.nombres}</td>
                                    <td>${campo.DNI}</td>
                                    <td><a class="btn btn-info btn-sm" href="ControlerCliente?Op=Consultar&Id=${campo.id}">Consultar</a></td>
                                    <td><a class="btn btn-warning btn-sm" href="ControlerCliente?Op=Modificar&Id=${campo.id}">Modificar</a></td>
                                    <!--<td><a class="btn btn-danger btn-sm" href="ControlerCliente?Op=Eliminar&Id=${campo.id}">Eliminar</a></td>-->
                                    <td><a class="btn btn-danger btn-sm btnEliminar" href="ControlerCliente?Op=Eliminar&Id=${campo.id}">Eliminar</a></td>
                                        <!-- HTML para el cuadro de confirmación -->
                                        <div id="confirmDialog" class="confirm-dialog">
                                            <p>¿Estás seguro de que deseas eliminar este cliente?</p>
                                            <div class="confirm-buttons">
                                                <button id="confirmYes" class="confirm-button si">Sí</button>
                                                <button id="confirmNo" class="confirm-button no">No</button>
                                            </div>
                                        </div>
                                        <div id="confirmOverlay" class="confirm-overlay"></div>
                                        <!-- HTML para el cuadro de diálogo de éxito -->
                                        <div id="successDialog" class="success-dialog">
                                            <img src="IMG/star.png" alt="Star"> <!-- Asegúrate de tener una imagen llamada "star.png" en la carpeta de imágenes -->
                                            <p>Cliente eliminado con éxito</p>
                                        </div>
                                        <!-- JavaScript para manejar el cuadro de confirmación -->
                                        <script>
                                            document.addEventListener("DOMContentLoaded", function() {
                                            const botonesEliminar = document.querySelectorAll(".btnEliminar");
                                            const confirmDialog = document.getElementById("confirmDialog");
                                            const confirmOverlay = document.getElementById("confirmOverlay");
                                            const confirmYes = document.getElementById("confirmYes");
                                            const confirmNo = document.getElementById("confirmNo");
                                            const successDialog = document.getElementById("successDialog");

                                            let deleteUrl = ""; // URL del servlet para eliminar

                                            botonesEliminar.forEach(boton => {
                                                boton.addEventListener("click", function(event) {
                                                    event.preventDefault();
                                                    deleteUrl = boton.getAttribute("href"); // Asigna la URL del botón actual
                                                    confirmDialog.style.display = "block";
                                                    confirmOverlay.style.display = "block";
                                                });
                                            });

                                            confirmYes.addEventListener("click", function() {
                                                confirmDialog.style.display = "none";
                                                confirmOverlay.style.display = "none";
                                                successDialog.style.display = "block"; // Muestra el cuadro de éxito

                                                // Espera unos segundos y luego redirige
                                                setTimeout(function() {
                                                    window.location.href = deleteUrl; // Redirige a la URL para eliminar
                                                }, 2000); // 2 segundos de espera antes de la redirección
                                            });

                                            confirmNo.addEventListener("click", function() {
                                                confirmDialog.style.display = "none";
                                                confirmOverlay.style.display = "none";
                                            });
                                        });
                                        </script>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table> 
                </div>
            </div>
        </div>
    </body>
</html>
