<%-- 
    Document   : updateEmpresa
    Created on : Sep 1, 2010, 4:36:29 PM
    Author     : maya
--%>
<%@page import="javax.swing.JOptionPane"%>
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
<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.security.MessageDigest"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Editar contrase�a</title>
        <%
                    String mensaje = "";
                    String texto = "";
                    String id = "";
                    if (request.getParameter("id") == null) {
                        id = "";
                    } else {
                        id = request.getParameter("id");
                    }

                    String passActual = request.getParameter("contrasenaActual");
                    String passNueva = request.getParameter("contrasenaNueva");

                    MessageDigest alg = MessageDigest.getInstance("MD5");
                    alg.reset();
                    alg.update(passActual.getBytes());
                    byte[] digest = alg.digest();

                    StringBuffer hashedpasswd = new StringBuffer();
                    String hx;
                    for (int i = 0; i < digest.length; i++) {
                        hx = Integer.toHexString(0xFF & digest[i]);
                        //0x03 is equal to 0x3, but we need 0x03 for our md5sum
                        if (hx.length() == 1) {
                            hx = "0" + hx;
                        }
                        hashedpasswd.append(hx);
                    }

                    String hashedPassActual = hashedpasswd.toString();


        %>

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
                            usuario.setNombre(user.getNombre());
                            usuario.setApellido(user.getApellido());
                            usuario.setCorreo(user.getCorreo());
                            usuario.setIdRol(user.getIdRol());

                            Boolean result = Boolean.FALSE;

                            if (user.getPassword().equals(hashedPassActual)) {
                                usuario.setPassword(passNueva);
                                result = servicioUsuario.editarPassword(usuario);

                            } else {
                                usuario.setPassword(null);
                            }

                            if (result) {
                                mensaje = "exito";
                                texto = "La contrasena ha sido editada exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "La contrasena no pudo ser editada.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/usuarios/detalleMiContrasena.jsp?mensaje=<%=mensaje%>&texto=<%=texto%>">
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
