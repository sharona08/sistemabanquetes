package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Servicio;
import com.banquetes.servicios.interfaces.IServicioServicio;
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
public class ServicioServicio implements IServicioServicio {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioServicio() {
    }

    public boolean existeServicioNombre(Servicio servicio) {
        Boolean existe = Boolean.TRUE;
        Servicio newServicio = null;
        try {
            newServicio = (Servicio) sqlMap.queryForObject("getServicioNombre", servicio.getNombre());
            if (newServicio == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public boolean existeServicioId(Servicio servicio) {
        Boolean existe = Boolean.TRUE;
        Servicio newServicio = null;
        try {
            newServicio = (Servicio) sqlMap.queryForObject("getServicio", servicio.getId());
            if (newServicio == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public Integer crearServicio(Servicio servicio) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeServicioNombre(servicio);
        Integer id = null;
        try {
            if (!existe) {
                id = (Integer) sqlMap.insert("crearServicio", servicio);
            } else {
                System.out.println("El servicio ya esta registrado");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public Boolean editarServicio(Servicio servicio) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeServicioId(servicio);
        try {
            if (existe) {
                Servicio newServicio = (Servicio) sqlMap.queryForObject("getServicio", servicio.getId());

                if (servicio.getNombre() != null) {
                    newServicio.setNombre(servicio.getNombre());
                }
                newServicio.setDescripcion(servicio.getDescripcion());
                if (servicio.getCostoUnitario() != null) {
                    newServicio.setCostoUnitario(servicio.getCostoUnitario());
                }
                if (servicio.getTipoServicio() != null) {
                    newServicio.setTipoServicio(servicio.getTipoServicio());
                }
                if (servicio.getHabilitado() != null) {
                    newServicio.setHabilitado(servicio.getHabilitado());
                }

                int resultado = sqlMap.update("editarServicio", newServicio);
                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }
            } else {
                System.out.println("No existe el servicio");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public Boolean inhabilitarServicio(Servicio servicio) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeServicioId(servicio);
        try {
            if (existe) {
                Servicio newServicio = (Servicio) sqlMap.queryForObject("getServicio", servicio.getId());
                newServicio.setHabilitado(Boolean.FALSE);
                int resultado = sqlMap.update("editarServicio", newServicio);
                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }
            } else {
                System.out.println("No existe el servicio");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public Boolean habilitarServicio(Servicio servicio) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeServicioId(servicio);
        try {
            if (existe) {
                Servicio newServicio = (Servicio) sqlMap.queryForObject("getServicio", servicio.getId());
                newServicio.setHabilitado(Boolean.TRUE);
                int resultado = sqlMap.update("editarServicio", newServicio);
                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }
            } else {
                System.out.println("No existe el servicio");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Servicio> listarServicios() {
        List<Servicio> servicios = null;

        try {
            servicios = sqlMap.queryForList("getServicios", null);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return servicios;
    }

    public Servicio getServicio(Integer id) {
        Servicio servicio = null;
        try {
            servicio = (Servicio) sqlMap.queryForObject("getServicio", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return servicio;
    }
}
