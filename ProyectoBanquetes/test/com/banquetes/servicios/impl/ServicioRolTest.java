/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.impl;

import com.banquetes.dominio.Rol;
import com.banquetes.servicios.interfaces.IServicioRol;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioRolTest {
    
    private IServicioRol servicioRol = new ServicioRol();

    public ServicioRolTest() {
    }


    /**
     * Test of existeRolNombre method, of class ServicioRol.
     */
    //@Test
    public void testExisteRolNombre() {
        System.out.println("existeRolNombre");
        Rol rol = null;
        ServicioRol instance = new ServicioRol();
        Boolean expResult = null;
        Boolean result = instance.existeRolNombre(rol);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of existeRolId method, of class ServicioRol.
     */
    //@Test
    public void testExisteRolId() {
        System.out.println("existeRolId");
        Rol rol = null;
        ServicioRol instance = new ServicioRol();
        Boolean expResult = null;
        Boolean result = instance.existeRolId(rol);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of crearRol method, of class ServicioRol.
     */
    //@Test
    public void testCrearRol() {
        System.out.println("crearRol");
        Rol rol = null;
        ServicioRol instance = new ServicioRol();
        Integer expResult = null;
        Integer result = instance.crearRol(rol);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of editarRol method, of class ServicioRol.
     */
    //@Test
    public void testEditarRol() {
        System.out.println("editarRol");
        Rol rol = null;
        ServicioRol instance = new ServicioRol();
        Boolean expResult = null;
        Boolean result = instance.editarRol(rol);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of listarRoles method, of class ServicioRol.
     */
    @Test
    public void testListarRoles() {
        System.out.println("listarRoles");
        List<Rol> roles = servicioRol.listarRoles(null, null);
        for (Rol rol : roles) {
            System.out.println("ROL: " + rol.getId() + ", " + rol.getTipoRol());
        }
    }

    /**
     * Test of getRol method, of class ServicioRol.
     */
    //@Test
    public void testGetRol() {
        System.out.println("getRol");
        Integer id = null;
        ServicioRol instance = new ServicioRol();
        Rol expResult = null;
        Rol result = instance.getRol(id);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getRolNombre method, of class ServicioRol.
     */
    //@Test
    public void testGetRolNombre() {
        System.out.println("getRolNombre");
        String nombre = "";
        ServicioRol instance = new ServicioRol();
        Rol expResult = null;
        Rol result = instance.getRolNombre(nombre);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

}