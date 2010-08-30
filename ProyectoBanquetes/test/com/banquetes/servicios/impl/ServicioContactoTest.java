package com.banquetes.servicios.impl;

import com.banquetes.servicios.interfaces.IServicioContacto;
import java.util.List;
import com.banquetes.dominio.Contacto;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioContactoTest {

    private IServicioContacto servicioContacto = new ServicioContacto();

    public ServicioContactoTest() {
    }

    /**
     * Test of crearContacto method, of class ServicioContacto.
     */
//    @Test
    public void testCrearContacto() {
        System.out.println("crearContacto");
        Contacto contacto = new Contacto("CARLOS", "0212221111", "ALTO HATILLO", Boolean.TRUE, "J-00000000-0");
        Integer id = null;
        try {
            id = servicioContacto.crearContacto(contacto);
            System.out.println("CONTACTO NUEVO ID = " + id);
            this.testListarContactos();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    @Test
    public void testEditarContacto() {
        System.out.println("Editar Contacto");
        Contacto contacto = new Contacto(2, null, "12345", "LOS RUICES", Boolean.TRUE, null);

        try {
            servicioContacto.editarContacto(contacto);
            this.testListarContactos();
        } catch (Exception e) {
        }
    }

//    @Test
    public void testInhabilitarContacto() {
        System.out.println("Inhabilitar contacto");
        Contacto contacto = new Contacto(2, null, null, null, null, null);
        this.testListarContactos();
        System.out.println("");
        
        try {
            servicioContacto.inhabilitarContacto(contacto);
            this.testListarContactos();
        } catch (Exception e) {
        }
    }

    @Test
    public void testHabilitarContacto() {
        System.out.println("Habilitar contacto");
        Contacto contacto = new Contacto(2, null, null, null, null, null);

        try {
            servicioContacto.habilitarContacto(contacto);
            this.testListarContactos();
        } catch (Exception e) {
        }
    }

    @Test
    public void testListarContactos() {
        System.out.println("ListarContactos");
        try {
            List<Contacto> contactos = servicioContacto.listarContactos();
            assertNotNull(contactos);
            for (Contacto contacto : contactos) {
                System.out.println("CONTACTOS: " + contacto.getId() + " " + contacto.getNombre() + " " + contacto.getDireccion() + " " + contacto.getTelefono() + " " + contacto.getHabilitado().toString() + " " + contacto.getRifEmpresa());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testGetContacto() {
        System.out.println("ServicioContacto");
        Integer id = 1;
        try {
            Contacto contacto = servicioContacto.getContacto(id);
            assertNotNull(contacto);
            System.out.println("CONTACTOS: " + contacto.getId() + " " + contacto.getNombre() + " " + contacto.getDireccion() + " " + contacto.getTelefono() + " " + contacto.getHabilitado().toString() + " " + contacto.getRifEmpresa());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
