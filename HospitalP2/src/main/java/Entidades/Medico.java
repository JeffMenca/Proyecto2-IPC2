
package Entidades;

import SQLConnector.DbConnection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;


/**
 *
 * @author jeffrey
 */
public class Medico {
     //Atributos
    private String codigo;
    private String nombre;
    private String numero_colegiado;
    private String DPI;
    private String telefono;
    private String especialidad;
    private String correo;
    private LocalTime horario_entrada;
    private LocalTime horario_salida;
    private LocalDate inicio_trabajo;
    private String password;
    //Constructor
    public Medico(String codigo, String nombre,String numero_colegiado,String DPI,
            String telefono,String especialidad,String correo,LocalTime horario_entrada,LocalTime horario_salida,LocalDate inicio_trabajo,String password) {
        this.codigo=codigo;
        this.nombre=nombre;
        this.numero_colegiado=numero_colegiado;
        this.DPI=DPI;
        this.telefono=telefono;
        this.especialidad=especialidad;
        this.correo=correo;
        this.horario_entrada=horario_entrada;
        this.horario_salida=horario_salida;
        this.inicio_trabajo=inicio_trabajo;
        this.password=password;
        this.insertarMedico();
    }
    
    //Metodo para ingresar medico
    public void insertarMedico() {
        
        try {
        String queryselect="SELECT * FROM ESPECIALIDAD WHERE nombre='"+getEspecialidad()+"'";
        Statement statements = DbConnection.getConnection().createStatement();
            ResultSet resultset = statements.executeQuery(queryselect);
            if (resultset.getRow() == 0) {
                Especialidad nuevaEspecialidad=new Especialidad(getEspecialidad());
            } 
        } catch (Exception e) {
        }
        
        String query = "INSERT INTO MEDICO ("
                + " codigo,"
                + " nombre,"
                + " numero_colegiado,"
                + " DPI,"
                + " telefono,"
                + " correo,"
                + " horario_entrada,"
                + " horario_salida,"
                + " inicio_trabajo,"
                + " password ) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // Se ingresar los datos a la Query

            PreparedStatement statement = DbConnection.getConnection().prepareStatement(query);
            statement.setString(1, getCodigo());
            statement.setString(2, getNombre());
            statement.setString(3, getNumero_colegiado());
            statement.setString(4, getDPI());
            statement.setString(5, getTelefono());
            statement.setString(6, getCorreo());
            statement.setTime(7,Time.valueOf(getHorario_entrada()));
            statement.setTime(8,Time.valueOf(getHorario_salida()));
            statement.setDate(9, Date.valueOf(getInicio_trabajo()));
            statement.setString(10, getPassword());

            // Ejecutamos el update
            statement.execute();
            statement.close();
            Especializacion nuevaespecializacion=new Especializacion(getEspecialidad(), getCodigo());
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

    public String getNumero_colegiado() {
        return numero_colegiado;
    }

    public void setNumero_colegiado(String numero_colegiado) {
        this.numero_colegiado = numero_colegiado;
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

    public LocalTime getHorario_entrada() {
        return horario_entrada;
    }

    public void setHorario_entrada(LocalTime horario_entrada) {
        this.horario_entrada = horario_entrada;
    }

    public LocalTime getHorario_salida() {
        return horario_salida;
    }

    public void setHorario_salida(LocalTime horario_salida) {
        this.horario_salida = horario_salida;
    }

    public LocalDate getInicio_trabajo() {
        return inicio_trabajo;
    }

    public void setInicio_trabajo(LocalDate inicio_trabajo) {
        this.inicio_trabajo = inicio_trabajo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    
}
