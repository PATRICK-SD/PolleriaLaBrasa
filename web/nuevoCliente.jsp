
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nuevo Cliente</title>
        <style>
            .form-container {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            
            /* Estilo para campos con error */
            .error {
                border: 2px solid red;
            }
            .error-message {
                color: red;
                font-size: 0.9em;
                display: none;
            } 
        </style>
        <script>
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
                validateField(document.getElementById("direccion"), namePattern, "No se permiten números ni signos en esta casilla");

                // Validar DNI, Teléfono y Móvil (solo números)
                const numberPattern = /^[0-9]+$/;
                validateField(document.getElementById("DNI"), numberPattern, "Solo se permiten números en esta casilla");
                validateField(document.getElementById("telefono"), numberPattern, "Solo se permiten números en esta casilla");
                validateField(document.getElementById("movil"), numberPattern, "Solo se permiten números en esta casilla");
                
                // Evitar el envío del formulario si hay errores
                const errors = document.querySelectorAll(".error");
                return errors.length === 0;
            }
        </script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="content">
        <div class="container mt-6" style="margin-left: 0px;margin-right: 0px;">
            <div class="form-container">
                <h1 class="mb-4">Nuevo Cliente</h1>
                <form action="ControlerCliente" method="post" onsubmit="return validateForm();">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th>Id Cliente</th>
                                <td><input type="hidden" name="Id"></td>
                            </tr>
                            <tr>
                                <th>Apellidos</th>
                                <td>
                                    <input type="text" class="form-control" id="apellidos" name="apellidos" oninput="validateField(this, /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/, 'No se permiten números ni signos en esta casilla')">
                                    <span class="error-message"></span>
                                </td>
                            </tr>
                            <tr>
                                <th>Nombres</th>
                                <td>
                                    <input type="text" class="form-control" id="nombres" name="nombres" oninput="validateField(this, /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/, 'No se permiten números ni signos en esta casilla')">
                                    <span class="error-message"></span>
                                </td>
                            </tr>     
                            <tr>
                                <th>DNI</th>
                                <td>
                                    <input type="text" class="form-control" id="DNI" name="DNI" oninput="validateField(this, /^[0-9]+$/, 'Solo se permiten números en esta casilla')">
                                    <span class="error-message"></span>
                                </td>
                            </tr>        
                            <tr>
                                <th>Dirección</th>
                                <td>
                                    <input type="text" class="form-control" id="direccion" name="direccion" oninput="validateField(this, /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/, 'No se permiten números ni signos en esta casilla')">
                                    <span class="error-message"></span>
                                </td>
                            </tr>  
                            <tr>
                                <th>Teléfono</th>
                                <td>
                                    <input type="text" class="form-control" id="telefono" name="telefono" oninput="validateField(this, /^[0-9]+$/, 'Solo se permiten números en esta casilla')">
                                    <span class="error-message"></span>
                                </td>
                            </tr>                 
                            <tr>
                                <th>Móvil</th>
                                <td>
                                    <input type="text" class="form-control" id="movil" name="movil" oninput="validateField(this, /^[0-9]+$/, 'Solo se permiten números en esta casilla')">
                                    <span class="error-message"></span>
                                </td>
                            </tr>
                 
                        </table>
                    </div>
                    <button type="submit" class="btn btn-primary">Grabar</button>
                </form>
            </div>
            </div>
        </div>
    </body>
</html>

