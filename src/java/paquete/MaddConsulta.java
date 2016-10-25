package paquete;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;

public class MaddConsulta extends ActionSupport {

    private int id_cita;
    private String fecha;
    private double costo;
    private String anotaciones;

    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getAnotaciones() {
        return anotaciones;
    }

    public void setAnotaciones(String anotaciones) {
        this.anotaciones = anotaciones;
    }
    
    
    @Override
    public String execute() {
        LoginBeanX lb = new LoginBeanX();
        if (lb.MaddConsulta(id_cita, fecha, costo, anotaciones) == 1) {
            return "exitoso";
        } else {
            return "error";
        }
    }

    public String display() {
        return NONE;
    }

}



