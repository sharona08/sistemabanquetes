package com.banquetes.dominio;

/**
 *
 * @author maya
 */
public class TipoEvento {
    
    private Integer id;
    private String tipoEvento;

    public TipoEvento() {
    }

    public TipoEvento(Integer id, String tipoEvento) {
        this.id = id;
        this.tipoEvento = tipoEvento;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipoEvento() {
        return tipoEvento;
    }

    public void setTipoEvento(String tipoEvento) {
        this.tipoEvento = tipoEvento;
    }

}
