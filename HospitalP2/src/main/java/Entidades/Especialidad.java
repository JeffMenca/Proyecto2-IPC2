
package Entidades;

import SQLConnector.DbConnection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author jeffrey
 */
public class Especialidad {
    
    //Atributos
    private String nombre;
    //Constructor
    public Especialidad(String nombre) {
        this.nombre=nombre;
        this.insertarEspecialidad();
    }
    //Metodo para ingresar especialidad
    public void insertarEspecialidad() {
        String query = "INSERT INTO ESPECIALIDAD("
                + " nombre ) VALUES ("
                + " ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getNombre());
            // Ejecutamos el update
            statement.execute();
            statement.close();
            Consulta_Medica nuevaConsultaMedica=new Consulta_Medica(0,100, getNombre());
        } catch (SQLException e) {
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
