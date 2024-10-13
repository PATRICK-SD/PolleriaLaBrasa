package Entidades;

public class detallePedido {

    private String Id_Pedido;
    private String Id_Prod;
    private double Cantidad;
    private double Precio;
    private double TotalDeta;

    public detallePedido() {
    }

    public detallePedido(String Id_Pedido, String Id_Prod, double Cantidad, double Precio, double TotalDeta) {
        this.Id_Pedido = Id_Pedido;
        this.Id_Prod = Id_Prod;
        this.Cantidad = Cantidad;
        this.Precio = Precio;
        this.TotalDeta = TotalDeta;
    }

    public String getId_Pedido() {
        return Id_Pedido;
    }

    public void setId_Pedido(String Id_Pedido) {
        this.Id_Pedido = Id_Pedido;
    }

    public String getId_Prod() {
        return Id_Prod;
    }

    public void setId_Prod(String Id_Prod) {
        this.Id_Prod = Id_Prod;
    }

    public double getCantidad() {
        return Cantidad;
    }

    public void setCantidad(double Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public double getTotalDeta() {
        return TotalDeta;
    }

    public void setTotalDeta(double TotalDeta) {
        this.TotalDeta = TotalDeta;
    }

}
