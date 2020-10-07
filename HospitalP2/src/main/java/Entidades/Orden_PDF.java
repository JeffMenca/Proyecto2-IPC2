
package Entidades;

import SQLConnector.DbConnection;
import java.io.FileInputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author jeffrey
 */
public class Orden_PDF {
    
     //Atributos
    private FileInputStream archivo;
    private int orden_examen_codigo;
    
    //Constructor

    public Orden_PDF(FileInputStream archivo, int orden_examen_codigo) {
        this.archivo = archivo;
        this.orden_examen_codigo = orden_examen_codigo;
        this.insertarOrden_PDF();
    }
    //Metodo para ingresar orden PDF
    public void insertarOrden_PDF() {
        String query = "INSERT INTO ORDEN_PDF ("
                + " archivo,"
                + " orden_examen_codigo ) VALUES ("
                + " ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setBlob(1, getArchivo());
            statement.setInt(2, getOrden_examen_codigo());

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }
    }

    public FileInputStream getArchivo() {
        return archivo;
    }

    public void setArchivo(FileInputStream archivo) {
        this.archivo = archivo;
    }

    public int getOrden_examen_codigo() {
        return orden_examen_codigo;
    }

    public void setOrden_examen_codigo(int orden_examen_codigo) {
        this.orden_examen_codigo = orden_examen_codigo;
    }
    
}
