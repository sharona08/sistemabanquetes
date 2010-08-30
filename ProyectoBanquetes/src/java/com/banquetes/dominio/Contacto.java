package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio contacto
 * @author maya
 * @version 1.0
 */
public class Contacto {
    
    private Integer id;
    private String nombre;
    private String telefono;
    private String direccion;
    private Boolean habilitado;
    private String rifEmpresa;

    public Contacto() {
    }

    public Contacto(String nombre, String telefono, String direccion, Boolean habilitado, String rifEmpresa) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.direccion = direccion;
        this.habilitado = habilitado;
        this.rifEmpresa = rifEmpresa;
    }

    public Contacto(Integer id, String nombre, String telefono, String direccion, Boolean habilitado, String rifEmpresa) {
        this.id = id;
        this.nombre = nombre;
        this.telefono = telefono;
        this.direccion = direccion;
        this.habilitado = habilitado;
        this.rifEmpresa = rifEmpresa;
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
        this.direccion = direccion.toUpperCase();
    }

    public Boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }

    public String getRifEmpresa() {
        return rifEmpresa;
    }

    public void setRifEmpresa(String rifEmpresa) {
        this.rifEmpresa = rifEmpresa.toUpperCase();
    }

}
