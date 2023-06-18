/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.TipoEmpleado;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class TipoEmpleadoDao {
    Conexion conexion;
    
    public TipoEmpleadoDao(){
        conexion = new Conexion();
    }
    
    public List listar() {
        ArrayList<TipoEmpleado> ListarTipo =new ArrayList();
        TipoEmpleado tipo;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call VerTipoEmpleado}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                tipo = new TipoEmpleado();
                tipo.setId(rs.getInt(1));
                tipo.setTipoEmpleado(rs.getString(2));
                ListarTipo.add(tipo);
            }
        } catch (Exception e) {
            
        }
        return ListarTipo;
    }
}
