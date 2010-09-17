<%-- 
    Document   : updateEmpresa
    Created on : Sep 1, 2010, 4:36:29 PM
    Author     : maya
--%>
<%@page import="com.banquetes.dominio.Usuario"%>
<%@page import="com.banquetes.servicios.impl.ServicioUsuario"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioUsuario"%>
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
        <title>Editar usuario</title>
        <%
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
                    String apellido = "";
                    if (request.getParameter("apellido") == null) {
                        apellido = "";
                    } else {
                        apellido = request.getParameter("apellido");
                    }
        %>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/usuarios/detalleMiCuenta.jsp">
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">USUARIOS</h1>
                <%
                            IServicioUsuario servicioUsuario = new ServicioUsuario();
                            Usuario user = servicioUsuario.getUsuario(id);

                            Usuario usuario = new Usuario();
                            usuario.setUsername(id);
                            usuario.setPassword(null);
                            usuario.setNombre(request.getParameter("nombreUsuario"));
                            usuario.setApellido(request.getParameter("apellidoUsuario"));
                            usuario.setCorreo(request.getParameter("correo"));
                            usuario.setIdRol(user.getIdRol());

                            Boolean result = servicioUsuario.editarUsuario(usuario);

                            if (result) {
                %>
                <script type="text/javascript">
                    alert("Exito! el usuario ha sido editado exitosamente.");
                </script>
                <% } else{ %>
                <script type="text/javascript">
                    alert("Error! el usuario no pudo ser editado.");
                </script>

                <% } %>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
