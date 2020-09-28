
package Entidades;

/**
 *
 * @author jeffrey
 */
public class Orden_Examen {
    
     //Atributos
    private int codigo;
    private String descripcion;
    private String paciente_codigo;
    private String medico_codigo;
    private String examen_laboratorio_codigo;
    
    //Constructor

    public Orden_Examen(int codigo, String descripcion, String paciente_codigo, String medico_codigo, String examen_laboratorio_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.paciente_codigo = paciente_codigo;
        this.medico_codigo = medico_codigo;
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPaciente_codigo() {
        return paciente_codigo;
    }

    public void setPaciente_codigo(String paciente_codigo) {
        this.paciente_codigo = paciente_codigo;
    }

    public String getMedico_codigo() {
        return medico_codigo;
    }

    public void setMedico_codigo(String medico_codigo) {
        this.medico_codigo = medico_codigo;
    }

    public String getExamen_laboratorio_codigo() {
        return examen_laboratorio_codigo;
    }

    public void setExamen_laboratorio_codigo(String examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }
    
}
