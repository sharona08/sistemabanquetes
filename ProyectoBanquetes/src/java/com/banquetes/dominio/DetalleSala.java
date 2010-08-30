package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio detalleSala
 * @author maya
 * @version 1.0
 */
public class DetalleSala {
    
    private Integer idSalon;
    private Integer idMontaje;
    private Double capacidad;

    public DetalleSala() {
    }

    public Double getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(Double capacidad) {
        this.capacidad = capacidad;
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

}
