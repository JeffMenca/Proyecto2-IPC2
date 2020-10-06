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
public class HorarioLaboratorista {

    private String codigo_laboratorista;
    private LocalDate fecha_ingresada;
    private Time horario_salida = Time.valueOf(LocalTime.of(23, 0));
    private Time horario_entrada = Time.valueOf(LocalTime.of(0, 0));
    private String diaSeleccionado;

    public HorarioLaboratorista(String codigo_laboratorista, LocalDate fecha_ingresada, String diaSeleccionado) {
        this.codigo_laboratorista = codigo_laboratorista;
        this.fecha_ingresada = fecha_ingresada;
        this.diaSeleccionado = diaSeleccionado;
    }

    public ResultSet citasLab(String hora) {
        String query = "SELECT * FROM CITA_EXAMEN_LABORATORIO WHERE hora=? && fecha=? && laboratorista_codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            int horaEntera = Integer.valueOf(hora);
            statement.setTime(1, Time.valueOf(LocalTime.of(horaEntera, 0)));
            statement.setDate(2, Date.valueOf(getFecha_ingresada()));
            statement.setString(3, getCodigo_laboratorista());
            //Ejecuta el select
            ResultSet resultset = statement.executeQuery();
            return resultset;
        } catch (SQLException e) {

        }
        return null;
    }

    public String[] obtenerHorasLab() {
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
            String[] horas = obtenerHorasLab();
            Boolean diaDisponible=false;
            ArrayList horasDisponibles = new ArrayList();
            BuscarEnDB1 buscador=new BuscarEnDB1();
            ArrayList diasTrabajados=buscador.BuscarDiasTrabajados(getCodigo_laboratorista());
            for (int i = 0; i < horas.length; i++) {
                if (!citasLab(horas[i]).next()) {
                    horasDisponibles.add(LocalTime.of(Integer.valueOf(horas[i]), 0));
                }
            }
            for (int i = 0; i < diasTrabajados.size(); i++) {
                if (diasTrabajados.get(i).equals(getDiaSeleccionado())) {
                    diaDisponible=true;
                }
            }
            if (diaDisponible==false) {
                horasDisponibles.clear();
            }
                    
            return horasDisponibles;

        } catch (Exception e) {
            return null;
        }
    }

    public String getCodigo_laboratorista() {
        return codigo_laboratorista;
    }

    public void setCodigo_laboratorista(String codigo_lab) {
        this.codigo_laboratorista = codigo_lab;
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

    public String getDiaSeleccionado() {
        return diaSeleccionado;
    }

    public void setDiaSeleccionado(String diaSeleccionado) {
        this.diaSeleccionado = diaSeleccionado;
    }
    

}
