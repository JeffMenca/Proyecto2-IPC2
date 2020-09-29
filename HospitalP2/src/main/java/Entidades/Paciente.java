package Entidades;

import SQLConnector.DbConnection;
import SQLConnector.Encriptar;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Base64;

/**
 *
 * @author jeffrey
 */
public class Paciente {

    //Atributos
    private String codigo;
    private String nombre;
    private String sexo;
    private LocalDate fecha_nacimiento;
    private String DPI;
    private String telefono;
    private String peso;
    private String tipo_sangre;
    private String correo;
    private String password;

    //Constructor
    public Paciente(String codigo, String nombre, String sexo, LocalDate fecha_nacimiento,
            String DPI, String telefono, String peso, String tipo_sangre, String correo, String password) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.sexo = sexo;
        this.fecha_nacimiento = fecha_nacimiento;
        this.DPI = DPI;
        this.telefono = telefono;
        this.peso = peso;
        this.tipo_sangre = tipo_sangre;
        this.correo = correo;
        this.password = password;
        this.insertarPaciente();
    }

    //Metodo para ingresar pacientes
    public void insertarPaciente() {
        String query = "INSERT INTO PACIENTE ("
                + " codigo,"
                + " nombre,"
                + " sexo,"
                + " fecha_nacimiento,"
                + " DPI,"
                + " telefono,"
                + " peso,"
                + " tipo_sangre,"
                + " correo,"
                + " password ) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getCodigo());
            statement.setString(2, getNombre());
            statement.setString(3, getSexo());
            statement.setDate(4, Date.valueOf(getFecha_nacimiento()));
            statement.setString(5, getDPI());
            statement.setString(6, getTelefono());
            statement.setString(7, getPeso());
            statement.setString(8, getTipo_sangre());
            statement.setString(9, getCorreo());
            statement.setString(10,Encriptar.encriptar(getPassword()));
            // Ejecutamos el update
            statement.execute();
            statement.close();
        } catch (Exception e) {
        }
    }
    
    //Metodos getters and setters
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

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public LocalDate getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
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

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
