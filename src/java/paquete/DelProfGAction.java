package paquete;

public class DelProfGAction {
    
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int Id) {
        this.id = Id;
    }
    
    public DelProfGAction() {
    }
    
    public String execute() throws Exception {
        LoginBeanX lb = new LoginBeanX();
        if(lb.deleteProfG(id)==1){
            return "exitoso";
        }else{
            return "error";
        }
    }
    
}