<%-- 
    Document   : crearEmpresa
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="javax.swing.JOptionPane"%>
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
<%@page import="java.sql.Time"%>
<%@page import="com.banquetes.dominio.ServicioServicioEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Eliminar Usuario</title>
        
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Eliminar Usuario</h1>
                <%
                String mensaje = "";
                    String texto = "";
                            IServicioUsuario servicioUsuario = new ServicioUsuario();

                            String idUsuario = request.getParameter("id");

                            Boolean result = servicioUsuario.eliminarUsuario(idUsuario);
                            
                            if (result) {
                                mensaje = "exito";
                                texto = "El usuario ha sido eliminado exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "El usuario no pudo ser eliminado.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/usuarios/usuarioFiltros.jsp?mensaje=<%=mensaje%>&texto=<%=texto%>"/>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
