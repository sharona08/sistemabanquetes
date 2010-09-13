package com.banquetes.servicios.interfaces;

import com.banquetes.dominio.Usuario;
import java.util.List;

/**
 * Servicio para la gestion de usuarios
 * @author maya
 * @version 1.0
 */
public interface IServicioUsuario {

    /**
     * Firma para verificar si existe un usuario por su username
     * @param usuario el objeto usuario que sera verificado
     * @return boolean si retorna true existe, si retorna false no existe
     */
    public Boolean existeUsuario(Usuario usuario);

    /**
     * Firma para crear una nuevo usuario
     * @param empresa objeto usuario a ser creado
     */
    public String crearUsuario(Usuario usuario);

    /**
     * Firma para editar un usuario
     * @param empresa el objeto usuario que sera editado
     */
    public Boolean editarUsuario(Usuario usuario);

    /**
     * Firma para listar todas las usuarios
     * @return List<Usuario> lista de todos las usuarios
     */
    public List<Usuario> listarUsuarios();

    /**
     * Firma para listar todos los usuarios
     * @return List<Usuario> lista de todos los usuarios
     */
    public List<Usuario> listarUsuariosTodos(String username, String nombre, String apellido);

    /**
     * Firma para obtener un usuario dado el username
     * @param username el username mediante el cual se buscara el usuario
     * @return Usuario objeto usuario encontrado con el username
     */
    public Usuario getUsuario(String username);

}
