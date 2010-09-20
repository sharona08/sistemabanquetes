/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banquetes.reportes;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperCompileManager;

import java.sql.Connection;
import java.util.Map;

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
            JasperExportManager.exportReportToPdfFile(jasperPrint, "../ProyectoBanquetes/src/java/com/banquetes/reportes/PDF/reporteSalonesPDF.pdf");
            File file = new File("../ProyectoBanquetes/src/java/com/banquetes/reportes/PDF/reporteSalonesPDF.pdf");
            Desktop.getDesktop().open(file);

        } catch (IOException ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException e) {
            e.printStackTrace();
        }
    }

    public void reporteContactosEmpresaPDF(String rifEmpresa) {
        try {
            Map parameters = new HashMap();
            parameters.put("rifEmpresa", rifEmpresa);
            jasperReport = JasperCompileManager.compileReport("../ProyectoBanquetes/src/java/com/banquetes/reportes/reporteContactosEmpresa.jrxml");
            jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
            JasperExportManager.exportReportToPdfFile(jasperPrint, "../ProyectoBanquetes/src/java/com/banquetes/reportes/PDF/reporteContactosEmpresaPDF.pdf");
            File file = new File("../ProyectoBanquetes/src/java/com/banquetes/reportes/PDF/reporteContactosEmpresaPDF.pdf");
            Desktop.getDesktop().open(file);

        } catch (IOException ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException e) {
            e.printStackTrace();
        }
    }
}
