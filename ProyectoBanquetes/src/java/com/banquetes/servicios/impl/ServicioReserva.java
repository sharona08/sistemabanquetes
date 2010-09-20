package com.banquetes.servicios.impl;

import com.banquetes.configuracion.Conexion;
import com.banquetes.dominio.Evento;
import com.banquetes.dominio.EventoSala;
import com.banquetes.dominio.Iva;
import com.banquetes.dominio.Servicio;
import com.banquetes.dominio.ServicioServicioEvento;
import com.banquetes.servicios.TO.DetallesReservaSalonTO;
import com.banquetes.servicios.TO.DetallesReservaTO;
import com.banquetes.servicios.interfaces.IServicioReserva;
import com.banquetes.servicios.interfaces.IServicioEvento;
import com.banquetes.servicios.interfaces.IServicioEventoSala;
import com.banquetes.servicios.interfaces.IServicioIva;
import com.banquetes.servicios.interfaces.IServicioServicio;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maya
 */
public class ServicioReserva implements IServicioReserva {

    private Conexion conexion = new Conexion();
    private SqlMapClient sqlMap = conexion.conectar();
    private IServicioEvento servicioEvento = new ServicioEvento();
    private IServicioEventoSala servicioEventoSala = new ServicioEventoSala();
    private IServicioIva servicioIva = new ServicioIva();

    public ServicioReserva() {
    }

    public Integer reservar(Evento evento, Integer idSalon, Integer idMontaje, Double nuevoCosto) {
        Integer idEvento = servicioEvento.crearEvento(evento);
        if (idEvento != null) {
            EventoSala eventoSala = new EventoSala(idEvento, nuevoCosto, idSalon, idMontaje, null, Boolean.TRUE);
            Boolean resultES = servicioEventoSala.crearEventoSala(eventoSala);
            if (resultES) {
                System.out.println("Se inserto el evento sala correctamente.");

            } else {
                System.out.println("ERROR: no se inserto el evento sala.");
            }
        } else {
            System.out.println("ERROR: no se inserto el evento.");
        }
        return idEvento;
    }

    public DetallesReservaTO getDetallesReserva(Integer idEvento) {
        DetallesReservaTO detalles = null;
        try {
            detalles = (DetallesReservaTO) sqlMap.queryForObject("getDetallesReserva", idEvento);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detalles;
    }

    public List<DetallesReservaSalonTO> getDetallesReservaSalon(Integer idEvento) {
        List<DetallesReservaSalonTO> detallesSalon = null;
        try {
            detallesSalon = sqlMap.queryForList("getDetallesReservaSalon", idEvento);

        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detallesSalon;
    }

    public Boolean crearServicioEvento(ServicioServicioEvento servicioEvento) {
        Boolean result = Boolean.FALSE;
        try {
            Integer resultado = (Integer) sqlMap.insert("crearServicioEvento", servicioEvento);

            if (resultado != null) {
                result = Boolean.TRUE;
            } else {
                result = Boolean.FALSE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public Boolean editarServicioEvento(ServicioServicioEvento servicioEvento) {
        Boolean result = Boolean.FALSE;
        try {
            Map param = new HashMap();
            param.put("idEvento", servicioEvento.getIdEvento());
            param.put("idServicio", servicioEvento.getIdServicio());
            param.put("idSalon", servicioEvento.getIdSalon());

            ServicioServicioEvento newServicioEvento = (ServicioServicioEvento) sqlMap.queryForObject("getServicioEvento", param);

            if (servicioEvento.getCantidad() != null) {
                newServicioEvento.setCantidad(servicioEvento.getCantidad());
            }
            if (servicioEvento.getHoraInicio() != null) {
                newServicioEvento.setHoraInicio(servicioEvento.getHoraInicio());
            }
            if (servicioEvento.getHoraInicio() != null) {
                newServicioEvento.setHoraInicio(servicioEvento.getHoraInicio());
            }
            if (servicioEvento.getHoraFin() != null) {
                newServicioEvento.setHoraFin(servicioEvento.getHoraFin());
            }
            if (servicioEvento.getNotaEspecial() != null) {
                newServicioEvento.setNotaEspecial(servicioEvento.getNotaEspecial());
            }
            if (servicioEvento.getNuevoCosto() != null) {
                newServicioEvento.setNuevoCosto(servicioEvento.getNuevoCosto());
            }
            if (servicioEvento.getNuevoNombre() != null) {
                newServicioEvento.setNuevoNombre(servicioEvento.getNuevoNombre());
            }
            if (servicioEvento.getNuevaDescripcion() != null) {
                newServicioEvento.setNuevaDescripcion(servicioEvento.getNuevaDescripcion());
            }
            if (servicioEvento.getFechaInicio() != null) {
                newServicioEvento.setFechaInicio(servicioEvento.getFechaInicio());
            }
            if (servicioEvento.getFechaFin() != null) {
                newServicioEvento.setFechaFin(servicioEvento.getFechaFin());
            }

            int resultado = sqlMap.update("editarServicioEvento", newServicioEvento);

            if (resultado == 1) {
                result = Boolean.TRUE;
            } else {
                result = Boolean.FALSE;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<ServicioServicioEvento> listarServicioEventos(Integer idEvento, String tipoServicio) {
        List<ServicioServicioEvento> servicioEventos = null;

        try {
            Map param = new HashMap();
            param.put("idEvento", idEvento);
            param.put("tipoServicio", tipoServicio);
            servicioEventos = sqlMap.queryForList("getServicioEventos", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return servicioEventos;
    }

    public List<ServicioServicioEvento> listarServicioEventosTodos(Integer idEvento) {
        List<ServicioServicioEvento> servicioEventos = null;

        try {
            servicioEventos = sqlMap.queryForList("getServicioEventosTodos", idEvento);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return servicioEventos;
    }

    public ServicioServicioEvento getServicioEvento(Integer idEvento, Integer idSalon, Integer idServicio) {
        ServicioServicioEvento servicioEvento2 = null;

        try {
            Map param = new HashMap();
            param.put("idEvento", idEvento);
            param.put("idSalon", idSalon);
            param.put("idServicio", idServicio);
            servicioEvento2 = (ServicioServicioEvento) sqlMap.queryForObject("getServicioEvento", param);
        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }
        return servicioEvento2;
    }

    public Boolean eliminarServicioEvento(Integer idServicio, Integer idEvento, Integer idSalon) {
        Boolean result = false;

        try {
            Map param = new HashMap();
            param.put("idServicio", idServicio);
            param.put("idEvento", idEvento);
            param.put("idSalon", idSalon);
            int resultado = sqlMap.delete("eliminarServicioEvento", param);

            if (resultado == 1) {
                result = Boolean.TRUE;
            } else {
                result = Boolean.FALSE;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioReserva.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public Double costoTotalSalones(Integer idEvento) {
        Double costoTotal = new Double(0);
        List<DetallesReservaSalonTO> detallesReservaSalon = this.getDetallesReservaSalon(idEvento);
        for (DetallesReservaSalonTO d : detallesReservaSalon) {
            if (d.getNuevoCosto() != null) {
                costoTotal = costoTotal + d.getNuevoCosto();
            } else {
                costoTotal = costoTotal + d.getCostoSalon();
            }
        }
        return costoTotal;
    }

    public Double costoTotalServicios(Integer idEvento, String tipoServicio) {
        Double costoTotal = new Double(0);
        IServicioServicio servicioServicio = new ServicioServicio();
        Servicio servicio = new Servicio();

        List<ServicioServicioEvento> servicioServicioEventos = this.listarServicioEventos(idEvento, tipoServicio);
        for (ServicioServicioEvento s : servicioServicioEventos) {
            if (s.getNuevoCosto() != null) {
                costoTotal = costoTotal + s.getNuevoCosto();
            } else {
                servicio = servicioServicio.getServicio(s.getIdServicio());
                costoTotal = costoTotal + servicio.getCostoUnitario();
            }
        }
        return costoTotal;
    }

    public Double subtotalReserva(Integer idEvento) {
        Double subtotal = new Double(0);

        Double costoSalones = this.costoTotalSalones(idEvento);
        Double costoAB = this.costoTotalServicios(idEvento, "AB");
        Double costoAU = this.costoTotalServicios(idEvento, "AU");
        Double costoOT = this.costoTotalServicios(idEvento, "OT");

        subtotal = costoSalones + costoAB + costoAU + costoOT;

        return subtotal;
    }

    public Double ivaReserva(Integer idEvento) {
        Double costoIVA = new Double(0);

        Iva ivaObj = new Iva();
        ivaObj = servicioIva.getIva(new Integer(1));

        Double iva = ivaObj.getPorcentaje();

        Double subtotal = this.subtotalReserva(idEvento);

        costoIVA = subtotal * (iva/100);

        return costoIVA;
    }

    public Double costoTotalReserva(Integer idEvento) {
        Double costoTotal = new Double(0);

        Double subtotal = this.subtotalReserva(idEvento);
        Double costoIVA = this.ivaReserva(idEvento);

        costoTotal = subtotal + costoIVA;

        return costoTotal;
    }
}
