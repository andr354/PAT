package paquete;

import static com.opensymphony.xwork2.Action.NONE;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;

public class AddProfGAction extends ActionSupport {
    
    private int idu;
    private String nombre;
    private String apps;
    private String esp;

    public String getEsp() {
        return esp;
    }

    public void setEsp(String esp) {
        this.esp = esp;
    }

    public int getIdu() {
        return idu;
    }

    public void setIdu(int idu) {
        this.idu = idu;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApps() {
        return apps;
    }

    public void setApps(String apps) {
        this.apps = apps;
    }
    
    @Override
    public String execute() {
        LoginBeanX lb = new LoginBeanX();
        if (lb.addProfG(idu, nombre, apps, esp) == 1) {
            return "exitoso";
        } else {
            return "error";
        }
    }
    
    public String display() {
        return NONE;
    }
    
}
