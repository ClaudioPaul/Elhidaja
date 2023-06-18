/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class Empleados {
    private int Id;
    private String Nombres;
    private String Apellidos;
    private int IdTipoEmpleado;
    private String TipoEmpleado;
    private int IdEmpresaTerciaria;
    private String TipoDocumento;
    private String NumeroDocumento;
    private String Telefono;
    private String Correo;
    private String Direccion;
    private String TipoLicencia;
    private String NumeroLicencia;

    public Empleados() {
    }

    public Empleados(int Id, String Nombres, String Apellidos, int IdTipoEmpleado, String TipoEmpleado, int IdEmpresaTerciaria, String TipoDocumento, String NumeroDocumento, String Telefono, String Correo, String Direccion, String TipoLicencia, String NumeroLicencia) {
        this.Id = Id;
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
        this.IdTipoEmpleado = IdTipoEmpleado;
        this.TipoEmpleado = TipoEmpleado;
        this.IdEmpresaTerciaria = IdEmpresaTerciaria;
        this.TipoDocumento = TipoDocumento;
        this.NumeroDocumento = NumeroDocumento;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Direccion = Direccion;
        this.TipoLicencia = TipoLicencia;
        this.NumeroLicencia = NumeroLicencia;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public int getIdTipoEmpleado() {
        return IdTipoEmpleado;
    }

    public void setIdTipoEmpleado(int IdTipoEmpleado) {
        this.IdTipoEmpleado = IdTipoEmpleado;
    }

    public String getTipoEmpleado() {
        return TipoEmpleado;
    }

    public void setTipoEmpleado(String TipoEmpleado) {
        this.TipoEmpleado = TipoEmpleado;
    }

    public int getIdEmpresaTerciaria() {
        return IdEmpresaTerciaria;
    }

    public void setIdEmpresaTerciaria(int IdEmpresaTerciaria) {
        this.IdEmpresaTerciaria = IdEmpresaTerciaria;
    }

    public String getTipoDocumento() {
        return TipoDocumento;
    }

    public void setTipoDocumento(String TipoDocumento) {
        this.TipoDocumento = TipoDocumento;
    }

    public String getNumeroDocumento() {
        return NumeroDocumento;
    }

    public void setNumeroDocumento(String NumeroDocumento) {
        this.NumeroDocumento = NumeroDocumento;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTipoLicencia() {
        return TipoLicencia;
    }

    public void setTipoLicencia(String TipoLicencia) {
        this.TipoLicencia = TipoLicencia;
    }

    public String getNumeroLicencia() {
        return NumeroLicencia;
    }

    public void setNumeroLicencia(String NumeroLicencia) {
        this.NumeroLicencia = NumeroLicencia;
    }

    
    
}
