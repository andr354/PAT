package paquete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

class LoginBeanX{
    Connection con = null;
    PreparedStatement pst = null; 
    ResultSet rs = null;
    boolean status = false;
    
    private HashMap validUsers = new HashMap();

    public LoginBeanX(){
    }

    public int validateUser(String userName, String password){
        String nombre = "";
        String pass = "";
        int id = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "Select * from users where id=? and password=?";
            pst = con.prepareStatement(consulta);
            pst.setString(1, userName);
            pst.setString(2, password);
            rs = pst.executeQuery();
            status = rs.next();   
            if(status){
                id = rs.getInt("users.nivel");//acc_usu se convirtio en nivel y usuarios en users ;)
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
        } 
        return id;
    }
    
    public int getAccess(int id){
        try{
            con = Conexion.getConexion();
            String consulta = "Select acc_usu from usuarios where id_usu=?;";
            pst = con.prepareStatement(consulta);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            int acc = rs.getInt("usuarios.acc_usu");
            return acc;
        }catch (Exception e){
            System.out.println(e);
        }
        return 0;
    }
    
    public int modifyUser(String userName, String password, int rol, int id, String mail){
        int status = 0;
        String pass2 = "";
        try {
            con = Conexion.getConexion();
            String nivel = "RUSER";
            if(rol==5){
                nivel = "PROFFESOR";
            }else if(rol==4){
                nivel = "PROFFESOR+";
            }else if(rol==3){
                nivel = "ADMIN";
            }else if(rol==2){
                nivel = "STUDENT";
            }
            if(password==""){
                pst = con.prepareStatement("SELECT users.password FROM users WHERE users.idUser="+id+"");
                rs = pst.executeQuery("SELECT users.password FROM users WHERE users.idUser="+id+"");
                pass2 = rs.getString("users.password");
                password = pass2;
            }
            String consulta = "update users\n" +
                            "set id='"+userName+"', password='"+password+"', rol='"+nivel+"', nivel='"+rol+"'\n, email='"+mail+"'\n" +
                            "where idUser='"+id+"';"; //tambien esta al reves pero nimodo de nuevo
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int modifyStudent(String nom, String app, int id, int idprof){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "update students\n" +
                            "set nom_std='"+nom+"', app_std='"+app+"', idprofesor="+idprof+"\n" +
                            "where id_std="+id+";"; 
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int modifyPG(String nom, String app, int id, String esp){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "update profesores\n" +
                            "set nom_prof='"+nom+"', apps_prof='"+app+"', esp_prof='"+esp+"'\n" +
                            "where id_prof='"+id+"';"; 
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int MModifyUser(int id, String nom, String aps, String callen, String colonia, String del, String cd, String ced, String edad, String esp){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "update medicos set nom_med='"+nom+"', ap_med='"+aps+"', calle_med='"+callen+"', Col_med='"+colonia+"', "
                    + "Del_med='"+del+"', Cd_med='"+cd+"', "
                    + "Ced_med='"+ced+"', Ed_med='"+edad+"', Esp_med='"+esp+"' WHERE id_med="+id+";";
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
            con = Conexion.getConexion();
            String consulta = "DELETE FROM usuarios\n" +
                                "WHERE id_usu='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int deleteProfG(int id){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "DELETE FROM profesores\n" +
                                "WHERE id_usu='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=deleteProfGPart2(id);
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int deleteProfGPart2(int id){
        try {
            con = Conexion.getConexion();
            String consulta = "update users set rol='RUSER', nivel=1 WHERE idUser='"+id+"' ";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            return 1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return 0;
    }
    
    public int MdeleteUser(int id){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "DELETE FROM medicos\n" +
                                "WHERE id_med='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int addAlumno(int id_usu, String nombre, String apellido, int id_prof){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "insert into students(id_usu,idprofesor, nom_std, app_std) values(" + id_usu + "," + id_prof + ", '"+nombre+"', '"+apellido+"');";//ya se que esta al reves pero nimodo :D
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=addAlumnoPlus(id_usu);
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int addAlumnoPlus(int id_usu){
        try{
            con = Conexion.getConexion();
            String consulta = "update users set nivel=2 WHERE id_usu='"+id_usu+"'";
            return 1;
        }catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
    
    public int addProfG(int id_usu, String nombre, String apellido, String esp){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "insert into profesores(id_usu,nom_prof, apps_prof, esp_prof) values(" + id_usu + ", '"+nombre+"', '"+apellido+"', '"+esp+"');";
            System.out.println(consulta);
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int addOAT(int id, String titulo, String desc, int curso, String contenido){
        Calendar fecha = new GregorianCalendar();
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        int hora = fecha.get(Calendar.HOUR_OF_DAY);
        int minuto = fecha.get(Calendar.MINUTE);
        int segundo = fecha.get(Calendar.SECOND);
        String cont = contenido.replace('"','\"');
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "insert into oats(id_prof,titulo, descrip, diagrama, curso) values(" + id + ", '"+titulo+"', '"+desc+"', '"+cont +"', "+curso+");";
            System.out.println(consulta);
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int addUser(String userName, String password, int rol, String mail){
        int status = 0;
        String nivel = "RUSER";
            if(rol==5){
                nivel = "PROFFESOR";
            }else if(rol==4){
                nivel = "PROFFESOR+";
            }else if(rol==3){
                nivel = "ADMIN";
            }else if(rol==2){
                nivel = "STUDENT";
            }
        try {
            con = Conexion.getConexion();
            String consulta = "insert into users(id, password, rol, nivel, email) values('"+userName+"', '"+password+"', '"+nivel+"', '"+rol+"', '"+mail+"');";//ya se que esta al reves pero nimodo :D
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int MaddUser(String nom, String aps, String callen, String colonia, String del, String cd, String ced, String edad, String esp){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "insert into medicos(nom_med, ap_med, calle_med, Col_med, Del_med, Cd_med, Ced_med, Ed_med, Esp_med) values('"+nom+"', '"+aps+"', '"+callen+"', '"+colonia+"', '"+del+"', '"+cd+"', '"+ced+"', '"+edad+"', '"+esp+"');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int PaddUser(int id_usu, String nom_pac, String apps_pac, String sexo, String tel_pac, String mail_pac, String dir_pac, String edad_pac) {
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "insert into pacientes(id_usu, nom_pac, apps_pac, sexo, tel_pac, mail_pac, dir_pac, edad_pac)values('" + id_usu + "','" + nom_pac + "', '" + apps_pac + "', '" + sexo + "','" + tel_pac + "','" + mail_pac + "','" + dir_pac + "','" + edad_pac + "');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    public int PaddCita(int id_usu, int id_med, String fecha, String hora, String motivo) {
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "insert into citas(id_usu, id_med, fecha, hora, motivo)values(" + id_usu + "," + id_med + ", '" + fecha + "', '" + hora + "','" + motivo + "');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    public int MaddConsulta(int id_cita, String fecha, double costo, String anotaciones) {
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "insert into consultas(id_cita, fecha, costo, anotaciones)values('" + id_cita + "','" + fecha + "', '" + costo + "', '" + anotaciones + "');";
            String consulta2 = "UPDATE citas set estado=1 WHERE id_cita="+id_cita+";";
            pst = con.prepareStatement(consulta);
            pst = con.prepareStatement(consulta2);
            int cols = pst.executeUpdate(consulta);
            int cols2 = pst.executeUpdate(consulta2);
            status = 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    public int MModifyPac(int id, String nom_pac, String apps_pac, String sexo, String tel_pac, String mail_pac,String dir_pac, String edad_pac){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "update pacientes set nom_pac='"+nom_pac+"', apps_pac='"+apps_pac+"', sexo='"+sexo+"', tel_pac='"+tel_pac+"', mail_pac='"+mail_pac+"', dir_pac='"+dir_pac+"', edad_pac='"+edad_pac+"' WHERE id_pac="+id+"";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    
    public int deletePa(int id){
        int status = 0;
        try {
            con = Conexion.getConexion();
            String consulta = "DELETE FROM pacientes\n" +
                                "WHERE id_pac='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
}