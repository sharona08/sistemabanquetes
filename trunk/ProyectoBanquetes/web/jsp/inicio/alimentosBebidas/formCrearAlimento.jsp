<%-- 
    Document   : formCrearAlimento
    Created on : Sep 2, 2010, 5:29:46 PM
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
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>
<%@page import="com.banquetes.dominio.Departamento"%>
<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
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
            label { width: 10em; float: left; }
            label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
            p { clear: both; }
            .submit { margin-left: 12em; }
            em { font-weight: bold; padding-right: 1em; vertical-align: top; }
        </style>

        <script type="text/javascript" >
            $(document).ready(function(){
                $("#commentForm").validate();
            });
        </script>


        <title>Crear Servicio</title>
    </head>

    <%
                IServicioDepartamento servicioDepartamento = new ServicioDepartamento();
                List<Departamento> departamentos = servicioDepartamento.listarDepartamentos(null,null);

                IServicioServicio servicioServicio = new ServicioServicio();
                List<Servicio> servicios = servicioServicio.listarServiciosHabilitados(null, null, "AB");

    %>

    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">CREAR SERVICIO</h1>
                <div style="height: 10px"></div>
                <div style="padding-left: 20px; background-color: #dadada; width: 33%; min-height: 350px">
                    <div id="espacio"></div>

                    <form method="get" action="crearAlimento.jsp" class="cmxform" id="commentForm">
                        <table width="90%" border="0">
                            <tr style="height: 40px">
                                <td width="40%">Nombre: (*)</td>
                                <td width="50%">
                                    <input class="required" value="" name="nombre" onKeyUp="this.value=this.value.toUpperCase();" style="width: 200px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 80px">
                                <td>Descripcion:</td>
                                <td>
                                    <textarea name="descripcion" rows="4" cols="" style="width: 202px"><%=""%></textarea>
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td>Costo Unitario: (*)</td>
                                <td>
                                    <input class="required" value="" name="costo" onKeyUp="this.value=this.value.toUpperCase();" style="width: 200px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 40px">
                                <td width="10%">Departamento: (*)</td>
                                <td width="30%">
                                    <select name="departamento" style="width: 205px; height: 25px">
                                        <% for (Departamento departamento : departamentos) {%>
                                        <option selected>
                                            <%= departamento.getNombre()%>
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
