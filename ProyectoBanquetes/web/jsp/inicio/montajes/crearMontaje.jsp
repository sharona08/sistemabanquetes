<%-- 
    Document   : crearEmpresa
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="javax.swing.JOptionPane"%>
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
<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Crear Montaje</title>
        
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Montaje</h1>
                <%
                            String mensaje = "";
                            String texto = "";
                            IServicioMontaje servicioMontaje = new ServicioMontaje();
                            Montaje montaje = new Montaje();

                            montaje.setTipoMontaje(request.getParameter("nombre"));

                            Integer result = servicioMontaje.crearMontaje(montaje);

                            if (result != null) {
                                mensaje = "exito";
                                texto = "El montaje ha sido registrado exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "El montaje no se pudo registrar.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/montajes/montajeFiltros.jsp?mensaje=<%=mensaje%>&texto=<%=texto%>"/>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
