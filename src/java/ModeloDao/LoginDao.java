/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDao;

import Modelo.Login;
import Config.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Claudio Cruzado
 */
public class LoginDao {
    Conexion conexion;
    public LoginDao(){
        conexion = new Conexion();
    }

    public List listar(Login login) throws ClassNotFoundException {
        ArrayList<Login> listarLogin = new ArrayList<>();
        Login lo;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call ValidarLogin (?,?)}");
            cs.setString(1, login.getUsuario());
            cs.setString(2, login.getContra());
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                lo = new Login();
                lo.setId(rs.getInt(1));
                lo.setNombres(rs.getString(2));
                lo.setApellidos(rs.getString(3));
                lo.setUsuario(rs.getString(4));
                listarLogin.add(lo);
            }
        } catch (SQLException e) {
        }
        return listarLogin;
    }
}
