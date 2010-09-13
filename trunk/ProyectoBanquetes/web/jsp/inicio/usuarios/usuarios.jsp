<%-- 
    Document   : contactos
    Created on : Sep 2, 2010, 1:46:38 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Usuario"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioRol"%>
<%@page import="com.banquetes.dominio.Rol"%>
<%@page import="com.banquetes.servicios.impl.ServicioRol"%>
<%@page import="com.banquetes.servicios.impl.ServicioUsuario"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioUsuario"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    function includeDivContacto()
    {
        document.getElementById("usuario").style.display="block";
    }

    function hideDivContacto()
    {
        document.getElementById("usuario").style.display="none";
    }
</script>

<script type="text/javascript">
    function redirect(url){
        window.location.href=url;
    }
</script>

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

            IServicioUsuario servicioUsuario = new ServicioUsuario();
            IServicioRol servicioRol = new ServicioRol();
            List<Usuario> usuarios;
            if (id == "") {
                usuarios = servicioUsuario.listarUsuariosTodos(null, nombre, apellido);
            } else {
                usuarios = servicioUsuario.listarUsuariosTodos(id, nombre, apellido);
            }
%>


<div id="resultEmpresas" style="margin-right: 10px">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr align="center" style="height: 30px; background-color: #919999; border-color: #556270; font-weight: bolder; color: white">
            <td width="10%">Usuario</td>
            <td width="20%">Nombre</td>
            <td width="20%">Apellido</td>
            <td width="20%">Correo</td>
            <td width="15%">Rol</td>
            <td width="10%">Opcion</td>
            <td width="5%"></td>
        </tr>
        <%
                    for (Usuario u : usuarios) {

        %>
        <tr align="center">
        <form method="get" action="">
            <td>
                <%= u.getUsername()%>
                <input type="hidden" name="hiddenId" value="<%= u.getUsername()%>"/>
            </td>
            <td align="center">
                <%= u.getNombre()%>
            </td>
            <td align="center">
                <%= u.getApellido()%>
            </td>
            <td align="center">
                <%= u.getCorreo()%>
            </td>
            <td>
                <%
                                        Rol rol = servicioRol.getRol(u.getIdRol());
                                        out.print(rol.getTipoRol());
                %>
            </td>
            <td>
                <div id="boton" class="demo">
                    <input type="hidden" name="hiddenId" value="<%= u.getUsername() %>">
                    <input type="hidden" name="id" value="<%= id%>">
                    <input type="hidden" name="nombre" value="<%= nombre%>">
                    <input type="hidden" name="apellido" value="<%= apellido%>">
                    <input type="hidden" name="idRol" value="<%= u.getIdRol()%>">
                    <input type="submit" name="editar" value="Editar" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="includeDivContacto()"/>
                </div>
            </td>
        </form>
        <form method="get" action="deleteUsuario.jsp">
            <input type="hidden" name="id" value="<%= u.getUsername()%>">
            <td>
                <input type="image" src="../../inicio/remove_24.png" name="eliminar" value="" style="width: 20px; height: 20px; margin-top: 2px; margin-bottom: 2px;" onclick=""/>
            </td>
        </form>
        </tr>
        <% }%>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center">
                <div id="boton" class="demo">
                    <input type="submit" name="crear" value="Nuevo" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="redirect('formCrearUsuario.jsp')"/>
                </div>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>

<div id="espacio"></div>

<%
            if (request.getParameter("hiddenId") != null) {
%>

<div id="usuario" style="width: 40%; min-height: 300px; background-color: #B9B9B9; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px">
    <jsp:include page="detalleUsuario.jsp"></jsp:include>
</div>

<% }%>

<div id="espacio"></div>