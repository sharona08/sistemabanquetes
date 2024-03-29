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
        <title>Crear Empresa</title>
        
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Empresa</h1>
                <%
                            String mensaje = "";
                            String texto = "";
                            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();
                            Empresa empresa = new Empresa();
                            empresa.setRif(request.getParameter("rif"));
                            empresa.setNombre(request.getParameter("nombre"));
                            empresa.setTelefono(request.getParameter("telefono"));
                            empresa.setDireccion(request.getParameter("direccion"));
                            empresa.setHabilitado(true);

                            Boolean existe = servicioEmpresa.existeEmpresa(empresa);
                            if (!existe) {
                                Boolean result = servicioEmpresa.crearEmpresa(empresa);
                                if (result) {
                                    mensaje = "exito";
                                    texto = "La empresa ha sido registrado exitosamente.";

                                } else {
                                    mensaje = "error";
                                    texto = "La empresa no se pudo registrar.";
                                }
                            } else {
                                mensaje = "error";
                                texto = "La empresa ya existe.";
                            }

                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/empresas/empresaFiltros.jsp?mensaje=<%=mensaje%>&texto=<%=texto%>"/>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
