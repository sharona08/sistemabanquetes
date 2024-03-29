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
        <title>Crear Contacto</title>
        
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Contacto</h1>
                <%
                String mensaje = "";
                            String texto = "";
                            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();

                            IServicioContacto servicioContacto = new ServicioContacto();
                            Contacto contacto = new Contacto();

                            contacto.setNombre(request.getParameter("nombre"));
                            contacto.setTelefono(request.getParameter("telefono"));
                            contacto.setDireccion(request.getParameter("direccion"));
                            contacto.setHabilitado(true);

                            Empresa empresa = new Empresa();
                            empresa = servicioEmpresa.getEmpresaNombre(request.getParameter("empresa"));

                            contacto.setRifEmpresa(empresa.getRif());

                            Integer result = servicioContacto.crearContacto(contacto);

                            if (result != null) {
                                mensaje = "exito";
                                texto = "El contacto ha sido registrado exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "El contacto no se pudo registrar.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/contactos/contactoFiltros.jsp?mensaje=<%=mensaje%>&texto=<%=texto%>"/>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
