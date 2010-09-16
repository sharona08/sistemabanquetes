package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Evento;
import java.util.List;

/**
 *
 * @author maya
 */
public interface IServicioEvento {

    public boolean existeEventoId(Evento evento);

    public Integer crearEvento(Evento evento);
    
    public int editarEvento(Evento evento) ;

    public List<Evento> listarEventos();
    
    public Evento getEvento(Integer id);

}
