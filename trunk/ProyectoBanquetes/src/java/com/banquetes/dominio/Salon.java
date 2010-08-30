package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio salon
 * @author maya
 * @version 1.0
 */
public class Salon {

    private Integer id;
    private String nombre;
    private Double costo;
    private Boolean habilitado;
    private Integer idSalon;
    
    public Salon() {
    }

    public Salon(Integer id, String nombre, Double costo, Boolean habilitado, Integer idSalon) {
        this.id = id;
        this.nombre = nombre;
        this.costo = costo;
        this.habilitado = habilitado;
        this.idSalon = idSalon;
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

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }

    public Boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }

    public Integer getIdSalon() {
        return idSalon;
    }

    public void setIdSalon(Integer idSalon) {
        this.idSalon = idSalon;
    }

}
