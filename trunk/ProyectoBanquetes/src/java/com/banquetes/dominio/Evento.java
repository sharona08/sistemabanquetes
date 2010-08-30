package com.banquetes.dominio;

import java.sql.Time;
import java.sql.Date;

/**
 * Clase para almacenar informacion de los objetos de dominio evento
 * @author maya
 * @version 1.0
 */
public class Evento {

    private Integer id;
    private String estado;
    private String nombre;
    private Integer idTipoEvento;
    private Date fechaInicio;
    private Date fechaFin;
    private Integer cantidadPersonas;
    private Time horaInicio;
    private Time horaFin;
    private String rifEmpresa;
    private Integer idContacto;

    public Evento() {
    }

    public Evento(Integer id) {
        this.id = id;
    }

    public Evento(Integer id, String estado, String nombre, Integer idTipoEvento, Date fechaInicio, Date fechaFin, Integer cantidadPersonas, Time horaInicio, Time horaFin, String rifEmpresa, Integer idContacto) {
        this.id = id;
        this.estado = estado;
        this.nombre = nombre;
        this.idTipoEvento = idTipoEvento;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.cantidadPersonas = cantidadPersonas;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.rifEmpresa = rifEmpresa;
        this.idContacto = idContacto;
    }

    public Integer getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(Integer cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado.toUpperCase();
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre.toUpperCase();
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
    
}
