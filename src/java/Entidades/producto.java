package Entidades;

public class producto {

    private String Id;
    private String Descripcion;
    private double Costo;
    private double Precio;
    private int Cantidad;

    public producto() {
        this.Id = "";
        this.Descripcion = "";
        this.Costo = 0;
        this.Precio = 0;
        this.Cantidad = 0;
    }

    
    public producto(String Id, String Descripcion, double Costo, double Precio, int Cantidad) {
        this.Id = Id;
        this.Descripcion = Descripcion;
        this.Costo = Costo;
        this.Precio = Precio;
        this.Cantidad = Cantidad;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public double getCosto() {
        return Costo;
    }

    public void setCosto(double Costo) {
        this.Costo = Costo;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }
    public double getSubtotal() {
        return Precio * Cantidad;
    }

}
