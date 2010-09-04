/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.impl;

import java.sql.Time;
import com.banquetes.util.UtilMethods;
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
    @Test
    public void testReservar() {
        System.out.println("reservar");
        UtilMethods util = new UtilMethods();
        java.sql.Date fechaInicio = util.getSqlDate("2010-09-10");
        java.sql.Date fechaFin = util.getSqlDate("2010-09-10");
        java.sql.Time horaInicio = Time.valueOf("12:00:00");
        java.sql.Time horaFin = Time.valueOf("15:00:00");

        Evento evento = new Evento(null, null, "NUEVO EVENTO", new Integer(6), fechaInicio, fechaFin, new Integer(30), horaInicio, horaFin, "J-00000000-0", 2);
        Integer idSalon = new Integer(4);
        Integer idMontaje = new Integer(5);
        Double nuevoCosto = new Double(120);

        Boolean result = servicioReserva.reservar(evento, idSalon, idMontaje, nuevoCosto);
        System.out.println("RESULTADO: " + result);
    }

    /**
     * Test of getDetallesReserva method, of class ServicioReserva.
     */
//    @Test
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