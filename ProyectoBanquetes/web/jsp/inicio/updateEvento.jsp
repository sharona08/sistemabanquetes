<%-- 
    Document   : updateEvento
    Created on : Aug 28, 2010, 6:28:01 PM
    Author     : maya
--%>

<%@page import="com.banquetes.util.UtilMethods"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEventoSala"%>
<%@page import="com.banquetes.servicios.impl.ServicioEventoSala"%>
<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page import="com.banquetes.dominio.EventoSala"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="java.sql.Time"%>
<%@page import="com.banquetes.dominio.TipoEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioTipoEvento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioTipoEvento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioEvento"%>
<%@page import="com.banquetes.dominio.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../include/head.jsp"></jsp:include>
        <title>Editar Evento</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp?fechaInicio=<%= request.getParameter("hiddenFechaInicio")%>&fechaFin=<%= request.getParameter("hiddenFechaFin")%>&salon=<%= request.getParameter("hiddenSalon")%>">
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">
                <%
                            UtilMethods util = new UtilMethods();
                            IServicioEvento servicioEvento = new ServicioEvento();
                            IServicioEventoSala servicioEventoSala = new ServicioEventoSala();
                            IServicioTipoEvento servicioTipoEvento = new ServicioTipoEvento();
                            IServicioSalon servicioSalon = new ServicioSalon();
                            IServicioMontaje servicioMontaje = new ServicioMontaje();
                            Evento evento = new Evento();
                            EventoSala eventoSala = new EventoSala();
                            String estado = null;
                            if (request.getParameter("estado") != null) {
                                String estadoActual = request.getParameter("estado");

                                if (estadoActual.equals("TENTATIVO")) {
                                    estado = "T";
                                } else if (estadoActual.equals("CONFIRMADO")) {
                                    estado = "C";
                                } else if (estadoActual.equals("ANULADO")) {
                                    estado = "A";
                                }

                            }
                            evento.setId(Integer.valueOf(request.getParameter("idEvento")));
                            eventoSala.setIdEvento(Integer.valueOf(request.getParameter("idEvento")));

                            evento.setEstado(estado);

                            if (request.getParameter("fechaInicioEvento") != null) {
                                evento.setFechaInicio(util.getSqlDate(request.getParameter("fechaInicioEvento")));
                            }

                            if (request.getParameter("fechaFinEvento") != null) {
                                evento.setFechaFin(util.getSqlDate(request.getParameter("fechaFinEvento")));
                            }

                            if (request.getParameter("nombreEvento") != null) {
                                evento.setNombre(request.getParameter("nombreEvento"));
                            }

                            if (request.getParameter("tipoEvento") != null) {
                                TipoEvento te = servicioTipoEvento.getTipoEventoNombre(request.getParameter("tipoEvento"));
                                evento.setIdTipoEvento(te.getId());
                            }

                            if (request.getParameter("cantidadPersonas") != null) {
                                evento.setCantidadPersonas(Integer.valueOf(request.getParameter("cantidadPersonas")));
                            }

                            if ((request.getParameter("horaInicio") != null) && (request.getParameter("minutosInicio") != null)) {
                                String horaInicio = request.getParameter("horaInicio") + ":" + request.getParameter("minutosInicio") + ":00";
                                evento.setHoraInicio(Time.valueOf(horaInicio));
                            }

                            if ((request.getParameter("horaFin") != null) && (request.getParameter("minutosFin") != null)) {
                                String horaFin = request.getParameter("horaFin") + ":" + request.getParameter("minutosFin") + ":00";
                                evento.setHoraFin(Time.valueOf(horaFin));
                            }

                            if (request.getParameter("rifEmpresa") != null) {
                                evento.setRifEmpresa(request.getParameter("rifEmpresa"));
                            }

                            if (request.getParameter("idContacto") != null) {
                                evento.setIdContacto(Integer.valueOf(request.getParameter("idContacto")));
                            }

                            int result = servicioEvento.editarEvento(evento);

                            if (request.getParameter("cont") != null) {
                                int cont = Integer.valueOf(request.getParameter("cont"));
                                String varSalon = "";
                                String varNuevoCosto = "";
                                String varCosto = "";
                                String varMontaje = "";
                                String varHiddenSalon = "";

                                for (int i = 1; i <= cont; i++) {
                                    varSalon = "salon" + i;
                                    varNuevoCosto = "nuevoCostoSalon" + i;
                                    varCosto = "costoSalon" + i;
                                    varMontaje = "montaje" + i;
                                    varHiddenSalon = "hiddenSalon" + i;

                                    if (request.getParameter(varSalon) != null) {
                                        out.print(varSalon+ ", ");
                                        Salon salon = servicioSalon.getSalonNombre(request.getParameter(varHiddenSalon));
                                        eventoSala.setIdSalon(salon.getId());
                                        Salon salonNew = servicioSalon.getSalonNombre(request.getParameter(varSalon));
                                        eventoSala.setNuevoIdSalon(salonNew.getId());
                                    }

                                    if (request.getParameter(varNuevoCosto) != null) {
                                        out.print(varNuevoCosto + ", ");
                                        eventoSala.setNuevoCosto(new Double(request.getParameter(varNuevoCosto)));
                                    } else if (request.getParameter(varCosto) != null) {
                                        eventoSala.setNuevoCosto(new Double(request.getParameter(varCosto)));
                                    }

                                    if (request.getParameter(varMontaje) != null) {
                                        out.print(varMontaje + ". | ");
                                        Montaje montaje = servicioMontaje.getMontajeNombre(request.getParameter(varMontaje));
                                        eventoSala.setIdMontaje(montaje.getId());
                                    }

                                    //out.print(varSalon);
                                    int result2 = servicioEventoSala.editarEventoSala(eventoSala);
                                }

                            }

                            if ((result == 1)) {
                            }
                %>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
