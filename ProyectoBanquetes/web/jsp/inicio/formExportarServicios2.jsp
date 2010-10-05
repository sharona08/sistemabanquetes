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
        
        <script type="text/javascript" src="mensajeExito.js"></script>
        <title>Exportar Servicios al Salon:</title>
    </head>
    <body>
        <%
                    Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));
                    Integer idSalon = Integer.valueOf(request.getParameter("salon"));

                    IServicioSalon servicioSalon = new ServicioSalon();

                    List<Salon> salonesReserva = servicioSalon.listarSalonesReservaConfirm(idEvento, idSalon);
        %>
        <div id="pageWrap">

            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">
                <div id="disponibilidad" style="margin-left: 10px;">
                    <h1 id="letra1">Exportar Servicios del Evento #<%=idEvento%></h1>
                    <h1 id="letra2">Seleccione Salon</h1>
                    <form action="" method="get" name="form">
                        <table width="31%">
                            <tr style="height: 35px">
                                <td width="13%">Salon: </td>
                                <td width="15%">
                                    <select name="seleccion" style="width: 200px; height: 25px" onchange="mostrarCosto(this.value)">
                                        <% for (Salon salon : salonesReserva) {%>
                                        <option value="<%= salon.getId()%>">
                                            <%= salon.getNombre()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                                <td width="3%">
                                    <div id="boton" class="demo" style="margin-left: 10px; float: left">
                                        <input type="hidden" name="idEvento" value="<%= idEvento%>"/>
                                        <input type="hidden" name="salon" value="<%= idSalon%>"/>
                                        <input type="submit" value="Exportar" style="width: 75px; height: 25px;" align="left" onclick="document.form.action='eliminarSalonExpServicio2.jsp';document.form.submit();"/>

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
