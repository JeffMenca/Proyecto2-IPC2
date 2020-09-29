
package Entidades;

import SQLConnector.DbConnection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author jeffrey
 */
public class Especializacion {
    
     //Atributos
    private String especialidad_nombre;
    private String medico_codigo;
    
    //Constructor

    public Especializacion(String especialidad_nombre, String medico_codigo) {
        this.especialidad_nombre = especialidad_nombre;
        this.medico_codigo = medico_codigo;
        this.insertarEspecializacion();
    }
    //Metodo para ingresar especializacion
    public void insertarEspecializacion() {
        String query = "INSERT INTO ESPECIALIZACION ("
                + " especialidad_nombre,"
                + " medico_codigo ) VALUES ("
                + " ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getEspecialidad_nombre());
            statement.setString(2, getMedico_codigo());

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }
    }

    public String getEspecialidad_nombre() {
        return especialidad_nombre;
    }

    public void setEspecialidad_nombre(String especialidad_nombre) {
        this.especialidad_nombre = especialidad_nombre;
    }

    public String getMedico_codigo() {
        return medico_codigo;
    }

    public void setMedico_codigo(String medico_codigo) {
        this.medico_codigo = medico_codigo;
    }
    
}
