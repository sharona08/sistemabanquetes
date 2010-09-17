/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.reportes;

import java.util.HashMap;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperCompileManager;

import java.sql.Connection;

/**
 *
 * @author maya
 */
public class Reportes {

    private JasperReport jasperReport;
    private JasperPrint jasperPrint;
    private ConexionReportes conexion = new ConexionReportes();
    private Connection connection = conexion.connection();

    public void reporteSalonesPDF() {
        try {
            jasperReport = JasperCompileManager.compileReport("../ProyectoBanquetes/src/java/com/banquetes/reportes/reporteSalones.jrxml");
            jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap(), connection);
            JasperExportManager.exportReportToPdfFile(jasperPrint, "../ProyectoBanquetes/src/java/com/banquetes/reportes/reporteSalonesPDF.pdf");

        } catch (JRException e) {
            e.printStackTrace();
        }
    }

}
