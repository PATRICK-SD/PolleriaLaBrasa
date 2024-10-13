package Controler;

import Entidades.empleados;
import Entidades.producto;
import Entidades.usuarios;
import conexion.conexionBD;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "ControlerProducto", urlPatterns = {"/ControlerProducto"})
public class ControlerProducto extends HttpServlet {

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
        ArrayList<producto> ListaP = new ArrayList<producto>();
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        switch (Op) {
            case "ListarP":
                try {
                    String sql = "SELECT * FROM t_producto ORDER BY Id_Prod ASC";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        producto product = new producto();
                        product.setId(rs.getString("Id_Prod"));
                        product.setDescripcion(rs.getString("Descripcion"));
                        product.setCosto(rs.getDouble("Costo"));
                        product.setPrecio(rs.getDouble("Precio"));
                        product.setCantidad(rs.getInt("Cantidad"));
                        ListaP.add(product);
                    }
                    request.setAttribute("ListaP", ListaP);
                    request.getRequestDispatcher("listarProducto.jsp").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;
            case "Consultar":
                try {
                    String Id = request.getParameter("Id");
                    String sql = "select * from t_producto where Id_Prod=?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs = ps.executeQuery();
                    producto product = new producto();
                    while (rs.next()) {
                        product.setId(rs.getString("Id_Prod"));
                        product.setDescripcion(rs.getString("Descripcion"));
                        product.setCosto(rs.getDouble("Costo"));
                        product.setPrecio(rs.getDouble("Precio"));
                        product.setCantidad(rs.getInt("Cantidad"));
                        ListaP.add(product);
                    }
                    request.setAttribute("ListaP", ListaP);
                    request.getRequestDispatcher("consultarProducto.jsp").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;
            case "Modificar":
                try {
                    String Id = request.getParameter("Id");
                    String sql = "select * from t_producto where Id_Prod=?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs = ps.executeQuery();
                    producto product = new producto();
                    while (rs.next()) {
                        product.setId(rs.getString("Id_Prod"));
                        product.setDescripcion(rs.getString("Descripcion"));
                        product.setCosto(rs.getDouble("Costo"));
                        product.setPrecio(rs.getDouble("Precio"));
                        product.setCantidad(rs.getInt("Cantidad"));
                        ListaP.add(product);
                    }
                    request.setAttribute("ListaP", ListaP);
                    request.getRequestDispatcher("modificarProducto.jsp").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }

                break;
            case "Eliminar":
                try {
                    String Id = request.getParameter("Id");
                    String sql = "delete from t_producto where Id_Prod=?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    ps.executeUpdate();
                    response.sendRedirect("ControlerProducto?Op=ListarP");
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;
            case "NuevoProducto":
                request.getRequestDispatcher("nuevoProducto.jsp").forward(request, response);
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetro de cantidad de la solicitud y convertirlo a int
        int Cantidad = 0;
        try {
            Cantidad = Integer.parseInt(request.getParameter("cantidad"));
        } catch (NumberFormatException e) {
            System.out.println("Error al convertir cantidad a int: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "La cantidad debe ser un número entero.");
            return;
        }

        // Otros parámetros de la solicitud
        String Id = request.getParameter("Id");
        String Descripcion = request.getParameter("descripcion");
        Double Costo = null;
        Double Precio = null;

        // Convertir parámetros de String a Double
        try {
            Costo = Double.parseDouble(request.getParameter("costo"));
            Precio = Double.parseDouble(request.getParameter("precio"));
        } catch (NumberFormatException e) {
            System.out.println("Error al convertir valores a Double: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Los valores de costo y precio deben ser números.");
            return;
        }

        // Crear objeto producto y asignar valores
        producto product = new producto();
        product.setId(Id);
        product.setDescripcion(Descripcion);
        product.setCosto(Costo);
        product.setPrecio(Precio);
        product.setCantidad(Cantidad); // Asignar la cantidad como int

        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            if (Id == null || Id.isEmpty()) {
                // Insertar nuevo producto
                String sql_new = "SELECT MAX(Id_Prod) AS Id_Prod FROM t_producto";
                String sql = "INSERT INTO t_producto(Id_Prod, descripcion, costo, precio, cantidad) VALUES(?, ?, ?, ?, ?)";

                String Id_Prod = null;
                ps = conn.prepareStatement(sql_new);
                rs = ps.executeQuery();
                if (rs.next()) {
                    Id_Prod = rs.getString("Id_Prod");
                }

                if (Id_Prod == null) {
                    Id_Prod = "P00000";
                }

                Id_Prod = newCod(Id_Prod);
                ps = conn.prepareStatement(sql);
                ps.setString(1, Id_Prod);
                ps.setString(2, product.getDescripcion());
                ps.setDouble(3, product.getCosto());
                ps.setDouble(4, product.getPrecio());
                ps.setInt(5, (int) product.getCantidad());
                ps.executeUpdate();
            } else {
                // Actualizar producto existente
                String sql = "UPDATE t_producto SET descripcion=?, costo=?, precio=?, cantidad=? WHERE Id_Prod=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, product.getDescripcion());
                ps.setDouble(2, product.getCosto());
                ps.setDouble(3, product.getPrecio());
                ps.setInt(4, (int) product.getCantidad());
                ps.setString(5, product.getId());
                ps.executeUpdate();
            }

            // Redirigir después de guardar
            response.sendRedirect("ControlerProducto?Op=ListarP");
        } catch (SQLException ex) {
            System.out.println("Error actualizando tabla..." + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException ignore) {
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ignore) {
            }
            conBD.Discconet();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String newCod(String pCodigo) {
        if (pCodigo == null || pCodigo.length() < 2) {
            return "P00001";
        }

        int Numero = Integer.parseInt(pCodigo.substring(1));
        Numero = Numero + 1;
        pCodigo = String.valueOf(Numero);
        while (pCodigo.length() < 5) {
            pCodigo = '0' + pCodigo;
        }
        pCodigo = 'P' + pCodigo;
        return pCodigo;
    }
}
