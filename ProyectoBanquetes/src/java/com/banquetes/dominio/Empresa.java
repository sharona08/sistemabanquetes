package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio empresa
 * @author maya
 * @version 1.0
 */
public class Empresa {
    
    private String rif;
    private String nombre;
    private String telefono;
    private String direccion;
    private Boolean habilitado;
    
    public Empresa() {
    }

    public Empresa(String rif, String nombre, String telefono, String direccion, Boolean habilitado) {
        this.rif = rif;
        this.nombre = nombre;
        this.telefono = telefono;
        this.direccion = direccion;
        this.habilitado = habilitado;
    }

    public String getRif() {
        return rif;
    }

    public void setRif(String rif) {
        this.rif = rif;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre.toUpperCase();
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }
    
}
