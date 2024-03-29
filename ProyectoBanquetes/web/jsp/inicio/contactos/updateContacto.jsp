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
        <title>Editar contacto</title>
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
                    String rif = "";
                    if (request.getParameter("rifEmpresa") == null) {
                        rif = "";
                    } else {
                        rif = request.getParameter("rifEmpresa");
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
                <h1 id="letra1">CONTACTOS</h1>
                <%
                            IServicioContacto servicioContacto = new ServicioContacto();
                            Contacto contacto = new Contacto();
                            contacto.setId(Integer.valueOf(hiddenId));
                            contacto.setNombre(request.getParameter("nombreContacto"));
                            contacto.setTelefono(request.getParameter("telefono"));
                            contacto.setDireccion(request.getParameter("direccion"));
                            contacto.setRifEmpresa(rif);

                            Boolean habilitado = null;
                            String estadoActual = request.getParameter("estados");

                            if (estadoActual.equals("HABILITADO")) {
                                habilitado = Boolean.TRUE;
                            } else if (estadoActual.equals("INHABILITADO")) {
                                habilitado = Boolean.FALSE;
                            }

                            contacto.setHabilitado(habilitado);

                            Boolean result = servicioContacto.editarContacto(contacto);

                            if (result) {
                                mensaje = "exito";
                                texto = "El contacto ha sido editado exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "El contacto no pudo ser editado.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/contactos/contactoFiltros.jsp?id=<%= id%>&nombre=<%= nombre%>&mensaje=<%=mensaje%>&texto=<%=texto%>">
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
