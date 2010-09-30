/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.reportes.TO;

/**
 *
 * @author maya
 */
public class CostoSalones {

    private String nombreSalon;
    private Double totalSalon;

    public CostoSalones() {
    }

    public CostoSalones(String nombreSalon, Double totalSalon) {
        this.nombreSalon = nombreSalon;
        this.totalSalon = totalSalon;
    }

    public String getNombreSalon() {
        return nombreSalon;
    }

    public void setNombreSalon(String nombreSalon) {
        this.nombreSalon = nombreSalon;
    }

    public Double getTotalSalon() {
        return totalSalon;
    }

    public void setTotalSalon(Double totalSalon) {
        this.totalSalon = totalSalon;
    }

}
