<%-- 
    Document   : updateEmpresa
    Created on : Sep 1, 2010, 4:36:29 PM
    Author     : maya
--%>
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

<%@page import="com.banquetes.dominio.Rol"%>
<%@page import="com.banquetes.servicios.impl.ServicioRol"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioRol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Editar rol</title>
        <%
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
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/roles/rolFiltros.jsp?id=<%= id%>&nombre=<%= nombre%>">
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">ROLES</h1>
                <%
                            IServicioRol servicioRol = new ServicioRol();
                            Rol rol = new Rol();
                            rol.setId(Integer.valueOf(hiddenId));
                            rol.setTipoRol(request.getParameter("nombreRol"));

                            Boolean result = servicioRol.editarRol(rol);

                            if (result) {
                %>
                <script type="text/javascript">
                    alert("Exito! el rol ha sido editado exitosamente.");
                </script>
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el rol no pudo ser editado.");
                </script>

                <% }%>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
