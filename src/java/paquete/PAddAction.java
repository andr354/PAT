package paquete;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;

public class PAddAction extends ActionSupport {

    private int id_usu;
    private String nom_pac;
    private String apps_pac;
    private String sexo;
    private String tel_pac;
    private String mail_pac;
    private String dir_pac;
    private String edad_pac;
    public String mensaje;

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public String getNom_pac() {
        return nom_pac;
    }

    public void setNom_pac(String nom_pac) {
        this.nom_pac = nom_pac;
    }

    public String getApps_pac() {
        return apps_pac;
    }

    public void setApps_pac(String apps_pac) {
        this.apps_pac = apps_pac;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getTel_pac() {
        return tel_pac;
    }

    public void setTel_pac(String tel_pac) {
        this.tel_pac = tel_pac;
    }

    public String getMail_pac() {
        return mail_pac;
    }

    public void setMail_pac(String mail_pac) {
        this.mail_pac = mail_pac;
    }

    public String getDir_pac() {
        return dir_pac;
    }

    public void setDir_pac(String dir_pac) {
        this.dir_pac = dir_pac;
    }

    public String getEdad_pac() {
        return edad_pac;
    }

    public void setEdad_pac(String edad_pac) {
        this.edad_pac = edad_pac;
    }
    
    @Override
    public String execute() {
         mensaje = "Estimado usuario(a) "+nom_pac+" "+apps_pac+", ¡bienvenido a SITA! \n usted ha sido registrado exitosamente y a partir de ahora"+
            "puede pedir, revisar y administrar sus citas con nosotros en linea, sus credenciales de acceso son las mismas que se le dieron en el momento "+
            "de su registro como usuario. \n\n"+
            "Atentamente: El equipo de SITA";
        LoginBeanX lb = new LoginBeanX();
        if (lb.PaddUser(id_usu, nom_pac, apps_pac, sexo, tel_pac, mail_pac, dir_pac, edad_pac) == 1) {
            Mail mail = new Mail();
            mail.enviarMail(mensaje, mail_pac, "Bienvenido a SITA");
            return "exitoso";
        } else {
            return "error";
        }
    }

    public String display() {
        return NONE;
    }

}