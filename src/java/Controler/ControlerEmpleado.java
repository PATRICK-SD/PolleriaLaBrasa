package Controler;

import Entidades.empleados;
import Entidades.usuarios;
import conexion.conexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Patrick
 */
@WebServlet(name = "ControlerEmpleado", urlPatterns = {"/ControlerEmpleado"})
public class ControlerEmpleado extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        empleados user = (empleados) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp"); // Redirigir al login si no hay usuario en sesión
            return;
        }
        String Op = request.getParameter("Op");
        ArrayList<empleados> Lista = new ArrayList<empleados>();
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        switch (Op) {
            case "Listar":
                try {
                    String sql = "SELECT * FROM t_empleado ORDER BY Id_Usuario ASC";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        empleados empl = new empleados();
                        empl.setId(rs.getString("Id_Usuario"));
                        empl.setNombres(rs.getString("Nombres"));
                        empl.setApellidos(rs.getString("Apellidos"));
                        empl.setDNI(rs.getString("DNI"));
                        empl.setCargo(rs.getString("Cargo"));
                        empl.setDireccion(rs.getString("Direccion"));
                        empl.setTelefono(rs.getString("Telefono"));
                        empl.setPassword(rs.getString("Password"));
                        Lista.add(empl);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("listarEmpleado.jsp").forward(request, response);

                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());

                } finally {
                    conBD.Discconet();
                }
                break;
            case "Consultar":
                try {
                    String Id = request.getParameter("Id");
                    String sql = "select * from t_empleado where Id_Usuario=?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs = ps.executeQuery();
                    empleados empl = new empleados();
                    while (rs.next()) {
                        empl.setId(rs.getString("Id_Usuario"));
                        empl.setNombres(rs.getString("Nombres"));
                        empl.setApellidos(rs.getString("Apellidos"));
                        empl.setDNI(rs.getString("DNI"));
                        empl.setCargo(rs.getString("Cargo"));
                        empl.setDireccion(rs.getString("Direccion"));
                        empl.setTelefono(rs.getString("Telefono"));
                        empl.setPassword(rs.getString("Password"));
                        Lista.add(empl);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("consultarEmpleado.jsp").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;
            case "Modificar":
                try {
                    String Id = request.getParameter("Id");
                    String sql = "select * from t_empleado where Id_Usuario=?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs = ps.executeQuery();
                    empleados empl = new empleados();
                    while (rs.next()) {
                        empl.setId(rs.getString("Id_Usuario"));
                        empl.setNombres(rs.getString("Nombres"));
                        empl.setApellidos(rs.getString("Apellidos"));
                        empl.setDNI(rs.getString("DNI"));
                        empl.setCargo(rs.getString("Cargo"));
                        empl.setDireccion(rs.getString("Direccion"));
                        empl.setTelefono(rs.getString("Telefono"));
                        empl.setPassword(rs.getString("Password"));
                        Lista.add(empl);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("modificarEmpleado.jsp").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;
            case "Eliminar":
                try {
                    String Id = request.getParameter("Id");
                    String sql = "delete from t_empleado where Id_Usuario=?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    ps.executeUpdate();
                    response.sendRedirect("ControlerEmpleado?Op=Listar");
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;
            case "Nuevo":
                request.getRequestDispatcher("nuevoEmpleado.jsp").forward(request, response);
                break;
            /*boton cancelar*/
            /*case "Cancelar":
                request.getRequestDispatcher("listarEmpleado").forward(request, response);
                break;*/
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Id = request.getParameter("Id");
        String Nombres = request.getParameter("nombres");
        String Apellidos = request.getParameter("apellidos");
        String DNI = request.getParameter("DNI");
        String Cargo = request.getParameter("cargo");
        String Direccion = request.getParameter("direccion");
        String Telefono = request.getParameter("telefono");
        String Password = request.getParameter("password");

        System.out.println("Parámetros recibidos: " + Id + ", " + Nombres + ", " + Apellidos + ", " + DNI + ", " + Cargo + ", " + Direccion + ", " + Telefono + ", " + Password);
        
        empleados empl = new empleados();

        empl.setId(Id);
        empl.setNombres(Nombres);
        empl.setApellidos(Apellidos);
        empl.setDNI(DNI);
        empl.setCargo(Cargo);
        empl.setDireccion(Direccion);
        empl.setTelefono(Telefono);
        empl.setPassword(Password);

        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;

        try {
            if (Id == null || Id.isEmpty()) {
                String sql_new = "select max(Id_Usuario) as Id_Usuario from t_empleado";
                String sql_insert = "insert into t_empleado(Id_Usuario, nombres, apellidos, DNI, cargo, direccion, telefono, password) values(?, ?, ?, ?, ?, ?, ?, ?)";

                ps = conn.prepareStatement(sql_new);
                rs = ps.executeQuery();
                String Id_Usuario = "";
                if (rs.next()) {
                    Id_Usuario = rs.getString("Id_Usuario");
                }
                Id_Usuario = newCod(Id_Usuario);
                System.out.println("Nuevo ID generado: " + Id_Usuario);

                ps = conn.prepareStatement(sql_insert);
                ps.setString(1, Id_Usuario);
                ps.setString(2, empl.getNombres());
                ps.setString(3, empl.getApellidos());
                ps.setString(4, empl.getDNI());
                ps.setString(5, empl.getCargo());
                ps.setString(6, empl.getDireccion());
                ps.setString(7, empl.getTelefono());
                ps.setString(8, empl.getPassword());
                ps.executeUpdate();
                System.out.println("Nuevo empleado insertado correctamente.");

            } else {
                String sql_update = "update t_empleado set nombres=?, apellidos=?, DNI=?, cargo=?, direccion=?, telefono=?, password=? where Id_Usuario=?";
                ps = conn.prepareStatement(sql_update);
                ps.setString(1, empl.getNombres());
                ps.setString(2, empl.getApellidos());
                ps.setString(3, empl.getDNI());
                ps.setString(4, empl.getCargo());
                ps.setString(5, empl.getDireccion());
                ps.setString(6, empl.getTelefono());
                ps.setString(7, empl.getPassword());
                ps.setString(8, empl.getId());
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            System.out.println("Error updating table: " + ex.getMessage());
        } finally {
            conBD.Discconet();
        }

        response.sendRedirect("ControlerEmpleado?Op=Listar");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String newCod(java.lang.String pCodigo) {
        int Numero;
        Numero = Integer.parseInt(pCodigo.substring(2));
        Numero = Numero + 1;
        pCodigo = String.valueOf(Numero);
        while (pCodigo.length() < 5) {
            pCodigo = '0' + pCodigo;
        }
        pCodigo = 'E' + pCodigo;
        return (pCodigo);
    }

}
