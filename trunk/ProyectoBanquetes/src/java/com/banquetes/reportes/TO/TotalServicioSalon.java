/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.reportes.TO;

/**
 *
 * @author maya
 */
public class TotalServicioSalon {

    private String nombreSalon;
    private Double totalServicioSalon;

    public TotalServicioSalon() {
    }

    public TotalServicioSalon(String nombreSalon, Double totalServicioSalon) {
        this.nombreSalon = nombreSalon;
        this.totalServicioSalon = totalServicioSalon;
    }

    public String getNombreSalon() {
        return nombreSalon;
    }

    public void setNombreSalon(String nombreSalon) {
        this.nombreSalon = nombreSalon;
    }

    public Double getTotalServicioSalon() {
        return totalServicioSalon;
    }

    public void setTotalServicioSalon(Double totalServicioSalon) {
        this.totalServicioSalon = totalServicioSalon;
    }
    
}
