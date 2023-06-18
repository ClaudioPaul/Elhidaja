/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Empresas;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class EmpresasDao {
    Conexion conexion;
    
    public EmpresasDao(){
        conexion = new Conexion();
    }
    
    public boolean Registrar(Empresas empresa) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistrarEmpresas(?,?,?,?,?,?,?)}");
            cs.setString(1, empresa.getRuc());
            cs.setString(2, empresa.getRazonSocial());
            cs.setString(3, empresa.getNombreRepresentante());
            cs.setString(4, empresa.getApellidoRepresentante());
            cs.setString(5, empresa.getDireccion());
            cs.setString(6, empresa.getTelefono());
            cs.setString(7, empresa.getCorreo());

            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Empresas> listar() {
        ArrayList<Empresas> listarEmpresas =new ArrayList();
        Empresas empresas;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call MostrarEmpresas}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                empresas = new Empresas();
                empresas.setId(rs.getInt(1));
                empresas.setRuc(rs.getString(2));
                empresas.setRazonSocial(rs.getString(3));
                empresas.setNombreRepresentante(rs.getString(4));
                empresas.setApellidoRepresentante(rs.getString(5));
                empresas.setDireccion(rs.getString(6));
                empresas.setTelefono(rs.getString(7));
                empresas.setCorreo(rs.getString(8));
                listarEmpresas.add(empresas);
            }
        } catch (Exception e) {
            
        }
        return listarEmpresas;
    }
    
    public Empresas Seleccionar(int Idempresas) {
        Empresas empresas = null;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call SeleccionarEmpresas(?)}");
            cs.setInt(1, Idempresas);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                empresas = new Empresas();
                empresas.setId(rs.getInt(1));
                empresas.setRuc(rs.getString(2));
                empresas.setRazonSocial(rs.getString(3));
                empresas.setNombreRepresentante(rs.getString(4));
                empresas.setApellidoRepresentante(rs.getString(5));
                empresas.setDireccion(rs.getString(6));
                empresas.setTelefono(rs.getString(7));
                empresas.setCorreo(rs.getString(8));
            }
        } catch (Exception e) {
        }
        return empresas;
    }
    
    public boolean Editar(Empresas empresas) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EditarEmpresas(?,?,?,?,?,?)}");
            cs.setString(1, empresas.getNombreRepresentante());
            cs.setString(2, empresas.getApellidoRepresentante());
            cs.setString(3, empresas.getDireccion());
            cs.setString(4, empresas.getTelefono());
            cs.setString(5, empresas.getCorreo());
            cs.setInt(6, empresas.getId());
            cs.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
}
