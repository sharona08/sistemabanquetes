<%-- 
    Document   : contactos
    Created on : Sep 2, 2010, 1:46:38 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    function includeDivMontaje()
    {
        document.getElementById("montaje").style.display="block";
    }

    function hideDivMontaje()
    {
        document.getElementById("montaje").style.display="none";
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

            IServicioMontaje servicioMontaje = new ServicioMontaje();
            List<Montaje> montajes;
            if (id == "") {
                montajes = servicioMontaje.listarMontajes(null, nombre);
            } else {
                montajes = servicioMontaje.listarMontajes(Integer.valueOf(id), nombre);
            }

%>


<div id="resultEmpresas" style="margin-right: 10px">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr align="center" style="height: 30px; background-color: #919999; border-color: #556270; font-weight: bolder; color: white">
            <td width="5%">ID</td>
            <td width="80%">Nombre</td>
            <td width="15%">Opcion</td>
        </tr>
        <%
                    for (Montaje m : montajes) {

        %>
        <form method="get" action="">
            <tr align="center">
                <td>
                    <%= m.getId()%>
                    <input type="hidden" name="hiddenId" value="<%=m.getId()%>"/>
                </td>
                <td align="center">
                    <%=m.getTipoMontaje()%>
                </td>
                <td>
                    <div id="boton" class="demo">
                        <input type="hidden" name="id" value="<%= id%>">
                        <input type="hidden" name="nombre" value="<%= nombre%>">
                        <input type="submit" name="editar" value="Editar" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="includeDivMontaje()"/>
                    </div>
                </td>
            </tr>
        </form>
        <% }%>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center">
                <div id="boton" class="demo">
                    <input type="submit" name="crear" value="Nuevo" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="redirect('formCrearMontaje.jsp')"/>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="espacio"></div>

<%
            if (request.getParameter("hiddenId") != null) {
%>

<div id="montaje" style="width: 40%; min-height: 200px; background-color: #B9B9B9; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px">
    <jsp:include page="detalleMontaje.jsp"></jsp:include>
</div>

<% }%>

<div id="espacio"></div>