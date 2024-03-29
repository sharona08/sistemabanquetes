/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.servicios.impl;

import java.util.logging.Level;
import java.sql.SQLException;
import com.banquetes.dominio.EventoSala;
import com.banquetes.servicios.interfaces.IServicioEventoSala;
import java.util.List;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioEventoSalaTest {

    IServicioEventoSala servicioEventoSala = new ServicioEventoSala();

    public ServicioEventoSalaTest() {
    }

    /**
     * Test of crearEventoSala method, of class ServicioEventoSala.
     */
  //  @Test
    public void testCrearEventoSala() {
        System.out.println("crearEventoSala");
//        EventoSala eventoSala = new EventoSala(6, new Double("275.3"), 8, 5, null);
        EventoSala eventoSala = new EventoSala(5, null, 1, 5, null, Boolean.TRUE);

        try {
            this.testListarEventoSalas();
            System.out.println("");
            servicioEventoSala.crearEventoSala(eventoSala);
            this.testListarEventoSalas();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of editarEventoSala method, of class ServicioEventoSala.
     */
//    @Test
    public void testEditarEventoSala() {
        System.out.println("editarEventoSala");
        EventoSala eventoSala = new EventoSala(2, new Double("150"), new Integer(5), new Integer(2), null, Boolean.TRUE);

        try {
            System.out.println("EVENTO_SALA ANTES DEL UPDATE");
            this.testListarEventoSalas();
            int result = servicioEventoSala.editarEventoSala(eventoSala);
            System.out.println("resultado: " + result);
            System.out.println("EVENTO_SALA DESPUES DEL UPDATE");
            this.testListarEventoSalas();
        } catch (Exception e) {
        }
    }

   // @Test
    public void testEliminarEventoSala() {
        System.out.println("eliminarEventoSala");
        Integer idEvento = new Integer(5);
        Integer idSalon = new Integer(4);

        try {
            System.out.println("EVENTO_SALA ANTES DEL UPDATE");
            this.testListarEventoSalas();
            Boolean result = servicioEventoSala.eliminarEventoSala(idEvento, idSalon);
            System.out.println("resultado: " + result);
            System.out.println("EVENTO_SALA DESPUES DEL UPDATE");
            this.testListarEventoSalas();
        } catch (Exception e) {
        }
    }

    /**
     * Test of listarEventoSalas method, of class ServicioEventoSala.
     */
    @Test
    public void testListarEventoSalas() {
        System.out.println("listarEventoSalas");

        try {
            List<EventoSala> eventoSalas = servicioEventoSala.listarEventoSalas(8);
            assertNotNull(eventoSalas);
            for (EventoSala newEventoSalas : eventoSalas) {
                System.out.println("idEvento: " + newEventoSalas.getIdEvento() + ", idMontaje: " + newEventoSalas.getIdMontaje() + ", idSalon: " + newEventoSalas.getIdSalon() + ", nuevoCosto: " + newEventoSalas.getNuevoCosto());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of listarEventoSalas method, of class ServicioEventoSala.
     */
  //  @Test
    public void testListarEventoSala() {
        System.out.println("listarEventoSala");

        try {
            EventoSala eventoSala = servicioEventoSala.getEventoSala(2, 2);
            assertNotNull(eventoSala);
            System.out.println("idEvento: " + eventoSala.getIdEvento() + ", idMontaje: " + eventoSala.getIdMontaje() + ", idSalon" + eventoSala.getIdSalon() + ", nuevoCosto: " + eventoSala.getNuevoCosto());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
