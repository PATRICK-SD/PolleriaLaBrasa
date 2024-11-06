
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nuevo Producto</title>
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
                // Validar Descripcion (solo letras)
                const namePattern = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/;
                //validateField(document.getElementById("descripcion"), namePattern, "No se permiten números ni signos en esta casilla");

                // Validar Costo, Precio y Cantidad (solo números)
                const numberPattern = /^[0-9]+$/;
                validateField(document.getElementById("costo"), numberPattern, "Solo se permiten números en esta casilla");
                validateField(document.getElementById("precio"), numberPattern, "Solo se permiten números en esta casilla");
                validateField(document.getElementById("cantidad"), numberPattern, "Solo se permiten números en esta casilla");
                
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
                <h1 class="mb-4">Nuevo Producto</h1>
                <form action="ControlerProducto" method="post" onsubmit="return validateForm();">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th>Id Producto</th>
                                <td><input type="hidden" name="Id"></td>
                            </tr>
                            <tr>
                                <th>Descripcion</th>
                                <td>
                                    <input type="text" class="form-control" name="descripcion">
                                    <!--<input type="text" class="form-control" id="descripcion" name="descripcion" oninput="validateField(this, /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/, 'No se permiten números ni signos en esta casilla')">
                                    <span class="error-message"></span>-->
                                </td>
                            </tr>
                            <tr>
                                <th>Costo</th>
                                <td>
                                    <input type="text" class="form-control" id="costo" name="costo" oninput="validateField(this, /^[0-9]+$/, 'Solo se permiten números en esta casilla')">
                                    <span class="error-message"></span>
                                </td>
                            </tr>     
                            <tr>
                                <th>Precio</th>
                                <td>
                                    <input type="text" class="form-control" id="precio" name="precio" oninput="validateField(this, /^[0-9]+$/, 'Solo se permiten números en esta casilla')">
                                    <span class="error-message"></span>
                                </td>
                            </tr>        
                            <tr>
                                <th>Cantidad</th>
                                <td>
                                    <input type="text" class="form-control" id="cantidad" name="cantidad" oninput="validateField(this, /^[0-9]+$/, 'Solo se permiten números en esta casilla')">
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

