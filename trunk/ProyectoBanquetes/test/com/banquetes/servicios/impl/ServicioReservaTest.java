/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.impl;

import com.banquetes.dominio.Evento;
import com.banquetes.servicios.TO.DetallesReservaTO;
import com.banquetes.servicios.interfaces.IServicioReserva;
import java.util.List;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioReservaTest {

    private IServicioReserva servicioReserva = new ServicioReserva();

    public ServicioReservaTest() {
    }

    /**
     * Test of reservar method, of class ServicioReserva.
     */
   // @Test
    public void testReservar() {
        System.out.println("reservar");
        Evento evento = null;
        Integer idSalon = null;
        Integer idMontaje = null;
        Double nuevoCosto = null;
        ServicioReserva instance = new ServicioReserva();
        boolean expResult = false;
        boolean result = instance.reservar(evento, idSalon, idMontaje, nuevoCosto);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDetallesReserva method, of class ServicioReserva.
     */
    @Test
    public void testGetDetallesReserva() {
        System.out.println("getDetallesReserva");
        Integer idEvento = new Integer(3);
        DetallesReservaTO detalles = servicioReserva.getDetallesReserva(idEvento);
        System.out.println("ID: " + detalles.getIdEvento() + " nombre: " + detalles.getNombreEvento());

    }

    /**
     * Test of getDetallesReservaSalon method, of class ServicioReserva.
     */
   // @Test
    public void testGetDetallesReservaSalon() {
        System.out.println("getDetallesReservaSalon");
        Integer idEvento = null;
        ServicioReserva instance = new ServicioReserva();
        List expResult = null;
        List result = instance.getDetallesReservaSalon(idEvento);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

}