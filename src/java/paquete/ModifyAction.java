package paquete;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class ModifyAction extends ActionSupport
{
        private String username;
        private String password;
        private int rol;
        private int Id;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }    
        
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }
        
 
    public String getUsername() {
	return username;
    }
 
    public void setUsername(String username) {
	this.username = username;
    }
    
    public String getDefaultRol() {
	return "Paciente";
	}
 
    public String execute() {
        System.out.println("Rol: " + rol);
         LoginBeanX lb = new LoginBeanX();
        if(lb.modifyUser(username,password, rol, Id)==1){
            return "exitoso";
        }else{
            return "error";
        }
	}
        
        public String display() {
		return NONE;
	}
        
    }


