package Controler;

import Entidades.detallePedido;
import Entidades.empleados;
import Entidades.pedido;
import conexion.conexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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

@WebServlet(name = "ControlerPedido", urlPatterns = {"/ControlerPedido"})
public class ControlerPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

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
        ArrayList<pedido> ListaPe = new ArrayList<pedido>();
        ArrayList<detallePedido> ListaPeD = new ArrayList<detallePedido>();
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        switch (Op) {
            case "ListarPe":
                try {
                    String sql = "SELECT * FROM t_pedido";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        pedido pedid = new pedido();
                        pedid.setId_Pedido(rs.getString("Id_Pedido"));
                        pedid.setId_Cliente(rs.getString("Id_Cliente"));
                        pedid.setFecha(rs.getDate("Fecha"));
                        pedid.setSubTotal(rs.getDouble("SubTotal"));
                        pedid.setTotalVenta(rs.getDouble("TotalVenta"));
                        ListaPe.add(pedid);
                    }
                    request.setAttribute("ListaPe", ListaPe);
                    request.getRequestDispatcher("listarPedido.jsp").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;
            case "Consultar":
                try {
                    String Id_Pedido = request.getParameter("Id");
                    String sql = "SELECT * FROM t_pedido WHERE Id_Pedido=?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id_Pedido);
                    rs = ps.executeQuery();
                    pedido ped;
                    while (rs.next()) {
                        ped = new pedido();
                        ped.setId_Pedido(rs.getString("Id_Pedido"));
                        ped.setId_Cliente(rs.getString("Id_Cliente"));
                        ped.setFecha(rs.getDate("Fecha"));
                        ped.setSubTotal(rs.getDouble("SubTotal"));
                        ped.setTotalVenta(rs.getDouble("TotalVenta"));
                        ListaPe.add(ped);
                    }
                    request.setAttribute("Lista", ListaPe);
                    request.getRequestDispatcher("consultarPedido.jsp").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;

            case "Modificar":
                try {
                    String Id_Pedido = request.getParameter("Id_Pedido");
                    String sql = "SELECT * FROM t_pedido WHERE Id_Pedido=?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id_Pedido);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        pedido pedid = new pedido();
                        pedid.setId_Pedido(rs.getString("Id_Pedido"));
                        pedid.setId_Cliente(rs.getString("Id_Cliente"));
                        pedid.setFecha(rs.getDate("Fecha"));
                        pedid.setSubTotal(rs.getDouble("SubTotal"));
                        pedid.setTotalVenta(rs.getDouble("TotalVenta"));

                        ListaPe.add(pedid);
                    }

                    request.setAttribute("ListaPe", ListaPe);
                    request.getRequestDispatcher("modificarPedido.jsp").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL: " + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;

            case "Eliminar":
                try {
                    String Id_Pedido = request.getParameter("Id_Pedido");

                    String sqlDetalle = "DELETE FROM t_detalle_pedido WHERE Id_Pedido=?";
                    ps = conn.prepareStatement(sqlDetalle);
                    ps.setString(1, Id_Pedido);
                    ps.executeUpdate();

                    String sqlPedido = "DELETE FROM t_pedido WHERE Id_Pedido=?";
                    ps = conn.prepareStatement(sqlPedido);
                    ps.setString(1, Id_Pedido);
                    ps.executeUpdate();

                    request.getRequestDispatcher("ControlerPedido?Op=ListarPe").forward(request, response);
                } catch (SQLException ex) {
                    System.out.println("Error de SQL..." + ex.getMessage());
                } finally {
                    conBD.Discconet();
                }
                break;
            case "Nuevo":
                request.getRequestDispatcher("nuevoPedido.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String Id = request.getParameter("Id");
        String id_Cliente = request.getParameter("id_Cliente");
        String fecha = request.getParameter("fecha");
        Double subTotal = null;
        Double totalVenta = null;

        try {
            subTotal = Double.parseDouble(request.getParameter("subTotal"));
            totalVenta = Double.parseDouble(request.getParameter("totalVenta"));
        } catch (NumberFormatException e) {
            System.out.println("Error al convertir valores a Double: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Los valores de subtotal y total de venta deben ser números.");
            return;
        }

        pedido pedid = new pedido();
        pedid.setId_Pedido(Id);
        pedid.setId_Cliente(id_Cliente);
        pedid.setFecha(Date.valueOf(fecha));
        pedid.setSubTotal(subTotal);
        pedid.setTotalVenta(totalVenta);

        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;

        String sql = "update t_pedido set Id_Cliente=?, Fecha=?, SubTotal=?, TotalVenta=? where Id_Pedido=?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, pedid.getId_Cliente());
            ps.setDate(2, pedid.getFecha());
            ps.setDouble(3, pedid.getSubTotal());
            ps.setDouble(4, pedid.getTotalVenta());
            ps.setString(5, pedid.getId_Pedido());

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al actualizar el pedido: " + ex.getMessage());
        } finally {
            conBD.Discconet(); 
        }

        response.sendRedirect("ControlerPedido?Op=ListarPe");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
