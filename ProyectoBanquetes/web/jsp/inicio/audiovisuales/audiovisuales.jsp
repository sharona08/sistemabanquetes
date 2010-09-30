<%-- 
    Document   : alimentos
    Created on : Sep 2, 2010, 4:46:38 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    function includeDivAudiovisual()
    {
        document.getElementById("audiovisual").style.display="block";
    }

    function hideDivAudiovisual()
    {
        document.getElementById("audiovisual").style.display="none";
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
            IServicioServicio servicioServicio = new ServicioServicio();
            List<Servicio> servicios;
            
            if (request.getParameter("inhabilitados") != null) {
                if (id == "") {
                    servicios = servicioServicio.listarServiciosTodos(null, nombre, "AU");
                } else {
                    servicios = servicioServicio.listarServiciosTodos(Integer.valueOf(id), nombre, "AU");
                }
            } else {
                if (id == "") {
                    servicios = servicioServicio.listarServiciosHabilitados(null, nombre, "AU");
                } else {
                    servicios = servicioServicio.listarServiciosHabilitados(Integer.valueOf(id), nombre, "AU");
                }
            }
%>


<div id="result" style="margin-right: 10px">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr align="center" style="height: 30px; background-color: #919999; border-color: #556270; font-weight: bolder; color: white">
            <td width="5%">ID</td>
            <td width="20%">Nombre</td>
            <td width="40%">Descripcion</td>
            <td width="12%">Costo Unitario</td>
            <td width="8%">Opcion</td>
        </tr>
        <%
                    for (Servicio s : servicios) {

        %>
        <form method="get" action="">
            <% if (s.getHabilitado()) {%>
            <tr align="center">
                <% } else {%>
            <tr align="center" bgcolor="#FF8080">
                <% }%>
                <td>
                    <%= s.getId()%>
                    <input type="hidden" name="hiddenId" value="<%=s.getId()%>"/>
                </td>
                <td align="center">
                    <%=s.getNombre()%>
                </td>
                <td>
                    <%
                                            if (s.getDescripcion() == null) {
                                                out.print("--");
                                            } else {
                                                out.print(s.getDescripcion());
                                            }
                    %>
                </td>
                <td>
                    <%= s.getCostoUnitario()%>
                </td>
                <td>
                    <div id="boton" class="demo">
                        <input type="hidden" name="id" value="<%= id%>">
                        <input type="hidden" name="nombre" value="<%= nombre%>">
                        <% if (request.getParameter("inhabilitados") != null) {%>
                        <input type="hidden" name="inhabilitados" value="<%= request.getParameter("inhabilitados")%>">
                        <%}%>
                        <input type="submit" name="editar" value="Editar" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="includeDivAudiovisual()"/>
                    </div>
                </td>
            </tr>
        </form>
        <% }%>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center">
                <div id="boton" class="demo">
                    <input type="submit" name="crear" value="Nuevo" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="redirect('formCrearAudiovisual.jsp')"/>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="espacio"></div>

<%
            if (request.getParameter("hiddenId") != null) {
%>

<div id="audiovisual" style="width: 40%; min-height: 300px; background-color: #dadada; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px">
    <jsp:include page="detalleAudiovisual.jsp"></jsp:include>
</div>

<% }%>

<div id="espacio"></div>