<%-- 
    Document   : formAlimentos
    Created on : Sep 6, 2010, 9:04:44 PM
    Author     : maya
--%>

<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.dominio.Departamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento"%>
<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
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

        <title>Alimentos y Bebidas</title>
    </head>
    <body>
        <%
                    IServicioServicio servicioServicio = new ServicioServicio();
                    List<Servicio> servicios = servicioServicio.listarServiciosHabilitados(null, null, "AB");

                    IServicioDepartamento servicioDepartamento = new ServicioDepartamento();
                    List<Departamento> departamentos = servicioDepartamento.listarDepartamentos(null, null);

                    String idEvento = request.getParameter("idEvento");
                    IServicioSalon servicioSalon = new ServicioSalon();
                    List<Salon> salones = servicioSalon.listarSalonesEvento(Integer.valueOf(idEvento));
        %>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">AGREGAR ALIMENTO Y BEBIDA</h1>
                <div style="height: 10px"></div>
                <div style="padding-left: 20px; background-color: #dadada; width: 35%; min-height: 400px">
                    <div id="espacio"></div>

                    <form method="get" action="crearAB.jsp" class="cmxform" id="commentForm" name="form">
                        <table width="100%" border="0">

                            <tr style="height: 30px">
                                <td width="40%">Nombre: (*)</td>
                                <td width="40%">
                                    <select name="nombre" style="width: 165px; height: 25px">
                                        <%
                                                    for (Servicio s : servicios) {
                                                        out.write("<option value=" + s.getId() + ">" + s.getNombre() + "</option>");
                                                    }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Costo Unitario: (*)</td>
                                <td>
                                    <input class="required" value="" name="costoUnitario" style="width: 160px; height: 23px" onKeyUp="this.value=this.value.toUpperCase();" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Cantidad: (*)</td>
                                <td>
                                    <input class="required" type="text" name="cantidad" value="" style="width: 160px; height: 23px" align="middle" onKeyUp="this.value=this.value.toUpperCase();" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Hora:</td>
                                <td>
                                    <select name="horaInicio" style="width: 50px; height: 25px">
                                        <% for (int i = 0; i < 24; i++) {%>
                                        <% if (i < 10) {%>

                                        <option selected>
                                            <%= "0" + i%>
                                        </option>
                                        <% } else {%>
                                        <option selected>
                                            <%= i%>
                                        </option>
                                        <% }%>
                                        <% }%>
                                    </select>
                                    <select name="minutosInicio" style="width: 50px; height: 25px">
                                        <% for (int i = 0; i < 60; i = i + 10) {%>

                                        <% if (i < 10) {%>
                                        <option selected>
                                            <%= "0" + i%>
                                        </option>
                                        <% } else {%>
                                        <option selected>
                                            <%= i%>
                                        </option>
                                        <% }%>
                                        <% }%>
                                    </select>
                                </td>
                            </tr>
                            <%--TODO:
                            * LISTAR TODOS LOS SALONES QUE ESTEN RELACIONADOS CON LA RESERVA QUE SE ACABA DE CREAR
                            --%>
                            <tr style="height: 30px">
                                <td>Salon: </td>
                                <td>
                                    <select style="width: 165px; height: 25px">
                                        <%
                                                    for (Salon s : salones) {
                                                        out.write("<option value=" + s.getId() + ">" + s.getNombre() + "</option>");
                                                    }

                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Descripcion:</td>
                                <td>
                                    <textarea cols="" rows="" name="descripcion" style="width: 165px;"></textarea>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Nota:</td>
                                <td>
                                    <textarea cols="" rows="" name="nota" style="width: 165px;"></textarea>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Area de Servicio: (*)</td>
                                <td>
                                    <select name="area" style="width: 165px; height: 25px">
                                        <%
                                                    for (Departamento d : departamentos) {
                                                        out.write("<option value=" + d.getId() + ">" + d.getNombre() + "</option>");
                                                    }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
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
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <div id="boton" class="demo" style="float: right; margin-bottom: 20px">
                                        <input class="submit" type="submit" name="create" value="Otro" style="width: 65px; margin-right: 10px" onclick=""/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="espacio"></div>
                <div id="resultado">

                </div>
                <div id="espacio"></div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
