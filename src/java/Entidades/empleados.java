package Entidades;

public class empleados {

    private String id;
    private String Nombres;
    private String Apellidos;
    private String DNI;
    private String Cargo;
    private String Direccion;
    private String Telefono;
    private String Password;

    public empleados() {
    }

    public empleados(String id, String Nombres, String Apellidos, String DNI, String Cargo, String Direccion, String Telefono, String Password) {
        this.id = id;
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
        this.DNI = DNI;
        this.Cargo = Cargo;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Password = Password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getCargo() {
        return Cargo;
    }

    public void setCargo(String Cargo) {
        this.Cargo = Cargo;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
    
    

}
