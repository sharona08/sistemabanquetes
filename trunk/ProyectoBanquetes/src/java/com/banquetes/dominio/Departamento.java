package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio departamento
 * @author maya
 * @version 1.0
 */
public class Departamento {
    
    private Integer id;
    private String nombre;

    public Departamento() {
    }

    public Departamento(Integer id) {
        this.id = id;
    }

    public Departamento(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
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

}
