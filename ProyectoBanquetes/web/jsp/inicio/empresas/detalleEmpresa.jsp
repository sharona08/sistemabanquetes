<%-- 
    Document   : detalleEmpresa
    Created on : Sep 1, 2010, 3:36:56 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript" src="../../js/jquery.validate.js"></script>
<style type="text/css">
    /*            label { width: 10em; float: left; }*/
    label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
    p { clear: both; }
    .submit { margin-left: 12em; }
    em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script type="text/javascript">
    $(document).ready(function(){
        $("#commentForm").validate();
    });
</script>

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
<div id="detalle" style="margin-left: 20px; margin-right: 5px; padding-top: 15px" align="center">
    <form method="get" action="updateEmpresa.jsp" class="cmxform" id="commentForm">
        <table width="80%" border="0">
            <tr style="height: 40px">
                <td width="30%">Nombre:</td>
                <td width="50%">
                    <input class="required" value="<%= empresa.getNombre()%>" name="nombreEmpresa" onKeyUp="this.value=this.value.toUpperCase();" style="width: 305px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Telefono:</td>
                <td>
                    <input value="<%= telefono%>" name="telefono" onKeyUp="this.value=this.value.toUpperCase();" style="width: 305px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 110px;">
                <td>Direccion:</td>
                <td>
                    <% if (!direccion.equals("")) {%>
                    <textarea name="descripcion" rows="6" cols="" style="width: 308px"><%=direccion%></textarea>
                    <% } else {%>
                    <textarea name="descripcion" rows="6" cols="" style="width: 308px"><%=""%></textarea>
                    <% }%>
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Estado:</td>
                <td>
                    <select name="estados" style="width: 310px; height: 25px">
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
            <input type="submit" name="update" value="Guardar" style="width: 80px; height: 25px; margin-left: 310px; margin-right: 10px" onclick=""/>
        </div>
    </form>
    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDivEmpresa()" style="width: 80px; height: 25px;"/>
    </div>
    <div id="espacio"></div>
</div>