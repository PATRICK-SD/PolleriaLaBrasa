package Controler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import conexion.conexionBD;
import Entidades.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "ControlerPedidoN", urlPatterns = {"/ControlerPedidoN"})
public class ControlerPedidoN extends HttpServlet {

    cliente c = new cliente();
    producto p = new producto();
    venta v = new venta();
    List<venta> lista = new ArrayList<>();

    int item = 1;
    String cod;
    String descripcion;
    double precio;
    int cant;
    double subtotal;
    double igv;
    double totalPagar;
    String numeroserie = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        HttpSession session = request.getSession();

        switch (accion) {

            case "BuscarCliente":
                String DNI = request.getParameter("codigocliente");
                c = buscarClientePorDNI(DNI);
                request.setAttribute("c", c);
                request.setAttribute("nserie", numeroserie);
                lista = new ArrayList<>();
                subtotal = 0.0;
                igv = 0.0;
                totalPagar = 0.0;
                session.setAttribute("lista", lista);
                session.setAttribute("subtotal", subtotal);
                session.setAttribute("igv", igv);
                session.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("nuevoPedido.jsp").forward(request, response);
                break;

            case "BuscarProducto":
                String Id = request.getParameter("codigoproducto");
                p = buscarProductoPorId(Id);
                request.setAttribute("p", p);  // Asegúrate de establecer el atributo del producto
                request.setAttribute("c", c);  // Mantén los datos del cliente
                lista = (List<venta>) session.getAttribute("lista");
                subtotal = session.getAttribute("subtotal") != null ? (double) session.getAttribute("subtotal") : 0.0;
                igv = session.getAttribute("igv") != null ? (double) session.getAttribute("igv") : 0.0;
                totalPagar = session.getAttribute("totalPagar") != null ? (double) session.getAttribute("totalPagar") : 0.0;
                request.setAttribute("lista", lista);
                request.setAttribute("subtotal", subtotal);
                request.setAttribute("igv", igv);
                request.setAttribute("totalpagar", totalPagar);
                request.setAttribute("nserie", numeroserie);
                request.getRequestDispatcher("nuevoPedido.jsp").forward(request, response);
                break;

            case "Agregar":
                item = lista.size() + 1;
                request.setAttribute("nserie", numeroserie);
                request.setAttribute("c", c);

                // Recuperar parámetros del formulario
                cod = p.getId();
                descripcion = request.getParameter("nomproducto");
                precio = Double.parseDouble(request.getParameter("precio"));
                cant = Integer.parseInt(request.getParameter("cant"));

                // Calcular subtotal y totalPagar
                subtotal = precio * cant;
                totalPagar += subtotal;

                // Crear objeto venta
                v = new venta();
                v.setItem(item);
                v.setIdProductoV(cod);
                v.setNomProductoV(descripcion);
                v.setPrecioV(precio);
                v.setCantidadV(cant);
                v.setSubTotalV(subtotal);

                // Recuperar lista de la sesión
                lista = (List<venta>) session.getAttribute("lista");
                if (lista == null) {
                    lista = new ArrayList<>();
                }
                lista.add(v);

                // Recalcular totales
                subtotal = 0.0;
                for (venta venta : lista) {
                    subtotal += venta.getSubTotalV();
                }
                igv = subtotal * 0.18;
                totalPagar = subtotal + igv;

                // Actualizar atributos de la sesión y request
                session.setAttribute("lista", lista);
                session.setAttribute("subtotal", subtotal);
                session.setAttribute("igv", igv);
                session.setAttribute("totalPagar", totalPagar);

                request.setAttribute("subtotal", subtotal);
                request.setAttribute("igv", igv);
                request.setAttribute("totalpagar", totalPagar);
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("nuevoPedido.jsp").forward(request, response);
                break;
            case "delete":
                String idpd = request.getParameter("id");
                for (int i = 0; i < lista.size(); i++) {
                    if (lista.get(i).getIdProductoV().equals(idpd)) {
                        lista.remove(i);
                        break;
                    }
                }
                item = 1;
                subtotal = 0.0;
                for (venta venta : lista) {
                    venta.setItem(item++);
                    subtotal += venta.getSubTotalV();
                }
                igv = subtotal * 0.18;
                totalPagar = subtotal + igv;
                request.setAttribute("nserie", numeroserie);
                request.setAttribute("c", c);
                request.setAttribute("subtotal", subtotal);
                request.setAttribute("igv", igv);
                request.setAttribute("totalpagar", totalPagar);
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("nuevoPedido.jsp").forward(request, response);
                break;
            case "GenerarVenta":
                //Actualizacion del Stock  
                for (int i = 0; i < lista.size(); i++) {
                    producto pr = new producto();
                    int cantidad = lista.get(i).getCantidadV();
                    String idproducto = lista.get(i).getIdProductoV();
                    pr = buscarProductoPorId(idproducto);
                    int sac = pr.getCantidad() - cantidad;
                    actualizarStock(idproducto, sac);
                }

                //Guardar Venta
                String fechaPedido = obtenerFechaActual();
                v.setIdPedido(numeroserie);
                v.setIdClienteV(c.getId());
                v.setFecha(fechaPedido);//"2024-06-23"
                v.setSubTotalV(subtotal);
                v.setTotalVenta(totalPagar);
                guardarPedido(v);

                //Guardar Detalle ventas
                for (int i = 0; i < lista.size(); i++) {
                    v = new venta();
                    v.setIdPedido(numeroserie);
                    v.setIdProductoV(lista.get(i).getIdProductoV());
                    v.setCantidadV(lista.get(i).getCantidadV());
                    v.setPrecioV(lista.get(i).getPrecioV());
                    double detalleSubtotal = lista.get(i).getPrecioV() * lista.get(i).getCantidadV();
                    v.setSubTotalV(detalleSubtotal);
                    guardarDetallePedido(v);
                }

                session.removeAttribute("lista");
                lista = new ArrayList<>();
                request.getRequestDispatcher("ControlerPedidoN?accion=ventanueva").forward(request, response);
                System.out.println("Venta Realizada con Éxito..!!!:");
                break;

            case "Cancelar":
                // Limpiar los datos del lista de la sesión
                session.removeAttribute("lista");
                // Redirigir a la página de listado de pedidos
                response.sendRedirect("nuevoPedido.jsp");
                break;

            default:
                v = new venta();
                lista = new ArrayList<>();
                item = 0;
                totalPagar = 0.0;
                numeroserie = generarSerie();
                request.setAttribute("nserie", numeroserie);
                request.getRequestDispatcher("nuevoPedido.jsp").forward(request, response);

        }
    }

    private cliente buscarClientePorDNI(String DNI) {
        cliente c = new cliente();
        String sql = "SELECT * FROM t_cliente WHERE DNI=?";
        try (Connection con = new conexionBD().Connected(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, DNI);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    c.setId(rs.getString(1));
                    c.setApellidos(rs.getString(2));
                    c.setNombres(rs.getString(3));
                    c.setDireccion(rs.getString(4));
                    c.setDNI(rs.getString(5));
                    c.setTelefono(rs.getString(6));
                    c.setMovil(rs.getString(7));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error:" + e);
        }
        return c;
    }

    private producto buscarProductoPorId(String Id) {
        producto p = new producto();
        String sql = "SELECT * FROM t_producto WHERE Id_Prod=?";
        try (Connection con = new conexionBD().Connected(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, Id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p.setId(rs.getString(1));
                    p.setDescripcion(rs.getString(2));
                    p.setCosto(rs.getDouble(3));
                    p.setPrecio(rs.getDouble(4));
                    p.setCantidad(rs.getInt(5));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error:" + e);
        }
        return p;
    }

    private void actualizarStock(String idProducto, int stock) {
        String sql = "UPDATE t_producto SET cantidad=? WHERE Id_Prod=?";
        try (Connection con = new conexionBD().Connected(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, stock);
            ps.setString(2, idProducto);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error:" + e);
        }
    }

    private String generarSerie() {
        String numeroserie = "";
        String sql = "SELECT MAX(Id_Pedido) FROM t_pedido";
        try (Connection con = new conexionBD().Connected(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                String maxIdPedido = rs.getString(1);
                if (maxIdPedido == null) {
                    numeroserie = "P0001";
                } else {
                    int numeroSiguiente = Integer.parseInt(maxIdPedido.substring(1)) + 1;
                    numeroserie = "P" + String.format("%04d", numeroSiguiente);
                }
            } else {
                numeroserie = "P0001";
            }
        } catch (SQLException e) {
            System.out.println("Error al generar serie: " + e);
        }
        return numeroserie;
    }

    private void guardarPedido(venta ve) {
        String sql = "INSERT INTO t_pedido(Id_Pedido, Id_Cliente, Fecha, SubTotal, TotalVenta) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = new conexionBD().Connected(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, ve.getIdPedido());
            ps.setString(2, ve.getIdClienteV());
            ps.setString(3, ve.getFecha());
            ps.setDouble(4, ve.getSubTotalV());
            ps.setDouble(5, ve.getTotalVenta());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error:" + e);
        }
    }

    private void guardarDetallePedido(venta venta) {
        String sql = "INSERT INTO t_detalle_pedido(Id_Pedido, Id_Prod, cantidad, precio, TotalDeta) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = new conexionBD().Connected(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, venta.getIdPedido());
            ps.setString(2, venta.getIdProductoV());
            ps.setInt(3, venta.getCantidadV());
            ps.setDouble(4, venta.getPrecioV());
            ps.setDouble(5, venta.getSubTotalV());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al guardar detalle de pedido: " + e);
        }
    }

    private String obtenerFechaActual() {
        LocalDate fechaActual = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return fechaActual.format(formatter);
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
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
