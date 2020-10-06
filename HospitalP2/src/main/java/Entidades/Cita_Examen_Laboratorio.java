package Entidades;

import SQLConnector.DbConnection;
import java.sql.Blob;
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
public class Cita_Examen_Laboratorio {

    //Atributos
    private int codigo;
    private LocalDate fecha;
    private LocalTime hora;
    private String paciente_codigo;
    private String orden;
    private String laboratorista_codigo;

    //Constructor
    public Cita_Examen_Laboratorio(int codigo, LocalDate fecha, LocalTime hora, String paciente_codigo, String orden, String laboratorista_codigo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.paciente_codigo = paciente_codigo;
        this.orden = orden;
        this.laboratorista_codigo = laboratorista_codigo;
        this.insertarCita_Examen_Laboratorio();
    }
    //Metodo para ingresar cita examen de laboratorio

    public void insertarCita_Examen_Laboratorio() {
        String query = "INSERT INTO CITA_EXAMEN_LABORATORIO ("
                + " codigo,"
                + " fecha,"
                + " hora,"
                + " paciente_codigo,"
                + " orden,"
                + " laboratorista_codigo) VALUES ("
                + " ?, ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setInt(1, 0);
            statement.setDate(2, Date.valueOf(getFecha()));
            statement.setTime(3, Time.valueOf(getHora()));
            statement.setString(4, getPaciente_codigo());
            statement.setString(5, getOrden());
            statement.setString(6, getLaboratorista_codigo());

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
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

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }

}
