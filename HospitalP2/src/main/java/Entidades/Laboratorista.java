
package Entidades;

import SQLConnector.DbConnection;
import SQLConnector.Encriptar;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.swing.JOptionPane;

/**
 *
 * @author jeffrey
 */
public class Laboratorista {
     //Atributos
    private String codigo;
    private String nombre;
    private String numero_registro;
    private String DPI;
    private String telefono;
    private String correo;
    private LocalDate fecha_inicio;
    private String password;
    private int examen_laboratorio_codigo;
    //Constructor
    public Laboratorista(String codigo, String nombre,String numero_registro,String DPI,
            String telefono,String correo,LocalDate fecha_inicio,String password,int examen_laboratorio_codigo) {
        this.codigo=codigo;
        this.nombre=nombre;
        this.numero_registro=numero_registro;
        this.DPI=DPI;
        this.telefono=telefono;
        this.correo=correo;
        this.fecha_inicio=fecha_inicio;
        this.password=password;
        this.examen_laboratorio_codigo=examen_laboratorio_codigo;
        this.insertarLaboratorista();
    }
    //Metodo para ingresar laboratorista
    public void insertarLaboratorista() {
        String query = "INSERT INTO LABORATORISTA("
                + " codigo,"
                + " nombre,"
                + " numero_registro,"
                + " DPI,"
                + " telefono,"
                + " correo,"
                + " fecha_inicio,"
                + " password,"
                + " examen_laboratorio_codigo ) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query
            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getCodigo());
            statement.setString(2, getNombre());
            statement.setString(3, getNumero_registro());
            statement.setString(4, getDPI());
            statement.setString(5, getTelefono());
            statement.setString(6, getCorreo());
            statement.setDate(7, Date.valueOf(getFecha_inicio()));
            statement.setString(8, Encriptar.encriptar(getPassword()));
            statement.setInt(9, getExamen_laboratorio_codigo());
            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (UnsupportedEncodingException | SQLException e) {
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

    public String getNumero_registro() {
        return numero_registro;
    }

    public void setNumero_registro(String numero_registro) {
        this.numero_registro = numero_registro;
    }

    public String getDPI() {
        return DPI;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public LocalDate getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(LocalDate fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getExamen_laboratorio_codigo() {
        return examen_laboratorio_codigo;
    }

    public void setExamen_laboratorio_codigo(int examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    
    
}