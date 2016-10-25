package paquete;

public class DelAction {
    
    private int Id;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }
    
    public DelAction() {
    }
    
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        if(lb.deleteUser(Id)==1){
            return "exitoso";
        }else{
            return "error";
        }
    }
    
}
