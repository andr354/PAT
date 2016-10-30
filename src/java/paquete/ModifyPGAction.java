package paquete;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class ModifyPGAction extends ActionSupport
{
        private int id;    
        private String noms;
        private String apps;
        private String esp;     

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getEsp() {
        return esp;
    }

    public void setEsp(String esp) {
        this.esp = esp;
    }

    public String execute() {
         LoginBeanX lb = new LoginBeanX();
        if(lb.modifyPG(noms,apps, id, esp)==1){
            return "exitoso";
        }else{
            return "error";
        }
	}
        
        public String display() {
		return NONE;
	}
        
    }

