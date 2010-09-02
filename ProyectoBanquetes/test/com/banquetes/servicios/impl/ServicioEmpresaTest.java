/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.servicios.impl;

import com.banquetes.servicios.interfaces.IServicioEmpresa;
import java.util.List;
import com.banquetes.dominio.Empresa;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioEmpresaTest {

    private IServicioEmpresa servicioEmpresa = new ServicioEmpresa();

    public ServicioEmpresaTest() {
    }

//    @Test
    public void testExisteEmpresa() {
        System.out.println("Existe Empresa");
        Empresa empresa = new Empresa("J-12345678-1", "MAYA C.A.", "04129513435", "Cafetal", null);

        try {
            Boolean existe = servicioEmpresa.existeEmpresa(empresa);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
        }
    }

    /**
     * Test of listarEmpresa method, of class ServicioEmpresa.
     */
    @Test
    public void testCrearEmpresa() {
        System.out.println("Crear Empresa");
        Empresa empresa = new Empresa("J-12345678-3", "empresa C.A.", null, null, Boolean.TRUE);

        try {
            Boolean result = servicioEmpresa.crearEmpresa(empresa);
            System.out.println("RESULTADO: " + result);
            this.testListarEmpresas();
        } catch (Exception e) {
        }
    }

//    @Test
    public void testEditarEmpresa() {
        System.out.println("Editar Empresa");
        Empresa empresa = new Empresa("J-29565286-0", "HBP", "02124341122", "Av. Francisco de Miranda, Centro Plaza, Torre C, Piso 15, Oficina H. - los Palos Grandes", true);

        try {
            servicioEmpresa.editarEmpresa(empresa);
            this.testListarEmpresas();
        } catch (Exception e) {
        }
    }

//    @Test
    public void testInhabilitarEmpresa() {
        System.out.println("Inhabilitar Empresa");
        Empresa empresa = new Empresa("J-12345678-1", null, null, null, null);

        try {
            servicioEmpresa.inhabilitarEmpresa(empresa);
            this.testListarEmpresas();
        } catch (Exception e) {
        }
    }

//    @Test
    public void testHabilitarEmpresa() {
        System.out.println("Habilitar Empresa");
        Empresa empresa = new Empresa("J-12345678-1", null, null, null, null);

        try {
            servicioEmpresa.habilitarEmpresa(empresa);
            this.testListarEmpresas();
        } catch (Exception e) {
        }
    }

    /**
     * Test of listarEmpresas method, of class ServicioEmpresa.
     */
//    @Test
    public void testListarEmpresas() {
        System.out.println("Servicio Empresas");
        try {
            List<Empresa> empresas = servicioEmpresa.listarEmpresas();
            assertNotNull(empresas);
            for (Empresa empresa1 : empresas) {
                System.out.println("EMPRESA LISTA: " + empresa1.getRif() + " " + empresa1.getNombre() + " " + empresa1.getDireccion() + " " + empresa1.getTelefono() + " " + empresa1.getHabilitado().toString());
            }
        } catch (Exception e) {
        }
    }

    /**
     * Test of listarEmpresas method, of class ServicioEmpresa.
     */
//    @Test
    public void testListarEmpresasTodas() {
        System.out.println("Servicio Empresas todas");
        try {
            List<Empresa> empresas = servicioEmpresa.listarEmpresasTodas("", "PAR");
            assertNotNull(empresas);
            for (Empresa empresa1 : empresas) {
                System.out.println("EMPRESA LISTA: " + empresa1.getRif() + " " + empresa1.getNombre() + " " + empresa1.getDireccion() + " " + empresa1.getTelefono() + " " + empresa1.getHabilitado().toString());
            }
        } catch (Exception e) {
        }
    }

    /**
     * Test of listarEmpresa method, of class ServicioEmpresa.
     */
    //@Test
    public void testGetEmpresa() {
        System.out.println("Servicio Empresa");
        String rif = "J-00000000-0";
        try {
            Empresa empresa = servicioEmpresa.getEmpresa(rif);
            assertNotNull(empresa);
            System.out.println("EMPRESA: " + empresa.getRif() + " " + empresa.getNombre() + " " + empresa.getDireccion() + " " + empresa.getHabilitado().toString());
        } catch (Exception e) {
        }
    }
}
