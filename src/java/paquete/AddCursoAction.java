/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paquete;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Asus
 */
public class AddCursoAction extends ActionSupport {
    
    private int idu;
    private String nombre;
    private String desc;

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

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    
    public AddCursoAction() {
    }
    
    @Override
    public String execute() {
        LoginBean lb = new LoginBean();
        if (lb.addCurso(idu, nombre, desc) == 1) {
            return "exitoso";
        } else {
            return "error";
        }
    }
    
}
