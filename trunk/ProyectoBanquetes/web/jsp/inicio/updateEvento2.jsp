<%-- 
    Document   : updateEvento
    Created on : Aug 28, 2010, 6:28:01 PM
    Author     : maya
--%>
<%@ page session="true" %>

<%
            String username = "";
            HttpSession sesionOk = request.getSession();
            if (sesionOk.getAttribute("username") == null) {
%>

<meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/login/login.jsp?error=Coloca tus datos">

<%            } else {
                username = (String) sesionOk.getAttribute("username");
            }
%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.TO.DisponibilidadConfirmadosTO"%>
<%@page import="java.awt.Window"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows_de"%>
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
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp">
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
                            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));
                            Date fechaInicio = util.getSqlDate(request.getParameter("fechaInicioEvento"));
                            Date fechaFin = util.getSqlDate(request.getParameter("fechaFinEvento"));
                            evento.setId(idEvento);
                            eventoSala.setIdEvento(Integer.valueOf(request.getParameter("idEvento")));

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
                            List<Salon> salones = new ArrayList<Salon>();
                            Salon salon = new Salon();
                            if (estado.equals("C")) {
                                int cont = Integer.valueOf(request.getParameter("cont"));
                                String varSalon = "";
                                String varHiddenSalon = "";
                                for (int i = 1; i <= cont; i++) {
                                    varSalon = "salon" + i;
                                    varHiddenSalon = "hiddenSalon" + i;
                                    salon = servicioSalon.getSalonNombre(request.getParameter(varHiddenSalon));
                                    salones.add(salon);
                                }

                                Boolean disponible = servicioSalon.disponibilidadConfirmados(fechaInicio, fechaFin, salones, idEvento);

                                if (disponible) {
                                    evento.setEstado(estado);
                                    evento.setFechaInicio(fechaInicio);
                                    evento.setFechaFin(fechaFin);

                                } else {
                                    out.print("Ya existe un evento confirmado para la fecha en el salon: " + request.getParameter(varHiddenSalon));
                                }
                            } else {
                                evento.setEstado(estado);

                                if (request.getParameter("fechaInicioEvento") != null) {
                                    evento.setFechaInicio(util.getSqlDate(request.getParameter("fechaInicioEvento")));
                                }

                                if (request.getParameter("fechaFinEvento") != null) {
                                    evento.setFechaFin(util.getSqlDate(request.getParameter("fechaFinEvento")));
                                }
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

                            if (request.getParameter("nota") != null) {
                                evento.setNota(request.getParameter("nota"));
                            }

                            int result = servicioEvento.editarEvento(evento);
                            int result2 = 0;

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
                                        salon = servicioSalon.getSalonNombre(request.getParameter(varHiddenSalon));
                                        eventoSala.setIdSalon(salon.getId());
                                        Salon salonNew = servicioSalon.getSalonNombre(request.getParameter(varSalon));
                                        eventoSala.setNuevoIdSalon(salonNew.getId());
                                    }

                                    if (request.getParameter(varNuevoCosto) != null) {
                                        eventoSala.setNuevoCosto(new Double(request.getParameter(varNuevoCosto)));
                                    } else if (request.getParameter(varCosto) != null) {
                                        eventoSala.setNuevoCosto(new Double(request.getParameter(varCosto)));
                                    }

                                    if (request.getParameter(varMontaje) != null) {
                                        Montaje montaje = servicioMontaje.getMontajeNombre(request.getParameter(varMontaje));
                                        eventoSala.setIdMontaje(montaje.getId());
                                    }

                                    result2 = servicioEventoSala.editarEventoSala(eventoSala);
                                }

                            }

                            if ((result == 1) && (result2 == 1)) {
                %>
                <script type="text/javascript">
                    alert("Exito! la reserva ha sido editada exitosamente.");
                </script>
                <% } else {%>
                <% if ((result != 1) && (result2 == 1)) {%>
                <script type="text/javascript">
                    alert("Error! la informacion del evento no pudo ser editada, revise campos.");
                </script>
                <% }%>
                <%if ((result == 1) && (result2 != 1)) {%>
                <script type="text/javascript">
                    alert("Error! la informacion del salon no pudo ser editada, revise campos.");
                </script>
                <% }%>
                <%if ((result != 1) && (result2 != 1)) {%>
                <script type="text/javascript">
                    alert("Error! la reserva no pudo ser editada, revise campos.");
                </script>
                <% }%>
                <% }%>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
