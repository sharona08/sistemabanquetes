<%-- 
    Document   : informacionAB
    Created on : Sep 14, 2010, 12:17:07 PM
    Author     : maya
--%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.dominio.ServicioServicioEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));

            IServicioReserva servicioReserva = new ServicioReserva();
            List<ServicioServicioEvento> serviciosEvento = servicioReserva.listarServicioEventos(idEvento, "OT");

            IServicioServicio servicioServicio = new ServicioServicio();

            IServicioSalon servicioSalon = new ServicioSalon();

%>

<div id="result">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr align="center" style="height: 30px; background-color: #919999; border-color: #556270; font-weight: bolder; color: white">
            <td width="20%">Nombre</td>
            <td width="20%">Costo Unitario</td>
            <td width="25%">Salon</td>
            <td width="20%">Cantidad</td>
        </tr>

        <%
                    for (ServicioServicioEvento s : serviciosEvento) {
                        Servicio servicio = servicioServicio.getServicio(s.getIdServicio());

        %>

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
        </tr>
        <% }%>
    </table>
</div>

