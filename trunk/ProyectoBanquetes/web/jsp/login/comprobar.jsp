<%-- 
    Document   : comprobar
    Created on : Sep 10, 2010, 11:26:31 AM
    Author     : maya
--%>

<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioUsuario"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioUsuario"%>
<%@page import="com.banquetes.dominio.Usuario"%>
<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.security.MessageDigest"%>
<%@page session="true" %>

<%
            IServicioUsuario servicioUsuario = new ServicioUsuario();
            List<Usuario> users = servicioUsuario.listarUsuarios();

            String nombre = "";
            String password = "";
            if (request.getParameter("username") != null) {
                nombre = request.getParameter("username");
            }
            if (request.getParameter("password") != null) {
                password = request.getParameter("password");
            }

            MessageDigest alg = MessageDigest.getInstance("MD5");
            alg.reset();
            alg.update(password.getBytes());
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
            String newPassword = hashedpasswd.toString();

            //  int cont = 0;
            Boolean flag = Boolean.FALSE;
            for (Usuario user : users) {
                // cont++;
                if (nombre.equals(user.getUsername()) && newPassword.equals(user.getPassword())) {
                    HttpSession sesionOk = request.getSession();
                    sesionOk.setAttribute("username", nombre);
                    flag = Boolean.TRUE;

%>

<meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp">
<%
                }
            }

            if (!flag) {
%>

<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Ha ocurrido un error...usuario no registrado"/>
</jsp:forward>

<%                  }

%>