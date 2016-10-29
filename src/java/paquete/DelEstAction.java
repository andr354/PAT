package paquete;

public class DelEstAction {
    
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int Id) {
        this.id = Id;
    }
    
    public DelEstAction() {
    }
    
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        if(lb.deleteUserEst(id)==1){
            return "exitoso";
        }else{
            return "error";
        }
    }
    
}