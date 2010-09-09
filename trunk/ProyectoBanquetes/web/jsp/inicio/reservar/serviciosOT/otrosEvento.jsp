<%-- 
    Document   : alimentos
    Created on : Sep 2, 2010, 4:46:38 PM
    Author     : maya
--%>

<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.dominio.ServicioServicioEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
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
    function includeDivAlimento()
    {
        document.getElementById("alimento").style.display="block";
    }

    function hideDivAlimento()
    {
        document.getElementById("alimento").style.display="none";
    }
</script>

<script type="text/javascript">
    function redirect(url){
        window.location.href=url;
    }
</script>

<%
            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));

            IServicioReserva servicioReserva = new ServicioReserva();
            List<ServicioServicioEvento> serviciosEvento = servicioReserva.listarServicioEventos(idEvento, "OT");

            IServicioServicio servicioServicio = new ServicioServicio();

            IServicioSalon servicioSalon = new ServicioSalon();

%>

<div id="result" style="margin-right: 10px">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr align="center" style="height: 30px; background-color: #919999; border-color: #556270; font-weight: bolder; color: white">
            <td width="20%">Nombre</td>
            <td width="20%">Costo Unitario</td>
            <td width="25%">Salon</td>
            <td width="20%">Cantidad</td>
            <td width="10%">Opcion</td>
            <td width="5%"></td>
        </tr>

        <%
                    for (ServicioServicioEvento s : serviciosEvento) {
                        Servicio servicio = servicioServicio.getServicio(s.getIdServicio());

        %>

        <form method="get" action="">
            <tr align="center">
                <td>
                    <%
                                            if (!s.getNuevoNombre().equals("")) {
                                                out.print(s.getNuevoNombre());
                                            } else {
                                                out.print(servicio.getNombre());
                                            }
                    %>
                    <input type="hidden" name="hiddenId" value="<%= s.getIdEvento()%>"/>
                </td>
                <td>
                    <%
                                            if (s.getNuevoCosto() != null) {
                                                out.print(s.getNuevoCosto());
                                            } else {
                                                out.print(servicio.getCostoUnitario());
                                            }
                    %>
                </td>
                <td>
                    <%=servicioSalon.getSalon(s.getIdSalon()).getNombre()%>
                </td>
                <td>
                    <%=s.getCantidad()%>
                </td>
                <td>
                    <div id="boton" class="demo">
                        <input type="hidden" name="idEvento" value="<%= idEvento%>">
                        <input type="hidden" name="idSalon" value="<%= s.getIdSalon()%>"/>
                        <input type="hidden" name="idServicio" value="<%= s.getIdServicio()%>"/>
                        <input type="submit" name="editar" value="Editar" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick="includeDivAlimento()"/>
                    </div>
                </td>
                <td>
                    <input type="image" src="../../remove_24.png" name="eliminar" value="" style="width: 20px; height: 20px; margin-top: 2px; margin-bottom: 2px;" onclick=""/>
                </td>
            </tr>
        </form>
        <% }%>
    </table>
</div>

<div id="espacio"></div>

<%
            if (request.getParameter("hiddenId") != null) {
%>

<div id="alimento" style="width: 40%; min-height: 300px; background-color: #dadada; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px">
    <jsp:include page="detalleOT.jsp"></jsp:include>
</div>

<% }%>
