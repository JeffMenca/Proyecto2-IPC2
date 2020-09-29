
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
public class Informe_Examen_Laboratorio {
    
    //Atributos
    private String codigo;
    private String descripcion;
    private LocalDate fecha;
    private LocalTime hora;
    private String examen_laboratorio_codigo;
    private String paciente_codigo;
    private String laboratorista_codigo;
    
    //Constructor

    public Informe_Examen_Laboratorio(String codigo, String descripcion, LocalDate fecha, LocalTime hora, String examen_laboratorio_codigo, String paciente_codigo, String laboratorista_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.hora = hora;
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
        this.paciente_codigo = paciente_codigo;
        this.laboratorista_codigo = laboratorista_codigo;
        this.insertarInforme_Examen_Laboratorio();
    }
    //Metodo para ingresar informe examen de laboratorio
    public void insertarInforme_Examen_Laboratorio() {
        String query = "INSERT INTO INFORME_EXAMEN_LABORATORIO ("
                + " codigo,"
                + " descripcion,"
                + " fecha,"
                + " hora,"
                + " examen_laboratorio_codigo,"
                + " paciente_codigo,"
                + " laboratorista_codigo) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getCodigo());
            statement.setString(2, getDescripcion());
            statement.setDate(3, Date.valueOf(getFecha()));
            statement.setTime(4, Time.valueOf(getHora()));
            statement.setString(5, getExamen_laboratorio_codigo());
            statement.setString(6, getPaciente_codigo());
            statement.setString(7, getLaboratorista_codigo());

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

    public String getExamen_laboratorio_codigo() {
        return examen_laboratorio_codigo;
    }

    public void setExamen_laboratorio_codigo(String examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }
    
}
