package paquete;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;

public class ModifyP extends ActionSupport
{
        private String nom_pac;
        private String apps_pac;
        private String sexo;
        private String tel_pac;
        private String mail_pac;
        private String dir_pac;
        private String edad_pac;
        private int id;

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
 
        @Override
    public String execute() {
         LoginBeanX lb = new LoginBeanX();
        if(lb.MModifyPac(id,nom_pac,apps_pac,sexo,tel_pac,mail_pac,dir_pac,edad_pac)==1){
            return "exitoso";
        }else{
            return "error";
        }
	}
        
        public String display() {
		return NONE;
	}
        
    }


