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
            String tipoCambio = (String) request.getParameter("tipoCambio");

            if (tipoCambio.equals("B")) {
%>

<input type="text" name="tasaCambio" value="1" style="width: 185px; height: 25px; display: none"/>

<%            } else if (tipoCambio.equals("D")) {
%>

<input type="text" name="tasaCambio" value="1" style="width: 185px; height: 25px;"/>
<%            }
%>

