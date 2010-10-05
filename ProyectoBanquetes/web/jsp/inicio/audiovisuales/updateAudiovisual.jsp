<%-- 
    Document   : updateAlimento
    Created on : Sep 1, 2010, 5:16:29 PM
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
<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Editar servicio</title>
        <%
        String mensaje = "";
                    String texto = "";
                    String hiddenId = "";
                    if (request.getParameter("hiddenId") == null) {
                        hiddenId = "";
                    } else {
                        hiddenId = request.getParameter("hiddenId");
                    }
                    String id = "";
                    if (request.getParameter("id") == null) {
                        id = "";
                    } else {
                        id = request.getParameter("id");
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
                <h1 id="letra1">SERVICIOS</h1>
                <%
                            IServicioDepartamento servicioDepartamento = new ServicioDepartamento();
                            Departamento departamento = servicioDepartamento.getDepartamentoNombre(request.getParameter("departamento"));

                            IServicioServicio servicioServicio = new ServicioServicio();
                            Servicio servicio = new Servicio();

                            servicio.setId(Integer.valueOf(hiddenId));
                            servicio.setNombre(request.getParameter("nombreServicio"));
                            servicio.setDescripcion(request.getParameter("descripcion"));
                            servicio.setCostoUnitario(Double.valueOf(request.getParameter("costo")));

                            Boolean habilitado = null;
                            String estadoActual = request.getParameter("estados");

                            if (estadoActual.equals("HABILITADO")) {
                                habilitado = Boolean.TRUE;
                            } else if (estadoActual.equals("INHABILITADO")) {
                                habilitado = Boolean.FALSE;
                            }

                            servicio.setHabilitado(habilitado);
                            servicio.setIdDepartamento(departamento.getId());

                            Boolean result = servicioServicio.editarServicio(servicio);

                            if (result) {
                                mensaje = "exito";
                                texto = "El servicio ha sido editado exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "El servicio no pudo ser editado.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/audiovisuales/audiovisualFiltros.jsp?id=<%= id%>&nombre=<%= nombre%>&mensaje=<%=mensaje%>&texto=<%=texto%>">
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
