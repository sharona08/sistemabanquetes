package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Iva;
import com.banquetes.servicios.interfaces.IServicioIva;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.util.List;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que ofrece servicios para el manejo de iva
 * @author maya
 * @version 1.0
 */
public class ServicioIva implements IServicioIva {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioIva() {
    }

    public boolean existeIvaId(Iva iva) {
        Boolean existe = Boolean.TRUE;
        Iva newIva = null;
        try {
            newIva = (Iva) sqlMap.queryForObject("getIva", iva.getId());
            if (newIva == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioIva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public Boolean editarIva(Iva iva) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeIvaId(iva);
        try {
            if (existe) {
                Iva newIva = (Iva) sqlMap.queryForObject("getIva", iva.getId());

                if (iva.getPorcentaje() != null) {
                    newIva.setPorcentaje(iva.getPorcentaje());
                }
                int resultado = sqlMap.update("editarIva", newIva);

                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }

            } else {
                System.out.println("No existe el iva");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioIva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Iva> listarIvas(Integer id, Double porcentaje) {
        List<Iva> ivas = null;

        String idIva = "";
        if (id == null) {
            idIva = "%";
        } else {
            idIva = id.toString() + "%";
        }

        String porcentajeIva = "";
        if (porcentaje == null) {
            porcentajeIva = "%";
        } else {
            porcentajeIva = porcentaje.toString() + "%";
        }

        try {
            Map param = new HashMap();
            param.put("id", idIva);
            param.put("porcentaje", porcentajeIva);
            ivas = sqlMap.queryForList("getIvas", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioIva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ivas;
    }

    public Iva getIva(Integer id) {
        Iva iva = null;
        try {
            iva = (Iva) sqlMap.queryForObject("getIva", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioIva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return iva;
    }
    
}
