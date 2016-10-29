package paquete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

class LoginBean{
    Connection con = null;
    PreparedStatement pst = null; 
    ResultSet rs = null;
    boolean status = false;
    
    private HashMap validUsers = new HashMap();

    public LoginBean(){
    }

    public int validateUser(String userName, String password){
        String nombre = "";
        String pass = "";
        int id = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "Select * from users where id=? and password=?";
            pst = con.prepareStatement(consulta);
            pst.setString(1, userName);
            pst.setString(2, password);
            rs = pst.executeQuery();
            status = rs.next(); 
            if(status){
                id = rs.getInt("users.nivel");
                return(id);
            }
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (con != null) {  
                try {  
                    con.close();  
                } catch (SQLException e) {  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {    
                }  
            }  
        } 
        return 0;
    }
    
    public int modifyUser(String userName, String password, int nivel, int id){
        int status = 0;
        String pass2 = "";
        try {
            con = DataSource.getInstance().getConnection();
            String rol = "STUDENT";
            if(nivel==3){
                rol = "ADMIN";
            }else if(nivel == 2){
                rol = "PROFESSOR";
            }
            if(password==""){
                pst = con.prepareStatement("SELECT users.password FROM users WHERE users.idUser="+id+"");
                rs = pst.executeQuery("SELECT users.password FROM users WHERE users.idUser="+id+"");
                pass2 = rs.getString("users.password");
                password = pass2;
            }
            System.out.println("ejecutando consulta");
            String consulta = "update users\n" +
                            "set id='"+userName+"', password='"+password+"', rol='"+rol+"', nivel='"+nivel+"'\n" +
                            "where idUser='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int deleteUser(int id){
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM users\n" +
                                "WHERE idUser='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int deleteUserEst(int id){
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM students\n" +
                                "WHERE id_usu="+id+";";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=deleteUserEst2(id);
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    public int deleteUserEst2(int id){
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "UPDATE users set rol = 'RUSER', nivel=1 where idUser="+id+" ;";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int addUser(String userName, String password, int rol){
        int status = 0;
        String nivel = "STUDENT";
            if(rol==3){
                nivel = "ADMIN";
            }else if(rol==2){
                nivel = "PROFESOR";
            }
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "insert into users(id, password, rol, nivel) values('"+userName+"', '"+password+"', '"+nivel+"', '"+rol+"');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int addData(String nombre, String apps, int grupo, int id){
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "insert into students(id_usu, nom_std, app_std, grp_std) values('"+id+"', '"+nombre+"', '"+apps+"', '"+grupo+"');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int Calif(int calif, String nota, int id){
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            //String consulta = "insert into diagramas(calif, notaP) values('"+calif+"', '"+nota+"') where id_dig='"+id+"';";
            String consulta = "update diagramas\n" +
                            "set calif='"+calif+"', notaP='"+nota+"'\n" +
                            "where id_dig='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int Comment(String comment, int ide, int idd){
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            //String consulta = "insert into diagramas(calif, notaP) values('"+calif+"', '"+nota+"') where id_dig='"+id+"';";
            String consulta = "insert into diagramas(Id_stdn, id_dgp, descripcion) values('"+ide+"', '"+idd+"', '"+comment+"');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int deleteD(int id){
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM diagramasP WHERE id_dip='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
}
