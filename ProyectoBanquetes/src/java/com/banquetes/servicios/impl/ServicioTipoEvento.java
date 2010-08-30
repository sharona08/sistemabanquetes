package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.TipoEvento;
import com.banquetes.servicios.interfaces.IServicioTipoEvento;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maya
 */
public class ServicioTipoEvento implements IServicioTipoEvento {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioTipoEvento() {
    }

    public boolean existeTipoEventoNombre(TipoEvento tipoEvento) {
        Boolean existe = Boolean.TRUE;
        TipoEvento newTipoEvento = null;
        try {
            newTipoEvento = (TipoEvento) sqlMap.queryForObject("getTipoEventoNombre", tipoEvento.getTipoEvento());
            if (newTipoEvento == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public boolean existeTipoEventoId(TipoEvento tipoEvento) {
        Boolean existe = Boolean.TRUE;
        TipoEvento newTipoEvento = null;
        try {
            newTipoEvento = (TipoEvento) sqlMap.queryForObject("getTipoEvento", tipoEvento.getId());
            if (newTipoEvento == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public Integer crearTipoEvento(TipoEvento tipoEvento) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeTipoEventoNombre(tipoEvento);
        Integer id = null;
        try {
            if (!existe) {
                id = (Integer) sqlMap.insert("crearTipoEvento", tipoEvento);
            } else {
                System.out.println("El tipo de evento ya esta registrado");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public void editarTipoEvento(TipoEvento tipoEvento) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeTipoEventoId(tipoEvento);
        try {
            if (existe) {
                TipoEvento newTipoEvento = (TipoEvento) sqlMap.queryForObject("getTipoEvento", tipoEvento.getId());

                if (tipoEvento.getTipoEvento() != null) {
                    newTipoEvento.setTipoEvento(tipoEvento.getTipoEvento());
                }

                sqlMap.update("editarTipoEvento", newTipoEvento);
            } else {
                System.out.println("No existe el tipo de evento");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<TipoEvento> listarTipoEventos() {
        List<TipoEvento> tipoEventos = null;

        try {
            tipoEventos = sqlMap.queryForList("getTipoEventos", null);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tipoEventos;
    }
    
    public TipoEvento getTipoEvento(Integer id) {
        TipoEvento tipoEvento = null;
        try {
            tipoEvento = (TipoEvento) sqlMap.queryForObject("getTipoEvento", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tipoEvento;
    }

    public TipoEvento getTipoEventoNombre(String nombre) {
        TipoEvento tipoEvento = null;
        try {
            tipoEvento = (TipoEvento) sqlMap.queryForObject("getTipoEventoNombre", nombre);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tipoEvento;
    }

}
