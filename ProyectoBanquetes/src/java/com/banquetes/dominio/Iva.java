package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio montaje
 * @author maya
 * @version 1.0
 */
public class Iva {

    private Integer id;
    private Double porcentaje;
    
    public Iva() {
    }

    public Iva(Integer id) {
        this.id = id;
    }

    public Iva(Integer id, Double porcentaje) {
        this.id = id;
        this.porcentaje = porcentaje;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(Double porcentaje) {
        this.porcentaje = porcentaje;
    }

}
