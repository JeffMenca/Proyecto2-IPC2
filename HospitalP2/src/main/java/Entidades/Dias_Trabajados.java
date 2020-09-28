
package Entidades;

/**
 *
 * @author jeffrey
 */
public class Dias_Trabajados {
    
     //Atributos
    private int codigo;
    private String dia;
    private String laboratorista_codigo;
    
    //Constructor

    public Dias_Trabajados(int codigo, String dia, String laboratorista_codigo) {
        this.codigo = codigo;
        this.dia = dia;
        this.laboratorista_codigo = laboratorista_codigo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getLaboratorista_codigo() {
        return laboratorista_codigo;
    }

    public void setLaboratorista_codigo(String laboratorista_codigo) {
        this.laboratorista_codigo = laboratorista_codigo;
    }
    
}
