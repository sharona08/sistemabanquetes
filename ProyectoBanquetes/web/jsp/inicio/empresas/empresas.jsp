<%-- 
    Document   : empresas
    Created on : Sep 1, 2010, 2:14:38 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    function includeDivEmpresa()
    {
        document.getElementById("empresa").style.display="block";
    }

    function hideDivEmpresa()
    {
        document.getElementById("empresa").style.display="none";
    }
</script>

<%
            String rif = "";
            if (request.getParameter("rif") == null) {
                rif = "";
            } else {
                rif = request.getParameter("rif");
            }

            String nombre = "";
            if (request.getParameter("nombre") == null) {
                nombre = "";
            } else {
                nombre = request.getParameter("nombre");
            }
            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();
            List<Empresa> empresas = servicioEmpresa.listarEmpresasTodas(rif, nombre);
%>


<div id="resultEmpresas" style="margin-right: 10px">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr align="center" style="height: 30px; background-color: #919999; border-color: #556270; font-weight: bolder; color: white">
            <td width="10%">RIF</td>
            <td width="10%">Nombre</td>
            <td width="10%">Telefono</td>
            <td width="60%">Direccion</td>
            <td width="10%">Opcion</td>
        </tr>
        <%
                    for (Empresa e : empresas) {

        %>
        <form method="get" action="">
            <tr align="center">
                <td>
                    <%=e.getRif()%>
                    <input type="hidden" name="hiddenRif" value="<%=e.getRif()%>"/>
                </td>
                <td>
                    <%=e.getNombre()%>
                </td>
                <td>
                    <%
                                            if (e.getTelefono() == null) {
                                                out.print("--");
                                            } else {
                                                out.print(e.getTelefono());
                                            }
                    %>
                </td>
                <td>
                    <%
                                            if (e.getDireccion() == null) {
                                                out.print("--");
                                            } else {
                                                out.print(e.getDireccion());
                                            }
                    %>
                </td>
                <td>
                    <div id="boton" class="demo">
                        <input type="hidden" name="rif" value="<%= rif%>">
                        <input type="hidden" name="nombre" value="<%= nombre%>">
                        <% if (request.getParameter("inhabilitados") != null) {%>
                        <input type="hidden" name="inhabilitados" value="<%= request.getParameter("inhabilitados")%>">
                        <%}%>
                        <input type="submit" name="editar" value="Editar" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="includeDivEmpresa()"/>
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
                    <input type="submit" name="crear" value="Crear Empresa" style="width: 95px; margin-top: 1px; margin-bottom: 1px;" onclick=""/>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="espacio"></div>

<%
            if (request.getParameter("hiddenRif") != null) {
%>

<div id="empresa" style="width: 40%; min-height: 300px; background-color: #B9B9B9; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px">
    <jsp:include page="detalleEmpresa.jsp"></jsp:include>
</div>

<% }%>

<div id="espacio"></div>