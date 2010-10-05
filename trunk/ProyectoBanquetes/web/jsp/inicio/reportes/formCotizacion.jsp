<%-- 
    Document   : verReservaID
    Created on : Sep 14, 2010, 2:24:45 PM
    Author     : maya
--%>
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
        <title>Cotizacion</title>
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
        <script type="text/javascript" src="showHideTasaCambio.js"></script>
        <script type="text/javascript" src="showHideTasaCambioLabel.js"></script>
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Cotizacion:</h1>
                <h1 id="letra2">Introduzca Numero de Reserva:</h1>
                <div style="margin-left: 10px; width: 35%">
                    <form action="repCotizacion.jsp" method="get" class="cmxform" id="commentForm">
                        <table width="95%" border="0">
                            <tr style="height: 40px">
                                <td width="5%">No Reserva:</td>
                                <td width="53%">
                                    <input class="required" type="text" name="idEvento" style="width: 185px; height: 23px">
                                </td>
                                <td width="37%">&nbsp;</td>
                            </tr>
                            <tr style="height: 40px">
                                <td width="45%">Moneda:</td>
                                <td width="40%">
                                    <select name="moneda" style="width: 190px; height: 25px" onchange="showHideTasa(this.value); showHideTasaLabel(this.value)">
                                        <option selected value="B">Bolívares</option>
                                        <option value="D">Dólares</option>
                                    </select>
                                </td>
                                <td>
                                    <div id="boton" class="demo">
                                        <input class="submit" type="submit" value="IR" style="width: 40px; height: 23px;" onclick=""/>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 40px; ">
                                <td>
                                    <div id="tasaCambioLabel">
                                        <label style="display: none">Tasa Cambio:</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="tasaCambio">
                                        <input type="text" name="tasaCambio" value="1" style="width: 185px; height: 25px; display: none"/>
                                    </div>
                                </td>
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
