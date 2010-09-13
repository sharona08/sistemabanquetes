<%-- 
    Document   : detalleEmpresa
    Created on : Sep 1, 2010, 3:36:56 PM
    Author     : maya
--%>

<%@page import="java.util.List"%>
<%@page import="com.banquetes.dominio.Usuario"%>
<%@page import="com.banquetes.dominio.Rol"%>
<%@page import="com.banquetes.dominio.Rol"%>
<%@page import="com.banquetes.servicios.impl.ServicioRol"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioRol"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioUsuario"%>
<%@page import="com.banquetes.servicios.impl.ServicioUsuario"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            IServicioUsuario servicioUsuario = new ServicioUsuario();
            String id = request.getParameter("hiddenId");
            Usuario usuario = servicioUsuario.getUsuario(id);

            IServicioRol servicioRol = new ServicioRol();
            List<Rol> roles = servicioRol.listarRoles(null, null);

%>

<h1 id="letra2">INFORMACION USUARIO: <% out.println(id);%></h1>
<div id="detalle" style="margin-left: 20px; margin-right: 20px; padding-top: 15px" align="center">
    <form method="get" action="updateUsuario.jsp">
        <table width="80%" border="0">
            <tr style="height: 40px">
                <td width="30%">Nombre:</td>
                <td width="50%">
                    <input value="<%= usuario.getNombre()%>" name="nombreUsuario" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Apellido:</td>
                <td>
                    <input value="<%= usuario.getApellido()%>" name="apellidoUsuario" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Correo:</td>
                <td>
                    <input value="<%= usuario.getCorreo()%>" name="correo" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Rol:</td>
                <td>
                    <%
                                Rol rol = servicioRol.getRol(Integer.valueOf(request.getParameter("idRol")));
                    %>
                    <select name="rol" style="width: 200px; height: 23px">
                        <%
                                    for (Rol r : roles) {
                                        if (r.getId().equals(rol.getId())) {
                        %>
                        <option selected value="<%= r.getId()%>"><%= r.getTipoRol()%></option>
                        <%                                    } else {
                        %>
                        <option value="<%= r.getId()%>"><%= r.getTipoRol()%></option>
                        <%                                    
                                    }
                                    }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <input type="hidden" name="hiddenId" value="<%= id%>"/>
        <input type="hidden" name="id" value="<%= request.getParameter("id")%>"/>
        <input type="hidden" name="nombre" value="<%= request.getParameter("nombre")%>"/>
        <input type="hidden" name="apellido" value="<%= request.getParameter("apellido")%>"/>
        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
            <input type="submit" name="update" value="Guardar" style="width: 65px; margin-left: 270px; margin-right: 10px" onclick=""/>
        </div>
    </form>
    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDivContacto()" style="width: 65px;"/>
    </div>
    <div id="espacio"></div>
</div>