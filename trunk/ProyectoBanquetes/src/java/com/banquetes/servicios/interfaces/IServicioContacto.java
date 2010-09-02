package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Contacto;
import java.util.List;

/**
 * Servicio para la gestion de contactos
 * @author maya
 * @version 1.0
 */
public interface IServicioContacto {

    /**
     * Firma para crear un nuevo contacto
     * @param contacto el objeto contacto que sera creado
     * @return Integer el identificador del objeto contacto creado
     */
    public Integer crearContacto(Contacto contacto);

    /**
     * Firma para editar un contacto existente 
     * @param contacto objeto contacto que sera editado
     */
    public Boolean editarContacto(Contacto contacto);

    /**
     * Firma para inhabilitar un contacto existente
     * @param contacto el objeto contacto que sera inhabilitado
     */
    public Boolean inhabilitarContacto(Contacto contacto);

    /**
     * Firma para habilitar un contacto existente
     * @param contacto el objeto contacto que sera habilitado
     */
    public Boolean habilitarContacto(Contacto contacto);

    /**
     * Firma para listar todos los contactos 
     * @return List<Contacto> lista de todos los contactos 
     */
    public List<Contacto> listarContactos();

    /**
     * Firma para listar todos los contactos todos
     * @return List<Contacto> lista de todos los contactos todos
     */
    public List<Contacto> listarContactosTodos(Integer id, String nombre);

    /**
     * Firma para listar todos los contactos por rif
     * @return List<Contacto> lista de todos los contactos por rif
     */
    public List<Contacto> listarContactosRif(String rif);

    /**
     * Firma para listar todos los contactos habilitados
     * @return List<Contacto> lista de todos los contactos habilitados
     */
    public List<Contacto> listarContactosHabilitados(Integer id, String nombre);

    /**
     * Firma para obtener un contacto mediante su id
     * @param id el identificador con el cual se buscara 
     * @return Contacto objeto contacto con el id ingresado 
     */
    public Contacto getContacto(Integer id);
}
