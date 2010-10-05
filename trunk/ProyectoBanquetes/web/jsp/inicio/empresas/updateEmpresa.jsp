<%-- 
    Document   : updateEmpresa
    Created on : Sep 1, 2010, 4:36:29 PM
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
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Editar empresa</title>
        <%
        String mensaje = "";
                    String texto = "";
                    String hiddenRif = "";
                    if (request.getParameter("hiddenRif") == null) {
                        hiddenRif = "";
                    } else {
                        hiddenRif = request.getParameter("hiddenRif");
                    }
                    String rif = "";
                    if (request.getParameter("rif") == null) {
                        rif = "";
                    } else {
                        rif = request.getParameter("rif");
                    }
                    String nombre = "";
                    if (request.getParameter("nombre") == null) {
                        nombre = "";
                    } else {
                        nombre = request.getParameter("nombre");
                    }
        %>
        </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">EMPRESAS</h1>
                <%
                            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();
                            Empresa empresa = new Empresa();
                            empresa.setRif(hiddenRif);
                            empresa.setNombre(request.getParameter("nombreEmpresa"));
                            empresa.setTelefono(request.getParameter("telefono"));
                            empresa.setDireccion(request.getParameter("direccion"));

                            Boolean habilitado = null;
                            String estadoActual = request.getParameter("estados");

                            if (estadoActual.equals("HABILITADO")) {
                                habilitado = Boolean.TRUE;
                            } else if (estadoActual.equals("INHABILITADO")) {
                                habilitado = Boolean.FALSE;
                            }

                            empresa.setHabilitado(habilitado);

                            Boolean result = servicioEmpresa.editarEmpresa(empresa);
                            
                            if (result) {
                                mensaje = "exito";
                                texto = "La empresa ha sido editada exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "La empresa no pudo ser editada.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/empresas/empresaFiltros.jsp?rif=<%= rif%>&nombre=<%= nombre%>&mensaje=<%=mensaje%>&texto=<%=texto%>">
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
