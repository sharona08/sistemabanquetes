<%-- 
    Document   : verReservaID
    Created on : Sep 14, 2010, 2:24:45 PM
    Author     : maya
--%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="java.util.Date"%>
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
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Ver Reserva</title>
        <script type="text/javascript">
            $(function() {
                $("button, input:submit, a", ".demo").button();

                $("a", ".demo").click(function() { return false; });
            });
        </script>

        <script type="text/javascript" src="../../js/jquery.validate.js"></script>
        <style type="text/css">
            /*            label { width: 10em; float: left; }*/
            label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
            p { clear: both; }
            /*            .submit { margin-left: 12em; }*/
            em { font-weight: bold; padding-right: 1em; vertical-align: top; }
        </style>

        <script type="text/javascript" >
            $(document).ready(function(){
                $("#commentForm").validate();
            });
        </script>

        <script type="text/javascript">
            function redirect(url){
                window.location.href=url;
            }
        </script>
    </head>
    <body>
        <%
                    IServicioSalon iServicioSalon = new ServicioSalon();
                    List<Salon> salones = iServicioSalon.listarSalones();

                    Date today = new java.util.Date();
                    java.sql.Date fecha = new java.sql.Date(today.getTime());
        %>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Salón más vendido</h1>
                <h1 id="letra2">Introduzca los siguientes datos:</h1>
                <div style="margin-left: 10px; width: 30%">
                    <form action="repSalonMasVendido.jsp" method="get" class="cmxform" id="commentForm">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr style="height: 10px">
                                <td width="30%">&nbsp;</td>
                                <td width="50%">&nbsp;</td>
                                <td width="20%">&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Fecha Inicio </td>
                                <td>
                                    <input class="inputDate" id="inputDate" value="<%= fecha.toString()%>" name="fechaInicio"/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Fecha Fin </td>
                                <td>
                                    <input class="inputDate2" id="inputDate2" value="<%= fecha.toString()%>" name="fechaFin"/>
                                </td>
                                <td>
                                    <div id="boton" class="demo">
                                        <input type="submit" value="IR" style="width: 40px; height: 23px;" align="middle" onclick=""/>
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
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
