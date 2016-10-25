package paquete;

public class MDeleteAction {
    
    private int Id;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }
    
    public MDeleteAction() {
    }
    
    public String execute() throws Exception {
        LoginBeanX lb = new LoginBeanX();
        if(lb.MdeleteUser(Id)==1){
            return "exitoso";
        }else{
            return "error";
        }
    }
    
}
