package paquete;

import com.opensymphony.xwork2.ActionSupport;

public class ModifyGrpAction extends ActionSupport {
    private int id;
    private int grupo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGrupo() {
        return grupo;
    }

    public void setGrupo(int grupo) {
        this.grupo = grupo;
    }
    public ModifyGrpAction() {
    }
    
    @Override
    public String execute() {
        LoginBean lb = new LoginBean();
        if (lb.addGrupo(id, grupo) == 1) {
            return "exitoso";
        } else {
            return "error";
        }
    }
    
}
