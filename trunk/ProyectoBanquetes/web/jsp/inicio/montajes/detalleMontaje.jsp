<%-- 
    Document   : detalleEmpresa
    Created on : Sep 1, 2010, 3:36:56 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
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
            Integer id = Integer.valueOf(request.getParameter("hiddenId"));

            IServicioMontaje servicioMontaje = new ServicioMontaje();
            Montaje montaje = servicioMontaje.getMontaje(id);

%>

<h1 id="letra2">INFORMACION MONTAJE # <% out.println(id);%></h1>
<div id="detalle" style="margin-left: 20px; margin-right: 20px; padding-top: 15px" align="center">
    <form method="get" action="updateMontaje.jsp" class="cmxform" id="commentForm">
        <table width="80%" border="0">
            <tr style="height: 40px">
                <td width="30%">Nombre:</td>
                <td width="50%">
                    <input class="required" value="<%= montaje.getTipoMontaje()%>" name="nombreMontaje" onKeyUp="this.value=this.value.toUpperCase();" style="width: 250px; height: 23px" align="middle" />
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
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDivMontaje()" style="width: 80px; height: 25px;"/>
    </div>
</div>