package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio rol
 * @author maya
 * @version 1.0
 */
public class Rol {

    private Integer id;
    private String tipoRol;
    
    public Rol() {
    }

    public Rol(Integer id) {
        this.id = id;
    }

    public Rol(Integer id, String tipoRol) {
        this.id = id;
        this.tipoRol = tipoRol;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipoRol() {
        return tipoRol;
    }

    public void setTipoRol(String tipoRol) {
        this.tipoRol = tipoRol;
    }

}
