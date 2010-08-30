/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.impl;

import com.banquetes.dominio.TipoEvento;
import com.banquetes.servicios.interfaces.IServicioTipoEvento;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioTipoEventoTest {

    private IServicioTipoEvento servicioTipoEvento = new ServicioTipoEvento();

    public ServicioTipoEventoTest() {
    }

    /**
     * Test of existeTipoEventoNombre method, of class ServicioTipoEvento.
     */
   // @Test
    public void testExisteTipoEventoNombre() {
        System.out.println("existeTipoEventoNombre");
        TipoEvento tipoEvento = new TipoEvento(null, "RUEDA DE PRENSA");

        try {
            Boolean existe = servicioTipoEvento.existeTipoEventoNombre(tipoEvento);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        };
    }

    /**
     * Test of existeTipoEventoId method, of class ServicioTipoEvento.
     */
   // @Test
    public void testExisteTipoEventoId() {
        System.out.println("existeTipoEventoId");
        TipoEvento tipoEvento = new TipoEvento(new Integer(1), null);

        try {
            Boolean existe = servicioTipoEvento.existeTipoEventoId(tipoEvento);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of crearTipoEvento method, of class ServicioTipoEvento.
     */
    //@Test
    public void testCrearTipoEvento() {
        System.out.println("crearTipoEvento");
        TipoEvento tipoEvento = new TipoEvento(null, "RUEDA DE PRENSA");
        Integer id = null;
        try {
            this.testListarTipoEventos();
            System.out.println("");
            id = servicioTipoEvento.crearTipoEvento(tipoEvento);
            System.out.println("TIPO_EVENTO NUEVO ID = " + id);
            this.testListarTipoEventos();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of editarTipoEvento method, of class ServicioTipoEvento.
     */
    //@Test
    public void testEditarTipoEvento() {
        System.out.println("editarTipoEvento");
        TipoEvento tipoEvento = new TipoEvento(12, "RUEDA DE PRENSA");
        try {
            this.testListarTipoEventos();
            System.out.println("");
            servicioTipoEvento.editarTipoEvento(tipoEvento);
            this.testListarTipoEventos();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of listarTipoEventos method, of class ServicioTipoEvento.
     */
   // @Test
    public void testListarTipoEventos() {
        System.out.println("listarTipoEventos");
        try {
            List<TipoEvento> tipoEventos = servicioTipoEvento.listarTipoEventos();
            assertNotNull(tipoEventos);
            for (TipoEvento tp : tipoEventos) {
                System.out.println(tp.getId() + " " + tp.getTipoEvento());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of getTipoEvento method, of class ServicioTipoEvento.
     */
   // @Test
    public void testGetTipoEvento() {
        System.out.println("getTipoEvento");
        try {
            TipoEvento tipoEvento = servicioTipoEvento.getTipoEvento(new Integer(12));
            assertNotNull(tipoEvento);
            System.out.println(tipoEvento.getId() + " " + tipoEvento.getTipoEvento());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testGetTipoEventoNombre() {
        System.out.println("getTipoEventoNombre");
        try {
            TipoEvento tipoEvento = servicioTipoEvento.getTipoEventoNombre("ALMUERZO");
            assertNotNull(tipoEvento);
            System.out.println(tipoEvento.getId() + " " + tipoEvento.getTipoEvento());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}