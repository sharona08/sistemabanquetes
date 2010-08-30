package com.banquetes.dominio;

import java.util.Date;

/**
 * Clase para almacenar informacion de los objetos de dominio servicioEvento
 * @author maya
 * @version 1.0
 */
public class ServicioEvento {

    private Integer idServicio;
    private Integer idEvento;
    private Integer cantidad;
    private Date horaInicio;
    private Date horaFin;
    private String notaEspecial;
    private Double nuevoCosto;
    private String nuevoNombre;
    private String nuevaDescripcion;

    public ServicioEvento() {
    }

    public ServicioEvento(Integer idServicio, Integer idEvento, Integer cantidad, Date horaInicio, Date horaFin, String notaEspecial, Double nuevoCosto, String nuevoNombre, String nuevaDescripcion) {
        this.idServicio = idServicio;
        this.idEvento = idEvento;
        this.cantidad = cantidad;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.notaEspecial = notaEspecial;
        this.nuevoCosto = nuevoCosto;
        this.nuevoNombre = nuevoNombre;
        this.nuevaDescripcion = nuevaDescripcion;
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

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }


    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public String getNotaEspecial() {
        return notaEspecial;
    }

    public void setNotaEspecial(String notaEspecial) {
        this.notaEspecial = notaEspecial;
    }

    public String getNuevaDescripcion() {
        return nuevaDescripcion;
    }

    public void setNuevaDescripcion(String nuevaDescripcion) {
        this.nuevaDescripcion = nuevaDescripcion;
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
        this.nuevoNombre = nuevoNombre;
    }

}
