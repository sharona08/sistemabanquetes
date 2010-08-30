package com.banquetes.servicios.TO;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author maya
 */
public class DisponibilidadSalonTO {

    Integer idEvento;
    String nombreEvento;
    String estadoEvento;
    Date fechaInicio;
    Date fechaFin;
    Date fecha;
    Time horaInicio;
    Time horaFin;
    String nombreSalon;
    String nombreEmpresa;
    String nombreContacto;

    public DisponibilidadSalonTO() {
    }

    public DisponibilidadSalonTO(Integer idEvento, String nombreEvento, String estadoEvento, Date fechaInicio, Date fechaFin, Date fecha, Time horaInicio, Time horaFin, String nombreSalon, String nombreEmpresa, String nombreContacto) {
        this.idEvento = idEvento;
        this.nombreEvento = nombreEvento;
        this.estadoEvento = estadoEvento;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.nombreSalon = nombreSalon;
        this.nombreEmpresa = nombreEmpresa;
        this.nombreContacto = nombreContacto;
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

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
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

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public String getEstadoEvento() {
        return estadoEvento;
    }

    public void setEstadoEvento(String estadoEvento) {
        this.estadoEvento = estadoEvento;
    }

    public String getNombreSalon() {
        return nombreSalon;
    }

    public void setNombreSalon(String nombreSalon) {
        this.nombreSalon = nombreSalon;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }
    
}
