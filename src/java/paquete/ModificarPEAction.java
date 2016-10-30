
/**
 *
 * @author Dillan
 */
package paquete;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;

public class ModificarPEAction extends ActionSupport {
    
    private int id;
    private String nombre;
    private String apellidos;
    private String escuela;

    @Override
    public String execute() {
        LoginBean lb = new LoginBean();
        if (lb.modifyPE(nombre, apellidos, escuela, id) == 1) {
            System.out.println(nombre +" "+ apellidos +" "+ escuela +" "+ id );
            return "exitoso";
        } else {
            return "error";
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String display() {
        return NONE;
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
