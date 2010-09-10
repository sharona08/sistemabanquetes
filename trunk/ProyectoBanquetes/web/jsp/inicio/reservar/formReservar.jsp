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

        <script type="text/javascript" src="selectContacto.js"></script>

        <title>Reservar</title>
    </head>

    <%
                String hiddenSalon = request.getParameter("salon");
                String hiddenFecha = request.getParameter("fecha");

                String fechaInicio = "";

                if (request.getParameter("fechaInicioEvento") != null) {
                    fechaInicio = request.getParameter("fechaInicioEvento");
                } else {
                    fechaInicio = request.getParameter("fecha");
                }

                String rif = request.getParameter("empresa");

                IServicioSalon iServicioSalon = new ServicioSalon();
                Salon salon = iServicioSalon.getSalonNombre(hiddenSalon);

                IServicioMontaje iServicioMontaje = new ServicioMontaje();
                List<Montaje> montajes = iServicioMontaje.listarMontajes(null, null);

                IServicioTipoEvento iServicioEvento = new ServicioTipoEvento();
                List<TipoEvento> tipoEventos = iServicioEvento.listarTipoEventos();

                IServicioEmpresa iServicioEmpresa = new ServicioEmpresa();
                List<Empresa> empresas = iServicioEmpresa.listarEmpresasHabilitadas(null, null);

                IServicioContacto iServicioContacto = new ServicioContacto();

                List<Contacto> contactos = iServicioContacto.listarContactosHabilitados(null, null);

    %>

    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">CREAR RESERVA</h1>
                <div style="height: 10px"></div>
                <div style="padding-left: 50px; background-color: #dadada; width: 40%; min-height: 400px">
                    <div id="espacio"></div>

                    <form method="GET" action="reservar.jsp" class="cmxform" id="commentForm" name="formulario" id="formulario">
                        <table width="97%" border="0">

                            <tr style="height: 35px">
                                <td width="42%">Fecha Inicio: (*)</td>
                                <td width="45%">
                                    <input class="inputDate3" id="inputDate3" value="<%=fechaInicio%>" name="fechaInicioEvento" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" />
                                </td>
                                <td width="10%">&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td>Fecha Fin: (*)</td>
                                <td>
                                    <input class="inputDate4" id="inputDate4" value="<%= hiddenFecha%>" name="fechaFinEvento" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td>Nombre Evento: (*)</td>
                                <td>
                                    <input class="required" type="text" name="nombreEvento" value="" style="width: 195px; height: 23px" align="middle" onKeyUp="this.value=this.value.toUpperCase();" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td>Tipo Evento: (*)</td>
                                <td>
                                    <select name="tipoEvento" style="width: 200px; height: 25px" >
                                        <% for (TipoEvento tipoEvento : tipoEventos) {%>
                                        <option value="<%= tipoEvento.getId()%>">
                                            <%= tipoEvento.getTipoEvento()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td>Cantidad Personas: (*)</td>
                                <td>
                                    <input class="required" type="text" name="cantidadPersonas" value="" style="width: 195px; height: 23px" align="middle" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr style="height: 35px">
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
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px;" valign="middle">
                                <td valign="middle">Hora Fin:</td>
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
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td width="10%">Empresa: (*)</td>
                                <td width="30%">
                                    <!--                                    <select name="empresa" style="width: 165px; height: 25px" onchange="location.href='formReservar.jsp?empresa='+this.value+'&fechaInicioEvento='+<fechaInicio%>" >-->
<!--                                    <select name="empresa" style="width: 165px; height: 25px" onchange="redirect('/ProyectoBanquetes/jsp/inicio/reservar/formReservar.jsp?empresa='+this.value+'&cantidadPersonas='+<%=request.getParameter("cantidadPersonas")%>)" >-->
                                    <select id="empresa" name="empresa" style="width: 200px; height: 25px" onchange="showCustomer(this.value)">
                                        <% for (Empresa empresa : empresas) {%>
                                        <% if (empresa.getRif().equals("J-00000000-0")) {%>
                                        <option selected value="<%= empresa.getRif()%>">
                                            <%= empresa.getNombre()%>
                                        </option>
                                        <% } else {%>
                                        <option value="<%= empresa.getRif()%>">
                                            <%= empresa.getNombre()%>
                                        </option>
                                        <% }%>
                                        <% }%>
                                    </select>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td width="10%">Contacto: (*)</td>
                                <td width="30%">
                                    <div id="txtHint">
                                        <select id="contacto" name="contacto" style="width: 200px; height: 25px" >
                                            <% contactos = iServicioContacto.listarContactosRif("J-00000000-0");%>
                                            <% for (Contacto contacto : contactos) {%>
                                            <option selected value="<%= contacto.getId()%>">
                                                <%= contacto.getNombre()%>
                                            </option>
                                            <% }%>
                                        </select>
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 40px">
                                <td style="font-size: 18px">Detalles sal&oacute;n</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr style="height: 35px">
                                <td>Salon: </td>
                                <td>
                                    <input type="text" name="salon" value="<%= hiddenSalon%>" style="width: 195px; height: 23px" align="middle" disabled/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td>Nuevo Costo:</td>
                                <td>
                                    <input type="text" name="nuevoCosto" value="<%= salon.getCosto()%>" style="width: 195px; height: 23px" align="middle" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 35px">
                                <td>Montaje: (*)</td>
                                <td>
                                    <select name="montaje" style="width: 200px; height: 25px">
                                        <% for (Montaje montaje : montajes) {%>
                                        <option selected value="<%= montaje.getId()%>">
                                            <%= montaje.getTipoMontaje()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </td>
                                <td>
                                    <div id="boton" class="demo" style="float: left">
                                        <!--                                        <input type="submit" name="nuevoSalon" value="+" style="width: 35px; height: 25px;" align="left" onclick=""/>-->
                                        <input type="image" src="../add_24.png" name="nuevo" value="" style="width: 20px; height: 20px; margin-top: 1px; margin-bottom: 1px;" onclick=""/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <label style="font-weight: 400; color: red; width: 100%">(*) Campos obligatorios</label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <div id="boton" class="demo" style="float: right;">
                                        <input type="hidden" name="hiddenSalon" value="<%= request.getParameter("salon")%>"/>
                                        <input class="submit" type="submit" name="create" value="Siguente" style="width: 65px; margin-right: 10px" onclick=""/>
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="espacio"></div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
