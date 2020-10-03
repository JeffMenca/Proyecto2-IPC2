package Logica;

import Entidades.Especialidad;
import SQLConnector.DbConnection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author jeffrey
 */
public class HorarioMedico {

    private String codigo_medico;
    private LocalDate fecha_ingresada;
    private Time horario_salida;
    private Time horario_entrada;

    public HorarioMedico(String codigo_medico, LocalDate fecha_ingresada) {
        this.codigo_medico = codigo_medico;
        this.fecha_ingresada = fecha_ingresada;
        ObtenerHorario();
    }

    public void ObtenerHorario() {
        try {
            String queryselect = "SELECT * FROM MEDICO WHERE codigo='" + getCodigo_medico() + "'";
            Statement statements = DbConnection.getConnection().createStatement();
            ResultSet resultset = statements.executeQuery(queryselect);
            while (resultset.next()) {
                setHorario_entrada(resultset.getTime("horario_entrada"));
                setHorario_salida(resultset.getTime("horario_salida"));
            }
        } catch (Exception e) {
        }
    }

    public ResultSet citasMedicas(String hora) {
        String query = "SELECT * FROM CITA_CONSULTA_MEDICA WHERE hora=? && fecha=? && medico_codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            int horaEntera=Integer.valueOf(hora);
            statement.setTime(1, Time.valueOf(LocalTime.of(horaEntera, 0)));
            statement.setDate(2, Date.valueOf(getFecha_ingresada()));
            statement.setString(3, getCodigo_medico());
            //Ejecuta el select
            ResultSet resultset = statement.executeQuery();
            return resultset;
        } catch (SQLException e) {

        }
        return null;
    }

    public String[] obtenerHorasMedico() {
        int contadorHoras = 0;
        //Milisegundos
        long diferencia_milisegundos = getHorario_salida().getTime() - getHorario_entrada().getTime();
        //Convertir a horas
        int diferencia_horas = (int) ((diferencia_milisegundos / (1000 * 60 * 60)) % 24);
        //Horas totales
        String[] obtener_horainicio = getHorario_entrada().toString().split(":");
        String[] obtener_horafinal = getHorario_salida().toString().split(":");
        //Horas en numeros enteross
        int hora_inicio = Integer.parseInt(obtener_horainicio[0]);
        int hora_final = Integer.parseInt(obtener_horafinal[0]);
        String[] horas_disponibles = new String[diferencia_horas];
        //Se van guardando las hora entre el intervalo
        for (int i = hora_inicio; i < hora_final; i++) {
            horas_disponibles[contadorHoras] = String.valueOf(i);
            contadorHoras++;
        }

        return horas_disponibles;
    }

    public ArrayList comprobarDisponibilidad() {
        try {
            String[] horas = obtenerHorasMedico();
            ArrayList horasDisponibles = new ArrayList();
            for (int i = 0; i < horas.length; i++) {
                if (!citasMedicas(horas[i]).next()) {
                    horasDisponibles.add(LocalTime.of(Integer.valueOf(horas[i]),0));
                }
            }
            return horasDisponibles;
        } catch (Exception e) {
            return null;
        }
    }

    public String getCodigo_medico() {
        return codigo_medico;
    }

    public void setCodigo_medico(String codigo_medico) {
        this.codigo_medico = codigo_medico;
    }

    public LocalDate getFecha_ingresada() {
        return fecha_ingresada;
    }

    public void setFecha_ingresada(LocalDate fecha_ingresada) {
        this.fecha_ingresada = fecha_ingresada;
    }

    public Time getHorario_salida() {
        return horario_salida;
    }

    public void setHorario_salida(Time horario_salida) {
        this.horario_salida = horario_salida;
    }

    public Time getHorario_entrada() {
        return horario_entrada;
    }

    public void setHorario_entrada(Time horario_entrada) {
        this.horario_entrada = horario_entrada;
    }

}
