
package Entidades;


/**
 *
 * @author jeffrey
 */
public class Examen_Laboratorio {
    
    //Atributos
    private String codigo;
    private String nombre;
    private Boolean orden;
    private String descripcion;
    private double costo;
    private String tipo_informe;
    private String laboratorista_codigo;
    
    //Constructor

    public Examen_Laboratorio(String codigo, String nombre, Boolean orden, String descripcion, double costo, String tipo_informe, String laboratorista_codigo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.orden = orden;
        this.descripcion = descripcion;
        this.costo = costo;
        this.tipo_informe = tipo_informe;
        this.laboratorista_codigo = laboratorista_codigo;
    }
    
    //Getters and setters

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

    public Boolean getOrden() {
        return orden;
    }

    public void setOrden(Boolean orden) {
        this.orden = orden;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getTipo_informe() {
        return tipo_informe;
    }

    public void setTipo_informe(String tipo_informe) {
        this.tipo_informe = tipo_informe;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }
    
}
