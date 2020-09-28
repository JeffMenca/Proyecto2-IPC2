
package Entidades;


/**
 *
 * @author jeffrey
 */
public class Especializacion {
    
     //Atributos
    private String especialidad_nombre;
    private String medico_codigo;
    
    //Constructor

    public Especializacion(String especialidad_nombre, String medico_codigo) {
        this.especialidad_nombre = especialidad_nombre;
        this.medico_codigo = medico_codigo;
    }

    public String getEspecialidad_nombre() {
        return especialidad_nombre;
    }

    public void setEspecialidad_nombre(String especialidad_nombre) {
        this.especialidad_nombre = especialidad_nombre;
    }

    public String getMedico_codigo() {
        return medico_codigo;
    }

    public void setMedico_codigo(String medico_codigo) {
        this.medico_codigo = medico_codigo;
    }
    
}
