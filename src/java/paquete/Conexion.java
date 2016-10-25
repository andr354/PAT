package paquete;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static Connection cn = null;
    private static String URL = "jdbc:mysql://localhost:3306/sita";
    private static String usuario = "root";
    private static String contrasena = "12345678";
    
    public static Connection getConexion() throws SQLException {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        cn = DriverManager.getConnection(URL, usuario, contrasena);
        return cn;
    }
}
