package paquete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author Andrés
 */
public class enviarmail {
    
    Connection con = null;
    PreparedStatement pst = null; 
    ResultSet rs = null;
    boolean status = false;
    
    public int enviarmail(int id_curso, String tit_oat){
        Mailp mailp = new Mailp();
        String mail = "";
        String texto = "Estimado usuario, le informamos que se ha publicado un nuevo OAT en un curso al que esta inscrito, ¡Que lo disfrute!  De parte del equipo de PAT le mandamos saludos";
        try {
            con = Conexion.getConexion();
            String consulta = "select email from users, inscritos where users.idUser=inscritos.id_usu and inscritos.id_curso="+id_curso+";";
            System.out.println(consulta);
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery(consulta);
            while(rs.next()){
                mail = rs.getString("users.email");
                mailp.enviarMail(texto, "agze300@gmail.com", "Nuevo OAT: " + tit_oat);
            }
        } catch (Exception e) {  
            System.out.println(e);  
            return 0;
        }
        return 1;
    }
    
}
