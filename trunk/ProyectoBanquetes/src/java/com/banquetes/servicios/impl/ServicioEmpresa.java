package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Empresa;
import com.banquetes.servicios.interfaces.IServicioEmpresa;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.util.List;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que ofrece servicios para el manejo de empresas
 * @author maya
 * @version 1.0
 */
public class ServicioEmpresa implements IServicioEmpresa {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioEmpresa() {
    }

    public boolean existeEmpresa(Empresa empresa) {
        Boolean existe = Boolean.TRUE;
        Empresa newEmpresa = null;
        try {
            newEmpresa = (Empresa) sqlMap.queryForObject("getEmpresa", empresa.getRif());
            if (newEmpresa == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }
    public void crearEmpresa(Empresa empresa) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeEmpresa(empresa);
        try {
            if (!existe) {
                sqlMap.insert("crearEmpresa", empresa);
            } else {
                System.out.println("La empresa ya esta registrada");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarEmpresa(Empresa empresa) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeEmpresa(empresa);
        try {
            if (existe) {
                Empresa newEmpresa = (Empresa) sqlMap.queryForObject("getEmpresa", empresa.getRif());
                if (empresa.getNombre() != null) {
                    newEmpresa.setNombre(empresa.getNombre());
                }
                newEmpresa.setTelefono(empresa.getTelefono());
                newEmpresa.setDireccion(empresa.getDireccion());
                if (empresa.getHabilitado() != null) {
                    newEmpresa.setHabilitado(empresa.getHabilitado());
                }

                sqlMap.update("editarEmpresa", newEmpresa);
            } else {
                System.out.println("No existe la empresa");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void inhabilitarEmpresa(Empresa empresa) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeEmpresa(empresa);
        try {
            if (existe) {
                Empresa newEmpresa = (Empresa) sqlMap.queryForObject("getEmpresa", empresa.getRif());
                newEmpresa.setHabilitado(Boolean.FALSE);
                sqlMap.update("editarEmpresa", newEmpresa);
            } else {
                System.out.println("No existe la empresa");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void habilitarEmpresa(Empresa empresa) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeEmpresa(empresa);
        try {
            if (existe) {
                Empresa newEmpresa = (Empresa) sqlMap.queryForObject("getEmpresa", empresa.getRif());
                newEmpresa.setHabilitado(Boolean.TRUE);
                sqlMap.update("editarEmpresa", newEmpresa);
            } else {
                System.out.println("No existe la empresa");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Empresa> listarEmpresas() {
        List<Empresa> empresas = null;

        try {
            empresas = sqlMap.queryForList("getEmpresas", null);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return empresas;
    }

    public List<Empresa> listarEmpresasTodas(String rif, String nombre){
        List<Empresa> empresas = null;

        rif = rif+"%";
        nombre = nombre+"%";
        try {
            Map param = new HashMap();
            param.put("rif", rif);
            param.put("nombre", nombre);
            empresas = sqlMap.queryForList("getEmpresasTodas", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return empresas;
    }

    public List<Empresa> listarEmpresasHabilitadas(String rif, String nombre){
        List<Empresa> empresas = null;

        rif = rif+"%";
        nombre = nombre+"%";
        try {
            Map param = new HashMap();
            param.put("rif", rif);
            param.put("nombre", nombre);
            empresas = sqlMap.queryForList("getEmpresasHabilitadas", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return empresas;
    }

    public Empresa getEmpresa(String rif) {
        Empresa empresa = null;
        try {
            empresa = (Empresa) sqlMap.queryForObject("getEmpresa", rif);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return empresa;
    }
}

