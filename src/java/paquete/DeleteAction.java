package paquete;

public class DeleteAction {
    
    private int Id;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }
    
    public DeleteAction() {
    }
    
    public String execute() throws Exception {
        LoginBeanX lb = new LoginBeanX();
        if(lb.deleteUser(Id)==1){
            return "exitoso";
        }else{
            return "error";
        }
    }
    
}
