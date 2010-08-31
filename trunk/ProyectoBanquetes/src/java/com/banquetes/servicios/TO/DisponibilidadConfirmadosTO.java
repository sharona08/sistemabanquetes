/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.TO;

import java.sql.Date;

/**
 *
 * @author maya
 */
public class DisponibilidadConfirmadosTO {

    private Integer idEvento;
    private Date fechaInicio;
    private Date fechafin;
    private Integer idSalon;
    
    public DisponibilidadConfirmadosTO() {
    }

    public DisponibilidadConfirmadosTO(Integer idEvento, Date fechaInicio, Date fechafin, Integer idSalon) {
        this.idEvento = idEvento;
        this.fechaInicio = fechaInicio;
        this.fechafin = fechafin;
        this.idSalon = idSalon;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechafin() {
        return fechafin;
    }

    public void setFechafin(Date fechafin) {
        this.fechafin = fechafin;
    }

    public Integer getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public Integer getIdSalon() {
        return idSalon;
    }

    public void setIdSalon(Integer idSalon) {
        this.idSalon = idSalon;
    }

}
