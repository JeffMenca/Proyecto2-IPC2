package Logica;

import SQLConnector.DbConnection;
import SQLConnector.Encriptar;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author jeffrey
 */
public class Login {

    //Atributos
    private String usuario;
    private String password;
    private String tipo;
    //Constructor

    public Login(String usuario, String password, String tipo) {
        this.usuario = usuario;
        this.password = password;
        this.tipo = tipo;
    }

    //Metodo verificador
    public int ingresarLogin() {
        int ingreso = 0;
        try {
            String newPassword = Encriptar.encriptar(getPassword());
            Statement statements = DbConnection.getConnection().createStatement();
            if (getTipo().equals("Paciente")) {
                String queryselect = "SELECT * FROM PACIENTE WHERE codigo='" + getUsuario() + "' && password='" + newPassword + "'";
                ResultSet resultset = statements.executeQuery(queryselect);
                if (resultset.first() == false) {
                    ingreso = 0;
                } else {
                    ingreso = 1;
                }
            } else if (getTipo().equals("Medico")) {
                String queryselect = "SELECT * FROM MEDICO WHERE codigo='" + getUsuario() + "' && password='" + newPassword + "'";
                ResultSet resultset = statements.executeQuery(queryselect);
                if (resultset.first() == false) {
                    ingreso = 0;
                } else {
                    ingreso = 2;
                }
            } else if (getTipo().equals("Laboratorista")) {
                String queryselect = "SELECT * FROM LABORATORISTA WHERE codigo='" + getUsuario() + "' && password='" + newPassword + "'";
                ResultSet resultset = statements.executeQuery(queryselect);
                if (resultset.first() == false) {
                    ingreso = 0;
                } else {
                    ingreso = 3;
                }
            } else if (getTipo().equals("Administrador")) {
                String queryselect = "SELECT * FROM ADMINISTRADOR WHERE codigo='" + getUsuario() + "' && password='" + newPassword + "'";
                ResultSet resultset = statements.executeQuery(queryselect);
                if (resultset.first() == false) {
                    ingreso = 0;
                } else {
                    ingreso = 4;
                }
            } else {
                ingreso = 0;
            }
        } catch (UnsupportedEncodingException | SQLException e) {
        }
        return ingreso;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

}
