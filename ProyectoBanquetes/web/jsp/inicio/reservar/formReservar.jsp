<%-- 
    Document   : createEmpresa
    Created on : Sep 2, 2010, 10:12:46 AM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioTipoEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioTipoEvento"%>
<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.dominio.TipoEvento"%>
<%@page import="java.util.Date"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
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

        <script>
            $(document).ready(function(){
                $("#commentForm").validate();
            });
        </script>


        <title>Reservar</title>
    </head>

    <%
                Date today = new java.util.Date();
                java.sql.Date fecha = new java.sql.Date(today.getTime());
                //String hiddenFechaInicio = request.getParameter("fechaInicio");
               // String hiddenFechaFin = request.getParameter("fechaFin");
                String hiddenSalon = request.getParameter("salon");
                String hiddenFecha = request.getParameter("fecha");

                IServicioSalon iServicioSalon = new ServicioSalon();
                List<Salon> salones = iServicioSalon.listarSalones();

                IServicioMontaje iServicioMontaje = new ServicioMontaje();
                List<Montaje> montajes = iServicioMontaje.listarMontajes(null, null);

                IServicioTipoEvento iServicioEvento = new ServicioTipoEvento();
                List<TipoEvento> tipoEventos = iServicioEvento.listarTipoEventos();

                IServicioEmpresa iServicioEmpresa = new ServicioEmpresa();
                List<Empresa> empresas = iServicioEmpresa.listarEmpresasHabilitadas(null, null);

                IServicioContacto iServicioContacto = new ServicioContacto();
                List<Contacto> contactos = iServicioContacto.listarContactosHabilitados(null, null);
                //List<Contacto> contactosRif = iServicioContacto.listarContactosRif(rif);

    %>

    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">CREAR RESERVA</h1>
                <div style="height: 10px"></div>
                <div style="padding-left: 20px; background-color: #dadada; width: 30%; min-height: 330px">
                    <div id="espacio"></div>

                    <form method="get" action="reservar.jsp" class="cmxform" id="commentForm">
                        <table width="100%" border="0">

                            <tr style="height: 30px">
                                <td width="40%">Fecha Inicio: (*)</td>
                                <td width="50%">
                                    <input class="inputDate3" id="inputDate3" value="<%= hiddenFecha%>" name="fechaInicioEvento" onKeyUp="this.value=this.value.toUpperCase();" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Fecha Fin: (*)</td>
                                <td>
                                    <input class="inputDate4" id="inputDate4" value="<%= hiddenFecha%>" name="fechaFinEvento" onKeyUp="this.value=this.value.toUpperCase();" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Nombre Evento: (*)</td>
                                <td>
                                    <input class="required" type="text" name="nombreEvento" value="" style="width: 160px; height: 23px" align="middle" onKeyUp="this.value=this.value.toUpperCase();" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Tipo Evento: (*)</td>
                                <td>
                                    <select name="tipoEvento" style="width: 165px; height: 25px" >
                                        <% for (TipoEvento tipoEvento : tipoEventos) {%>
                                        <option>
                                            <%= tipoEvento.getTipoEvento()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Cantidad Personas: (*)</td>
                                <td>
                                    <input class="required" type="text" name="cantidadPersonas" value="" style="width: 160px; height: 23px" align="middle" />
                                </td>
                            </tr>

                            <tr style="height: 30px">
                                <td>Hora Inicio:</td>
                                <td>
                                    <select name="horaInicio" style="width: 50px; height: 23px">
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
                                    <select name="minutosInicio" style="width: 50px; height: 23px">
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
                            <tr style="height: 30px">
                                <td>Hora Fin:</td>
                                <td>
                                    <select name="horaFin" style="width: 50px; height: 23px">
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
                                    <select name="minutosFin" style="width: 50px; height: 23px">
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
                            <tr style="height: 30px">
                                <td width="10%">Empresa: (*)</td>
                                <td width="30%">
                                    <select name="empresa" style="width: 202px; height: 25px">
                                        <% for (Empresa empresa : empresas) {%>
                                        <% if(empresa.getRif().equals("J-00000000-0")){ %>
                                        <option selected>
                                            <%= empresa.getNombre()%>
                                        </option>
                                        <% } else {%>
                                        <option>
                                            <%= empresa.getNombre()%>
                                        </option>
                                        <% }%>
                                        <% }%>
                                    </select>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td width="10%">Contacto (*)</td>
                                <td width="30%">
                                    <select name="empresa" style="width: 202px; height: 25px">
                                        <% for (Contacto contacto : contactos) {%>
                                        <option selected>
                                            <%= contacto.getNombre()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td style="font-size: 18px">Detalles sal&oacute;n</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr style="height: 30px">
                                <td>Salon: </td>
                                <td>
                                    <input type="text" name="salon" value="<%= hiddenSalon%>" style="width: 160px; height: 23px" align="middle" disabled/>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Nuevo Costo:</td>
                                <td>
                                    <input type="text" name="nuevoCosto" value="" style="width: 160px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Montaje: (*)</td>
                                <td>
                                    <select name="montaje" style="width: 165px; height: 25px">
                                        <% for (Montaje montaje : montajes) {%>
                                        <option selected>
                                            <%= montaje.getTipoMontaje()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                                <td>
                                    <div id="boton" class="demo">
                                        <input type="submit" name="nuevoSalon" value="+" style="width: 35px; height: 25px;" align="middle" onclick=""/>
                                    </div>
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
