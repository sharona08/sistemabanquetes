/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.servicios.impl;

import com.banquetes.dominio.Iva;
import com.banquetes.servicios.interfaces.IServicioIva;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioIvaTest {

    private IServicioIva servicioIva = new ServicioIva();

    public ServicioIvaTest() {
    }

    /**
     * Test of existeIvaId method, of class ServicioIva.
     */
//    @Test
    public void testExisteIvaId() {
        System.out.println("existeIvaId");
        Iva iva = null;
        ServicioIva instance = new ServicioIva();
        boolean expResult = false;
        boolean result = instance.existeIvaId(iva);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of editarIva method, of class ServicioIva.
     */
    @Test
    public void testEditarIva() {
        System.out.println("editarIva");
        Iva iva = new Iva(new Integer(1), new Double(12));

        Boolean resultado = servicioIva.editarIva(iva);
        System.out.println("Edito: " + resultado);
    }

    /**
     * Test of listarIvas method, of class ServicioIva.
     */
    @Test
    public void testListarIvas() {
        System.out.println("listarIvas");

        List<Iva> ivas = servicioIva.listarIvas(null, null);
        for (Iva iva : ivas) {
            System.out.println("IVA: " + iva.getId() + ", " + iva.getPorcentaje());
        }
    }

    /**
     * Test of getIva method, of class ServicioIva.
     */
    @Test
    public void testGetIva() {
        System.out.println("getIva");

        Iva iva = servicioIva.getIva(new Integer(1));
        System.out.println("IVA: " + iva.getId() + ", " + iva.getPorcentaje());
    }
}
