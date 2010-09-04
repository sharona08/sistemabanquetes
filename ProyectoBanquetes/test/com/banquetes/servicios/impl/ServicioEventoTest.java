/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.servicios.impl;

import com.banquetes.dominio.Evento;
import com.banquetes.servicios.interfaces.IServicioEvento;
import com.banquetes.util.UtilMethods;
import java.sql.Time;
import java.util.List;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioEventoTest {

    private IServicioEvento servicioEvento = new ServicioEvento();
    private UtilMethods util = new UtilMethods();

    public ServicioEventoTest() {
    }

    /**
     * Test of crearEvento method, of class ServicioEvento.
     */
    //@Test
    public void testCrearEvento() {
        System.out.println("crearEvento");
        this.testListarEventos();
        System.out.println("");
        UtilMethods util2 = new UtilMethods();
        java.sql.Date fechaInicio = util2.getSqlDate("2010-08-31");
        java.sql.Date fechaFin = util2.getSqlDate("2010-09-01");
        java.sql.Time horaInicio = Time.valueOf("12:00:00");
        java.sql.Time horaFin = Time.valueOf("15:00:00");

        Evento evento = new Evento(null, null, "PRESENTACION", new Integer(6), fechaInicio, fechaFin, new Integer(30), horaInicio, horaFin, "J-00000000-0", 2);

        Integer id = null;
        try {
            id = servicioEvento.crearEvento(evento);
            System.out.println("EVENTO NUEVO ID = " + id);
            this.testListarEventos();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of editarEvento method, of class ServicioEvento.
     */
//    @Test
    public void testEditarEvento() {
        System.out.println("editarEvento");
        this.testListarEventos();
        java.sql.Time horaInicio = Time.valueOf("08:00:00");
        java.sql.Time horaFin = Time.valueOf("10:10:00");
        java.sql.Date fechaFin = util.getSqlDate("2010-08-30");
        Evento evento = new Evento(2, "C", null, new Integer(8), null, fechaFin, null, horaInicio, horaFin, null, null);

        try {
            int result = servicioEvento.editarEvento(evento);
            System.out.println("RESULT: " + result);
            this.testListarEventos();
        } catch (Exception e) {
        }
    }

    /**
     * Test of listarEventos method, of class ServicioEvento.
     */
    @Test
    public void testListarEventos() {
        System.out.println("listarEventos");
        try {
            List<Evento> eventos = servicioEvento.listarEventos();
            assertNotNull(eventos);
            for (Evento evento : eventos) {
                System.out.println("EVENTOS: " + evento.getId() + " " + evento.getNombre() + " idTipoEvento: " + evento.getIdTipoEvento() + " " + evento.getEstado() + " " + evento.getFechaInicio() + " " + evento.getFechaFin() + " " + evento.getHoraInicio() + " " + evento.getHoraFin() + " " + evento.getCantidadPersonas());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of getEvento method, of class ServicioEvento.
     */
//    @Test
    public void testGetEvento() {
        System.out.println("getEvento");
        try {
            Evento evento = servicioEvento.getEvento(new Integer(1));
            assertNotNull(evento);
            System.out.println("EVENTOS: " + evento.getId() + " " + evento.getNombre() + " " + evento.getEstado() + " " + evento.getFechaInicio() + " " + evento.getFechaFin() + " " + evento.getHoraInicio() + " " + evento.getHoraFin() + " " + evento.getCantidadPersonas());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
