package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio montaje
 * @author maya
 * @version 1.0
 */
public class Montaje {

    private Integer id;
    private String tipoMontaje;
    
    public Montaje() {
    }

    public Montaje(Integer id) {
        this.id = id;
    }

    public Montaje(Integer id, String tipoMontaje) {
        this.id = id;
        this.tipoMontaje = tipoMontaje;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipoMontaje() {
        return tipoMontaje;
    }

    public void setTipoMontaje(String tipoMontaje) {
        this.tipoMontaje = tipoMontaje;
    }

}
