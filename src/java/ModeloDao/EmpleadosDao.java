/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Empleados;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class EmpleadosDao {
    Conexion conexion;
    
    public EmpleadosDao(){
        conexion = new Conexion();
    }
    
    public boolean Registrar(Empleados empleado) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistrarEmpleados(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, empleado.getNombres());
            cs.setString(2, empleado.getApellidos());
            cs.setInt(3, empleado.getIdTipoEmpleado());
            cs.setInt(4, empleado.getIdEmpresaTerciaria());
            cs.setString(5, empleado.getTipoDocumento());
            cs.setString(6, empleado.getNumeroDocumento());
            cs.setString(7, empleado.getTelefono());
            cs.setString(8, empleado.getCorreo());
            cs.setString(9, empleado.getDireccion());
            cs.setString(10, empleado.getTipoLicencia());
            cs.setString(11, empleado.getNumeroLicencia());

            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Empleados> listar() {
        ArrayList<Empleados> listarEmpresas =new ArrayList();
        Empleados empleados;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call MostrarEmpleados}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                empleados = new Empleados();
                empleados.setId(rs.getInt(1));
                empleados.setNombres(rs.getString(2));
                empleados.setApellidos(rs.getString(3));
                listarEmpresas.add(empleados);
            }
        } catch (Exception e) {
            
        }
        return listarEmpresas;
    }
}
