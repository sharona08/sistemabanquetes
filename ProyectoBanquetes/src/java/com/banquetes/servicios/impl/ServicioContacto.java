package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Contacto;
import com.banquetes.servicios.interfaces.IServicioContacto;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.util.List;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que ofrece servicios para el manejo de contactos
 * @author maya
 * @version 1.0
 */
public class ServicioContacto implements IServicioContacto {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioContacto() {
    }

    public Integer crearContacto(Contacto contacto) {
        Integer id = null;
        try {
            id = (Integer) sqlMap.insert("crearContacto", contacto);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public void editarContacto(Contacto contacto) {
        try {
            Contacto newContacto = (Contacto) sqlMap.queryForObject("getContacto", contacto.getId());
            if (contacto.getNombre() != null) {
                newContacto.setNombre(contacto.getNombre());
            }
            newContacto.setTelefono(contacto.getTelefono());
            newContacto.setDireccion(contacto.getDireccion());
            if (contacto.getHabilitado() != null) {
                newContacto.setHabilitado(contacto.getHabilitado());
            }

            sqlMap.update("editarContacto", newContacto);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void inhabilitarContacto(Contacto contacto) {
        try {
            Contacto newContacto = (Contacto) sqlMap.queryForObject("getContacto", contacto.getId());
            newContacto.setHabilitado(Boolean.FALSE);
            sqlMap.update("editarContacto", newContacto);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void habilitarContacto(Contacto contacto) {
        try {
            Contacto newContacto = (Contacto) sqlMap.queryForObject("getContacto", contacto.getId());
            newContacto.setHabilitado(Boolean.TRUE);
            sqlMap.update("editarContacto", newContacto);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Contacto> listarContactos() {
        List<Contacto> contactos = null;

        try {
            contactos = sqlMap.queryForList("getContactos", null);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contactos;
    }

    public Contacto getContacto(Integer id) {
        Contacto contacto = null;
        try {
            contacto = (Contacto) sqlMap.queryForObject("getContacto", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contacto;
    }
}

