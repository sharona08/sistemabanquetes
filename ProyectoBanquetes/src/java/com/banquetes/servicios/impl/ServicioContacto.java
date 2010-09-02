package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Contacto;
import com.banquetes.servicios.interfaces.IServicioContacto;
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

    public Boolean editarContacto(Contacto contacto) {
        Boolean result = false;
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

            int resultado = sqlMap.update("editarContacto", newContacto);
            if (resultado == 1) {
                result = Boolean.TRUE;
            } else {
                result = Boolean.FALSE;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public Boolean inhabilitarContacto(Contacto contacto) {
        Boolean result = false;
        try {
            Contacto newContacto = (Contacto) sqlMap.queryForObject("getContacto", contacto.getId());
            newContacto.setHabilitado(Boolean.FALSE);
            int resultado = sqlMap.update("editarContacto", newContacto);
            if (resultado == 1) {
                result = Boolean.TRUE;
            } else {
                result = Boolean.FALSE;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public Boolean habilitarContacto(Contacto contacto) {
        Boolean result = false;
        try {
            Contacto newContacto = (Contacto) sqlMap.queryForObject("getContacto", contacto.getId());
            newContacto.setHabilitado(Boolean.TRUE);
            int resultado = sqlMap.update("editarContacto", newContacto);
            if (resultado == 1) {
                result = Boolean.TRUE;
            } else {
                result = Boolean.FALSE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
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

    public List<Contacto> listarContactosTodos(Integer id, String nombre) {
        List<Contacto> contactos = null;

        String idContacto = "";
        if (id == null) {
            idContacto = "%";
        } else {
            idContacto = id.toString() + "%";
        }

        if (nombre == null) {
            nombre = "%";
        } else {
            nombre = nombre + "%";
        }

        try {
            Map param = new HashMap();
            param.put("id", idContacto);
            param.put("nombre", nombre);
            contactos = sqlMap.queryForList("getContactosTodos", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contactos;
    }

    public List<Contacto> listarContactosRif(String rif) {
        List<Contacto> contactos = null;

        try {
            contactos = sqlMap.queryForList("getContactosRif", rif);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contactos;
    }

    public List<Contacto> listarContactosHabilitados(Integer id, String nombre) {
        List<Contacto> contactos = null;

        String idContacto = "";
        if (id == null) {
            idContacto = "%";
        } else {
            idContacto = id.toString() + "%";
        }

        if (nombre == null) {
            nombre = "%";
        } else {
            nombre = nombre + "%";
        }

        try {
            Map param = new HashMap();
            param.put("id", idContacto);
            param.put("nombre", nombre);
            contactos = sqlMap.queryForList("getContactosHabilitados", param);
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
