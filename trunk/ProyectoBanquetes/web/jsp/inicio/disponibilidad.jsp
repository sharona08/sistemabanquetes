<%-- 
    Document   : disponibilidad
    Created on : Aug 13, 2010, 10:45:59 AM
    Author     : maya
--%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="java.util.Date"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Home page</title>
        <jsp:include page="../include/head.jsp"></jsp:include>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>

    <body>
        <div id="pageWrap">
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">

                <% IServicioSalon iServicioSalon = new ServicioSalon();%>
                <% List<Salon> salones = iServicioSalon.listarSalones();%>
                <% Date today = new java.util.Date();%>
                <% java.sql.Date fecha = new java.sql.Date(today.getTime());%>

                <script type="text/javascript">
                    function includefile()
                    {
                        document.getElementById("resultado").style.display="block";
                    }

                    function hidedisplay()
                    {
                        document.getElementById("resultado").style.display="none";
                    }
                </script>

                <div id="disponibilidad" style="margin-left: 10px">

                    <h1 id="letra1">Disponibilidad de salones</h1>

                    <%
                                String hiddenFechaInicio = request.getParameter("fechaInicio");
                                if (hiddenFechaInicio == null) {
                                    hiddenFechaInicio = fecha.toString();

                                }
                                String hiddenFechaFin = request.getParameter("fechaFin");
                                if (hiddenFechaFin == null) {
                                    hiddenFechaFin = fecha.toString();
                                }
                                String hiddenSalon = request.getParameter("salon");
                                if (hiddenSalon == null) {
                                    hiddenSalon = salones.get(0).getNombre();
                                }

                                Boolean check = Boolean.FALSE;
                                if (request.getParameter("anulados") != null) {
                                    check = Boolean.TRUE;
                                } else {
                                    check = Boolean.FALSE;
                                }
                    %>

                    <form name="form" method="get" action="">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr style="height: 10px">
                                <td width="10%">&nbsp;</td>
                                <td width="15%">&nbsp;</td>
                                <td width="75%">&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Mostrar Anulados </td>
                                <td>
                                    <% if (check) {%>
                                    <input type="checkbox" name="anulados" value="ON" checked/>
                                    <% } else {%>
                                    <input type="checkbox" name="anulados" value="ON" />
                                    <% }%>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Fecha Inicio </td>
                                <td>
                                    <input class="inputDate" id="inputDate" value="<%= hiddenFechaInicio%>" name="fechaInicio" onKeyUp="this.value=this.value.toUpperCase();"/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Fecha Fin </td>
                                <td>
                                    <input class="inputDate2" id="inputDate2" value="<%= hiddenFechaFin%>" name="fechaFin"/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Salon</td>
                                <td>
                                    <select name="salon" style="width: 160px; height: 25px">
                                        <% for (Salon salon : salones) {%>
                                        <% if (salon.getNombre().equals(hiddenSalon)) {%>
                                        <option selected>
                                            <%= salon.getNombre()%>
                                            <% } else {%>
                                        <option>
                                            <%= salon.getNombre()%>
                                        </option>
                                        <% }%>
                                        <% }%>
                                    </select>
                                </td>
                                <td>
                                    <div id="boton" class="demo">
                                        <input type="submit" name="ok" value="Ok" style="width: 35px; height: 25px;" align="middle" onclick="includefile()"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </form>
                </div>

                <div id="resultado" style="margin-left: 10px">
                    <jsp:include page="../inicio/result.jsp">
                        <jsp:param name="fechaInicio" value="<%= hiddenFechaInicio%>"></jsp:param>
                        <jsp:param name="fechaFin" value="<%= hiddenFechaFin%>"></jsp:param>
                        <jsp:param name="salon" value="<%= hiddenSalon%>"></jsp:param>
                    </jsp:include>
                </div>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>