package paquete;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;

public class CaddAction extends ActionSupport {

    private int id_usu;
    private int id_med;
    private String fecha;
    private String hora;
    private String motivo;

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public int getId_med() {
        return id_med;
    }

    public void setId_med(int id_med) {
        this.id_med = id_med;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
   

   
    
    @Override
    public String execute() {
        LoginBeanX lb = new LoginBeanX();
        if (lb.PaddCita(id_usu, id_med, fecha, hora, motivo) == 1) {
            return "exitoso";
        } else {
            return "error";
        }
    }

    public String display() {
        return NONE;
    }

}



