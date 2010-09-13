package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Rol;
import com.banquetes.servicios.interfaces.IServicioRol;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.util.List;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que ofrece servicios para el manejo de contactos
 * @author maya
 * @version 1.0
 */
public class ServicioRol implements IServicioRol {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioRol() {
    }

    public Boolean existeRolNombre(Rol rol) {
        Boolean existe = Boolean.TRUE;
        Rol newRol = null;
        try {
            newRol = (Rol) sqlMap.queryForObject("getRolNombre", rol.getTipoRol());
            if (newRol == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public Boolean existeRolId(Rol rol) {
        Boolean existe = Boolean.TRUE;
        Rol newRol = null;
        try {
            newRol = (Rol) sqlMap.queryForObject("getRol", rol.getId());
            if (newRol == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public Integer crearRol(Rol rol) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeRolNombre(rol);
        Integer id = null;
        try {
            if (!existe) {
                id = (Integer) sqlMap.insert("crearRol", rol);
            } else {
                System.out.println("El rol ya esta registrado");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public Boolean editarRol(Rol rol) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeRolId(rol);
        try {
            if (existe) {
                Rol newRol = (Rol) sqlMap.queryForObject("getRol", rol.getId());

                if (rol.getTipoRol() != null) {
                    newRol.setTipoRol(rol.getTipoRol());
                }
                int resultado = sqlMap.update("editarRol", newRol);

                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }

            } else {
                System.out.println("No existe el rol");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Rol> listarRoles(Integer id, String nombre) {
        List<Rol> roles = null;

        String idRol = "";
        if (id == null) {
            idRol = "%";
        } else {
            idRol = id.toString() + "%";
        }

        if (nombre == null) {
            nombre = "%";
        } else {
            nombre = nombre + "%";
        }

        try {
            Map param = new HashMap();
            param.put("id", idRol);
            param.put("tipoRol", nombre);
            roles = sqlMap.queryForList("getRoles", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roles;
    }

    public Rol getRol(Integer id) {
        Rol rol = null;
        try {
            rol = (Rol) sqlMap.queryForObject("getRol", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rol;
    }

    public Rol getRolNombre(String nombre) {
        Rol rol = null;
        try {
            rol = (Rol) sqlMap.queryForObject("getRolNombre", nombre);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rol;
    }
}
