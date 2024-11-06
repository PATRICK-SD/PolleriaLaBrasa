
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
                                    <!--<td><a class="btn btn-danger btn-sm" href="ControlerPedido?Op=Eliminar&Id_Pedido=${campo.id_Pedido}">Eliminar</a>-->
                                    <td><a class="btn btn-danger btn-sm btnEliminar" href="ControlerPedido?Op=Eliminar&Id_Pedido=${campo.id_Pedido}">Eliminar</a></td>
                                        <!-- HTML para el cuadro de confirmación -->
                                        <div id="confirmDialog" class="confirm-dialog">
                                            <p>¿Estás seguro de que deseas eliminar este pedido?</p>
                                            <div class="confirm-buttons">
                                                <button id="confirmYes" class="confirm-button si">Sí</button>
                                                <button id="confirmNo" class="confirm-button no">No</button>
                                            </div>
                                        </div>
                                        <div id="confirmOverlay" class="confirm-overlay"></div>
                                        <!-- HTML para el cuadro de diálogo de éxito -->
                                        <div id="successDialog" class="success-dialog">
                                            <img src="IMG/star.png" alt="Star"> <!-- Asegúrate de tener una imagen llamada "star.png" en la carpeta de imágenes -->
                                            <p>Pedido eliminado con éxito</p>
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
