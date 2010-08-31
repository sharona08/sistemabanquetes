package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Departamento;
import com.banquetes.servicios.interfaces.IServicioDepartamento;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.util.List;
import java.sql.SQLException;
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

    public void editarDeparteamento(Departamento departamento) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeDepartamentoId(departamento);
        try {
            if (existe) {
                Departamento newDepartamento = (Departamento) sqlMap.queryForObject("getDepartamento", departamento.getId());

                if (departamento.getNombre() != null) {
                    newDepartamento.setNombre(departamento.getNombre());
                }
                sqlMap.update("editarDepartamento", newDepartamento);

            } else {
                System.out.println("No existe el departamento");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioDepartamento.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Departamento> listarDepartamentos() {
        List<Departamento> departamentos = null;

        try {
            departamentos = sqlMap.queryForList("getDepartamentos", null);
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
}