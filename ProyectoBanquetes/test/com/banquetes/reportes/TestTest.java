/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.reportes;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class TestTest {

    Reportes test = new Reportes();

    public TestTest() {
    }

    /**
     * Reportes of reporteTest method, of class Reportes.
     */
    //@Test
    public void testReporteTest() {
        System.out.println("reporteTest");
        test.reporteSalonesPDF();
    }

    @Test
    public void testReporteContactosEmpresa() {
        System.out.println("reporteContactosEmpresa");
        String rifEmpresa = "J-00000000-0";

        test.reporteContactosEmpresaPDF(rifEmpresa);
    }

}