/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.TO;

/**
 *
 * @author maya
 */
public class SalonesComboBoxTO {

    private Integer idSalon;
    private Integer idSalon2;
    private String nombreSalon;
    private Integer idEvento;

    public SalonesComboBoxTO() {
    }

    public SalonesComboBoxTO(Integer idSalon,Integer idSalon2, String nombreSalon, Integer idEvento) {
        this.idSalon = idSalon;
        this.idSalon2 = idSalon2;
        this.nombreSalon = nombreSalon;
        this.idEvento = idEvento;
    }

    public Integer getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public String getNombreSalon() {
        return nombreSalon;
    }

    public void setNombreSalon(String nombreSalon) {
        this.nombreSalon = nombreSalon;
    }

    public Integer getIdSalon() {
        return idSalon;
    }

    public void setIdSalon(Integer idSalon) {
        this.idSalon = idSalon;
    }

    public Integer getIdSalon2() {
        return idSalon2;
    }

    public void setIdSalon2(Integer idSalon2) {
        this.idSalon2 = idSalon2;
    }
    
}
