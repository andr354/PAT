package paquete;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Dillan
 */
public class ModOatAction extends ActionSupport {

    private String titulo;
    private String descrip;
    private String grupo;
    private String diagrama;
    private int id;
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getDiagrama() {
        return diagrama;
    }

    public void setDiagrama(String diagrama) {
        this.diagrama = diagrama;
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

    public String execute() {
        LoginBean lg = new LoginBean();
        if (lg.modificaOAT(titulo, descrip, grupo, diagrama, id)) {
            return "exitoso";
        }
        return "error";
    }

}
