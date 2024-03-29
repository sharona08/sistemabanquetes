<%-- 
    Document   : detalleSalon
    Created on : Sep 1, 2010, 3:36:56 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
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
            IServicioSalon servicioSalon = new ServicioSalon();
            Salon salon = servicioSalon.getSalon(id);

%>

<h1 id="letra2">INFORMACION SALON # <% out.println(id);%></h1>
<div id="detalle" style="margin-left: 20px; margin-right: 20px; padding-top: 15px" align="center">
    <form method="get" action="updateSalon.jsp" class="cmxform" id="commentForm">
        <table width="80%" border="0">
            <tr style="height: 40px">
                <td width="30%">Nombre:</td>
                <td width="50%">
                    <input class="required" value="<%= salon.getNombre()%>" name="nombreSalon" onKeyUp="this.value=this.value.toUpperCase();" style="width: 250px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Costo:</td>
                <td>
                    <input class="required" value="<%= salon.getCosto()%>" name="costo" onKeyUp="this.value=this.value.toUpperCase();" style="width: 250px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Estado:</td>
                <td>
                    <select name="estados" style="width: 255px; height: 25px">
                        <% if (salon.getHabilitado()) {%>
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
                <td>Salon:</td>
                <td>
                    <%
                                Salon salonFK = new Salon();
                                String salonfk = "";
                                if (!request.getParameter("idSalonFK").equals("")) {
                                    salonFK = servicioSalon.getSalon(Integer.valueOf(request.getParameter("idSalonFK")));
                                    salonfk = salonFK.getNombre();
                                } else {
                                    salonfk = "";
                                }
                    %>
                    <input value="<%= salonfk%>" name="salonFK" onKeyUp="this.value=this.value.toUpperCase();" style="width: 250px; height: 23px" align="middle" disabled />
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
        <input type="hidden" name="idSalonFK" value="<%= request.getParameter("idSalonFK")%>"/>
        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
            <input type="submit" name="update" value="Guardar" style="width: 80px; height: 25px; margin-left: 270px; margin-right: 10px" onclick=""/>
        </div>
    </form>
    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDivSalon()" style="width: 80px; height: 25px;"/>
    </div>
</div>