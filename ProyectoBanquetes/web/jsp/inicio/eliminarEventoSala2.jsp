<%-- 
    Document   : reservar
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
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
        <title>Eliminar Salon de Reserva</title>
        <jsp:include page="../include/head.jsp"></jsp:include>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Eliminar salon de reserva</h1>
                <%
                            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));
                            Integer idSalon = Integer.valueOf(request.getParameter("salon"));

                            IServicioEventoSala servicioEventoSala = new ServicioEventoSala();
                            IServicioSalon servicioSalon = new ServicioSalon();
                            
                            Boolean result = servicioEventoSala.eliminarEventoSala(idEvento, idSalon);

                            Salon salon = servicioSalon.getSalon(idSalon);
                            
                            if (result) {
                                // si el salon es el consul, se debe eliminar el diplomat tambien,
                                // si el salon es el diplomat, se deben eliminar los otros tres

                                if (salon.getIdSalon() != null) {
                                    Boolean superSalon = servicioEventoSala.eliminarEventoSala(idEvento, salon.getIdSalon());

                                } else {
                                    List<Salon> subSalones = servicioSalon.listarSubsalones(salon.getId());
                                    if (!subSalones.isEmpty()) {

                                        for (Salon s : subSalones) {
                                            Boolean subSalon = servicioEventoSala.eliminarEventoSala(idEvento, s.getId());
                                        }
                                    }
                                }

                %>
                <script type="text/javascript">
                    alert("Exito! el salon ha sido eliminado exitosamente.");
                </script>
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el salon no pudo ser eliminado.");
                </script>
                <% }%>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
