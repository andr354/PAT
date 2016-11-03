package paquete;

import com.opensymphony.xwork2.ActionSupport;

public class EnvMeAction extends ActionSupport {
    private int usuario;
    private String titulo;
    private String texto;
    private int idenvia;

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public int getIdenvia() {
        return idenvia;
    }

    public void setIdenvia(int idenvia) {
        this.idenvia = idenvia;
    }
    
    public EnvMeAction() {
    }
    
    @Override
    public String execute() {
        LoginBeanX lb = new LoginBeanX();
        if (lb.envMSJ(usuario, titulo, texto, idenvia) == 1) {
            return "exitoso";
        } else {
            return "error";
        }
    }
    
}
