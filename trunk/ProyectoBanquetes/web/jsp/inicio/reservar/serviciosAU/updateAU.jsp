<%-- 
    Document   : crearEmpresa
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="com.banquetes.dominio.Evento"%>
<%@page import="com.banquetes.servicios.impl.ServicioEvento"%>
<%@page import="com.banquetes.util.UtilMethods"%>
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
<%@page import="java.sql.Time"%>
<%@page import="com.banquetes.dominio.ServicioServicioEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Editar Audiovisuales</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/reservar/serviciosAU/formAudiovisuales.jsp?idEvento=<%= request.getParameter("idEvento")%>"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Editar Audiovisuales</h1>
                <%
                            IServicioReserva servicioReserva = new ServicioReserva();
                            ServicioServicioEvento servicioEvento = new ServicioServicioEvento();
                            UtilMethods util = new UtilMethods();

                            ServicioEvento servEvento = new ServicioEvento();
                            Evento evento = servEvento.getEvento(Integer.valueOf(request.getParameter("idEvento")));

                            servicioEvento.setIdServicio(Integer.valueOf(request.getParameter("idServicio")));
                            servicioEvento.setIdEvento(Integer.valueOf(request.getParameter("idEvento")));
                            servicioEvento.setIdSalon(Integer.valueOf(request.getParameter("idSalon")));
                            servicioEvento.setCantidad(Integer.valueOf(request.getParameter("cantidad")));

                            String horaInicio = request.getParameter("horaInicio");
                            String minutosInicio = request.getParameter("minutosInicio");
                            String fullTime = horaInicio + ":" + minutosInicio + ":00";
                            servicioEvento.setHoraInicio(Time.valueOf(fullTime));
                            servicioEvento.setHoraFin(evento.getHoraFin());

                            servicioEvento.setFechaInicio(util.getSqlDate(request.getParameter("fechaInicioEvento")));
                            servicioEvento.setFechaFin(util.getSqlDate(request.getParameter("fechaFinEvento")));

                            servicioEvento.setNotaEspecial(request.getParameter("notaEspecial"));
                            servicioEvento.setNuevoCosto(Double.valueOf(request.getParameter("costo")));
                            servicioEvento.setNuevoNombre("");
                            servicioEvento.setNuevaDescripcion(request.getParameter("descripcion"));

                            Boolean result = servicioReserva.editarServicioEvento(servicioEvento);
                            if (result) {
                %>
                <script type="text/javascript">
                    alert("Exito! el servicio ha sido editado exitosamente.");
                </script> 
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el servicio no se pudo editado.");
                </script>
                <% }%>
            </div>
            <jsp:include page="../../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
