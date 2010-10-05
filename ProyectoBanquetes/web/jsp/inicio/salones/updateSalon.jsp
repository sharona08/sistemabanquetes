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
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Editar salon</title>
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
                <h1 id="letra1">SALONES</h1>
                <%
                            IServicioSalon servicioSalon = new ServicioSalon();
                            Salon salon = new Salon();
                            salon.setId(Integer.valueOf(hiddenId));
                            salon.setNombre(request.getParameter("nombreSalon"));
                            salon.setCosto(Double.valueOf(request.getParameter("costo")));

                            if (!request.getParameter("idSalonFK").equals("")) {
                                salon.setIdSalon(Integer.valueOf(request.getParameter("idSalonFK")));
                            }

                            Boolean habilitado = null;
                            String estadoActual = request.getParameter("estados");

                            if (estadoActual.equals("HABILITADO")) {
                                habilitado = Boolean.TRUE;
                            } else if (estadoActual.equals("INHABILITADO")) {
                                habilitado = Boolean.FALSE;
                            }

                            salon.setHabilitado(habilitado);

                            Boolean result = servicioSalon.editarSalon(salon);

                            if (result) {
                                mensaje = "exito";
                                texto = "El salon ha sido editado exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "El salon no pudo ser editado.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/salones/salonFiltros.jsp?id=<%= id%>&nombre=<%= nombre%>&mensaje=<%=mensaje%>&texto=<%=texto%>">
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
