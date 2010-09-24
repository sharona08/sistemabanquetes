<%-- 
    Document   : detalleAlimento
    Created on : Sep 1, 2010, 4:56:56 PM
    Author     : maya
--%>

<%@page import="java.sql.Date"%>
<%@page import="com.banquetes.util.UtilMethods"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.dominio.ServicioServicioEvento"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.dominio.Departamento"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>
<%@page import="com.banquetes.dominio.Servicio"%>
<%@page import="com.banquetes.servicios.impl.ServicioServicio"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioServicio"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            UtilMethods util = new UtilMethods();

            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));
            Integer idSalon = Integer.valueOf(request.getParameter("idSalon"));
            Integer idServicio = Integer.valueOf(request.getParameter("idServicio"));
            Date fechaInicio = util.getSqlDate(request.getParameter("fechaInicio"));

            IServicioReserva servicioReserva = new ServicioReserva();
            ServicioServicioEvento servicioEvento = servicioReserva.getServicioEvento(idEvento, idSalon, idServicio, fechaInicio);

            IServicioServicio servicioServicio = new ServicioServicio();
            Servicio servicio = servicioServicio.getServicio(idServicio);

            IServicioSalon servicioSalon = new ServicioSalon();
            List<Salon> salones = servicioSalon.listarSalonesEvento(Integer.valueOf(idEvento));

            String notaEspecial = "";
            if (servicioEvento.getNotaEspecial() != null) {
                notaEspecial = servicioEvento.getNotaEspecial();
            } else {
                notaEspecial = "";
            }

            String descripcion = "";
            if (servicioEvento.getNuevaDescripcion() != null) {
                descripcion = servicioEvento.getNuevaDescripcion();
            } else {
                if (servicio.getDescripcion() != null) {
                    descripcion = servicio.getDescripcion();
                } else {
                    descripcion = "";
                }
            }
%>

<h1 id="letra2">INFORMACION AUDIOVISUALES # <% out.println(idEvento);%></h1>
<div id="detalle" style="margin-left: 20px; margin-right: 20px; padding-top: 15px" align="center">
    <form method="get" action="updateAU.jsp">
        <table width="85%" border="0">
            <tr style="height: 40px">
                <td width="35%">Nombre:</td>
                <td width="50%">
                    <input value="<%= servicio.getNombre()%>" name="nombreServicio" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" disabled />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Costo Unitario:</td>
                <td>
                    <% if (servicioEvento.getNuevoCosto() != null) {%>
                    <input value="<%= servicioEvento.getNuevoCosto()%>" name="costo" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                    <% } else {%>
                    <input value="<%= servicio.getCostoUnitario()%>" name="costo" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                    <% }%>
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Cantidad:</td>
                <td>
                    <input value="<%= servicioEvento.getCantidad()%>" name="cantidad" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                </td>
            </tr>

            <tr style="height: 35px">
                <td>Fecha Inicio: (*)</td>
                <td>
                    <input class="inputDate3" id="inputDate3" value="<%= servicioEvento.getFechaInicio()%>" name="fechaInicioEvento" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" />
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr style="height: 35px">
                <td>Fecha Fin: (*)</td>
                <td>
                    <input class="inputDate4" id="inputDate4" value="<%= servicioEvento.getFechaFin()%>" name="fechaFinEvento" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" />
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr style="height: 35px">
                <% String fullTime = servicioEvento.getHoraInicio().toString();%>
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
            <tr style="height: 40px">
                <td>Salon: </td>
                <td>
                    <select name="salon" style="width: 200px; height: 25px">
                        <%
                                    for (Salon s : salones) {
                                        if (s.getId().equals(idSalon)) {
                                            out.write("<option selected value=" + s.getId() + ">" + s.getNombre() + "</option>");
                                        } else {
                                            out.write("<option value=" + s.getId() + ">" + s.getNombre() + "</option>");
                                        }
                                    }

                        %>
                    </select>
                </td>
            </tr>
            <tr style="height: 80px;">
                <td>Descripcion:</td>
                <td>
                    <textarea name="descripcion" rows="4" cols="" style="width: 198px"><%=descripcion%></textarea>
                </td>
            </tr>
            <tr style="height: 80px;">
                <td>Nota Especial:</td>
                <td>
                    <textarea name="notaEspecial" rows="4" cols="" style="width: 198px"><%=notaEspecial%></textarea>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <input type="hidden" name="idEvento" value="<%= idEvento%>"/>
        <input type="hidden" name="idSalon" value="<%= idSalon%>"/>
        <input type="hidden" name="idServicio" value="<%= idServicio%>"/>
        <input type="hidden" name="fechaInicio" value="<%= fechaInicio%>"/>
        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
            <input type="submit" name="update" value="Guardar" style="width: 65px; margin-left: 270px; margin-right: 10px" onclick=""/>
        </div>
    </form>
    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDivAlimento()" style="width: 65px;"/>
    </div>
    <div id="espacio"></div>
</div>