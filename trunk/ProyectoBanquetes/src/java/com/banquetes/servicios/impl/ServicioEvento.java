package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Evento;
import com.banquetes.servicios.interfaces.IServicioEvento;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maya
 */
public class ServicioEvento implements IServicioEvento {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioEvento() {
    }

    public Integer crearEvento(Evento evento) {
        Integer id = null;
        try {
            id = (Integer) sqlMap.insert("crearEvento", evento);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int editarEvento(Evento evento) {
        int result = 0;
        try {
            Evento newEvento = (Evento) sqlMap.queryForObject("getEvento", evento.getId());
            if (evento.getEstado() != null) {
                newEvento.setEstado(evento.getEstado());
            }
            if (evento.getNombre() != null) {
                newEvento.setNombre(evento.getNombre());
            }
            if (evento.getFechaInicio() != null) {
                newEvento.setFechaInicio(evento.getFechaInicio());
            }
            if (evento.getFechaFin() != null) {
                newEvento.setFechaFin(evento.getFechaFin());
            }
            if (evento.getCantidadPersonas() != null) {
                newEvento.setCantidadPersonas(evento.getCantidadPersonas());
            }
            if (evento.getIdTipoEvento() != null) {
                newEvento.setIdTipoEvento(evento.getIdTipoEvento());
            }
            if (evento.getHoraInicio() != null) {
                newEvento.setHoraInicio(evento.getHoraInicio());
            }
            if (evento.getHoraFin() != null) {
                newEvento.setHoraFin(evento.getHoraFin());
            }
            if (evento.getIdContacto() != null) {
                newEvento.setIdContacto(evento.getIdContacto());
            }
            if (evento.getNota() != null) {
                newEvento.setNota(evento.getNota());
            }

            result = sqlMap.update("editarEvento", newEvento);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Evento> listarEventos() {
        List<Evento> eventos = null;

        try {
            eventos = sqlMap.queryForList("getEventos", null);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eventos;
    }

    public Evento getEvento(Integer id) {
        Evento evento = null;
        try {
            evento = (Evento) sqlMap.queryForObject("getEvento", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return evento;
    }
}
