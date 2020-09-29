/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import SQLConnector.DbConnection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author jeffrey
 */
public class Informe_Consulta_Medica {
    
    //Atributos
    private String codigo;
    private String descripcion;
    private LocalDate fecha;
    private LocalTime hora;
    private int consulta_medica_codigo;
    private String paciente_codigo;
    private String medico_codigo;
    
    //Constructor

    public Informe_Consulta_Medica(String codigo, String descripcion, LocalDate fecha, LocalTime hora, int consulta_medica_codigo, String paciente_codigo, String medico_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.hora = hora;
        this.consulta_medica_codigo = consulta_medica_codigo;
        this.paciente_codigo = paciente_codigo;
        this.medico_codigo = medico_codigo;
        insertarInforme_Consulta_Medica();
    }
    
    //Metodo para ingresar informe consulta medica
    public void insertarInforme_Consulta_Medica() {
        String query = "INSERT INTO INFORME_CONSULTA_MEDICA ("
                + " codigo,"
                + " descripcion,"
                + " fecha,"
                + " hora,"
                + " consulta_medica_codigo,"
                + " paciente_codigo,"
                + " medico_codigo) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getCodigo());
            statement.setString(2, getDescripcion());
            statement.setDate(3, Date.valueOf(getFecha()));
            statement.setTime(4, Time.valueOf(getHora()));
            statement.setInt(5, getConsulta_medica_codigo());
            statement.setString(6, getPaciente_codigo());
            statement.setString(7, getMedico_codigo());

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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
