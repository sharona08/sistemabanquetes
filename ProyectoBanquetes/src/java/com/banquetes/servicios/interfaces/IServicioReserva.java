package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Evento;
import com.banquetes.servicios.TO.DetallesReservaSalonTO;
import com.banquetes.servicios.TO.DetallesReservaTO;
import java.util.List;

/**
 *
 * @author maya
 */
public interface IServicioReserva {

    public Boolean reservar(Evento evento, Integer idSalon, Integer idMontaje, Double nuevoCosto);

    public DetallesReservaTO getDetallesReserva(Integer idEvento);

    public List<DetallesReservaSalonTO> getDetallesReservaSalon(Integer idEvento);

}
