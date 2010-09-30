<%-- 
    Document   : contactos
    Created on : Sep 2, 2010, 1:46:38 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Departamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    function includeDivDepartamento()
    {
        document.getElementById("departamento").style.display="block";
    }

    function hideDivDepartamento()
    {
        document.getElementById("departamento").style.display="none";
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

            IServicioDepartamento servicioDepartamento = new ServicioDepartamento();
            List<Departamento> departamentos;
            if (id == "") {
                departamentos = servicioDepartamento.listarDepartamentos(null, nombre);
            } else {
                departamentos = servicioDepartamento.listarDepartamentos(Integer.valueOf(id), nombre);
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
                    for (Departamento d : departamentos) {

        %>
        <form method="get" action="">
            <tr align="center">
                <td>
                    <%= d.getId()%>
                    <input type="hidden" name="hiddenId" value="<%=d.getId()%>"/>
                </td>
                <td align="center">
                    <%=d.getNombre()%>
                </td>
                <td>
                    <div id="boton" class="demo">
                        <input type="hidden" name="id" value="<%= id%>">
                        <input type="hidden" name="nombre" value="<%= nombre%>">
                        <input type="submit" name="editar" value="Editar" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="includeDivDepartamento()"/>
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
                    <input type="submit" name="crear" value="Nuevo" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="redirect('formCrearDepartamento.jsp')"/>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="espacio"></div>

<%
            if (request.getParameter("hiddenId") != null) {
%>

<div id="departamento" style="width: 40%; min-height: 200px; background-color: #dadada; padding-left: 20px; padding-top: 20px; padding-right: 10px; padding-bottom: 20px">
    <jsp:include page="detalleDepartamento.jsp"></jsp:include>
</div>

<% }%>

<div id="espacio"></div>