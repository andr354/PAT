package paquete;

import com.opensymphony.xwork2.ActionSupport;

public class inscAction extends ActionSupport {
    private int idc;
    private int idu;

    public int getIdc() {
        return idc;
    }

    public void setIdc(int idc) {
        this.idc = idc;
    }

    public int getIdu() {
        return idu;
    }

    public void setIdu(int idu) {
        this.idu = idu;
    }
    public inscAction() {
    }
    
    public String execute() {
         LoginBean lb = new LoginBean();
        if(lb.inscribirC(idc, idu)==1){
            return "exitoso";
        }else{
            return "error";
        }
	}
    
}
