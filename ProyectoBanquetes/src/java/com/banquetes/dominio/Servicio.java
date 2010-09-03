package com.banquetes.dominio;

/**
 * Clase para almacenar informacion de los objetos de dominio servicio
 * @author maya
 * @version 1.0
 */
public class Servicio {

    private Integer id;
    private String nombre;
    private String descripcion;
    private Double costoUnitario;
    private String tipoServicio;
    private Boolean habilitado;
    private Integer idDepartamento;
    
    public Servicio() {
    }

    public Servicio(Integer id, String nombre, String descripcion, Double costoUnitario, String tipoServicio, Boolean habilitado, Integer idDepartamento) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.costoUnitario = costoUnitario;
        this.tipoServicio = tipoServicio;
        this.habilitado = habilitado;
        this.idDepartamento = idDepartamento;
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
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getCostoUnitario() {
        return costoUnitario;
    }

    public void setCostoUnitario(Double costoUnitario) {
        this.costoUnitario = costoUnitario;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    public Boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }

    public Integer getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(Integer idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

}
