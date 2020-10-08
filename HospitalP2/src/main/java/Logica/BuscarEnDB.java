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
public class BuscarEnDB {

    public ResultSet BuscarMedico() {
        try {
            String queryselect = "SELECT M.*,E.especialidad_nombre,C.costo FROM MEDICO M "
                    + "INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo INNER JOIN CONSULTA_MEDICA C "
                    + "ON E.especialidad_nombre=C.especialidad_nombre";

            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarTodosMedico() {
        try {
            String queryselect = "SELECT M.*,E.especialidad_nombre,C.costo FROM MEDICO M "
                    + "INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo INNER JOIN CONSULTA_MEDICA C "
                    + "ON E.especialidad_nombre=C.especialidad_nombre";

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

    public ResultSet BuscarExamen(int codigo) {
        try {
            String queryselect = "SELECT * FROM EXAMEN_LABORATORIO WHERE codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarExamen(String nombre) {
        try {
            String queryselect = "SELECT * FROM EXAMEN_LABORATORIO WHERE nombre='" + nombre + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarTodosExamenes() {
        try {
            String queryselect = "SELECT * FROM EXAMEN_LABORATORIO";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarExamenesSin(String nombre) {
        try {
            String queryselect = "SELECT * FROM EXAMEN_LABORATORIO WHERE nombre!='" + nombre + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarConsulta(int codigo) {
        try {
            String queryselect = "SELECT * FROM CONSULTA_MEDICA WHERE codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public void generarDias(ArrayList dias, String codigo) {
        for (int i = 0; i < dias.size(); i++) {
            Dias_Trabajados nuevoDia = new Dias_Trabajados(0, dias.get(i).toString(), codigo);
        }
    }

    public ResultSet BuscarPaciente(String codigo) {
        try {
            String queryselect = "SELECT * FROM PACIENTE WHERE codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarMedicos(String codigo) {
        try {
            String queryselect = "SELECT * FROM MEDICO WHERE codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarAdmin(String codigo) {
        try {
            String queryselect = "SELECT * FROM ADMINISTRADOR WHERE codigo='" + codigo + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet BuscarConsultaEspecialidad(String especialidad) {
        try {
            String queryselect = "SELECT * FROM CONSULTA_MEDICA WHERE especialidad_nombre='" + especialidad + "'";
            PreparedStatement pstatement = DbConnection.getConnection().prepareStatement(queryselect);
            ResultSet resultset01 = pstatement.executeQuery();
            return resultset01;
        } catch (Exception e) {
        }
        return null;
    }

    public void EditarExamenLaboratorio(int codigo, String nombre, Boolean orden, String descripcion, Double costo, String tipo_informe) {

        String query = "UPDATE EXAMEN_LABORATORIO SET nombre=?, orden=?, descripcion=?, costo=?, tipo_informe=? WHERE codigo=?";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, nombre);
            if (orden == true) {
                statement.setInt(2, 1);
            } else {
                statement.setInt(2, 0);
            }
            statement.setString(3, descripcion);
            statement.setDouble(4, costo);
            statement.setString(5, tipo_informe);
            statement.setInt(6, codigo);

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }

    }

    public void EditarConsulta(int codigo, String especialidad, Double costo) {

        String query = "UPDATE CONSULTA_MEDICA SET costo=?, especialidad_nombre=? WHERE codigo=?";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setDouble(1, costo);
            statement.setString(2, especialidad);
            statement.setInt(3, codigo);

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }

    }

    public void EditarPaciente(String codigo, String nombre, String sexo, LocalDate fecha, String DPI, String telefono, String peso,
            String tipo_sangre, String correo, String password) {

        String query = "UPDATE PACIENTE SET nombre=?,sexo=?, fecha_nacimiento=?, DPI=?, telefono=?, peso=?, tipo_sangre=?, correo=?,"
                + " password=? WHERE codigo=?";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, nombre);
            statement.setString(2, sexo);
            statement.setDate(3, Date.valueOf(fecha));
            statement.setString(4, DPI);
            statement.setString(5, telefono);
            statement.setString(6, peso);
            statement.setString(7, tipo_sangre);
            statement.setString(8, correo);
            statement.setString(9, Encriptar.encriptar(password));
            statement.setString(10, codigo);

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (UnsupportedEncodingException | SQLException e) {
            JOptionPane.showMessageDialog(null, "no se edito");
        }

    }

    public void EditarAdmin(String codigo, String nombre, String DPI, String password) {

        String query = "UPDATE ADMINISTRADOR SET nombre=?, DPI=?, password=? WHERE codigo=?";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, nombre);
            statement.setString(2, DPI);
            statement.setString(3, Encriptar.encriptar(password));
            statement.setString(4, codigo);

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (UnsupportedEncodingException | SQLException e) {
            JOptionPane.showMessageDialog(null, "no se edito");
        }

    }

    public void EditarMedico(String codigo, String nombre, String numero_colegiado, String DPI, String telefono, String correo,
            LocalTime horarioEntrada, LocalTime horarioSalida, LocalDate fecha, String password) {

        String query = "UPDATE MEDICO SET nombre=?,numero_colegiado=?, DPI=?, telefono=?, correo=?, horario_entrada=?, horario_salida=?, inicio_trabajo=?,"
                + " password=? WHERE codigo=?";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, nombre);
            statement.setString(2, numero_colegiado);
            statement.setString(3, DPI);
            statement.setString(4, telefono);
            statement.setString(5, correo);
            statement.setTime(6, Time.valueOf(horarioEntrada));
            statement.setTime(7, Time.valueOf(horarioSalida));
            statement.setDate(8, Date.valueOf(fecha));
            statement.setString(9, Encriptar.encriptar(password));
            statement.setString(10, codigo);

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (UnsupportedEncodingException | SQLException e) {
            JOptionPane.showMessageDialog(null, "no se edito");
        }

    }

    public void EditarLaboratorista(String codigo, String nombre, String numero_registro, String DPI, String telefono, String correo,
            LocalDate fecha, String password, int examen_laboratorio) {

        String query = "UPDATE LABORATORISTA SET nombre=?,numero_registro=?, DPI=?, telefono=?, correo=?, fecha_inicio=?,"
                + " password=?, examen_laboratorio_codigo=? WHERE codigo=?";
        try {
            // Se ingresar los datos a la Query
            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, nombre);
            statement.setString(2, numero_registro);
            statement.setString(3, DPI);
            statement.setString(4, telefono);
            statement.setString(5, correo);
            statement.setDate(6, Date.valueOf(fecha));
            statement.setString(7, Encriptar.encriptar(password));
            statement.setInt(8, examen_laboratorio);
            statement.setString(9, codigo);
            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (UnsupportedEncodingException | SQLException e) {
            JOptionPane.showMessageDialog(null, "no se edito");
        }

    }
}
