package paquete;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class ModifyStudentAction extends ActionSupport
{
        private String noms;
        private String apps;
        private int id;
        private int idprof;     

    public String getNoms() {
        return noms;
    }

    public void setNoms(String noms) {
        this.noms = noms;
    }

    public String getApps() {
        return apps;
    }

    public void setApps(String apps) {
        this.apps = apps;
    }

    public int getIdprof() {
        return idprof;
    }

    public void setIdprof(int idprof) {
        this.idprof = idprof;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
        
 
    public String execute() {
         LoginBeanX lb = new LoginBeanX();
        if(lb.modifyStudent(noms,apps, id, idprof)==1){
            return "exitoso";
        }else{
            return "error";
        }
	}
        
        public String display() {
		return NONE;
	}
        
    }
