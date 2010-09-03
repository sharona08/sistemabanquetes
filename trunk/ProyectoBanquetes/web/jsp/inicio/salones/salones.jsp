<%-- 
    Document   : contactos
    Created on : Sep 2, 2010, 1:46:38 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    function includeDivSalon()
    {
        document.getElementById("salon").style.display="block";
    }

    function hideDivSalon()
    {
        document.getElementById("salon").style.display="none";
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

            IServicioSalon servicioSalon = new ServicioSalon();
            List<Salon> salones;
            if (request.getParameter("inhabilitados") != null) {
                if (id == "") {
                    salones = servicioSalon.listarSalonesTodos(null, nombre);
                } else {
                    salones = servicioSalon.listarSalonesTodos(Integer.valueOf(id), nombre);
                }
            } else {
                if (id == "") {
                    salones = servicioSalon.listarSalonesHabilitados(null, nombre);
                } else {
                    salones = servicioSalon.listarSalonesHabilitados(Integer.valueOf(id), nombre);
                }
            }
%>


<div id="resultEmpresas" style="margin-right: 10px">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr align="center" style="height: 30px; background-color: #919999; border-color: #556270; font-weight: bolder; color: white">
            <td width="5%">ID</td>
            <td width="15%">Nombre</td>
            <td width="30%">Costo</td>
            <td width="25%">Salon</td>
            <td width="10%">Opcion</td>
        </tr>
        <%
                    for (Salon s : salones) {

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
                    <%=s.getCosto()%>
                </td>
                <td>
                    <%
                                            Salon salon = servicioSalon.getSalon(s.getId());
                                            out.print(salon.getNombre());
                    %>
                </td>
                <td>
                    <div id="boton" class="demo">
                        <input type="hidden" name="id" value="<%= id%>">
                        <input type="hidden" name="nombre" value="<%= nombre%>">
                        <% if (request.getParameter("inhabilitados") != null) {%>
                        <input type="hidden" name="inhabilitados" value="<%= request.getParameter("inhabilitados")%>">
                        <%}%>
                        <% if (s.getIdSalon() != null) {%>
                        <input type="hidden" name="idSalonFK" value="<%= s.getIdSalon()%>">
                        <% } else {%>
                        <input type="hidden" name="idSalonFK" value="">
                        <% }%>
                        <input type="submit" name="editar" value="Editar" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="includeDivSalon()"/>
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
                    <input type="submit" name="crear" value="Nuevo" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="redirect('formCrearSalon.jsp')"/>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="espacio"></div>

<%
            if (request.getParameter("hiddenId") != null) {
%>

<div id="salon" style="width: 40%; min-height: 300px; background-color: #B9B9B9; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px">
    <jsp:include page="detalleSalon.jsp"></jsp:include>
</div>

<% }%>

<div id="espacio"></div>