/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.reportes.TO.CostoSalones;
import com.banquetes.reportes.TO.TotalServicioSalon;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maya
 */
public class ServicioReportes {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioReportes() {
    }

    public CostoSalones repTotalSalon(Integer idSalon, Integer mes, Integer ano) {
        CostoSalones costoSalon = null;

        try {
            Map param = new HashMap();
            param.put("idSalon", idSalon);
            param.put("mes", mes);
            param.put("ano", ano);
            costoSalon = (CostoSalones) sqlMap.queryForObject("repGetTotalSalon", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return costoSalon;
    }

    public TotalServicioSalon repTotalServicios(Integer idSalon, String tipoServicio, Integer mes, Integer ano) {
        TotalServicioSalon costoServicios = null;

        try {
            Map param = new HashMap();
            param.put("idSalon", idSalon);
            param.put("tipoServicio", tipoServicio);
            param.put("mes", mes);
            param.put("ano", ano);
            costoServicios = (TotalServicioSalon) sqlMap.queryForObject("repGetTotalServicios", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return costoServicios;
    }

    public TotalServicioSalon repTotalSalonesTodos(Integer mes, Integer ano) {
        TotalServicioSalon salonesTodos = null;

        try {
            Map param = new HashMap();
            param.put("mes", mes);
            param.put("ano", ano);
            salonesTodos = (TotalServicioSalon) sqlMap.queryForObject("repGetTotalSalonesTodos", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salonesTodos;
    }

    public TotalServicioSalon repTotalServiciosTodos(String tipoServicio, Integer mes, Integer ano) {
        TotalServicioSalon serviciosTodos = null;

        try {
            Map param = new HashMap();
            param.put("tipoServicio", tipoServicio);
            param.put("mes", mes);
            param.put("ano", ano);
            serviciosTodos = (TotalServicioSalon) sqlMap.queryForObject("repGetTotalServiciosPorTipo", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return serviciosTodos;
    }

}
