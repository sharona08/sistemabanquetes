<%-- 
    Document   : combodependiente
    Created on : Sep 7, 2010, 9:53:24 AM
    Author     : maya
--%>

<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            IServicioContacto iServicioContacto = new ServicioContacto();

            String rif = (String) request.getParameter("q");
            List<Contacto> contactosRif = iServicioContacto.listarContactosRif(rif);

            String sid = (String) request.getParameter("sid");
%>
<select name="contacto" style="width: 210px; height: 25px">
    <%
                for (Contacto c : contactosRif) {
                    out.write("<option value=" + c.getId() + ">" + c.getNombre() + "</option>");
                }
    %>
</select>