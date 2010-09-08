<%-- 
    Document   : crearEmpresa
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>

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
        <title>Crear Alimentos y Bebidas</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/reservar/formAlimentos.jsp?idEvento=<%= request.getParameter("idEvento")%>"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Alimentos y Bebidas</h1>
                <%
                            IServicioReserva servicioReserva = new ServicioReserva();
                            ServicioServicioEvento servicioEvento = new ServicioServicioEvento();

                            servicioEvento.setIdServicio(Integer.valueOf(request.getParameter("nombre")));
                            servicioEvento.setIdEvento(Integer.valueOf(request.getParameter("idEvento")));
                            servicioEvento.setIdSalon(Integer.valueOf(request.getParameter("salon")));
                            servicioEvento.setCantidad(Integer.valueOf(request.getParameter("cantidad")));

                            String horaInicio = request.getParameter("horaInicio");
                            String minutosInicio = request.getParameter("minutosInicio");
                            String fullTime = horaInicio + ":" + minutosInicio + ":00";
                            servicioEvento.setHoraInicio(Time.valueOf(fullTime));
                            servicioEvento.setHoraFin(Time.valueOf(fullTime));

                            servicioEvento.setNotaEspecial(request.getParameter("nota"));
                            servicioEvento.setNuevoCosto(Double.valueOf(request.getParameter("costoUnitario")));
                            servicioEvento.setNuevoNombre("");
                            servicioEvento.setNuevaDescripcion(request.getParameter("descripcion"));

                            Boolean result = servicioReserva.crearServicioEvento(servicioEvento);
                            if (result) {
                %>
                <script type="text/javascript">
                    alert("Exito! el servicio ha sido registrado exitosamente.");
                </script> 
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el servicio no se pudo registrar.");
                </script>
                <% }%>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
