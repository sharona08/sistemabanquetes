package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Servicio;
import java.util.List;

/**
 * Servicio para la gestion de servicios 
 * @author maya
 * @version 1.0
 */
public interface IServicioServicio {

    /**
     * Firma para verificar la existencia de un servicio por su nombre 
     * @param servicio el objeto servicio a ser verificado
     * @return boolean que indica true si existe, de lo contrario false
     */
    public boolean existeServicioNombre(Servicio servicio);

    /**
     * Firma para verificar la existencia de un servicio por su Id
     * @param servicio el objeto servicio a ser verificado
     * @return boolean que indica true si existe, de lo contrario false
     */
    public boolean existeServicioId(Servicio servicio);

    /**
     * Firma para crear un nuevo servicio
     * @param servicio el objeto servicio que sera creado
     * @return Integer el identificador del objeto creado 
     */
    public Integer crearServicio(Servicio servicio);

    /**
     * Firma para editar un servicio existente
     * @param servicio el objeto servicio que sera editado 
     */
    public void editarServicio(Servicio servicio);

    /**
     * Firma para inhabilitar un servicio existente
     * @param servicio el objeto servicio que sera inhabilitado 
     */
    public void inhabilitarServicio(Servicio servicio);

    /**
     * Firma para habilitar un servicio existente
     * @param servicio el objeto servicio que sera habilitado
     */
    public void habilitarServicio(Servicio servicio);

    /**
     * Firma para listar todos los servicios 
     * @return List<Servicio> lista con todos los servicios 
     */
    public List<Servicio> listarServicios();

    /**
     * Firma para obtener un servicio por su id
     * @param id el identificador con el que se buscara el servicio
     * @return Servicio el objeto servicio consultado 
     */
    public Servicio getServicio(Integer id);
}
