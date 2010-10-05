<%-- 
    Document   : reservar
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="java.util.Date"%>
<%@page import="com.banquetes.dominio.ServicioServicioEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
<%@page import="javax.swing.JOptionPane"%>
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
        <script type="text/javascript" src="mensajeExito.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp?fechaInicio=<request.getParameter("hiddenFechaInicio")%>&fechaFin=<request.getParameter("hiddenFechaFin")%>&salon=<request.getParameter("hiddenSalon")%>&ID=<request.getParameter("idEvento")%>"/>-->
    </head>

    <body>
        <div id="pageWrap">
            <%
                        String mensaje = "";
                        String texto = "";

                        Date today = new java.util.Date();
                        java.sql.Date fecha = new java.sql.Date(today.getTime());

                        Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));
                        Integer idSalon = Integer.valueOf(request.getParameter("salon"));

                        IServicioSalon servicioSalon = new ServicioSalon();
                        IServicioEventoSala servicioEventoSala = new ServicioEventoSala();
                        Salon salonUrl = servicioSalon.listarSalones().get(0);

                        Salon salonConfirm = servicioSalon.getSalon(idSalon);
                        String opcion = null;
                        opcion = request.getParameter("opcion");
            %>

            <%
                        if (opcion == null) {
            %>
            <script type="text/javascript">
                advertencia();
            </script>
            <div id="info3" style="float: inherit">
                <div>
                    Esta operación eliminará los servicios contratados en dicho salón. <br>
                </div>
                <div>
                    ¿Deseas exportar estos servicios del <%=salonConfirm.getNombre()%> a otro salón?
                </div>
                <div style="margin-left: 330px">
                    <a href="/ProyectoBanquetes/jsp/inicio/eliminarEventoSala.jsp?idEvento=<%=idEvento%>&salon=<%=idSalon%>&opcion=0" class="close">Si</a>
                    <a href="/ProyectoBanquetes/jsp/inicio/eliminarEventoSala.jsp?idEvento=<%=idEvento%>&salon=<%=idSalon%>&opcion=1" class="close">No</a>
                    <a href="/ProyectoBanquetes/jsp/inicio/eliminarEventoSala.jsp?idEvento=<%=idEvento%>&salon=<%=idSalon%>&opcion=2" class="close">Cancelar</a>
                </div>
            </div>
            <%
                        }
            %>
         
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Eliminar salon de reserva</h1>

                <%
                            Integer confirm = 3;

                            if (opcion != null) {
                                confirm = Integer.valueOf(opcion);
                            }

                            //confirm: 0 = si, 1 = no, 2 = cancel
                            if (confirm.equals(0)) { //Si es 0, entonces se exportan los servicios a otro salon

                %>
                <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/formExportarServicios.jsp?idEvento=<%=idEvento%>&salon=<%=idSalon%>"/>
                <%
                                            } else if (confirm.equals(1)) { //Si es 1 no se exportan, y se elimina el salon

                                                Boolean result = servicioEventoSala.eliminarEventoSala(idEvento, idSalon);

                                                Salon salon = servicioSalon.getSalon(idSalon);

                                                if (result) {
                                                    // si el salon es el consul, se debe eliminar el diplomat tambien,
                                                    // si el salon es el diplomat, se deben eliminar los otros tres

                                                    if (salon.getIdSalon() != null) {
                                                        //SI NO EXISTEN MAS SALONES EN ESA RESERVA QUE TENGAN COMO SUPER SALON A ESE SALON

                                                        List<EventoSala> eventosSala = servicioEventoSala.listarEventoSalas(idEvento);
                                                        Boolean eliminar = Boolean.TRUE;

                                                        for (EventoSala e : eventosSala) {
                                                            if (e.getIdSalon().equals(salon.getIdSalon())) {
                                                                eliminar = Boolean.FALSE;
                                                                break;
                                                            }
                                                        }
                                                        if (eliminar) {
                                                            Boolean superSalon = servicioEventoSala.eliminarEventoSala(idEvento, salon.getIdSalon());
                                                        }

                                                    } else {
                                                        List<Salon> subSalones = servicioSalon.listarSubsalones(salon.getId());
                                                        if (!subSalones.isEmpty()) {

                                                            for (Salon s : subSalones) {
                                                                Boolean subSalon = servicioEventoSala.eliminarEventoSala(idEvento, s.getId());
                                                            }
                                                        }
                                                    }

                                                    mensaje = "exito";
                                                    texto = "El salon ha sido eliminado exitosamente.";

                %>
                <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp?fechaInicio=<%= fecha%>&fechaFin=<%= fecha%>&salon=<%= salonUrl.getNombre()%>&mensaje=<%=mensaje%>&texto=<%=texto%>">
                <%

                                                                } else {

                                                                    mensaje = "error";
                                                                    texto = "El salon no pudo ser eliminado.";
                %>
                <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp?fechaInicio=<%= fecha%>&fechaFin=<%= fecha%>&salon=<%= salonUrl.getNombre()%>&mensaje=<%=mensaje%>&texto=<%=texto%>">
                <%
                                                }

                                            } else if (confirm.equals(2)) {
                %>
                <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp?fechaInicio=<%= fecha%>&fechaFin=<%= fecha%>&salon=<%= salonUrl.getNombre()%>&mensaje=<%=mensaje%>&texto=<%=texto%>">
                <%
                                            }
                %>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
