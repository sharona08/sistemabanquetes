package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Salon;
import com.banquetes.servicios.TO.DisponibilidadConfirmadosTO;
import com.banquetes.servicios.TO.DisponibilidadSalonTO;
import com.banquetes.servicios.interfaces.IServicioSalon;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.Date;

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
public class ServicioSalon implements IServicioSalon {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();

    public ServicioSalon() {
    }

    public boolean existeSalonNombre(Salon salon) {
        Boolean existe = Boolean.TRUE;
        Salon newSalon = null;
        try {
            newSalon = (Salon) sqlMap.queryForObject("getSalonNombre", salon.getNombre());
            if (newSalon == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public boolean existeSalonId(Salon salon) {
        Boolean existe = Boolean.TRUE;
        Salon newSalon = null;
        try {
            newSalon = (Salon) sqlMap.queryForObject("getSalon", salon.getId());
            if (newSalon == null) {
                existe = Boolean.FALSE;
            } else {
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }

    public Integer crearSalon(Salon salon) {
        Boolean existe = Boolean.TRUE;
        existe = this.existeSalonNombre(salon);
        Integer id = null;
        try {
            if (!existe) {
                id = (Integer) sqlMap.insert("crearSalon", salon);
            } else {
                System.out.println("El salon ya esta registrado");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public Boolean editarSalon(Salon salon) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeSalonId(salon);
        try {
            if (existe) {
                Salon newSalon = (Salon) sqlMap.queryForObject("getSalon", salon.getId());

                if (salon.getNombre() != null) {
                    newSalon.setNombre(salon.getNombre());
                }
                if (salon.getCosto() != null) {
                    newSalon.setCosto(salon.getCosto());
                }
                if (salon.getHabilitado() != null) {
                    newSalon.setHabilitado(salon.getHabilitado());
                }

                int resultado = sqlMap.update("editarSalon", newSalon);

                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }

            } else {
                System.out.println("No existe el salon");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public Boolean inhabilitarSalon(Salon salon) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeSalonId(salon);
        try {
            if (existe) {
                Salon newSalon = (Salon) sqlMap.queryForObject("getSalon", salon.getId());
                newSalon.setHabilitado(Boolean.FALSE);
                int resultado = sqlMap.update("editarSalon", newSalon);
                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }
            } else {
                System.out.println("No existe el salon");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public Boolean habilitarSalon(Salon salon) {
        Boolean result = Boolean.FALSE;
        Boolean existe = Boolean.TRUE;
        existe = this.existeSalonId(salon);
        try {
            if (existe) {
                Salon newSalon = (Salon) sqlMap.queryForObject("getSalon", salon.getId());
                newSalon.setHabilitado(Boolean.TRUE);
                int resultado = sqlMap.update("editarSalon", newSalon);
                if (resultado == 1) {
                    result = Boolean.TRUE;
                } else {
                    result = Boolean.FALSE;
                }
            } else {
                System.out.println("No existe el salon");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Salon> listarSalones() {
        List<Salon> salones = null;

        try {
            salones = sqlMap.queryForList("getSalones", null);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salones;
    }

    public List<Salon> listarSalonesTodos(Integer id, String nombre) {
        List<Salon> salones = null;

        String idSalon = "";
        if (id == null) {
            idSalon = "%";
        } else {
            idSalon = id.toString() + "%";
        }

        if (nombre == null) {
            nombre = "%";
        } else {
            nombre = nombre + "%";
        }
        try {
            Map param = new HashMap();
            param.put("id", idSalon);
            param.put("nombre", nombre);
            salones = sqlMap.queryForList("getSalones", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salones;
    }

    public List<Salon> listarSalonesHabilitados(Integer id, String nombre) {
        List<Salon> salones = null;

        String idSalon = "";
        if (id == null) {
            idSalon = "%";
        } else {
            idSalon = id.toString() + "%";
        }

        if (nombre == null) {
            nombre = "%";
        } else {
            nombre = nombre + "%";
        }
        try {
            Map param = new HashMap();
            param.put("id", idSalon);
            param.put("nombre", nombre);
            salones = sqlMap.queryForList("getSalonesHabilitados", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salones;
    }

    public Salon getSalon(Integer id) {
        Salon salon = null;
        try {
            salon = (Salon) sqlMap.queryForObject("getSalon", id);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salon;
    }

    public Salon getSalonNombre(String nombre) {
        Salon salon = null;
        try {
            salon = (Salon) sqlMap.queryForObject("getSalonNombre", nombre);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salon;
    }

    public List<DisponibilidadSalonTO> listarDisponibilidadSalones(String nombreSalon, Date fecha) {
        List<DisponibilidadSalonTO> dispon = null;

        try {
            Map param = new HashMap();
            param.put("nombreSalon", nombreSalon);
            param.put("fecha", fecha);
            dispon = sqlMap.queryForList("getDisponibilidadSalon", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dispon;
    }

    public List<DisponibilidadSalonTO> listarDisponibilidadSalonesAnulados(String nombreSalon, Date fecha) {
        List<DisponibilidadSalonTO> dispon = null;

        try {
            Map param = new HashMap();
            param.put("nombreSalon", nombreSalon);
            param.put("fecha", fecha);
            dispon = sqlMap.queryForList("getDisponibilidadSalonAnulados", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dispon;
    }

    public List<DisponibilidadConfirmadosTO> listarDisponibilidadConfirmados(Date fechaInicio, Date fechaFin, Integer idSalon) {
        List<DisponibilidadConfirmadosTO> dispon = null;

        try {
            Map param = new HashMap();
            param.put("fechaInicio", fechaInicio);
            param.put("fechaFin", fechaFin);
            param.put("idSalon", idSalon);
            dispon = sqlMap.queryForList("getDisponibilidadConfirmados", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioSalon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dispon;
    }

    public Boolean disponibilidadConfirmados(Date fechaInicio, Date fechaFin, List<Salon> salones, Integer idEvento) {
        List<DisponibilidadConfirmadosTO> dispon = null;
        Boolean result = Boolean.FALSE;

        for (Salon s : salones) {
            dispon = this.listarDisponibilidadConfirmados(fechaInicio, fechaFin, s.getId());

            if (dispon.isEmpty()) {
                result = Boolean.TRUE;
            } else {
                for (DisponibilidadConfirmadosTO d : dispon) {
                    if (d.getIdEvento().equals(idEvento)) {
                        result = Boolean.TRUE;
                    } else {
                        result = Boolean.FALSE;
                        return result;
                    }
                }
            }
        }

        return result;
    }
}
