
package Entidades;

import java.sql.Blob;


/**
 *
 * @author jeffrey
 */
public class Informe_PDF {
    
     //Atributos
    private Blob archivo;
    private String examen_laboratorio_codigo;
    
    //Constructor

    public Informe_PDF(Blob archivo, String examen_laboratorio_codigo) {
        this.archivo = archivo;
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }

    public Blob getArchivo() {
        return archivo;
    }

    public void setArchivo(Blob archivo) {
        this.archivo = archivo;
    }

    public String getExamen_laboratorio_codigo() {
        return examen_laboratorio_codigo;
    }

    public void setExamen_laboratorio_codigo(String examen_laboratorio_codigo) {
        this.examen_laboratorio_codigo = examen_laboratorio_codigo;
    }
    
}
