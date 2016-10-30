package paquete;

import com.opensymphony.xwork2.ActionSupport;

public class AddOATAction extends ActionSupport {
    
    private int id;
    private String titulo;
    private String desc;
    private int curso;
    private String contenido; //ver cusntos caracteres soporta string

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getCurso() {
        return curso;
    }

    public void setCurso(int curso) {
        this.curso = curso;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
    
    public AddOATAction() {
    }
    
    @Override
    public String execute() {
        LoginBeanX lb = new LoginBeanX();
        if (lb.addOAT(id, titulo, desc, curso, contenido) == 1) {
            return "exitoso";
        } else {
            return "error";
        }
    }
    
}
