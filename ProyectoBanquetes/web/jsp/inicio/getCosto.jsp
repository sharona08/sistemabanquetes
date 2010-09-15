<%-- 
    Document   : combodependiente
    Created on : Sep 7, 2010, 9:53:24 AM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            IServicioSalon servicioSalon = new ServicioSalon();

            String idSalon = (String) request.getParameter("idSalon");

            Salon salon = servicioSalon.getSalon(Integer.valueOf(idSalon));
            Double costo = salon.getCosto();

%>
<input type="text" name="nuevoCosto" value="<%=costo%>" style="width: 195px; height: 23px" align="middle" />
