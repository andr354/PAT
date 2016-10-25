package paquete;

import static com.opensymphony.xwork2.Action.NONE;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class califAction extends ActionSupport
{
        private String nts;
        private int calif;
        private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNts() {
        return nts;
    }

    public void setNts(String nts) {
        this.nts = nts;
    }

    public int getCalif() {
        return calif;
    }

    public void setCalif(int calif) {
        this.calif = calif;
    }

 
    public String execute() {
         LoginBean lb = new LoginBean();
        if(lb.Calif(calif, nts, id)==1){
            return "exitoso";
        }else{
            return "error";
        }
	}
        
        public String display() {
		return NONE;
	}
        
    }



