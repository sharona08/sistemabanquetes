/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.impl;

import java.sql.Time;
import com.banquetes.util.UtilMethods;
import com.banquetes.dominio.Evento;
import com.banquetes.dominio.ServicioServicioEvento;
import com.banquetes.servicios.TO.DetallesReservaTO;
import com.banquetes.servicios.interfaces.IServicioReserva;
import java.util.List;
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
    //@Test
    public void testReservar() {
        System.out.println("reservar");
        UtilMethods util = new UtilMethods();
        java.sql.Date fechaInicio = util.getSqlDate("2010-09-12");
        java.sql.Date fechaFin = util.getSqlDate("2010-09-12");
        java.sql.Time horaInicio = Time.valueOf("23:50:00");
        java.sql.Time horaFin = Time.valueOf("23:50:00");

        Evento evento = new Evento(null, "T", "PRUEBA", new Integer(8), fechaInicio, fechaFin, new Integer(30), horaInicio, horaFin, "J-00000000-0", 7, null);
        Integer idSalon = new Integer(4);
        Integer idMontaje = new Integer(5);
//        Double nuevoCosto = new Double(120);
        Double nuevoCosto = null;

        Integer result = servicioReserva.reservar(evento, idSalon, idMontaje, nuevoCosto);
        System.out.println("RESULTADO: " + result);
    }

    //@Test
    public void testCrearServicioEvento(){
        System.out.println("testCrearServicioEvento");
        ServicioServicioEvento servicioEvento = new ServicioServicioEvento(1, 2, 4, 30, Time.valueOf("23:50:00"), Time.valueOf("23:50:00"), "", Double.valueOf("50.0"), "", "");

        Boolean result = servicioReserva.crearServicioEvento(servicioEvento);
        System.out.println("Inserto: " + result);
    }

    @Test
    public void testEliminarServicioEvento(){
        System.out.println("testCrearServicioEvento");

        Integer idServicio = new Integer(27);
        Integer idEvento = new Integer(5);
        Integer idSalon = new Integer(4);
        
        ServicioServicioEvento servicioEvento = new ServicioServicioEvento(idServicio, idEvento, idSalon, 30, Time.valueOf("23:50:00"), Time.valueOf("23:50:00"), "", Double.valueOf("50.0"), "", "");

        Boolean result = servicioReserva.eliminarServicioEvento(idServicio, idEvento, idSalon);
        System.out.println("Elimino: " + result);
    }

    @Test
    public void testGetServiciosEvento(){
        System.out.println("testGetServiciosEvento");
        
        List<ServicioServicioEvento> servicios = servicioReserva.listarServicioEventos(5, "AB");
        for (ServicioServicioEvento s : servicios) {
            System.out.println("idEvento: " + s.getIdEvento() + ", idSalon: " + s.getIdSalon() + ", idServicio: " + s.getIdServicio());
        }
    }

   // @Test
    public void testGetServiciosEventoTodos(){
        System.out.println("testGetServiciosEventoTodos");

        List<ServicioServicioEvento> servicios = servicioReserva.listarServicioEventosTodos(10);
        for (ServicioServicioEvento s : servicios) {
            System.out.println("idEvento: " + s.getIdEvento() + ", idSalon: " + s.getIdSalon() + ", idServicio: " + s.getIdServicio());
        }
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