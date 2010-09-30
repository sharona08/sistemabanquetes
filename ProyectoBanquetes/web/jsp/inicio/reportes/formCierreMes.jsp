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
        <title>Ver Reserva</title>
        <script type="text/javascript">
            $(function() {
                $("button, input:submit, a", ".demo").button();

                $("a", ".demo").click(function() { return false; });
            });
        </script>

        <script type="text/javascript" src="../../jsp/js/jquery.validate.js"></script>
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
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Cierre del mes:</h1>
                <h1 id="letra2">Introduzca los siguientes datos:</h1>
                <div style="margin-left: 10px; width: 30%">
                    <form action="repCierreMes.jsp" method="get" class="cmxform" id="commentForm">
                        <table width="100%">
                            <tr style="height: 40px">
                                <td width="30%">Mes:</td>
                                <td width="55%">
                                    <select class="required" name="mes" style="width: 180px; height: 23px">
                                        <option selected value="1">Enero</option>
                                        <option value="2">Febrero</option>
                                        <option value="3">Marzo</option>
                                        <option value="4">Abril</option>
                                        <option value="5">Mayo</option>
                                        <option value="6">Junio</option>
                                        <option value="7">Julio</option>
                                        <option value="8">Agosto</option>
                                        <option value="9">Septiembre</option>
                                        <option value="10">Octubre</option>
                                        <option value="11">Noviembre</option>
                                        <option value="12">Diciembre</option>
                                    </select>
                                </td>
                                <td width="15%">&nbsp;</td>
                            </tr>
                            <tr style="height: 40px">
                                <td width="30%">A&ntilde;o</td>
                                <td width="55%">
                                    <input class="required" type="text" name="ano" style="width: 180px; height: 23px">
                                </td>
                                <td width="15%">
                                    <div id="boton" class="demo">
                                        <input class="submit" type="submit" value="IR" style="width: 40px; height: 23px;" onclick=""/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
