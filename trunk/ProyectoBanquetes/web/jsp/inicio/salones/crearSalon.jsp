<%-- 
    Document   : crearEmpresa
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
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Crear Salon</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/salones/salonFiltros.jsp"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Salon</h1>
                <%
                            IServicioSalon servicioSalon = new ServicioSalon();
                            Salon salon = new Salon();

                            salon.setNombre(request.getParameter("nombre"));
                            salon.setCosto(Double.valueOf(request.getParameter("costo")));
                            salon.setHabilitado(true);

                            if (!request.getParameter("salon").equals("--")) {
                                Salon salonFK = new Salon();
                                salonFK = servicioSalon.getSalonNombre(request.getParameter("salon"));

                                salon.setIdSalon(salonFK.getId());

                            } else {
                                salon.setIdSalon(null);
                            }

                            Integer result = servicioSalon.crearSalon(salon);
                            if (result != null) {
                %>
                <script type="text/javascript">
                    alert("Exito! el salon ha sido registrado exitosamente.");
                </script> 
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el salon no se pudo registrar.");
                </script>
                <% }%>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
