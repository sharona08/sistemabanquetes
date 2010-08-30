package com.banquetes.servicios.TO;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author maya
 */
public class DetallesReservaTO {

    Integer idEvento;
    String nombreEvento;
    String estadoEvento;
    Date fechaInicio;
    Date fechaFin;
    Integer cantidadPersonas;
    Time horaInicio;
    Time horaFin;
    Integer idTipoEvento;
    String tipoEvento;
    String rifEmpresa;
    String nombreEmpresa;
    Integer idContacto;
    String nombreContacto;

    public DetallesReservaTO() {
    }

    public DetallesReservaTO(Integer idEvento, String nombreEvento, String estadoEvento, Date fechaInicio, Date fechaFin, Integer cantidadPersonas, Time horaInicio, Time horaFin, Integer idTipoEvento, String tipoEvento, String rifEmpresa, String nombreEmpresa, Integer idContacto, String nombreContacto) {
        this.idEvento = idEvento;
        this.nombreEvento = nombreEvento;
        this.estadoEvento = estadoEvento;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.cantidadPersonas = cantidadPersonas;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.idTipoEvento = idTipoEvento;
        this.tipoEvento = tipoEvento;
        this.rifEmpresa = rifEmpresa;
        this.nombreEmpresa = nombreEmpresa;
        this.idContacto = idContacto;
        this.nombreContacto = nombreContacto;
    }

    public Integer getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(Integer cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public String getEstadoEvento() {
        return estadoEvento;
    }

    public void setEstadoEvento(String estadoEvento) {
        this.estadoEvento = estadoEvento;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
        this.horaFin = horaFin;
    }

    public Time getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Integer getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public String getRifEmpresa() {
        return rifEmpresa;
    }

    public void setRifEmpresa(String rifEmpresa) {
        this.rifEmpresa = rifEmpresa;
    }

    public Integer getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(Integer idContacto) {
        this.idContacto = idContacto;
    }
    
    public Integer getIdTipoEvento() {
        return idTipoEvento;
    }

    public void setIdTipoEvento(Integer idTipoEvento) {
        this.idTipoEvento = idTipoEvento;
    }

    public String getTipoEvento() {
        return tipoEvento;
    }

    public void setTipoEvento(String tipoEvento) {
        this.tipoEvento = tipoEvento;
    }

}
