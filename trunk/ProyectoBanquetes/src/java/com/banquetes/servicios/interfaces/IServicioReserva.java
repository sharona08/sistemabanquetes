package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Evento;
import com.banquetes.dominio.ServicioServicioEvento;
import com.banquetes.servicios.TO.DetallesReservaSalonTO;
import com.banquetes.servicios.TO.DetallesReservaTO;
import java.util.List;

/**
 *
 * @author maya
 */
public interface IServicioReserva {

    public Integer reservar(Evento evento, Integer idSalon, Integer idMontaje, Double nuevoCosto);

    public DetallesReservaTO getDetallesReserva(Integer idEvento);

    public List<DetallesReservaSalonTO> getDetallesReservaSalon(Integer idEvento);

    public Boolean crearServicioEvento(ServicioServicioEvento servicioEvento);
    
    public Boolean editarServicioEvento(ServicioServicioEvento servicioEvento);

    public List<ServicioServicioEvento> listarServicioEventos(Integer idEvento);

    public ServicioServicioEvento getServicioEvento(Integer idEvento, Integer idSalon, Integer idServicio);

}
