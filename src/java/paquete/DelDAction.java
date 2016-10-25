package paquete;

public class DelDAction {
    
    private int Id;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }
    
    public DelDAction() {
    }
    
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        if(lb.deleteD(Id)==1){
            return "exitoso";
        }else{
            return "error";
        }
    }
    
}