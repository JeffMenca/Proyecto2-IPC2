package Entidades;

/**
 *
 * @author jeffrey
 */
public class Consulta_Medica {

    //Atributos
    private int codigo;
    private double costo;
    private String especialidad_nombre;

    //Constructor
    public Consulta_Medica(int codigo, double costo, String especialidad_nombre) {
        this.codigo = codigo;
        this.costo = costo;
        this.especialidad_nombre = especialidad_nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getEspecialidad_nombre() {
        return especialidad_nombre;
    }

    public void setEspecialidad_nombre(String especialidad_nombre) {
        this.especialidad_nombre = especialidad_nombre;
    }
    

}
