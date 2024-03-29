<%-- 
    Document   : otroSalon
    Created on : Sep 14, 2010, 4:40:28 PM
    Author     : maya
--%>
<%@page import="java.util.Date"%>
<%@page import="com.banquetes.dominio.Evento"%>
<%@page import="com.banquetes.servicios.impl.ServicioEvento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEvento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>

<%
            String nombre = "";
            HttpSession sesionOk = request.getSession();
            if (sesionOk.getAttribute("username") == null) {
%>

<meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/login/login.jsp?error=Coloca tus datos">

<%            } else {
                nombre = (String) sesionOk.getAttribute("username");
            }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../include/head.jsp"></jsp:include>
        <script type="text/javascript" src="../../jsp/js/jquery.validate.js"></script>
        <script type="text/javascript" src="selectCosto.js"></script>

        <script type="text/javascript">
            $(function() {
                $("button, input:submit, a", ".demo").button();

                $("a", ".demo").click(function() { return false; });
            });
        </script>
        <script type="text/javascript">
            function confirmar() {
                var answer = confirm("¿Está seguro que desea eliminar este salón?\nEsta operación eliminará los servicios contratados para el mismo.")
                if (answer){
                    document.form.action='eliminarEventoSala.jsp';
                    document.form.submit();
                }
                else{
                }
            }
        </script>
        <script type="text/javascript" src="mensajeExito.js"></script>
        <title>Eliminar salon de reserva</title>
    </head>
    <body>
        <%
                    String fechaInicioFiltro = request.getParameter("hiddenFechaInicio");
                    String fechaFinFiltro = request.getParameter("hiddenFechaFin");
                    String salonFiltro = request.getParameter("hiddenSalon");
                    String idEvento = request.getParameter("idEvento");

                    IServicioEvento servicioEvento = new ServicioEvento();
                    Evento evento = servicioEvento.getEvento(Integer.valueOf(idEvento));

                    IServicioSalon iServicioSalon = new ServicioSalon();
                    List<Salon> salones = iServicioSalon.listarSalonesEvento(Integer.valueOf(idEvento));

                    Double costoSalonCero = salones.get(0).getCosto();

                    IServicioMontaje iServicioMontaje = new ServicioMontaje();
                    List<Montaje> montajes = iServicioMontaje.listarMontajes(null, null);
        %>
        <div id="pageWrap">
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">
                <div id="disponibilidad" style="margin-left: 10px;">
                    <h1 id="letra1">Eliminar salon de la reserva # <%=idEvento%></h1>
                    <form action="" method="get" name="form">
                        <table>
                            <tr style="height: 40px">
                                <td style="font-size: 18px">Detalles sal&oacute;n</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr style="height: 35px">
                                <td>Salon: </td>
                                <td>
                                    <select name="salon" style="width: 200px; height: 25px" onchange="mostrarCosto(this.value)">
                                        <% for (Salon salon : salones) {%>
                                        <option value="<%= salon.getId()%>">
                                            <%= salon.getNombre()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td>Costo:</td>
                                <td>
                                    <div id="costo">
                                        <input type="text" name="nuevoCosto" value="<%=costoSalonCero%>" style="width: 195px; height: 23px" align="middle" />
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td>Montaje: (*)</td>
                                <td>
                                    <select name="montaje" style="width: 200px; height: 25px">
                                        <% for (Montaje montaje : montajes) {%>
                                        <option value="<%= montaje.getId()%>">
                                            <%= montaje.getTipoMontaje()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                                <td>
                                    <div id="boton" class="demo" style="margin-left: 10px; float: left">
                                        <input type="hidden" name="idEvento" value="<%= idEvento%>"/>
                                        <input type="hidden" name="hiddenFechaInicio" value="<%= fechaInicioFiltro%>"/>
                                        <input type="hidden" name="hiddenFechaFin" value="<%= fechaFinFiltro%>"/>
                                        <input type="hidden" name="hiddenSalon" value="<%= salonFiltro%>"/>
                                        <% if (request.getParameter("anulados") != null) {%>
                                        <input type="hidden" name="hiddenAnulados" value="<%= request.getParameter("hiddenAnulados")%>"/>
                                        <% }%>
                                        <input type="submit" value="Eliminar" style="width: 75px; height: 25px;" align="left" onclick="document.form.action='eliminarEventoSala.jsp';document.form.submit();"/>

                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
