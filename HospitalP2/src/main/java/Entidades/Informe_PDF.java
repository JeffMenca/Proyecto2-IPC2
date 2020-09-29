
package Entidades;

import SQLConnector.DbConnection;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author jeffrey
 */
public class Informe_PDF {
    
     //Atributos
    private Blob archivo;
    private String informe_examen_laboratorio_codigo;
    
    //Constructor

    public Informe_PDF(Blob archivo, String informe_examen_laboratorio_codigo) {
        this.archivo = archivo;
        this.informe_examen_laboratorio_codigo = informe_examen_laboratorio_codigo;
        this.insertarInforme_PDF();
    }
    //Metodo para ingresar informe PDF
    public void insertarInforme_PDF() {
        String query = "INSERT INTO INFORME_PDF ("
                + " archivo,"
                + " informe_examen_laboratorio_codigo ) VALUES ("
                + " ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setBlob(1, getArchivo());
            statement.setString(2, getInforme_Examen_laboratorio_codigo());

            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (SQLException e) {
        }
    }

    public Blob getArchivo() {
        return archivo;
    }

    public void setArchivo(Blob archivo) {
        this.archivo = archivo;
    }

    public String getInforme_Examen_laboratorio_codigo() {
        return informe_examen_laboratorio_codigo;
    }

    public void setInforme_Examen_laboratorio_codigo(String informe_examen_laboratorio_codigo) {
        this.informe_examen_laboratorio_codigo = informe_examen_laboratorio_codigo;
    }
    
}
