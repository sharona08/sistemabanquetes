<%-- 
    Document   : infoReserva
    Created on : Aug 23, 2010, 8:31:51 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Evento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEvento"%>
<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioEvento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page import="com.banquetes.servicios.TO.DetallesReservaSalonTO"%>
<%@page import="com.banquetes.dominio.TipoEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioTipoEvento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioTipoEvento"%>
<%@page import="com.banquetes.servicios.TO.DetallesReservaTO"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.util.UtilMethods"%>
<%@page import="com.banquetes.servicios.TO.DisponibilidadSalonTO"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>

<% IServicioSalon iServicioSalon = new ServicioSalon();%>
<% List<Salon> salones = iServicioSalon.listarSalones();%>

<% IServicioMontaje iServicioMontaje = new ServicioMontaje();%>
<% List<Montaje> montajes = iServicioMontaje.listarMontajes();%>

<% IServicioTipoEvento iServicioEvento = new ServicioTipoEvento();%>
<% List<TipoEvento> tipoEventos = iServicioEvento.listarTipoEventos();%>

<% IServicioReserva iServicioReserva = new ServicioReserva();%>
<% DetallesReservaTO detalles = iServicioReserva.getDetallesReserva(Integer.valueOf(request.getParameter("ID")));%>

<% List<DetallesReservaSalonTO> detallesSalon = iServicioReserva.getDetallesReservaSalon(Integer.valueOf(request.getParameter("ID")));%>

<h1>INFORMACION RESERVA # <% out.println(request.getParameter("ID"));%></h1>
<div id="infoReserva" style="margin-left: 20px; margin-right: 20px; padding-top: 15px">
    <form method="get" action="updateEvento.jsp">
        <table width="90%" border="0">
            <tr style="height: 30px">
                <td width="40%">Fecha Inicio:</td>
                <td width="50%">
                    <input class="inputDate3" id="inputDate3" value="<%= detalles.getFechaInicio()%>" name="fechaInicioEvento" onKeyUp="this.value=this.value.toUpperCase();" />
                 </td>
            </tr>
            <tr style="height: 30px">
                <td>Fecha Fin:</td>
                <td>
                    <input class="inputDate4" id="inputDate4" value="<%= detalles.getFechaFin()%>" name="fechaFinEvento" onKeyUp="this.value=this.value.toUpperCase();" />
                </td>
            </tr>
            <tr style="height: 30px">
                <td>Nombre Evento:</td>
                <td>
                    <input type="text" name="nombreEvento" value="<%= detalles.getNombreEvento()%>" style="width: 160px; height: 23px" align="middle" onkeyup="toUpperCase()" />
                    <input type="hidden" name="idEvento" value="<%= detalles.getIdEvento()%>"/>
                </td>
            </tr>
            <tr style="height: 30px">
                <td>Tipo Evento:</td>
                <td>
                    <select name="tipoEvento" style="width: 165px; height: 25px" >
                        <% for (TipoEvento tipoEvento : tipoEventos) {%>
                        <% if (tipoEvento.getTipoEvento().equals(detalles.getTipoEvento())) {%>
                        <option selected>
                            <%= tipoEvento.getTipoEvento()%>
                        </option>

                        <% } else {%>
                        <option>
                            <%= tipoEvento.getTipoEvento()%>
                        </option>
                        <% }%>
                        <% }%>
                    </select>
                </td>
            </tr>
            <tr style="height: 30px">
                <td>Cantidad Personas:</td>
                <td>
                    <input type="text" name="cantidadPersonas" value="<%= detalles.getCantidadPersonas()%>" style="width: 160px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 30px">
                <% String fullTime = detalles.getHoraInicio().toString();%>
                <% String[] arregloHora = fullTime.split(":");%>
                <% Integer hora = Integer.valueOf(arregloHora[0]);%>
                <% Integer minutos = Integer.valueOf(arregloHora[1]);%>

                <td>Hora Inicio:</td>
                <td>
                    <select name="horaInicio" style="width: 50px; height: 23px">
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
                    <select name="minutosInicio" style="width: 50px; height: 23px">
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
            </tr>
            <tr style="height: 30px">
                <% String fullTimeEnd = detalles.getHoraFin().toString();%>
                <% String[] arregloHoraEnd = fullTimeEnd.split(":");%>
                <% Integer horaEnd = Integer.valueOf(arregloHoraEnd[0]);%>
                <% Integer minutosEnd = Integer.valueOf(arregloHoraEnd[1]);%>
                <td>Hora Fin:</td>
                <td>
                    <select name="horaFin" style="width: 50px; height: 23px">
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
                    <select name="minutosFin" style="width: 50px; height: 23px">
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
            </tr>
            <tr style="height: 30px">
                <td>Empresa:</td>
                <td>
                    <input type="text" name="nombreEmpresa" value="<%= detalles.getNombreEmpresa()%>" disabled="true" style="width: 160px; height: 23px" align="middle" />
                    <input type="hidden" name="rifEmpresa" value="<%= detalles.getRifEmpresa()%>"/>
                </td>
            </tr>
            <tr style="height: 30px">
                <td>Contacto:</td>
                <td>
                    <input type="text" name="nombreContacto" value="<%= detalles.getNombreContacto()%>" disabled="true" style="width: 160px; height: 23px" align="middle" />
                    <input type="hidden" name="idContacto" value="<%= detalles.getIdContacto()%>"/>
                </td>
            </tr>
            <tr style="height: 30px">
                <td>Estado:</td>
                <td>
                    <select name="estado" style="width: 165px; height: 25px">
                        <% if (detalles.getEstadoEvento().equals("T")) {%>
                        <option selected>TENTATIVO</option>
                        <option>CONFIRMADO</option>
                        <option>ANULADO</option>
                        <% } else if (detalles.getEstadoEvento().equals("C")) {%>
                        <option>TENTATIVO</option>
                        <option selected>CONFIRMADO</option>
                        <option>ANULADO</option>
                        <% } else if (detalles.getEstadoEvento().equals("A")) {%>
                        <option>TENTATIVO</option>
                        <option>CONFIRMADO</option>
                        <option selected>ANULADO</option>
                        <% }%>
                    </select>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr style="height: 30px">
                <% if (detallesSalon.size() > 1) {%>
                <td style="font-size: 18px">Detalles salones</td>
                <% } else {%>
                <td style="font-size: 18px">Detalles sal&oacute;n</td>
                <% }%>
                <td>&nbsp;</td>
            </tr>
            <% Integer cont = 0;%>
            <% String varSalon = "";%>
            <% String varCostoSalon = "";%>
            <% String varNuevoCostoSalon = "";%>
            <% String varMontaje = "";%>

            <% String varHiddenSalon = "";%>

            <% for (DetallesReservaSalonTO d : detallesSalon) {%>
            <% cont++;%>
            <% varSalon = "salon" + cont.toString();%>
            <% varCostoSalon = "costoSalon" + cont.toString();%>
            <% varNuevoCostoSalon = "nuevoCostoSalon" + cont.toString();%>
            <% varMontaje = "montaje" + cont.toString();%>
            <% varHiddenSalon = "hiddenSalon" + cont.toString();%>
            
            <tr style="height: 30px">
                <td>Salon:</td>
                <td>
                    <select name="<%=varSalon%>" style="width: 165px; height: 25px">
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
            </tr>
            <input type="hidden" name="<%= varHiddenSalon%>" value="<%= d.getNombreSalon()%>"/>
            <% Double costo = d.getNuevoCosto();%>
            <% if (costo == null) {%>
            <tr style="height: 30px">
                <td>Costo:</td>
                <td>
                    <input type="text" name="<%=varCostoSalon%>" value="<%= d.getCostoSalon()%>" style="width: 160px; height: 23px" align="middle" />
                </td>
            </tr>
            <% } else {%>

            <tr style="height: 30px">
                <td>Costo:</td>
                <td>
                    <input type="text" name="<%=varNuevoCostoSalon%>" value="<%= d.getNuevoCosto()%>" style="width: 160px; height: 23px" align="middle" />
                </td>
            </tr>
            <% }%>
            <tr style="height: 30px">
                <td>Montaje:</td>
                <td>
                    <select name="<%=varMontaje%>" style="width: 165px; height: 25px">
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
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <% }%>
            <input type="hidden" name="cont" value="<%=cont%>"/>
        </table>

        <input type="hidden" name="hiddenFechaInicio" value="<%= request.getParameter("fechaInicio")%>"/>
        <input type="hidden" name="hiddenFechaFin" value="<%= request.getParameter("fechaFin")%>"/>
        <input type="hidden" name="hiddenSalon" value="<%= request.getParameter("salon")%>"/>
        <% if (request.getParameter("anulados") != null) {%>
        <input type="hidden" name="hiddenAnulados" value="<%= request.getParameter("anulados")%>"/>
        <% }%>
        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
            <input type="submit" name="update" value="Guardar" style="width: 65px; margin-left: 270px; margin-right: 10px" onclick=""/>
        </div>
    </form>
    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDiv()" style="width: 65px;"/>
    </div>

    &nbsp;
</div>