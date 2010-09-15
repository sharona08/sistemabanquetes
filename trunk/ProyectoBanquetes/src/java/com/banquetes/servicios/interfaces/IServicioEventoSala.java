package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.EventoSala;
import java.util.List;

/**
 *
 * @author maya
 */
public interface IServicioEventoSala {

    public Boolean crearEventoSala(EventoSala eventoSala);

    public int editarEventoSala(EventoSala eventoSala);

    public Boolean eliminarEventoSala(Integer idEvento, Integer idSalon);

    public List<EventoSala> listarEventoSalas(Integer idEvento);
    
    public EventoSala getEventoSala(Integer idEvento, Integer idSalon) ;

}
