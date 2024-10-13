/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Entidades.empleados;
import conexion.conexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "ControladorValidar", urlPatterns = {"/ControladorValidar"})
public class ControladorValidar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String dni = request.getParameter("dni");
        String password = request.getParameter("password");

        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        empleados empl = null;

        try {
            String sql = "SELECT * FROM t_empleado WHERE DNI = ? AND Password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dni);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Crear objeto empleado con los datos de la consulta
                empl = new empleados();
                empl.setId(rs.getString("Id_Usuario"));
                empl.setNombres(rs.getString("Nombres"));
                empl.setApellidos(rs.getString("Apellidos"));
                empl.setDNI(rs.getString("DNI"));
                empl.setCargo(rs.getString("Cargo"));
                empl.setDireccion(rs.getString("Direccion"));
                empl.setTelefono(rs.getString("Telefono"));
                empl.setPassword(rs.getString("Password"));

                // Guardar el empleado en la sesión
                HttpSession session = request.getSession();
                session.setAttribute("user", empl);

                // Redirigir a la página principal de empleados
                response.sendRedirect("index.jsp");
            } else {
                // Si las credenciales son incorrectas, redirigir al login con mensaje de error
                response.sendRedirect("login.jsp?error=invalid");
            }
        } catch (SQLException ex) {
            System.out.println("Error de SQL..." + ex.getMessage());
        } finally {
            conBD.Discconet();
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador de empleados";
    }// </editor-fold>

}
