package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Montaje;
import com.banquetes.servicios.interfaces.IServicioMontaje;
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
public class ServicioMontaje implements IServicioMontaje {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioMontaje() {
    }

    public boolean existeMontajeNombre(Montaje montaje) {
        Boolean existe = Boolean.TRUE;
        Montaje newMontaje = null;
        try {
            newMontaje = (Montaje) sqlMap.queryForObject("getMontajeNombre", montaje.getTipoMontaje());
            if (newMontaje == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioMontaje.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public boolean existeMontajeId(Montaje montaje) {
        Boolean existe = Boolean.TRUE;
        Montaje newMontaje = null;
        try {
            newMontaje = (Montaje) sqlMap.queryForObject("getMontaje", montaje.getId());
            if (newMontaje == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioMontaje.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public Integer crearMontaje(Montaje montaje) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeMontajeNombre(montaje);
        Integer id = null;
        try {
            if (!existe) {
                id = (Integer) sqlMap.insert("crearMontaje", montaje);
            } else {
                System.out.println("El montaje ya esta registrado");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioMontaje.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int editarMontaje(Montaje montaje) {
        int result = 0;
        Boolean existe = Boolean.TRUE;
        existe = this.existeMontajeId(montaje);
        try {
            if (existe) {
                Montaje newMontaje = (Montaje) sqlMap.queryForObject("getMontaje", montaje.getId());

                if (montaje.getTipoMontaje() != null) {
                    newMontaje.setTipoMontaje(montaje.getTipoMontaje());
                }
                result = sqlMap.update("editarMontaje", newMontaje);

            } else {
                System.out.println("No existe el montaje");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioMontaje.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Montaje> listarMontajes() {
        List<Montaje> montajes = null;

        try {
            montajes = sqlMap.queryForList("getMontajes", null);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioMontaje.class.getName()).log(Level.SEVERE, null, ex);
        }
        return montajes;
    }

    public Montaje getMontaje(Integer id) {
        Montaje montaje = null;
        try {
            montaje = (Montaje) sqlMap.queryForObject("getMontaje", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioMontaje.class.getName()).log(Level.SEVERE, null, ex);
        }
        return montaje;
    }

    public Montaje getMontajeNombre(String nombre) {
        Montaje montaje = null;
        try {
            montaje = (Montaje) sqlMap.queryForObject("getMontajeNombre", nombre);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioMontaje.class.getName()).log(Level.SEVERE, null, ex);
        }
        return montaje;
    }
}
