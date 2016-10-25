package paquete;

public class deletePaciente {
    
    private int Id;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }
    
    public deletePaciente() {
    }
    
    public String execute() throws Exception {
        LoginBeanX lb = new LoginBeanX();
        if(lb.deletePa(Id)==1){
            return "exitoso";
        }else{
            return "error";
        }
    }
    
}