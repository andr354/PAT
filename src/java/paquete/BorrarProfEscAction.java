/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paquete;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Dillan
 */
public class BorrarProfEscAction extends ActionSupport {

    int id;
    
    public BorrarProfEscAction() {
    }
    
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        if(lb.borrarPE(id)==1){
            return "exitoso";
        }else{
            return "error";
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
