<%-- 
    Document   : reservar
    Created on : Sep 2, 2010, 10:44:25 AM
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

                            Boolean result = servicioEventoSala.crearEventoSala(eventoSala);

                            if (result) {
                %>
                <script type="text/javascript">
                    alert("Exito! el salon ha sido asignado exitosamente.");
                </script> 
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el salon no pudo ser asignado.");
                </script>
                <% }%>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
