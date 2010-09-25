<%-- 
    Document   : createEmpresa
    Created on : Sep 2, 2010, 10:12:46 AM
    Author     : maya
--%>
<%@ page session="true" %>

<%
            String username = "";
            HttpSession sesionOk = request.getSession();
            if (sesionOk.getAttribute("username") == null) {
%>

<meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/login/login.jsp?error=Coloca tus datos">

<%            } else {
                username = (String) sesionOk.getAttribute("username");
            }
%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>

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
            .submit { margin-left: 12em; }
            em { font-weight: bold; padding-right: 1em; vertical-align: top; }
        </style>

        <script>
            $(document).ready(function(){
                $("#commentForm").validate();
            });
        </script>


        <title>Crear Salon</title>
    </head>

    <%
                IServicioSalon servicioSalon = new ServicioSalon();
                          //  Salon salon = new Salon();
                List<Salon> salones = servicioSalon.listarSalonesHabilitados(null, null);

    %>

    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">CREAR SALON</h1>
                <div style="height: 10px"></div>
                <div style="padding-left: 20px; background-color: #dadada; width: 30%; min-height: 280px">
                    <div id="espacio"></div>

                    <form method="get" action="crearSalon.jsp" class="cmxform" id="commentForm">
                        <table width="100%" border="0">
                            <tr style="height: 40px">
                                <td width="30%">Nombre: (*)</td>
                                <td width="50%">
                                    <input class="required" value="" name="nombre" onKeyUp="this.value=this.value.toUpperCase();" style="width: 200px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 40px">
                                <td>Costo: (*)</td>
                                <td>
                                    <input class="required" value="" name="costo" onKeyUp="this.value=this.value.toUpperCase();" style="width: 200px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 40px">
                                <td width="10%">Salon: </td>
                                <td width="30%">
                                    <select name="salon" style="width: 205px; height: 25px">
                                        <option selected>--</option>
                                        <% for (Salon salon : salones) {%>
                                        <option>
                                            <%= salon.getNombre()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>(*) Campos obligatorios</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
                            <input class="submit" type="submit" name="create" value="Guardar" style="width: 65px; margin-left: 270px; margin-right: 10px" onclick=""/>
                        </div>
                    </form>
                </div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
