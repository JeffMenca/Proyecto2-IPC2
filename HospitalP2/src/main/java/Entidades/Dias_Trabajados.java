
package Entidades;

import SQLConnector.DbConnection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author jeffrey
 */
public class Dias_Trabajados {
    
     //Atributos
    private int codigo;
    private String dia;
    private String laboratorista_codigo;
    
    //Constructor

    public Dias_Trabajados(int codigo, String dia, String laboratorista_codigo) {
        this.codigo = codigo;
        this.dia = dia;
        this.laboratorista_codigo = laboratorista_codigo;
        this.insertarDias_Trabajados();
    }
    
    //Metodo para ingresar dias trabajados
    public void insertarDias_Trabajados() {
        String query = "INSERT INTO DIAS_TRABAJADOS ("
                + " codigo,"
                + " dia,"
                + " laboratorista_codigo ) VALUES ("
                + " ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setInt(1, 0);
            statement.setString(2, getDia());
            statement.setString(3, getLaboratorista_codigo());

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

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }
    
}
