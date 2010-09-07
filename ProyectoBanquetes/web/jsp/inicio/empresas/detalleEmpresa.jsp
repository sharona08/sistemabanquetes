<%-- 
    Document   : detalleEmpresa
    Created on : Sep 1, 2010, 3:36:56 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            String rif = request.getParameter("hiddenRif");
            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();
            Empresa empresa = servicioEmpresa.getEmpresa(rif);

            String telefono = "";
            if (empresa.getTelefono() == null) {
                telefono = "--";
            } else {
                telefono = empresa.getTelefono();
            }
            String direccion = "";
            if (empresa.getDireccion() == null) {
                direccion = "--";
            } else {
                direccion = empresa.getDireccion();
            }
%>

<h1 id="letra2">INFORMACION EMPRESA RIF: <% out.println(rif);%></h1>
<div id="detalle" style="margin-left: 20px; margin-right: 20px; padding-top: 15px" align="center">
    <form method="get" action="updateEmpresa.jsp">
        <table width="70%" border="0">
            <tr style="height: 40px">
                <td width="20%">Nombre:</td>
                <td width="50%">
                    <input value="<%= empresa.getNombre()%>" name="nombreEmpresa" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Telefono:</td>
                <td>
                    <input value="<%= telefono%>" name="telefono" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 70px;">
                <td>Direccion:</td>
                <td>
                    <% if (!direccion.equals("")) {%>
                    <textarea name="descripcion" rows="4" cols="" style="width: 198px"><%=direccion%></textarea>
                    <% } else {%>
                    <textarea name="descripcion" rows="4" cols="" style="width: 198px"><%=""%></textarea>
                    <% }%>
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Estado:</td>
                <td>
                    <select name="estados" style="width: 200px; height: 25px">
                        <% if (empresa.getHabilitado()) {%>
                        <option selected>HABILITADO</option>
                        <option>INHABILITADO</option>
                        <% } else {%>
                        <option>HABILITADO</option>
                        <option selected>INHABILITADO</option>
                        <% }%>
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
        <input type="hidden" name="hiddenRif" value="<%= rif%>"/>
        <input type="hidden" name="rif" value="<%= request.getParameter("rif")%>"/>
        <input type="hidden" name="nombre" value="<%= request.getParameter("nombre")%>"/>
        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
            <input type="submit" name="update" value="Guardar" style="width: 65px; margin-left: 270px; margin-right: 10px" onclick=""/>
        </div>
    </form>
    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDivEmpresa()" style="width: 65px;"/>
    </div>
    <div id="espacio"></div>
</div>