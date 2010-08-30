package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Montaje;
import java.util.List;

/**
 * Servicio para la gestion de montajes 
 * @author maya
 * @version 1.0
 */
public interface IServicioMontaje {

    /**
     * Firma para verificar si existe un montaje por su Nombre
     * @param montaje el objeto montaje a ser verificado
     * @return boolean que indicara true si existe, false sino existe
     */
    public boolean existeMontajeNombre(Montaje montaje);

    /**
     * Firma para verificar si existe un montaje por su Id
     * @param montaje el objeto montaje a ser verificado
     * @return boolean que indicara true si existe, false sino existe
     */
    public boolean existeMontajeId(Montaje montaje);

    /**
     * Firma para crear un nuevo montaje
     * @param montaje el objeto montaje a ser creado
     * @return Integer el identificador del montaje creado 
     */
    public Integer crearMontaje(Montaje montaje);

    /**
     * Firma para editar un montaje existente
     * @param montaje el objeto montaje a ser editado
     */
    public int editarMontaje(Montaje montaje);

    /**
     * Firma para listar todos los montajes
     * @return List<Montaje> lista con todos los montajes 
     */
    public List<Montaje> listarMontajes();

    /**
     * Firma para obtener un montaje por su id
     * @param id el identificador del montaje a consultar
     * @return Montaje consultado 
     */
    public Montaje getMontaje(Integer id);

    public Montaje getMontajeNombre(String nombre);
}
