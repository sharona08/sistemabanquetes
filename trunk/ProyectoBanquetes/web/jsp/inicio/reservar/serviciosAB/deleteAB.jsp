<%-- 
    Document   : crearEmpresa
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="java.sql.Date"%>
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
        <title>Eliminar Alimentos y Bebidas</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/reservar/serviciosAB/formAlimentos.jsp?idEvento=<%= request.getParameter("idEvento")%>"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Eliminar Alimentos y Bebidas</h1>
                <%
                            UtilMethods util = new UtilMethods();

                            IServicioReserva servicioReserva = new ServicioReserva();

                            Integer idServicio = Integer.valueOf(request.getParameter("idServicio"));
                            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));
                            Integer idSalon = Integer.valueOf(request.getParameter("idSalon"));
                            Date fechaInicio = util.getSqlDate(request.getParameter("fechaInicio"));

                            Boolean result = servicioReserva.eliminarServicioEvento(idServicio, idEvento, idSalon, fechaInicio);
                            if (result) {
                %>
                <script type="text/javascript">
                    alert("Exito! el servicio ha sido eliminado exitosamente.");
                </script> 
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el servicio no se pudo eliminado.");
                </script>
                <% }%>
            </div>
            <jsp:include page="../../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
