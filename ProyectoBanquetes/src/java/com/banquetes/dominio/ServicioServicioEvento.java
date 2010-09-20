package com.banquetes.dominio;

import java.sql.Date;
import java.sql.Time;

/**
 * Clase para almacenar informacion de los objetos de dominio servicioEvento
 * @author maya
 * @version 1.0
 */
public class ServicioServicioEvento {

    private Integer idServicio;
    private Integer idEvento;
    private Integer idSalon;
    private Integer cantidad;
    private Time horaInicio;
    private Time horaFin;
    private String notaEspecial;
    private Double nuevoCosto;
    private String nuevoNombre;
    private String nuevaDescripcion;
    private Date fechaInicio;
    private Date fechaFin;

    public ServicioServicioEvento() {
    }

    public ServicioServicioEvento(Integer idServicio, Integer idEvento, Integer idSalon, Integer cantidad, Time horaInicio, Time horaFin, String notaEspecial, Double nuevoCosto, String nuevoNombre, String nuevaDescripcion, Date fechaInicio, Date fechaFin) {
        this.idServicio = idServicio;
        this.idEvento = idEvento;
        this.idSalon = idSalon;
        this.cantidad = cantidad;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.notaEspecial = notaEspecial;
        this.nuevoCosto = nuevoCosto;
        this.nuevoNombre = nuevoNombre;
        this.nuevaDescripcion = nuevaDescripcion;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
    }

    public Integer getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(Integer idServicio) {
        this.idServicio = idServicio;
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

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }


    public Time getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
        this.horaFin = horaFin;
    }

    public String getNotaEspecial() {
        return notaEspecial;
    }

    public void setNotaEspecial(String notaEspecial) {
        this.notaEspecial = notaEspecial.toUpperCase();
    }

    public String getNuevaDescripcion() {
        return nuevaDescripcion;
    }

    public void setNuevaDescripcion(String nuevaDescripcion) {
        this.nuevaDescripcion = nuevaDescripcion.toUpperCase();
    }

    public Double getNuevoCosto() {
        return nuevoCosto;
    }

    public void setNuevoCosto(Double nuevoCosto) {
        this.nuevoCosto = nuevoCosto;
    }

    public String getNuevoNombre() {
        return nuevoNombre;
    }

    public void setNuevoNombre(String nuevoNombre) {
        this.nuevoNombre = nuevoNombre.toUpperCase();
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

}
