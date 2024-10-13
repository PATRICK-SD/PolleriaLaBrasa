package Entidades;

import java.sql.Date;

public class pedido {

    private String Id_Pedido;
    private String Id_Cliente;
    private Date Fecha;
    private double SubTotal;
    private double TotalVenta;

    public pedido() {
    }

    public pedido(String Id_Pedido, String Id_Cliente, Date Fecha, double SubTotal, double TotalVenta) {
        this.Id_Pedido = Id_Pedido;
        this.Id_Cliente = Id_Cliente;
        this.Fecha = Fecha;
        this.SubTotal = SubTotal;
        this.TotalVenta = TotalVenta;
    }

    public String getId_Pedido() {
        return Id_Pedido;
    }

    public void setId_Pedido(String Id_Pedido) {
        this.Id_Pedido = Id_Pedido;
    }

    public String getId_Cliente() {
        return Id_Cliente;
    }

    public void setId_Cliente(String Id_Cliente) {
        this.Id_Cliente = Id_Cliente;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    public double getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(double SubTotal) {
        this.SubTotal = SubTotal;
    }

    public double getTotalVenta() {
        return TotalVenta;
    }

    public void setTotalVenta(double TotalVenta) {
        this.TotalVenta = TotalVenta;
    }

}