/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.impl;

import com.banquetes.dominio.Usuario;
import com.banquetes.servicios.interfaces.IServicioUsuario;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioUsuarioTest {

    private IServicioUsuario servicioUsuario = new ServicioUsuario();

    public ServicioUsuarioTest() {
    }

    /**
     * Test of existeUsuario method, of class ServicioUsuario.
     */
    //@Test
    public void testExisteUsuario() {
        System.out.println("existeUsuario");
        Usuario usuario = null;
        ServicioUsuario instance = new ServicioUsuario();
        Boolean expResult = null;
        Boolean result = instance.existeUsuario(usuario);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of crearUsuario method, of class ServicioUsuario.
     */
    //@Test
    public void testCrearUsuario() {
        System.out.println("crearUsuario");
        Usuario usuario = null;
        ServicioUsuario instance = new ServicioUsuario();
        String expResult = "";
        String result = instance.crearUsuario(usuario);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of editarUsuario method, of class ServicioUsuario.
     */
    //@Test
    public void testEditarUsuario() {
        System.out.println("editarUsuario");
        Usuario usuario = new Usuario("ADMIN", "ADMIN", "MARIA", "URIBE", "mariale.uribe@gmail.com", new Integer(1));
        Boolean result = servicioUsuario.editarUsuario(usuario);
        System.out.println("Edito: " + result);
    }

    /**
     * Test of listarUsuarios method, of class ServicioUsuario.
     */
    @Test
    public void testListarUsuarios() {
        System.out.println("listarUsuarios");
        List<Usuario> users = servicioUsuario.listarUsuarios();
        for (Usuario usuario : users) {
        System.out.println(usuario.getUsername() + ", " + usuario.getNombre() + ", " + usuario.getApellido() + ", " + usuario.getPassword() + ", " + usuario.getCorreo() + ", " + usuario.getIdRol());
        }
    }

    /**
     * Test of listarUsuariosTodos method, of class ServicioUsuario.
     */
   // @Test
    public void testListarUsuariosTodos() {
        System.out.println("listarUsuariosTodos");
        String username = "";
        String nombre = "";
        String apellido = "";
        ServicioUsuario instance = new ServicioUsuario();
        List expResult = null;
        List result = instance.listarUsuariosTodos(username, nombre, apellido);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUsuario method, of class ServicioUsuario.
     */
    //@Test
    public void testGetUsuario() {
        System.out.println("getUsuario");
        String username = "HUGO";
        Usuario user = servicioUsuario.getUsuario(username);
        System.out.println("USER: " + user.getUsername() + ", " + user.getNombre() + ", " + user.getPassword());
    }

}