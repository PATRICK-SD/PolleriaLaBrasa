/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;
import java.sql.Connection;
//com.mysql.cj.jdbc.JdbcConnection;
//com.mysql.jdbc.Driver
import java.sql.DriverManager;
import java.sql.SQLException;
//import javax.swing.JOptionPane;

/**
 *
 * @author javie
 */
public class conexionBD {
    static String driver="com.mysql.jdbc.Driver";
    static String url="jdbc:mysql://localhost:3306/bd_rest";
    static String user="root";
    static String pass="";
    protected Connection conn=null;
    public conexionBD() {
            try{
            Class.forName(driver);
            conn= (Connection) DriverManager.getConnection(url,user,pass);
            if(conn!=null){
                System.out.println("Conexión realizada..."+conn);
                //JOptionPane.showMessageDialog(null,"Conectado");
            }
         }catch(SQLException ex){
             System.out.println("Conexión fallida..."+ex.getMessage());
         }catch (ClassNotFoundException ex) {
            System.out.println("Falta Driver "+ex.getMessage());
        }       
    }
    public Connection Connected(){
        return conn;
    }
    public Connection Discconet(){    
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Error de desconexión.. "+ex.getMessage());
        }
        return null;
    }

    public Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
