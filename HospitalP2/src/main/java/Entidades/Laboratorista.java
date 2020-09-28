
package Entidades;

import java.time.LocalDate;

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
    //Constructor
    public Laboratorista(String codigo, String nombre,String numero_registro,String DPI,
            String telefono,String correo,LocalDate fecha_inicio,String password) {
        this.codigo=codigo;
        this.nombre=nombre;
        this.numero_registro=numero_registro;
        this.DPI=DPI;
        this.telefono=telefono;
        this.correo=correo;
        this.fecha_inicio=fecha_inicio;
        this.password=password;
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
    
}