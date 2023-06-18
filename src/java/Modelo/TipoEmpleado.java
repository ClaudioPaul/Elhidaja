/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class TipoEmpleado {
    private int Id;
    private String TipoEmpleado;

    public TipoEmpleado() {
    }

    public TipoEmpleado(int Id, String TipoEmpleado) {
        this.Id = Id;
        this.TipoEmpleado = TipoEmpleado;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getTipoEmpleado() {
        return TipoEmpleado;
    }

    public void setTipoEmpleado(String TipoEmpleado) {
        this.TipoEmpleado = TipoEmpleado;
    }
    
}
