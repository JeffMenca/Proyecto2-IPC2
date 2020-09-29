
package Entidades;

import SQLConnector.DbConnection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author jeffrey
 */
public class Administrador {
    
     //Atributos
    private String codigo;
    private String nombre;
    private String DPI;
    private String password;
    //Constructor
    public Administrador(String codigo, String nombre,String DPI,String password) {
        this.codigo=codigo;
        this.nombre=nombre;
        this.DPI=DPI;
        this.password=password;
        this.insertarAdministrador();
    }
    
    //Metodo para ingresar administrador
    public void insertarAdministrador() {
        String query = "INSERT INTO ADMINISTRADOR("
                + " codigo,"
                + " nombre,"
                + " DPI,"
                + " password ) VALUES ("
                + " ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getCodigo());
            statement.setString(2, getNombre());
            statement.setString(3, getDPI());
            statement.setString(4, getPassword());

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }
    }

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

    public String getDPI() {
        return DPI;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
