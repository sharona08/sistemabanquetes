package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.TipoEvento;
import java.util.List;

/**
 *
 * @author maya
 */
public interface IServicioTipoEvento {

    public boolean existeTipoEventoNombre(TipoEvento tipoEvento);
    
    public boolean existeTipoEventoId(TipoEvento tipoEvento);

    public Integer crearTipoEvento(TipoEvento tipoEvento);

    public void editarTipoEvento(TipoEvento tipoEvento);

    public List<TipoEvento> listarTipoEventos();
    
    public TipoEvento getTipoEvento(Integer id);

    public TipoEvento getTipoEventoNombre(String nombre);
    
}
