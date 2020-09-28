
package Entidades;


/**
 *
 * @author jeffrey
 */
public class Administrador {
    
     //Atributos
    private String codigo;
    private String nombre;
    private String DPI;
    private String password;
    //Constructor
    public Administrador(String codigo, String nombre,String DPI,String password) {
        this.codigo=codigo;
        this.nombre=nombre;
        this.DPI=DPI;
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

    public String getDPI() {
        return DPI;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
