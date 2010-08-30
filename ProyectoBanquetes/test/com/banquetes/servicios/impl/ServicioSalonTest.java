/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.servicios.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import com.banquetes.dominio.Salon;
import com.banquetes.servicios.TO.DisponibilidadSalonTO;
import com.banquetes.servicios.interfaces.IServicioSalon;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioSalonTest {

    private IServicioSalon servicioSalon = new ServicioSalon();

    public ServicioSalonTest() {
    }

    /**
     * Test of existeSalon method, of class ServicioSalon.
     */
//    @Test
    public void testExisteSalon() {
        System.out.println("existeSalon");
        Salon salon = new Salon(1, "GOLD", null, null, null);

        try {
            Boolean existe = servicioSalon.existeSalonNombre(salon);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    @Test
    public void testExisteSalonId() {
        System.out.println("existeSalonId");
        Salon salon = new Salon(1, "GOLD", null, null, null);

        try {
            Boolean existe = servicioSalon.existeSalonId(salon);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of crearSalon method, of class ServicioSalon.
     */
    //@Test
    public void testCrearSalon() {
        System.out.println("crearSalon");
        Salon salon = new Salon(null, "HTV", new Double("350"), Boolean.TRUE, null);
        Integer id = null;
        try {
            this.testListarSalones();
            System.out.println("");
            id = servicioSalon.crearSalon(salon);
            System.out.println("SALON NUEVO ID = " + id);
            this.testListarSalones();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of editarSalon method, of class ServicioSalon.
     */
    //@Test
    public void testEditarSalon() {
        System.out.println("editarSalon");
        Salon salon = new Salon(9, "MTV!", new Double("400"), null, null);
        try {
            this.testListarSalones();
            System.out.println("");
            servicioSalon.editarSalon(salon);
            this.testListarSalones();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of inhabilitarSalon method, of class ServicioSalon.
     */
    //@Test
    public void testInhabilitarSalon() {
        System.out.println("inhabilitarSalon");
        Salon salon = new Salon(9, null, null, null, null);
        this.testListarSalones();
        System.out.println("");

        try {
            servicioSalon.inhabilitarSalon(salon);
            this.testListarSalones();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of habilitarSalon method, of class ServicioSalon.
     */
//    @Test
    public void testHabilitarSalon() {
        System.out.println("habilitarSalon");
        Salon salon = new Salon(9, null, null, null, null);
        this.testListarSalones();
        System.out.println("");

        try {
            servicioSalon.habilitarSalon(salon);
            this.testListarSalones();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of listarSalones method, of class ServicioSalon.
     */
   // @Test
    public void testListarSalones() {
        System.out.println("listarSalones");
        try {
            List<Salon> salones = servicioSalon.listarSalones();
            assertNotNull(salones);
            for (Salon newSalon : salones) {
                System.out.println(newSalon.getId() + " " + newSalon.getNombre() + " " + newSalon.getCosto() + " " + newSalon.getHabilitado());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of listarSalones method, of class ServicioSalon.
     */
    //@Test
    public void testListarDisponibilidadSalones() {
        System.out.println("listarDisponibilidadSalones");
        try {
            String date = "2010-08-26";
            DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedFechaInicio = formater.parse(date);
            java.sql.Date sqlFecha = new java.sql.Date(parsedFechaInicio.getTime());

            List<DisponibilidadSalonTO> dispon = servicioSalon.listarDisponibilidadSalones("PRESIDENTE", sqlFecha);
            assertNotNull(dispon);
            for (DisponibilidadSalonTO disponibilidadSalonTO : dispon) {
            System.out.println(disponibilidadSalonTO.getIdEvento() + " " + disponibilidadSalonTO.getNombreEvento() + " " + disponibilidadSalonTO.getFechaInicio() + " " + disponibilidadSalonTO.getFechaFin() + " " + disponibilidadSalonTO.getHoraInicio() + " " + disponibilidadSalonTO.getHoraFin() + " NOMBRE DEL SALON: " + disponibilidadSalonTO.getNombreSalon());

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of getSalon method, of class ServicioSalon.
     */
    //@Test
    public void testGetSalon() {
        System.out.println("getSalon");
        try {
            Salon salon = servicioSalon.getSalon(new Integer(1));
            assertNotNull(salon);
            System.out.println(salon.getId() + " " + salon.getNombre() + " " + salon.getCosto() + " " + salon.getHabilitado());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * Test of getSalon method, of class ServicioSalon.
     */
    @Test
    public void testGetSalonNombre() {
        System.out.println("getSalonNombre");
        try {
            Salon salon = servicioSalon.getSalonNombre("CONSUL");
            assertNotNull(salon);
            System.out.println(salon.getId() + " " + salon.getNombre() + " " + salon.getCosto() + " " + salon.getHabilitado());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
