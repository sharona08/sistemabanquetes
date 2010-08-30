package com.banquetes.servicios.TO;

/**
 *
 * @author maya
 */
public class DetallesReservaSalonTO {

    Integer idSalon;
    String nombreSalon;
    Double costoSalon;
    Boolean salonHabilitado;
    Integer idSalonFK;
    Double nuevoCosto;
    Integer idTipoMontaje;
    String tipoMontaje;

    public DetallesReservaSalonTO() {
    }

    public DetallesReservaSalonTO(Integer idSalon, String nombreSalon, Double costoSalon, Boolean salonHabilitado, Integer idSalonFK, Double nuevoCosto, Integer idTipoMontaje, String tipoMontaje) {
        this.idSalon = idSalon;
        this.nombreSalon = nombreSalon;
        this.costoSalon = costoSalon;
        this.salonHabilitado = salonHabilitado;
        this.idSalonFK = idSalonFK;
        this.nuevoCosto = nuevoCosto;
        this.idTipoMontaje = idTipoMontaje;
        this.tipoMontaje = tipoMontaje;
    }

    public Double getCostoSalon() {
        return costoSalon;
    }

    public void setCostoSalon(Double costoSalon) {
        this.costoSalon = costoSalon;
    }

    public Integer getIdSalon() {
        return idSalon;
    }

    public void setIdSalon(Integer idSalon) {
        this.idSalon = idSalon;
    }

    public Integer getIdTipoMontaje() {
        return idTipoMontaje;
    }

    public void setIdTipoMontaje(Integer idTipoMontaje) {
        this.idTipoMontaje = idTipoMontaje;
    }

    public String getNombreSalon() {
        return nombreSalon;
    }

    public void setNombreSalon(String nombreSalon) {
        this.nombreSalon = nombreSalon;
    }

    public Boolean getSalonHabilitado() {
        return salonHabilitado;
    }

    public void setSalonHabilitado(Boolean salonHabilitado) {
        this.salonHabilitado = salonHabilitado;
    }

    public Integer getIdSalonFK() {
        return idSalonFK;
    }

    public void setIdSalonFK(Integer idSalonFK) {
        this.idSalonFK = idSalonFK;
    }

    public Double getNuevoCosto() {
        return nuevoCosto;
    }

    public void setNuevoCosto(Double nuevoCosto) {
        this.nuevoCosto = nuevoCosto;
    }

    public String getTipoMontaje() {
        return tipoMontaje;
    }

    public void setTipoMontaje(String tipoMontaje) {
        this.tipoMontaje = tipoMontaje;
    }

}
