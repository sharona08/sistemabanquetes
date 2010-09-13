<%-- 
    Document   : comprobar
    Created on : Sep 10, 2010, 11:26:31 AM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
            Usuario user = new Usuario("admin", "admin", "Maya", "Uribe", "mariale.uribe@gmail.com", new Integer(1));
            String nombre = "";
            String password = "";
            if (request.getParameter("username") != null) {
                nombre = request.getParameter("username");
            }
            if (request.getParameter("password") != null) {
                password = request.getParameter("password");
            }
            if (nombre.equals(user.getUsername()) && password.equals(user.getPassword())) {
                HttpSession sesionOk = request.getSession();
                sesionOk.setAttribute("username", nombre);
%>

<meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp">
<%
} else {
%>

<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Ha ocurrido un error...usuario no registrado"/>
</jsp:forward>

<%            }
%>