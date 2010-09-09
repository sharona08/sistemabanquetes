package com.banquetes.servicios.impl;

import com.banquetes.servicios.interfaces.IServicioServicio;
import com.banquetes.dominio.Servicio;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioServicioTest {

    private IServicioServicio servicioServicio = new ServicioServicio();

    public ServicioServicioTest() {
    }

    /**
     * Test of existeServicioNombre method, of class ServicioServicio.
     */
//    @Test
    public void testExisteServicioNombre() {
        System.out.println("existeServicioNombre");
        Servicio servicio = new Servicio(1, "TELEVISOR 20", null, null, null, null, null);

        try {
            Boolean existe = servicioServicio.existeServicioNombre(servicio);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of existeServicioId method, of class ServicioServicio.
     */
//    @Test
    public void testExisteServicioId() {
        System.out.println("existeServicioId");
        Servicio servicio = new Servicio(1, "TELEVISOR 20", null, null, null, null, null);

        try {
            Boolean existe = servicioServicio.existeServicioId(servicio);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of crearServicio method, of class ServicioServicio.
     */
//    @Test
    public void testCrearServicio() {
        System.out.println("crearServicio");
        Servicio servicio = new Servicio(null, "NUEVO SERVICIO", "COMIDA", new Double("50"), "AB", Boolean.TRUE, 1);
        Integer id = null;
        try {
            this.testListarServicios();
            System.out.println("");
            id = servicioServicio.crearServicio(servicio);
            System.out.println("SERVICIO NUEVO ID = " + id);
            this.testListarServicios();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of editarServicio method, of class ServicioServicio.
     */
    @Test
    public void testEditarServicio() {
        System.out.println("editarServicio");
        Servicio servicio = new Servicio(29, "as", "COMIDA", new Double("70"), "AB", Boolean.TRUE, 1);
        try {
            this.testListarServicios();
            System.out.println("");
            servicioServicio.editarServicio(servicio);
            this.testListarServicios();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of inhabilitarServicio method, of class ServicioServicio.
     */
//    @Test
    public void testInhabilitarServicio() {
        System.out.println("inhabilitarServicio");
        Servicio servicio = new Servicio(28, null, null, null, null, null, null);
        this.testListarServicios();
        System.out.println("");

        try {
            servicioServicio.inhabilitarServicio(servicio);
            this.testListarServicios();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of habilitarServicio method, of class ServicioServicio.
     */
//    @Test
    public void testHabilitarServicio() {
        System.out.println("habilitarServicio");
        Servicio servicio = new Servicio(28, null, null, null, null, null, null);
        this.testListarServicios();
        System.out.println("");

        try {
            servicioServicio.habilitarServicio(servicio);
            this.testListarServicios();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of listarSalones method, of class ServicioServicio.
     */
//    @Test
    public void testListarServicios() {
        System.out.println("listarServicios");
        try {
            List<Servicio> servicios = servicioServicio.listarServicios();
            assertNotNull(servicios);
            for (Servicio newServicio : servicios) {
                System.out.println(newServicio.getId() + " " + newServicio.getNombre() + " "
                        + newServicio.getDescripcion() + " " + newServicio.getCostoUnitario() + " "
                        + newServicio.getTipoServicio() + " " + newServicio.getHabilitado() + " " + newServicio.getIdDepartamento());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of getSalon method, of class ServicioServicio.
     */
//    @Test
    public void testGetServicio() {
        System.out.println("getServicio");
        try {
            Servicio servicio = servicioServicio.getServicio(new Integer(1));
            assertNotNull(servicio);
            System.out.println(servicio.getId() + " " + servicio.getNombre() + " "
                    + servicio.getDescripcion() + " " + servicio.getCostoUnitario() + " "
                    + servicio.getTipoServicio() + " " + servicio.getHabilitado() + " " + servicio.getIdDepartamento());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
