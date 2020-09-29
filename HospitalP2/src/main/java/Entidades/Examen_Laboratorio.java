
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
public class Examen_Laboratorio {
    
    //Atributos
    private String codigo;
    private String nombre;
    private Boolean orden;
    private String descripcion;
    private double costo;
    private String tipo_informe;
    
    //Constructor

    public Examen_Laboratorio(String codigo, String nombre, Boolean orden, String descripcion, double costo, String tipo_informe) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.orden = orden;
        this.descripcion = descripcion;
        this.costo = costo;
        this.tipo_informe = tipo_informe;
        this.insertarExamenLaboratorio();
    }
    
    //Metodo para ingresar examen laboratorio
    public void insertarExamenLaboratorio() {
        String query = "INSERT INTO EXAMEN_LABORATORIO ("
                + " codigo,"
                + " nombre,"
                + " orden,"
                + " descripcion,"
                + " costo,"
                + " tipo_informe) VALUES ("
                + " ?, ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getCodigo());
            statement.setString(2, getNombre());
            if (getOrden()==true) {
                statement.setInt(3, 1);
            }
            else{
                statement.setInt(3, 0);
            }
            statement.setString(4, getDescripcion());
            statement.setDouble(5, getCosto());
            statement.setString(6, getTipo_informe());
            

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }
    }
    
    //Getters and setters

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Boolean getOrden() {
        return orden;
    }

    public void setOrden(Boolean orden) {
        this.orden = orden;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getTipo_informe() {
        return tipo_informe;
    }

    public void setTipo_informe(String tipo_informe) {
        this.tipo_informe = tipo_informe;
    }
    
}
