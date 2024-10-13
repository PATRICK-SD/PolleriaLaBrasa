package Entidades;

public class venta {

    int item;
    String nomProductoV;

    String idPedido;
    String idClienteV;
    String fecha;
    Double subTotalV;
    Double totalVenta;

    String idProductoV;
    int cantidadV;
    Double precioV;
    Double totalDVenta;

    public venta() {
    }

    public venta(int item, String nomProductoV, String idPedido, String idClienteV, String fecha, Double subTotalV, Double totalVenta, String idProductoV, int cantidadV, Double precioV, Double totalDVenta) {
        this.item = item;
        this.nomProductoV = nomProductoV;
        this.idPedido = idPedido;
        this.idClienteV = idClienteV;
        this.fecha = fecha;
        this.subTotalV = subTotalV;
        this.totalVenta = totalVenta;
        this.idProductoV = idProductoV;
        this.cantidadV = cantidadV;
        this.precioV = precioV;
        this.totalDVenta = totalDVenta;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public String getNomProductoV() {
        return nomProductoV;
    }

    public void setNomProductoV(String nomProductoV) {
        this.nomProductoV = nomProductoV;
    }

    public String getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(String idPedido) {
        this.idPedido = idPedido;
    }

    public String getIdClienteV() {
        return idClienteV;
    }

    public void setIdClienteV(String idClienteV) {
        this.idClienteV = idClienteV;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getSubTotalV() {
        return subTotalV;
    }

    public void setSubTotalV(Double subTotalV) {
        this.subTotalV = subTotalV;
    }

    public Double getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(Double totalVenta) {
        this.totalVenta = totalVenta;
    }

    public String getIdProductoV() {
        return idProductoV;
    }

    public void setIdProductoV(String idProductoV) {
        this.idProductoV = idProductoV;
    }

    public int getCantidadV() {
        return cantidadV;
    }

    public void setCantidadV(int cantidadV) {
        this.cantidadV = cantidadV;
    }

    public Double getPrecioV() {
        return precioV;
    }

    public void setPrecioV(Double precioV) {
        this.precioV = precioV;
    }

    public Double getTotalDVenta() {
        return totalDVenta;
    }

    public void setTotalDVenta(Double totalDVenta) {
        this.totalDVenta = totalDVenta;
    }

}
