/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author jeffrey
 */
public class Cita_Consulta_Medica {
    
    //Atributos
    private String codigo;
    private LocalDate fecha;
    private LocalTime hora;
    private int consulta_medica_codigo;
    private String paciente_codigo;
    private String medico_codigo;

    //Constructor

    public Cita_Consulta_Medica(String codigo, LocalDate fecha, LocalTime hora, int consulta_medica_codigo, String paciente_codigo, String medico_codigo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.consulta_medica_codigo = consulta_medica_codigo;
        this.paciente_codigo = paciente_codigo;
        this.medico_codigo = medico_codigo;
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

    public int getConsulta_medica_codigo() {
        return consulta_medica_codigo;
    }

    public void setConsulta_medica_codigo(int consulta_medica_codigo) {
        this.consulta_medica_codigo = consulta_medica_codigo;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public String getMedico_codigo() {
        return medico_codigo;
    }

    public void setMedico_codigo(String medico_codigo) {
        this.medico_codigo = medico_codigo;
    }
    

}
