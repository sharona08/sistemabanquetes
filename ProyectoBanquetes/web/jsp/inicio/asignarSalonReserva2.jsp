<%-- 
    Document   : reservar
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="java.util.List"%>
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
<%@page import="com.banquetes.servicios.impl.ServicioEventoSala"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEventoSala"%>
<%@page import="com.banquetes.dominio.EventoSala"%>
<%@page import="com.banquetes.servicios.impl.ServicioEventoSala"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEventoSala"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Agregar Salon a Evento</title>
        <jsp:include page="../include/head.jsp"></jsp:include>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Agregar salon a reserva</h1>
                <%
                            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));

                            IServicioEventoSala servicioEventoSala = new ServicioEventoSala();

                            EventoSala eventoSala = new EventoSala();
                            eventoSala.setIdEvento(idEvento);
                            eventoSala.setIdSalon(Integer.valueOf(request.getParameter("salon")));
                            eventoSala.setIdMontaje(Integer.valueOf(request.getParameter("montaje")));
                            eventoSala.setNuevoCosto(Double.valueOf(request.getParameter("nuevoCosto")));
                            eventoSala.setVisible(Boolean.TRUE);

                            Boolean result = servicioEventoSala.crearEventoSala(eventoSala);

                            if (result) {
                                IServicioSalon servicioSalon = new ServicioSalon();
                                Salon salon = servicioSalon.getSalon(Integer.valueOf(request.getParameter("salon")));

                                if (salon.getIdSalon() != null) {
                                    servicioEventoSala = new ServicioEventoSala();

                                    EventoSala salonSuper = servicioEventoSala.getEventoSala(idEvento, salon.getIdSalon());
                                    if (salonSuper != null) {
                                        //ya esta insertado el super salon
                                    } else {
                                        eventoSala = new EventoSala();
                                        eventoSala.setIdEvento(idEvento);
                                        eventoSala.setIdSalon(salon.getIdSalon());
                                        eventoSala.setIdMontaje(Integer.valueOf(request.getParameter("montaje")));
                                        eventoSala.setNuevoCosto(Double.valueOf(0));
                                        eventoSala.setVisible(Boolean.FALSE);

                                        Boolean superSalon = servicioEventoSala.crearEventoSala(eventoSala);
                                    }
                                    //ES COMO EL CONSUL
                                    //ASIGNAR COMO SALON DEL EVENTO EL DIPLOMAT, ES DECIR salon.getIdSalon()
                                } else {
                                    List<Salon> subSalones = servicioSalon.listarSubsalones(salon.getId());
                                    servicioEventoSala = new ServicioEventoSala();

                                    eventoSala = new EventoSala();
                                    for (Salon s : subSalones) {
                                        eventoSala.setIdEvento(idEvento);
                                        eventoSala.setIdSalon(s.getId());
                                        eventoSala.setIdMontaje(Integer.valueOf(request.getParameter("montaje")));
                                        eventoSala.setNuevoCosto(Double.valueOf(0));
                                        eventoSala.setVisible(Boolean.FALSE);

                                        Boolean subSalon = servicioEventoSala.crearEventoSala(eventoSala);
                                    }
                                    // BUSCAR SI ES COMO EL DIPLOMAT
                                    // ASIGNAR COMO SALON DEL EVENTO LOS 3, ES DECIR
                                }

                                JOptionPane.showMessageDialog(null,
                                        "Exito! El salon ha sido asignado exitosamente.",
                                        "Exito",
                                        JOptionPane.INFORMATION_MESSAGE);
                            } else {

                                JOptionPane.showMessageDialog(null,
                                        "Error! El salon no pudo ser asignado.",
                                        "Error",
                                        JOptionPane.ERROR_MESSAGE);
                            }
                %>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
