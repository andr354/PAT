/**
 *
 * @author Dillan
 */
package paquete;

import static com.opensymphony.xwork2.Action.NONE;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;


public class AddProfEscAction extends ActionSupport{
    private int id_usuario;
    private String nombre;
    private String apellidos;
    private String escuela;

    @Override
    public String execute() {
        LoginBean lb = new LoginBean();
        if (lb.addProfEsc(id_usuario, nombre, apellidos, escuela) == 1) {
            return "exitoso";
        } else {
            return "error";
        }
    }

    public String display() {
        return NONE;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEscuela() {
        return escuela;
    }

    public void setEscuela(String escuela) {
        this.escuela = escuela;
    }
    
    
}
