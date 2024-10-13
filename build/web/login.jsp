<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : 11 oct. 2024, 13:55:32
    Author     : PATRICK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url("IMG/LaBrasa.jpg");
                /*background-image: url('https://i.blogs.es/f336ca/img_4809/1366_2000.jpeg');*/
                background-size: cover;
                background-position: center;
                margin: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .form-container {
                background-color: rgba(255, 255, 255, 0.8);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            table {
                margin: 0 auto;
            }
            td {
                padding: 10px;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #000000;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #000000;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Inicio de Sesión</h1>
            <form action="ControladorValidar" method="POST">   
                <table border="0">
                    <tr>
                        <td>DNI</td>
                        <td><input type="text" name="dni" required></td>
                    </tr>
                    <tr>
                        <td>PASSWORD</td>
                        <td><input type="password" name="password" required></td>
                    </tr> 
                </table>        
                <input type="submit" name="accion" value="Ingresar"> 
            </form>
        </div>
    </body>
</html>
