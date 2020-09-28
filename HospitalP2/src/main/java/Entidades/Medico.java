
package Entidades;

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
    private String correo;
    private LocalTime horario_entrada;
    private LocalTime horario_salida;
    private LocalDate inicio_trabajo;
    private String password;
    //Constructor
    public Medico(String codigo, String nombre,String numero_colegiado,String DPI,
            String telefono,String correo,LocalTime horario_entrada,LocalTime horario_salida,LocalDate inicio_trabajo,String password) {
        this.codigo=codigo;
        this.nombre=nombre;
        this.numero_colegiado=numero_colegiado;
        this.DPI=DPI;
        this.telefono=telefono;
        this.correo=correo;
        this.horario_entrada=horario_entrada;
        this.horario_salida=horario_salida;
        this.inicio_trabajo=inicio_trabajo;
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
    
    
}
