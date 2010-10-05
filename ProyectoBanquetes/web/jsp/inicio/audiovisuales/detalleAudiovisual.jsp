<%-- 
    Document   : detalleAlimento
    Created on : Sep 1, 2010, 4:56:56 PM
    Author     : maya
--%>

<%@page import="java.util.List"%>
<%@page import="com.banquetes.dominio.Departamento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>
<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
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
            IServicioDepartamento servicioDepartamento = new ServicioDepartamento();

            Integer id = Integer.valueOf(request.getParameter("hiddenId"));

            IServicioServicio servicioServicio = new ServicioServicio();
            Servicio servicio = servicioServicio.getServicio(id);

            String descripcion = "";
            if (servicio.getDescripcion() == null) {
                descripcion = "";
            } else {
                descripcion = servicio.getDescripcion();
            }
%>

<h1 id="letra2">INFORMACION AUDIOVISUAL # <% out.println(id);%></h1>
<div id="detalle" style="margin-left: 20px; margin-right: 20px; padding-top: 15px" align="center">
    <form method="get" action="updateAudiovisual.jsp"  class="cmxform" id="commentForm">
        <table width="90%" border="0">
            <tr style="height: 40px">
                <td width="40%">Nombre:</td>
                <td width="50%">
                    <input class="required" value="<%= servicio.getNombre()%>" name="nombreServicio" onKeyUp="this.value=this.value.toUpperCase();" style="width: 275px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 100px;">
                <td>Descripcion:</td>
                <td>
                    <% if (!descripcion.equals("")) {%>
                    <textarea name="descripcion" rows="5" cols="" style="width: 278px"><%=descripcion%></textarea>
                    <% } else {%>
                    <textarea name="descripcion" rows="5" cols="" style="width: 278px"><%=""%></textarea>
                    <% }%>
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Costo Unitario:</td>
                <td>
                    <input value="<%= servicio.getCostoUnitario()%>" name="costo" onKeyUp="this.value=this.value.toUpperCase();" style="width: 275px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Estado:</td>
                <td>
                    <select name="estados" style="width: 280px; height: 25px">
                        <% if (servicio.getHabilitado()) {%>
                        <option selected>HABILITADO</option>
                        <option>INHABILITADO</option>
                        <% } else {%>
                        <option>HABILITADO</option>
                        <option selected>INHABILITADO</option>
                        <% }%>
                    </select>
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Departamento: </td>
                <td>
                    <%
                                Departamento departamento = servicioDepartamento.getDepartamento(servicio.getIdDepartamento());
                                List<Departamento> departamentos = servicioDepartamento.listarDepartamentos(null, null);
                    %>

                    <select name="departamento" style="width: 280px; height: 25px">
                        <% for (Departamento d : departamentos) {%>
                        <%
                             if (d.getId().equals(departamento.getId())) {
                        %>
                        <option selected>
                            <%= d.getNombre()%>
                        </option>
                        <% } else {%>
                        <option>
                            <%= d.getNombre()%>
                        </option>
                        <% }%>
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
        <input type="hidden" name="hiddenId" value="<%= id%>"/>
        <input type="hidden" name="id" value="<%= request.getParameter("id")%>"/>
        <input type="hidden" name="nombre" value="<%= request.getParameter("nombre")%>"/>
        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
            <input type="submit" name="update" value="Guardar" style="width: 80px; height: 25px; margin-left: 270px; margin-right: 10px" onclick=""/>
        </div>
    </form>
    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDivAlimento()" style="width: 80px; height: 25px;"/>
    </div>
    <div id="espacio"></div>
</div>