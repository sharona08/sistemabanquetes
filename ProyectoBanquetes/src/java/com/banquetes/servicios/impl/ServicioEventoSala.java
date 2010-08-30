package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.EventoSala;
import com.banquetes.servicios.interfaces.IServicioEventoSala;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maya
 */
public class ServicioEventoSala implements IServicioEventoSala {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioEventoSala() {
    }

    public void crearEventoSala(EventoSala eventoSala) {
        try {
            sqlMap.insert("crearEventoSala", eventoSala);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEventoSala.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int editarEventoSala(EventoSala eventoSala) {
        int result = 0;
        try {
            Map param = new HashMap();
            param.put("idEvento", eventoSala.getIdEvento());
            param.put("idSalon", eventoSala.getIdSalon());

            EventoSala newEventoSala = (EventoSala) sqlMap.queryForObject("getEventoSala", param);

            if (eventoSala.getIdSalon() != null) {
                newEventoSala.setIdSalon(eventoSala.getIdSalon());
            }
            if (eventoSala.getIdMontaje() != null) {
                newEventoSala.setIdMontaje(eventoSala.getIdMontaje());
            }
            if (eventoSala.getNuevoCosto() != null) {
                newEventoSala.setNuevoCosto(eventoSala.getNuevoCosto());
            }

            result = sqlMap.update("editarEventoSala", newEventoSala);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioEventoSala.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int editarEventoSalon(EventoSala eventoSala) {
        int result = 0;
        try {
            Map param = new HashMap();
            param.put("idEvento", eventoSala.getIdEvento());
            param.put("idSalon", eventoSala.getIdSalon());

            EventoSala newEventoSala = (EventoSala) sqlMap.queryForObject("getEventoSala", param);

            if (eventoSala.getNuevoIdSalon() != null) {
                newEventoSala.setIdSalon(eventoSala.getIdSalon());
                newEventoSala.setNuevoIdSalon(eventoSala.getNuevoIdSalon());
            }
            if (eventoSala.getIdMontaje() != null) {
                newEventoSala.setIdMontaje(eventoSala.getIdMontaje());
            }
            if (eventoSala.getNuevoCosto() != null) {
                newEventoSala.setNuevoCosto(eventoSala.getNuevoCosto());
            }
            System.out.println("Id:" + newEventoSala.getNuevoIdSalon());


            result = sqlMap.update("editarEventoSalon", newEventoSala);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioEventoSala.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<EventoSala> listarEventoSalas(Integer idEvento) {
        List<EventoSala> eventoSalas = null;

        try {
            eventoSalas = sqlMap.queryForList("getEventoSalas", idEvento);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEventoSala.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eventoSalas;
    }

    public EventoSala getEventoSala(Integer idEvento, Integer idSalon) {
        EventoSala eventoSala = null;

        try {
            Map param = new HashMap();
            param.put("idEvento", idEvento);
            param.put("idSalon", idSalon);
            eventoSala = (EventoSala) sqlMap.queryForObject("getEventoSala", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEventoSala.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eventoSala;
    }
}
