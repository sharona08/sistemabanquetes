package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio eventoSala
 * @author maya
 * @version 1.0
 */
public class EventoSala {

    private Integer idEvento;
    private Double nuevoCosto;
    private Integer idSalon;
    private Integer idMontaje;
    private Integer nuevoIdSalon;
    private Boolean visible;

    public EventoSala() {
    }

    public EventoSala(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public EventoSala(Integer idEvento, Double nuevoCosto, Integer idSalon, Integer idMontaje, Integer nuevoIdSalon, Boolean visible) {
        this.idEvento = idEvento;
        this.nuevoCosto = nuevoCosto;
        this.idSalon = idSalon;
        this.idMontaje = idMontaje;
        this.nuevoIdSalon = nuevoIdSalon;
        this.visible = visible;
    }

    public Integer getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public Double getNuevoCosto() {
        return nuevoCosto;
    }

    public void setNuevoCosto(Double nuevoCosto) {
        this.nuevoCosto = nuevoCosto;
    }

    public Integer getIdMontaje() {
        return idMontaje;
    }

    public void setIdMontaje(Integer idMontaje) {
        this.idMontaje = idMontaje;
    }

    public Integer getIdSalon() {
        return idSalon;
    }

    public void setIdSalon(Integer idSalon) {
        this.idSalon = idSalon;
    }

    public Integer getNuevoIdSalon() {
        return nuevoIdSalon;
    }

    public void setNuevoIdSalon(Integer nuevoIdSalon) {
        this.nuevoIdSalon = nuevoIdSalon;
    }

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

}
