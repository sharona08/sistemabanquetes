package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Evento;
import com.banquetes.dominio.ServicioServicioEvento;
import com.banquetes.servicios.TO.DetallesReservaSalonTO;
import com.banquetes.servicios.TO.DetallesReservaTO;
import java.sql.Date;
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

    public List<ServicioServicioEvento> listarServicioEventos(Integer idEvento, String tipoEvento);

    public List<ServicioServicioEvento> listarServicioEventosTodos(Integer idEvento);

    public ServicioServicioEvento getServicioEvento(Integer idEvento, Integer idSalon, Integer idServicio, Date fechaInicio);

    public Boolean eliminarServicioEvento(Integer idServicio, Integer idEvento, Integer idSalon, Date fechaInicio);

    public Double costoTotalSalones(Integer idEvento);

    public Double costoTotalServicios(Integer idEvento, String tipoServicio);

    public Double subtotalReserva(Integer idEvento);
    
    public Double diezPorciento(Integer idEvento);

    public Double ivaReserva(Integer idEvento);

    public Double costoTotalReserva(Integer idEvento);
}
