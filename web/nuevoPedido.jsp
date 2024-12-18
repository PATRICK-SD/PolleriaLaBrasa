<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nuevo Pedido</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                padding: 0;
            }

            h1 {
                text-align: center;
            }

            .container {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .form-container {
                display: flex;
                flex-direction: column;
                width: 48%;
            }

            .table-container {
                width: 48%;
            }

            .box {
                border: 1px solid #ccc;
                padding: 20px;
                margin: 20px 0;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                box-sizing: border-box;
            }

            .box h2 {
                margin-top: 0;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
            }

            .form-group input[type="text"],
            .form-group input[type="number"] {
                width: calc(100% - 22px);
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .btn-buscar,
            .btn-agregando {
                padding: 10px 20px;
                border: none;
                background-color: #000000;
                color: white;
                border-radius: 4px;
                cursor: pointer;
            }

            .btn-agregando {
                margin-top: 15px;
                display: block;
                width: 100%;
                text-align: center;
            }

            .btn-buscar:hover,
            .btn-agregando:hover {
                background-color: #a59b9b;
            }

            .output {
                margin-top: 15px;
                font-weight: bold;
            }

            input[type="submit"]:hover {
                background-color: #a59b9b;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table, th, td {
                border: 1px solid #ccc;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f4f4f4;
            }

            .action-buttons {
                display: flex;
                gap: 5px;
            }

            .action-buttons button {
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
            }

            .btn-edit {
                background-color: #4CAF50;
                color: white;
            }

            .btn-delete {
                background-color: #f44336;
                color: white;
            }

            .total-amount {
                font-weight: bold;
                text-align: right;
                padding: 10px;
            }

            .btn-container {
                display: flex;
                justify-content: flex-end;
                gap: 10px;
                margin-top: 20px;
            }

            .summary-group {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }

            .summary-group label {
                flex: 1;
                margin-right: 10px;
            }

            .summary-group input[type="text"] {
                flex: 2;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                text-align: right;
            }
            
            /* Estilo para campos con error */
            /*.error {
                border: 2px solid red;
            }
            .error-message {
                color: red;
                font-size: 0.9em;
                display: none;
            } */
        </style>
        <!--<script>
            function validateField(input, pattern, errorMessage) {
                const value = input.value;
                const errorSpan = input.nextElementSibling;

                if (!pattern.test(value)) {
                    input.classList.add("error");
                    errorSpan.style.display = "inline";
                    errorSpan.textContent = errorMessage;
                } else {
                    input.classList.remove("error");
                    errorSpan.style.display = "none";
                }
            }

            function validateForm() {
                // Validar Apellidos y Nombres (solo letras)
                const namePattern = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/;
                validateField(document.getElementById("apellidos"), namePattern, "No se permiten números ni signos en esta casilla");
                validateField(document.getElementById("nombres"), namePattern, "No se permiten números ni signos en esta casilla");

                // Validar DNI, Teléfono y Móvil (solo números)
                const numberPattern = /^[0-9]+$/;
                validateField(document.getElementById("DNI"), numberPattern, "Solo se permiten números en esta casilla");
                validateField(document.getElementById("telefono"), numberPattern, "Solo se permiten números en esta casilla");
                validateField(document.getElementById("movil"), numberPattern, "Solo se permiten números en esta casilla");
                
                // Evitar el envío del formulario si hay errores
                const errors = document.querySelectorAll(".error");
                return errors.length === 0;
            }
        </script>-->
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <br><br><br>
        
        <div class="container">
            <div class="form-container">
                <form action="ControlerPedidoN" method="post" style="width: 100%;">
                    <h1 class="title" style="font-size: 25px;">Agregar Nuevo Producto</h1>
                    <div class="box">
                        <h2 style="font-size: 22px;">Detalle del Cliente</h2>
                        <div class="form-group">
                            <!--<label for="client-code">DNI del Cliente</label>-->
                            <input value="${c.DNI}" type="text" name="codigocliente" class="form-control" placeholder="DNI del Cliente">
                        </div>
                        <div class="form-group">
                            <input type="submit" name="accion" value="BuscarCliente" class="btn-buscar" style="background-color: green;">
                        </div>
                        <div class="form-group">
                            <input type="text" name="nombrescliente" value="${c.nombres}" class="form-nombre" placeholder="Datos del cliente">
                        </div>
                    </div>
                    <div class="box">
                        <h2 style="font-size: 22px;">Detalle del Producto</h2>
                        <div class="form-group">
                            <!--<label for="product-code">Código del Producto</label>-->
                            <input value="${p.id}" type="text" name="codigoproducto" class="form-control" placeholder="Código Producto">
                        </div>
                        <div class="form-group">
                            <input type="submit" name="accion" value="BuscarProducto" class="btn-buscar" style="background-color: green;">
                        </div>
                        <div class="form-group">
                            <input type="text" name="nomproducto" value="${p.descripcion}" class="form-nombre" placeholder="Descripción del producto">
                        </div>
                        <div class="form-group">
                            <input type="text" name="precio" value="${p.precio}" class="form-control" placeholder="Precio">
                        </div>
                        <div class="form-group">
                            <input type="number" name="cant" class="form-control" placeholder="Cantidad">
                        </div>
                        <div class="form-group">
                            <input type="text" name="stock" value="${p.cantidad}" class="form-control" placeholder="Stock">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn-agregando" style="background-color: blue;">
                    </div>
                </form>
            </div>

            <div class="table-container">
                <h2 style="font-size: 25px;">Detalles del Pedido</h2>
                <div class="form-group">
                    <label for="id-pedido">ID Pedido:</label>
                    <input type="text" name="idpedido" value="${nserie}" class="form-control" readonly>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>N°</th>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>SubTotal</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="producto" items="${lista}">
                            <tr>
                                <td>${producto.item}</td>
                                <td>${producto.idProductoV}</td>
                                <td>${producto.nomProductoV}</td>
                                <td>${producto.precioV}</td>
                                <td>${producto.cantidadV}</td>
                                <td>${producto.subTotalV}</td>
                                <td class="action-buttons">
                                    <form action="ControlerPedidoN" method="post">
                                        <input type="hidden" name="id" value="${producto.idProductoV}">
                                        <input type="submit" name="accion" value="delete" class="btn-delete" style="background-color: red;">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br>
                <div class="summary-group">
                    <label for="subtotal">SubTotal:</label>
                    <input type="text" name="subtotal" value="S/. ${subtotal}" class="form-control" readonly>
                </div>
                <div class="summary-group">
                    <label for="igv">IGV:</label>
                    <input type="text" name="igv" value="S/. ${igv}" class="form-control" readonly>
                </div>
                <div class="summary-group">
                    <label for="importe">Importe:</label>
                    <input type="text" name="importe" value="S/. ${totalpagar}" class="form-control" readonly>
                </div>
                <div class="btn-container">
                    <form action="ControlerPedidoN" method="post">
                        <input type="submit" name="accion" value="GenerarVenta" class="btn-agregando" style="background-color: blue;">
                        <input type="submit" name="accion" value="Cancelar" class="btn-agregando" style="background-color: red;">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>