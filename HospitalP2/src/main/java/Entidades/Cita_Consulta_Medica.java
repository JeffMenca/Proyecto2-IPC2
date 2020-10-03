
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
public class Cita_Consulta_Medica {
    
    //Atributos
    private int codigo;
    private LocalDate fecha;
    private LocalTime hora;
    private int consulta_medica_codigo;
    private String paciente_codigo;
    private String medico_codigo;

    //Constructor

    public Cita_Consulta_Medica(int codigo, LocalDate fecha, LocalTime hora, int consulta_medica_codigo, String paciente_codigo, String medico_codigo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.consulta_medica_codigo = consulta_medica_codigo;
        this.paciente_codigo = paciente_codigo;
        this.medico_codigo = medico_codigo;
        this.insertarCita_Consulta_Medica();
    }
    
    //Metodo para ingresar cita consulta medica
    public void insertarCita_Consulta_Medica() {
        String query = "INSERT INTO CITA_CONSULTA_MEDICA ("
                + " codigo,"
                + " fecha,"
                + " hora,"
                + " consulta_medica_codigo,"
                + " paciente_codigo,"
                + " medico_codigo) VALUES ("
                + " ?, ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setInt(1, 0);
            statement.setDate(2, Date.valueOf(getFecha()));
            statement.setTime(3, Time.valueOf(getHora()));
            statement.setInt(4, getConsulta_medica_codigo());
            statement.setString(5, getPaciente_codigo());
            statement.setString(6, getMedico_codigo());

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
