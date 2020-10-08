package Logica;

import Entidades.Dias_Trabajados;
import SQLConnector.DbConnection;
import SQLConnector.Encriptar;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author jeffrey
 */
public class BuscarEnDB1 {

    public ResultSet BuscarMedico(String codigo) {
        try {
            String queryselect = "SELECT M.*,E.especialidad_nombre,C.costo FROM MEDICO M "
                    + "INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo INNER JOIN CONSULTA_MEDICA C "
                    + "ON E.especialidad_nombre=C.especialidad_nombre WHERE M.codigo='" + codigo + "'";

            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarLaboratorista(String codigo) {
        try {
            String queryselect = "SELECT L.*,E.nombre AS nombre_Examen,E.codigo AS codigo_Examen,E.costo AS precio_examen,E.orden FROM LABORATORISTA L "
                    + "INNER JOIN EXAMEN_LABORATORIO E ON L.examen_laboratorio_codigo=E.codigo WHERE L.codigo='" + codigo + "'";

            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList BuscarDiasTrabajados(String codigo) {
        try {
            ArrayList lista = new ArrayList();
            String queryselect = "SELECT * FROM DIAS_TRABAJADOS WHERE laboratorista_codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            while (resultset01.next()) {
                lista.add(resultset01.getString("dia"));
            }
            return lista;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarCitaConsulta(int codigo) {
        try {
            String queryselect = "SELECT C.*,P.nombre AS paciente_nombre,P.codigo AS paciente_codigo,Z.especialidad_nombre FROM CITA_CONSULTA_MEDICA C INNER JOIN PACIENTE P "
                    + "ON C.paciente_codigo=P.codigo INNER JOIN CONSULTA_MEDICA Z ON C.consulta_medica_codigo=Z.codigo WHERE C.codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }
    public ResultSet BuscarCitaExamen(int codigo) {
        try {
            String queryselect = "SELECT C.*,P.nombre AS paciente_nombre,P.codigo AS paciente_codigo,E.nombre AS tipo,E.codigo AS codigo_examen FROM CITA_EXAMEN_LABORATORIO C INNER JOIN PACIENTE P "
                    + "ON C.paciente_codigo=P.codigo INNER JOIN LABORATORISTA L ON C.laboratorista_codigo=L.codigo INNER JOIN EXAMEN_LABORATORIO E ON L.examen_laboratorio_codigo=E.codigo WHERE C.codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }
    public ResultSet BuscarOrden(int codigo) {
        try {
            String queryselect = "SELECT * FROM ORDEN_EXAMEN WHERE orden_examen_codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

}
