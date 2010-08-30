package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Evento;
import com.banquetes.dominio.EventoSala;
import com.banquetes.servicios.TO.DetallesReservaSalonTO;
import com.banquetes.servicios.TO.DetallesReservaTO;
import com.banquetes.servicios.interfaces.IServicioReserva;
import com.banquetes.servicios.interfaces.IServicioEvento;
import com.banquetes.servicios.interfaces.IServicioEventoSala;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maya
 */
public class ServicioReserva implements IServicioReserva {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();
    private IServicioEvento servicioEvento = new ServicioEvento();
    private IServicioEventoSala servicioEventoSala = new ServicioEventoSala();

    public ServicioReserva() {
    }

    public boolean reservar(Evento evento, Integer idSalon, Integer idMontaje, Double nuevoCosto) {
        boolean result = false;
        Integer id = servicioEvento.crearEvento(evento);
        if (id != null) {
            EventoSala eventoSala = new EventoSala(id, nuevoCosto, idSalon, idMontaje);
            servicioEventoSala.crearEventoSala(eventoSala);
        } else {
            System.out.println("ERROR: no se inserto el evento.");
        }
        return result;
    }

    public DetallesReservaTO getDetallesReserva(Integer idEvento) {
        DetallesReservaTO detalles = null;
        try {
            detalles = (DetallesReservaTO) sqlMap.queryForObject("getDetallesReserva", idEvento);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detalles;
    }

    public List<DetallesReservaSalonTO> getDetallesReservaSalon(Integer idEvento) {
        List<DetallesReservaSalonTO> detallesSalon = null;
        try {
            detallesSalon = sqlMap.queryForList("getDetallesReservaSalon", idEvento);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detallesSalon;
    }
}
