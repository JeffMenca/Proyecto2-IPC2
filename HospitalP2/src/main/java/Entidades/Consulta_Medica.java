package Entidades;

import SQLConnector.DbConnection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author jeffrey
 */
public class Consulta_Medica {

    //Atributos
    private int codigo;
    private double costo;
    private String especialidad_nombre;

    //Constructor
    public Consulta_Medica(int codigo, double costo, String especialidad_nombre) {
        this.codigo = codigo;
        this.costo = costo;
        this.especialidad_nombre = especialidad_nombre;
        this.insertarConsulta_Medica();
    }
    
    //Metodo para ingresar consulta medica
    public void insertarConsulta_Medica() {
        String query = "INSERT INTO CONSULTA_MEDICA ("
                + " codigo,"
                + " costo,"
                + " especialidad_nombre ) VALUES ("
                + " ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setInt(1, 0);
            statement.setDouble(2, getCosto());
            statement.setString(3, getEspecialidad_nombre());

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

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getEspecialidad_nombre() {
        return especialidad_nombre;
    }

    public void setEspecialidad_nombre(String especialidad_nombre) {
        this.especialidad_nombre = especialidad_nombre;
    }
    

}
