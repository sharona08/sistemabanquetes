<%-- 
    Document   : informacionReserva
    Created on : Sep 14, 2010, 11:17:00 AM
    Author     : maya
--%>
<%@page import="com.banquetes.dominio.Evento"%>
<%@page import="com.banquetes.servicios.impl.ServicioEvento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEvento"%>
<%@page import="com.banquetes.dominio.Iva"%>
<%@page import="com.banquetes.servicios.impl.ServicioIva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioIva"%>
<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.dominio.TipoEvento"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.TO.DetallesReservaSalonTO"%>
<%@page import="com.banquetes.servicios.TO.DetallesReservaTO"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
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
        <script type="text/javascript">
            function redirect(url){
                window.location.href=url;
            }
        </script>
        <title>Informaci&oacute;n Reserva</title>
    </head>
    <body>
        <%
                    Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));

                    Evento event = new Evento(idEvento);
                    IServicioEvento servicioEvento = new ServicioEvento();

                    Boolean existeEvento = servicioEvento.existeEventoId(event);

                    if (existeEvento) {


                        IServicioReserva servicioReserva = new ServicioReserva();

                        IServicioIva servicioIva = new ServicioIva();
                        Iva iva = servicioIva.getIva(new Integer(1));

                        DetallesReservaTO detallesReserva = servicioReserva.getDetallesReserva(idEvento);
                        List<DetallesReservaSalonTO> detallesReservaSalon = servicioReserva.getDetallesReservaSalon(idEvento);

                        String estado = detallesReserva.getEstadoEvento();
                        String estadoEvento = "";
                        if (estado.equals("T")) {
                            estadoEvento = "TENTATIVO";
                        } else if (estado.equals("C")) {
                            estadoEvento = "CONFIRMADO";
                        } else if (estado.equals("A")) {
                            estadoEvento = "ANULADO";
                        }

                        IServicioSalon iServicioSalon = new ServicioSalon();
                        List<Salon> salones = iServicioSalon.listarSalones();

                        IServicioMontaje iServicioMontaje = new ServicioMontaje();
                        List<Montaje> montajes = iServicioMontaje.listarMontajes(null, null);

                        Double costoSalones = servicioReserva.costoTotalSalones(idEvento);
                        Double costoAB = servicioReserva.costoTotalServicios(idEvento, "AB");
                        Double costoAU = servicioReserva.costoTotalServicios(idEvento, "AU");
                        Double costoOT = servicioReserva.costoTotalServicios(idEvento, "OT");
                        Double subtotal = servicioReserva.subtotalReserva(idEvento);
                        Double costoIVA = servicioReserva.ivaReserva(idEvento);
                        Double costoTotal = servicioReserva.costoTotalReserva(idEvento);
        %>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1" style="margin-left: 20px; margin-bottom: 10px">INFORMACION RESERVA # <%=idEvento%></h1>
                <div id="resumenReserva" style="width: 65%; margin-left: 30px; margin-right: 20px; padding-left: 30px; padding-top: 20px; padding-right: 30px; background-color: #eeeeee;">
                    <table width="70%" border="0">
                        <tr style="height: 40px">
                            <td width=30%">Fecha Inicio:</td>
                            <td width="30%">
                                <input class="inputDate3" id="inputDate3" value="<%= detallesReserva.getFechaInicio()%>" name="fechaInicioEvento" onKeyUp="this.value=this.value.toUpperCase();" style="width: 180px; height: 23px" disabled="disabled" />
                            </td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td>Fecha Fin:</td>
                            <td>
                                <input class="inputDate4" id="inputDate4" value="<%= detallesReserva.getFechaFin()%>" name="fechaFinEvento" onKeyUp="this.value=this.value.toUpperCase();" style="width: 180px; height: 23px" disabled="disabled" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td>Nombre Evento:</td>
                            <td>
                                <input type="text" name="nombreEvento" value="<%= detallesReserva.getNombreEvento()%>" style="width: 180px; height: 23px" align="middle" onkeyup="toUpperCase()" disabled="disabled"  />
                                <input type="hidden" name="idEvento" value="<%= detallesReserva.getIdEvento()%>"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td>Tipo Evento:</td>
                            <td>
                                <input type="text" name="tipoEvento" value="<%= detallesReserva.getTipoEvento()%>" style="width: 180px; height: 23px" align="middle" onkeyup="toUpperCase()" disabled="disabled"  />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td>Cantidad Personas:</td>
                            <td>
                                <input type="text" name="cantidadPersonas" value="<%= detallesReserva.getCantidadPersonas()%>" style="width: 180px; height: 23px" align="middle" disabled="disabled"  />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <% String fullTime = detallesReserva.getHoraInicio().toString();%>
                            <% String[] arregloHora = fullTime.split(":");%>
                            <% Integer hora = Integer.valueOf(arregloHora[0]);%>
                            <% Integer minutos = Integer.valueOf(arregloHora[1]);%>

                            <td>Hora Inicio:</td>
                            <td>
                                <select name="horaInicio" style="width: 50px; height: 23px" disabled="disabled" >
                                    <% for (int i = 0; i < 24; i++) {%>
                                    <% if (i < 10) {%>

                                    <% if (i == hora) {%>
                                    <option selected>
                                        <%= "0" + i%>
                                    </option>
                                    <% } else {%>
                                    <option>
                                        <%= "0" + i%>
                                    </option>
                                    <% }%>
                                    <% } else {%>

                                    <% if (i == hora) {%>
                                    <option selected>
                                        <%= i%>
                                    </option>
                                    <% } else {%>
                                    <option>
                                        <%= i%>
                                    </option>
                                    <% }%>
                                    <% }%>
                                    <% }%>
                                </select>
                                <select name="minutosInicio" style="width: 50px; height: 23px" disabled="disabled" >
                                    <% for (int i = 0; i < 60; i = i + 10) {%>

                                    <% if (i < 10) {%>
                                    <% if (i == minutos) {%>
                                    <option selected>
                                        <%= "0" + i%>
                                    </option>
                                    <% } else {%>
                                    <option>
                                        <%= "0" + i%>
                                    </option>
                                    <% }%>
                                    <%} else {%>

                                    <% if (i == minutos) {%>
                                    <option selected>
                                        <%= i%>
                                    </option>
                                    <% } else {%>
                                    <option>
                                        <%= i%>
                                    </option>
                                    <% }%>
                                    <% }%>
                                    <% }%>
                                </select>

                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <% String fullTimeEnd = detallesReserva.getHoraFin().toString();%>
                            <% String[] arregloHoraEnd = fullTimeEnd.split(":");%>
                            <% Integer horaEnd = Integer.valueOf(arregloHoraEnd[0]);%>
                            <% Integer minutosEnd = Integer.valueOf(arregloHoraEnd[1]);%>
                            <td>Hora Fin:</td>
                            <td>
                                <select name="horaFin" style="width: 50px; height: 23px" disabled="disabled" >
                                    <% for (int i = 0; i < 24; i++) {%>
                                    <% if (i < 10) {%>

                                    <% if (i == horaEnd) {%>
                                    <option selected>
                                        <%= "0" + i%>
                                    </option>
                                    <% } else {%>
                                    <option>
                                        <%= "0" + i%>
                                    </option>
                                    <% }%>
                                    <% } else {%>

                                    <% if (i == horaEnd) {%>
                                    <option selected>
                                        <%= i%>
                                    </option>
                                    <% } else {%>
                                    <option>
                                        <%= i%>
                                    </option>
                                    <% }%>
                                    <% }%>
                                    <% }%>
                                </select>
                                <select name="minutosFin" style="width: 50px; height: 23px" disabled="disabled" >
                                    <% for (int i = 0; i < 60; i = i + 10) {%>

                                    <% if (i < 10) {%>
                                    <% if (i == minutosEnd) {%>
                                    <option selected>
                                        <%= "0" + i%>
                                    </option>
                                    <% } else {%>
                                    <option>
                                        <%= "0" + i%>
                                    </option>
                                    <% }%>
                                    <%} else {%>

                                    <% if (i == minutosEnd) {%>
                                    <option selected>
                                        <%= i%>
                                    </option>
                                    <% } else {%>
                                    <option>
                                        <%= i%>
                                    </option>
                                    <% }%>
                                    <% }%>
                                    <% }%>
                                </select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td>Empresa:</td>
                            <td>
                                <input type="text" name="nombreEmpresa" value="<%= detallesReserva.getNombreEmpresa()%>" disabled="disabled"  style="width: 180px; height: 23px" align="middle" onKeyUp="this.value=this.value.toUpperCase();" />
                                <input type="hidden" name="rifEmpresa" value="<%= detallesReserva.getRifEmpresa()%>"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td>Contacto:</td>
                            <td>
                                <input type="text" name="nombreContacto" value="<%= detallesReserva.getNombreContacto()%>" disabled="disabled"  style="width: 180px; height: 23px" align="middle" />
                                <input type="hidden" name="idContacto" value="<%= detallesReserva.getIdContacto()%>"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td>Estado:</td>
                            <td>
                                <input type="text" name="estado" value="<%= estadoEvento%>" disabled="disabled"  style="width: 180px; height: 23px" align="middle" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 95px">
                            <td>Nota:</td>
                            <td>
                                <% if (detallesReserva.getNota() != null) {%>
                                <textarea name="nota" cols="" rows="5" style="width: 183px" disabled="disabled" ><%= detallesReserva.getNota()%></textarea>
                                <% } else {%>
                                <textarea name="nota" cols="" rows="5" style="width: 183px" disabled="disabled" ></textarea>
                                <% }%>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 20px">
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <% if (detallesReservaSalon.size() > 1) {%>
                            <td style="font-size: 18px">DETALLES SALONES</td>
                            <% } else {%>
                            <td style="font-size: 18px">DETALLES SAL&Oacute;N</td>
                            <% }%>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <% Integer cont = 0;%>
                        <% String varSalon = "";%>
                        <% String varCostoSalon = "";%>
                        <% String varNuevoCostoSalon = "";%>
                        <% String varMontaje = "";%>

                        <% String varHiddenSalon = "";%>

                        <% for (DetallesReservaSalonTO d : detallesReservaSalon) {%>
                        <% cont++;%>
                        <% varSalon = "salon" + cont.toString();%>
                        <% varCostoSalon = "costoSalon" + cont.toString();%>
                        <% varNuevoCostoSalon = "nuevoCostoSalon" + cont.toString();%>
                        <% varMontaje = "montaje" + cont.toString();%>
                        <% varHiddenSalon = "hiddenSalon" + cont.toString();%>

                        <tr style="height: 40px">
                            <td>Salon:</td>
                            <td>
                                <select name="<%=varSalon%>" style="width: 185px; height: 25px" disabled="disabled" >
                                    <% for (Salon salon : salones) {%>
                                    <% if (salon.getNombre().equals(d.getNombreSalon())) {%>
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
                            <td>&nbsp;</td>
                        </tr>
                        <input type="hidden" name="<%= varHiddenSalon%>" value="<%= d.getNombreSalon()%>"/>
                        <% Double costo = d.getNuevoCosto();%>
                        <% if (costo == null) {%>
                        <tr style="height: 40px">
                            <td>Costo:</td>
                            <td>
                                <input type="text" name="<%=varCostoSalon%>" value="<%= d.getCostoSalon()%>" style="width: 180px; height: 23px" disabled="disabled" align="middle" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <% } else {%>

                        <tr style="height: 40px">
                            <td>Costo:</td>
                            <td>
                                <input type="text" name="<%=varNuevoCostoSalon%>" value="<%= d.getNuevoCosto()%>" style="width: 180px; height: 23px" disabled="disabled"  align="middle" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <% }%>
                        <tr style="height: 40px">
                            <td>Montaje:</td>
                            <td>
                                <select name="<%=varMontaje%>" style="width: 185px; height: 25px" disabled="disabled" >
                                    <% for (Montaje montaje : montajes) {%>
                                    <% if (montaje.getTipoMontaje().equals(d.getTipoMontaje())) {%>
                                    <option selected>
                                        <%= montaje.getTipoMontaje()%>
                                        <% } else {%>
                                    <option>
                                        <%= montaje.getTipoMontaje()%>
                                    </option>
                                    <% }%>
                                    <% }%>
                                </select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <%
                             Integer size = Integer.valueOf(detallesReservaSalon.size());
                             if (cont.equals(size)) {
                        %>
                        <tr style="height: 40px">
                            <td>&nbsp;</td>
                            <td>
                                <label>Costo Total Salones: <%=costoSalones%></label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <% }%>
                        <tr style="height: 10px">
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <% }%>
                        <input type="hidden" name="cont" value="<%=cont%>"/>
                    </table>

                    <table width="70%" border="0">
                        <tr style="height: 40px">
                            <td width=30%" style="font-size: 18px">DETALLES SERVICIOS:</td>
                            <td width=30%">&nbsp;</td>
                            <td width=10%">&nbsp;</td>
                        </tr>
                        <tr style="height: 40px">
                            <td style="font-size: 18px">Alimentos y Bebidas:</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <jsp:include page="informacionAB.jsp" flush="true"></jsp:include>
                    <label style="float: right; margin-top: 5px; font-weight: 700">Costo total Alimentos y Bebidas: <%=costoAB%></label>

                    <div id="espacio"></div>

                    <table width="70%" border="0">
                        <tr style="height: 40px">
                            <td width=30%" style="font-size: 18px">Audiovisuales:</td>
                            <td width=30%">&nbsp;</td>
                            <td width=10%">&nbsp;</td>
                        </tr>
                    </table>
                    <jsp:include page="informacionAU.jsp" flush="true"></jsp:include>
                    <label style="float: right; margin-top: 5px; font-weight: 700">Costo total Audiovisuales: <%=costoAU%></label>

                    <div id="espacio"></div>
                    <table width="70%" border="0">
                        <tr style="height: 40px">
                            <td width=30%" style="font-size: 18px">Otros Servicios:</td>
                            <td width=30%">&nbsp;</td>
                            <td width=10%">&nbsp;</td>
                        </tr>
                    </table>
                    <jsp:include page="informacionOT.jsp" flush="true"></jsp:include>
                    <label style="float: right; margin-top: 5px; font-weight: 700">Costo total OtrosServicios: <%=costoOT%></label>

                    <div id="espacio"></div>

                    <div id="costosTotales" style="margin-left: 420px; margin-top: 20px">
                        <table width="90%" border="0">
                            <tr style="height: 30px">
                                <td width="70%">
                                    <label>Total Salones: </label>
                                </td>
                                <td width="20%" align="right"><%=costoSalones%></td>
                            </tr>
                            <tr style="height: 30px">
                                <td>
                                    <label>Total Alimentos y Bebidas: </label>
                                </td>
                                <td align="right"><%=costoAB%></td>
                            </tr>
                            <tr style="height: 30px">
                                <td>
                                    <label>Total Audiovisuales: </label>
                                </td>
                                <td align="right"><%=costoAU%></td>
                            </tr>
                            <tr style="height: 30px">
                                <td>
                                    <label>Total Otros Servicios: </label>
                                </td>
                                <td align="right"><%=costoOT%></td>
                            </tr>
                            <tr style="height: 30px">
                                <td>
                                    <label style="font-weight: 700">Subtotal: </label>
                                </td>
                                <td align="right">
                                    <label style="font-weight: 700"><%=subtotal%></label>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>
                                    <label>IVA (<%= iva.getPorcentaje()%>%): </label>
                                </td>
                                <td align="right"><%=costoIVA%></td>
                            </tr>
                            <tr style="height: 30px">
                                <td>
                                    <label style="font-size: 16px; color: green; font-weight: 700">TOTAL: </label>
                                </td>
                                <td align="right">
                                    <label style="font-size: 16px; color: green; font-weight: 700"><%=costoTotal%></label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="espacio"></div>
                </div>
                <div id="espacio"></div>
                <div style="width: 70%; margin-left: 30px; min-height: 50px">
                    <div id="boton" class="demo" style="float: right">
                        <input class="submit" type="submit" value="Listo" style="width: 70px; height: 30px;" onclick="redirect('/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp')"/>
                    </div>
                </div>
                <div id="espacio"></div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
        <% } else {%>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1" style="margin-left: 20px; margin-bottom: 10px">NUMERO DE RESERVA INVALIDO</h1>
                <script type="text/javascript">
                    alert("Error! numero de reserva invalido");
                </script>
                <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/verReservaID.jsp">
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
        <% }%>
    </body>
</html>
