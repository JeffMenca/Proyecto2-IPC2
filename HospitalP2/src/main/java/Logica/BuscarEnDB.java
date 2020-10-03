package Logica;

import SQLConnector.DbConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author jeffrey
 */
public class BuscarEnDB {

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

    public void EditarConsulta(int codigo,String especialidad, Double costo) {

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
}
