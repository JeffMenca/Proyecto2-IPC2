
package Entidades;

import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author jeffrey
 */
public class Cita_Examen_Laboratorio {
    
    //Atributos
    private String codigo;
    private LocalDate fecha;
    private LocalTime hora;
    private String paciente_codigo;
    private String examen_laboratorio;
    private Blob orden;
    private String laboratorista_codigo;
    
    //Constructor

    public Cita_Examen_Laboratorio(String codigo, LocalDate fecha, LocalTime hora, String paciente_codigo, String examen_laboratorio, Blob orden, String laboratorista_codigo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.paciente_codigo = paciente_codigo;
        this.examen_laboratorio = examen_laboratorio;
        this.orden = orden;
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public String getExamen_laboratorio() {
        return examen_laboratorio;
    }

    public void setExamen_laboratorio(String examen_laboratorio) {
        this.examen_laboratorio = examen_laboratorio;
    }

    public Blob getOrden() {
        return orden;
    }

    public void setOrden(Blob orden) {
        this.orden = orden;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }
    
}
