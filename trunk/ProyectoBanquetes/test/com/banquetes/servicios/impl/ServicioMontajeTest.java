/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.servicios.impl;

import com.banquetes.servicios.interfaces.IServicioMontaje;
import com.banquetes.dominio.Montaje;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioMontajeTest {

    private IServicioMontaje servicioMontaje = new ServicioMontaje();

    public ServicioMontajeTest() {
    }

    /**
     * Test of existeMontajeNombre method, of class ServicioMontaje.
     */
    //@Test
    public void testExisteMontajeNombre() {
        System.out.println("existeMontajeNombre");
        Montaje montaje = new Montaje(1, "TEATRO");
        try {
            Boolean existe = servicioMontaje.existeMontajeNombre(montaje);
            assertTrue(existe);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of existeMontajeId method, of class ServicioMontaje.
     */
    //@Test
    public void testExisteMontajeId() {
        System.out.println("existeMontajeId");
        Montaje montaje = new Montaje(1, "TEATRO");
        try {
            Boolean existe = servicioMontaje.existeMontajeId(montaje);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of crearMontaje method, of class ServicioMontaje.
     */
    //@Test
    public void testCrearMontaje() {
        System.out.println("crearMontaje");
        Montaje montaje = new Montaje(null, "ROLLITO");
        Integer id = null;
        try {
            this.testListarMontajes();
            System.out.println("");
            id = servicioMontaje.crearMontaje(montaje);
            System.out.println("MONTAJE NUEVO ID = " + id);
            this.testListarMontajes();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of editarMontaje method, of class ServicioMontaje.
     */
    //@Test
    public void testEditarMontaje() {
        System.out.println("editarMontaje");
        Montaje montaje = new Montaje(1, null);
        try {
            this.testListarMontajes();
            System.out.println("");
            servicioMontaje.editarMontaje(montaje);
            this.testListarMontajes();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of listarMontajes method, of class ServicioMontaje.
     */
    @Test
    public void testListarMontajes() {
        System.out.println("listarMontajes");
        try {
            List<Montaje> montajes = servicioMontaje.listarMontajes();
            assertNotNull(montajes);
            for (Montaje newMontaje : montajes) {
                System.out.println(newMontaje.getId() + " " + newMontaje.getTipoMontaje());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of getMontaje method, of class ServicioMontaje.
     */
    //@Test
    public void testGetMontaje() {
        System.out.println("getMontaje");
        try {
            Montaje montaje = servicioMontaje.getMontaje(new Integer(1));
            assertNotNull(montaje);
            System.out.println(montaje.getId() + " " + montaje.getTipoMontaje());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of getMontaje method, of class ServicioMontaje.
     */
    @Test
    public void testGetMontajeNombre() {
        System.out.println("getMontajeNombre");
        try {
            Montaje montaje = servicioMontaje.getMontajeNombre("U");
            assertNotNull(montaje);
            System.out.println(montaje.getId() + " " + montaje.getTipoMontaje());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
