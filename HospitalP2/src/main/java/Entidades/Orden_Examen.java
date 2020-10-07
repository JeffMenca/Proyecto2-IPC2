
package Entidades;

import SQLConnector.DbConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author jeffrey
 */
public class Orden_Examen {
    
     //Atributos
    private int codigo;
    private String descripcion;
    private String paciente_codigo;
    private String medico_codigo;
    private int examen_laboratorio_codigo;
    
    //Constructor

    public Orden_Examen(int codigo, String descripcion, String paciente_codigo, String medico_codigo, int examen_laboratorio_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.paciente_codigo = paciente_codigo;
        this.medico_codigo = medico_codigo;
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }
    
    //Metodo para ingresar Orden de examen
    public int insertarOrden_Examen() {
        String query = "INSERT INTO ORDEN_EXAMEN ("
                + " codigo,"
                + " descripcion,"
                + " paciente_codigo,"
                + " medico_codigo,"
                + " examen_laboratorio_codigo ) VALUES ("
                + " ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query
            int codigoOrden;
            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, 0);
            statement.setString(2, getDescripcion());
            statement.setString(3, getPaciente_codigo());
            statement.setString(4, getMedico_codigo());
            statement.setInt(5, getExamen_laboratorio_codigo());

            // Ejecutamos el update
            statement.execute();
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                codigoOrden = rs.getInt(1);
                statement.close();
                return codigoOrden;
            }
            
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    public int getExamen_laboratorio_codigo() {
        return examen_laboratorio_codigo;
    }

    public void setExamen_laboratorio_codigo(int examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }
    
}
