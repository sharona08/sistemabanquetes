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
<%@page import="com.banquetes.dominio.Departamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento"%>
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
        <title>Crear Departamento</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/departamentos/departamentoFiltros.jsp"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Departamento</h1>
                <%
                            IServicioDepartamento servicioDepartamento = new ServicioDepartamento();
                            Departamento departamento = new Departamento();

                            departamento.setNombre(request.getParameter("nombre"));

                            Integer result = servicioDepartamento.crearDepartamento(departamento);
                            if (result != null) {

                                JOptionPane.showMessageDialog(null,
                                        "Exito! el departamento ha sido registrado exitosamente.",
                                        "Exito",
                                        JOptionPane.INFORMATION_MESSAGE);
                            } else {

                                JOptionPane.showMessageDialog(null,
                                        "Error! el departamento no se pudo registrar.",
                                        "Error",
                                        JOptionPane.ERROR_MESSAGE);
                            }
                %>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
