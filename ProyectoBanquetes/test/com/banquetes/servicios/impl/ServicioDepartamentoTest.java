/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.servicios.impl;

import com.banquetes.servicios.interfaces.IServicioDepartamento;
import com.banquetes.dominio.Departamento;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author maya
 */
public class ServicioDepartamentoTest {

    private IServicioDepartamento servicioDepartamento = new ServicioDepartamento();

    public ServicioDepartamentoTest() {
    }

    /**
     * Test of existeDepartamentoNombre method, of class ServicioDepartamento.
     */
//    @Test
    public void testExisteDepartamentoNombre() {
        System.out.println("existeDepartamentoNombre");
        Departamento departamento = new Departamento(1, "BANQUETES");
        try {
            Boolean existe = servicioDepartamento.existeDepartamentoNombre(departamento);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of existeMontajeId method, of class ServicioDepartamento.
     */
//    @Test
    public void testExisteDepartamentoId() {
        System.out.println("existeDepartamentoId");
        Departamento departamento = new Departamento(1, "BANQUETES");
        try {
            Boolean existe = servicioDepartamento.existeDepartamentoId(departamento);
            System.out.println("Existe? : -> " + existe.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of crearMontaje method, of class ServicioDepartamento.
     */
//    @Test
    public void testCrearDepartamento() {
        System.out.println("crearDepartamento");
        Departamento departamento = new Departamento(null, "RECEPCION");
        Integer id = null;
        try {
            this.testListarDepartamentos();
            System.out.println("");
            id = servicioDepartamento.crearDepartamento(departamento);
            System.out.println("DEPARTAMENTO NUEVO ID = " + id);
            this.testListarDepartamentos();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of editarMontaje method, of class ServicioDepartamento.
     */
    @Test
    public void testEditarDepartamento() {
        System.out.println("editarDepartamento");
        Departamento departamento = new Departamento(7, "RECEPCION");
        try {
            this.testListarDepartamentos();
            System.out.println("");
            servicioDepartamento.editarDeparteamento(departamento);
            this.testListarDepartamentos();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of listarMontajes method, of class ServicioDepartamento.
     */
//    @Test
    public void testListarDepartamentos() {
        System.out.println("listarDepartamentos");
        try {
            List<Departamento> montajes = servicioDepartamento.listarDepartamentos();
            assertNotNull(montajes);
            for (Departamento newDepartamento : montajes) {
                System.out.println(newDepartamento.getId() + " " + newDepartamento.getNombre());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Test of getMontaje method, of class ServicioDepartamento.
     */
//    @Test
    public void testGetDepartamento() {
        System.out.println("getDepartamento");
        try {
            Departamento departamento = servicioDepartamento.getDepartamento(new Integer(1));
            assertNotNull(departamento);
            System.out.println(departamento.getId() + " " + departamento.getNombre());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
