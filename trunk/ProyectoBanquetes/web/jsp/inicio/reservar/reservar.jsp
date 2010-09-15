<%-- 
    Document   : reservar
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.dominio.EventoSala"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEventoSala"%>
<%@page import="com.banquetes.servicios.impl.ServicioEventoSala"%>
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
<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="java.sql.Time"%>
<%@page import="com.banquetes.util.UtilMethods"%>
<%@page import="com.banquetes.dominio.TipoEvento"%>
<%@page import="com.banquetes.dominio.Evento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioTipoEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioTipoEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Reservar</title>
        <!--        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/contactos/contactoFiltros.jsp"/>-->
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Reservar</h1>
                <%
                            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();
                            IServicioSalon servicioSalon = new ServicioSalon();
                            IServicioTipoEvento servicioTipoEvento = new ServicioTipoEvento();
                            IServicioMontaje servicioMontaje = new ServicioMontaje();
                            IServicioReserva servicioReserva = new ServicioReserva();
                            UtilMethods util = new UtilMethods();

                            String nombreEvento = request.getParameter("nombreEvento");
                            java.sql.Date fechaInicio = util.getSqlDate(request.getParameter("fechaInicioEvento"));
                            java.sql.Date fechaFin = util.getSqlDate(request.getParameter("fechaFinEvento"));
                            String horaInicioString = request.getParameter("horaInicio") + ":" + request.getParameter("minutosInicio") + ":00";
                            java.sql.Time horaInicio = Time.valueOf(horaInicioString);
                            String horaFinString = request.getParameter("horaFin") + ":" + request.getParameter("minutosFin") + ":00";
                            java.sql.Time horaFin = Time.valueOf(horaFinString);

                            Integer cantidadPersonas = Integer.valueOf(request.getParameter("cantidadPersonas"));
                            Integer idTipoEvento = Integer.valueOf(request.getParameter("tipoEvento"));
                            String rifEmpresa = request.getParameter("empresa");
                            Integer idContacto = Integer.valueOf(request.getParameter("contacto"));
                            String nota = null;

                            Salon salon = new Salon();
                            salon = servicioSalon.getSalonNombre(request.getParameter("hiddenSalon"));
                            Integer idSalon = salon.getId();

                            Integer idMontaje = Integer.valueOf(request.getParameter("montaje"));

                            Double nuevoCosto = null;
                            if (!request.getParameter("nuevoCosto").equals("")) {
                                nuevoCosto = Double.valueOf(request.getParameter("nuevoCosto"));
                            }

                            Evento evento = new Evento(null, "T", nombreEvento, idTipoEvento, fechaInicio, fechaFin, cantidadPersonas, horaInicio, horaFin, rifEmpresa, idContacto, nota);

                            Integer result = servicioReserva.reservar(evento, idSalon, idMontaje, nuevoCosto);
                            if (result != null) {
                                if (salon.getIdSalon() != null) {
                                    IServicioEventoSala servicioEventoSala = new ServicioEventoSala();

                                    EventoSala eventoSala = new EventoSala();
                                    eventoSala.setIdEvento(result);
                                    eventoSala.setIdSalon(salon.getIdSalon());
                                    eventoSala.setIdMontaje(Integer.valueOf(request.getParameter("montaje")));
                                    eventoSala.setNuevoCosto(Double.valueOf(0));
                                    eventoSala.setVisible(Boolean.FALSE);

                                    Boolean superSalon = servicioEventoSala.crearEventoSala(eventoSala);
                                    //ES COMO EL CONSUL
                                    //ASIGNAR COMO SALON DEL EVENTO EL DIPLOMAT, ES DECIR salon.getIdSalon()
                                } else {
                                    List<Salon> subSalones = servicioSalon.listarSubsalones(salon.getId());
                                    IServicioEventoSala servicioEventoSala = new ServicioEventoSala();

                                    EventoSala eventoSala = new EventoSala();
                                    for (Salon s : subSalones) {
                                        eventoSala.setIdEvento(result);
                                        eventoSala.setIdSalon(s.getId());
                                        eventoSala.setIdMontaje(Integer.valueOf(request.getParameter("montaje")));
                                        eventoSala.setNuevoCosto(Double.valueOf(0));
                                        eventoSala.setVisible(Boolean.FALSE);

                                        Boolean subSalon = servicioEventoSala.crearEventoSala(eventoSala);
                                    }
                                    // BUSCAR SI ES COMO EL DIPLOMAT
                                    // ASIGNAR COMO SALON DEL EVENTO LOS 3, ES DECIR
                                }
                %>
                <script type="text/javascript">
                    alert("Exito! la reserva ha sido realizada exitosamente.");
                    window.location.href='serviciosAB/formAlimentos.jsp?idEvento=<%=result%>';
                </script> 
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! la reserva no pudo ser realizada, revise campos.");
                </script>
                <% }%>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
