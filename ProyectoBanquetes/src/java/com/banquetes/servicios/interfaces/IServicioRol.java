package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Rol;
import java.util.List;

/**
 * Servicio para la gestion de rol
 * @author maya
 * @version 1.0
 */
public interface IServicioRol {

    /**
     * Firma para verificar si existe un rol por su Nombre
     * @param montaje el objeto rol a ser verificado
     * @return boolean que indicara true si existe, false sino existe
     */
    public Boolean existeRolNombre(Rol rol);

    /**
     * Firma para verificar si existe un montaje por su Id
     * @param montaje el objeto montaje a ser verificado
     * @return boolean que indicara true si existe, false sino existe
     */
    public Boolean existeRolId(Rol Rol);

    /**
     * Firma para crear un nuevo rol
     * @param montaje el objeto rol a ser creado
     * @return Integer el identificador del rol creado
     */
    public Integer crearRol(Rol rol);

    /**
     * Firma para editar un rol existente
     * @param montaje el objeto rol a ser editado
     */
    public Boolean editarRol(Rol rol);

    /**
     * Firma para listar todos los roles
     * @return List<Rol> lista con todos los roles
     */
    public List<Rol> listarRoles(Integer id, String nombre);

    /**
     * Firma para obtener un rol por su id
     * @param id el identificador del rol a consultar
     * @return Rol consultado
     */
    public Rol getRol(Integer id);

    public Rol getRolNombre(String nombre);
}
