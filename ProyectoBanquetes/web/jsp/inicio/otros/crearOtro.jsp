<%-- 
    Document   : crearServicio
    Created on : Sep 2, 2010, 5:44:25 PM
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
<%@page import="com.banquetes.dominio.Departamento"%>
<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page import="sun.org.mozilla.javascript.internal.JavaScriptException"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Crear Servicio</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/otros/otroFiltros.jsp"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Servicio</h1>
                <%
                            IServicioDepartamento servicioDepartamento = new ServicioDepartamento();

                            IServicioServicio servicioServicio = new ServicioServicio();
                            Servicio servicio = new Servicio();

                            servicio.setNombre(request.getParameter("nombre"));
                            servicio.setDescripcion(request.getParameter("descripcion"));
                            servicio.setCostoUnitario(Double.valueOf(request.getParameter("costo")));
                            servicio.setTipoServicio("OT");
                            servicio.setHabilitado(true);

                            Departamento departamento = new Departamento();
                            departamento = servicioDepartamento.getDepartamentoNombre(request.getParameter("departamento"));

                            servicio.setIdDepartamento(Integer.valueOf(departamento.getId()));

                            Integer result = servicioServicio.crearServicio(servicio);
                            if (result != null) {
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
