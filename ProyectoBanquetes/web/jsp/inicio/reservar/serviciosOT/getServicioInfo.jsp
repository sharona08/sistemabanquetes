<%-- 
    Document   : combodependiente
    Created on : Sep 7, 2010, 9:53:24 AM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
<%@page import="com.banquetes.dominio.ServicioServicioEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            IServicioServicio servicioServicio = new ServicioServicio();

            String idServicio = (String) request.getParameter("idServicio");

            Servicio servicio = servicioServicio.getServicio(Integer.valueOf(idServicio));
            Double costo = servicio.getCostoUnitario();

%>
<input value="<%= costo %>" name="costoUnitario" style="width: 250px; height: 23px" onKeyUp="this.value=this.value.toUpperCase();" />
