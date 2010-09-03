package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Departamento;
import com.banquetes.servicios.interfaces.IServicioDepartamento;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.util.List;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que ofrece servicios para el manejo de contactos
 * @author maya
 * @version 1.0
 */
public class ServicioDepartamento implements IServicioDepartamento {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioDepartamento() {
    }

    public boolean existeDepartamentoNombre(Departamento departamento) {
        Boolean existe = Boolean.TRUE;
        Departamento newDepartamento = null;
        try {
            newDepartamento = (Departamento) sqlMap.queryForObject("getDepartamentoNombre", departamento.getNombre());
            if (newDepartamento == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioDepartamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public boolean existeDepartamentoId(Departamento departamento) {
        Boolean existe = Boolean.TRUE;
        Departamento newDepartamento = null;
        try {
            newDepartamento = (Departamento) sqlMap.queryForObject("getDepartamento", departamento.getId());
            if (newDepartamento == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioDepartamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public Integer crearDepartamento(Departamento departamento) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeDepartamentoNombre(departamento);
        Integer id = null;
        try {
            if (!existe) {
                id = (Integer) sqlMap.insert("crearDepartamento", departamento);
            } else {
                System.out.println("El departamento ya esta registrado");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioDepartamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public Boolean editarDepartamento(Departamento departamento) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeDepartamentoId(departamento);
        try {
            if (existe) {
                Departamento newDepartamento = (Departamento) sqlMap.queryForObject("getDepartamento", departamento.getId());

                if (departamento.getNombre() != null) {
                    newDepartamento.setNombre(departamento.getNombre());
                }
                int resultado = sqlMap.update("editarDepartamento", newDepartamento);
                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }
            } else {
                System.out.println("No existe el departamento");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioDepartamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Departamento> listarDepartamentos(Integer id, String nombre) {
        List<Departamento> departamentos = null;

        String idDepartamento = "";
        if (id == null) {
            idDepartamento = "%";
        } else {
            idDepartamento = id.toString() + "%";
        }

        if (nombre == null) {
            nombre = "%";
        } else {
            nombre = nombre + "%";
        }
        
        try {
            Map param = new HashMap();
            param.put("id", idDepartamento);
            param.put("nombre", nombre);
            departamentos = sqlMap.queryForList("getDepartamentos", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioDepartamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return departamentos;
    }

    public Departamento getDepartamento(Integer id) {
        Departamento departamento = null;
        try {
            departamento = (Departamento) sqlMap.queryForObject("getDepartamento", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioDepartamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return departamento;
    }

    public Departamento getDepartamentoNombre(String nombre) {
        Departamento departamento = null;
        try {
            departamento = (Departamento) sqlMap.queryForObject("getDepartamentoNombre", nombre);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioDepartamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return departamento;
    }
}
