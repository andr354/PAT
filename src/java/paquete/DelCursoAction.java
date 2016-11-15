package paquete;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Dillan
 */
public class DelCursoAction extends ActionSupport {
    
    int id_curso;

    public int getId_curso() {
        return id_curso;
    }

    public void setId_curso(int id_curso) {
        this.id_curso = id_curso;
    }
    
    @Override
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        return lb.borrarCurso(id_curso);
    }    
    
    public DelCursoAction() {
    } 
}

