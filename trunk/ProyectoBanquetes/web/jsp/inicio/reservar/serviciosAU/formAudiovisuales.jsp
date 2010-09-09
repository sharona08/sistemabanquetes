<%-- 
    Document   : formAlimentos
    Created on : Sep 6, 2010, 9:04:44 PM
    Author     : maya
--%>

<%@page import="com.banquetes.servicios.interfaces.IServicioEvento"%>
<%@page import="com.banquetes.dominio.Evento"%>
<%@page import="com.banquetes.servicios.impl.ServicioEvento"%>
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

        <script type="text/javascript" src="../../../js/jquery.validate.js"></script>
        <style type="text/css">
            label { width: 10em; float: left; }
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

        <script type="text/javascript" src="selectServicio.js"></script>
        <script type="text/javascript" src="selectServicioDesc.js"></script>

        <title>Alimentos y Bebidas</title>
    </head>
    <body>
        <%
                    IServicioServicio servicioServicio = new ServicioServicio();
                    List<Servicio> servicios = servicioServicio.listarServiciosHabilitados(null, null, "AU");

                    String idEvento = request.getParameter("idEvento");

                    IServicioSalon servicioSalon = new ServicioSalon();
                    List<Salon> salones = servicioSalon.listarSalonesEvento(Integer.valueOf(idEvento));

                    IServicioEvento servicioEvento = new ServicioEvento();
                    Evento evento = servicioEvento.getEvento(Integer.valueOf(idEvento));

        %>
        <div id="pageWrap">
            <jsp:include page="../../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">AGREGAR AUDIOVISUALES</h1>
                <div style="height: 10px"></div>

                <div style="padding-left: 20px; background-color: #dadada; width: 35%; min-height: 400px">
                    <div id="espacio"></div>
                    <label id="letra2">RESERVA # <%= idEvento%></label>
                    <div id="espacio"></div>

                    <form method="get" action="crearAU.jsp" class="cmxform" id="commentForm" name="form">
                        <table width="85%" border="0">
                            <tr style="height: 40px">
                                <td width="45%">Nombre: (*)</td>
                                <td width="40%">
                                    <select name="nombre" style="width: 200px; height: 25px" onchange="mostrarInfo(this.value, <%=request.getParameter("idEvento")%>); mostrarDesc(this.value, <%=request.getParameter("idEvento")%>);">
                                        <%
                                                    Servicio serv = servicios.get(0);
                                                    for (Servicio s : servicios) {
                                                        if (s.getId().equals(serv.getId())) {
                                                            out.write("<option selected value=" + s.getId() + ">" + s.getNombre() + ", " + s.getCostoUnitario() + "</option>");
                                                        } else {
                                                            out.write("<option value=" + s.getId() + ">" + s.getNombre() + ", " + s.getCostoUnitario() + "</option>");
                                                        }
                                                    }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <%
                                        Servicio servicio = servicioServicio.getServicio(serv.getId());
                            %>

                            <tr style="height: 40px">
                                <td>Costo Unitario: (*)</td>
                                <td>
                                    <div id="ab">

                                        <input class="required" value="<%= servicio.getCostoUnitario()%>" name="costoUnitario" style="width: 195px; height: 23px" onKeyUp="this.value=this.value.toUpperCase();" />
                                    </div>
                                </td>
                            </tr>

                            <tr style="height: 40px">
                                <td>Cantidad: (*)</td>
                                <td>
                                    <input class="required" type="text" name="cantidad" value="<%= evento.getCantidadPersonas()%>" style="width: 195px; height: 23px" align="middle" onKeyUp="this.value=this.value.toUpperCase();" />
                                </td>
                            </tr>
                            <tr style="height: 40px">
                                <td>Hora:</td>
                                <td>
                                    <%
                                                String horaInicio = evento.getHoraInicio().toString();
                                                String[] arregloHora = horaInicio.split(":");
                                                Integer hora = Integer.valueOf(arregloHora[0]);
                                                Integer minutos = Integer.valueOf(arregloHora[1]);
                                    %>
                                    <div id="horaInicio">
                                        <select name="horaInicio" style="width: 50px; height: 25px; float: left">
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
                                    </div>
                                    <div id="minutosInicio">
                                        <select name="minutosInicio" style="width: 50px; height: 25px; float: left; margin-left: 5px">
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
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 40px">
                                <td>Salon: </td>
                                <td>
                                    <select name="salon" style="width: 200px; height: 25px">
                                        <%
                                                    for (Salon s : salones) {
                                                        out.write("<option value=" + s.getId() + ">" + s.getNombre() + "</option>");
                                                    }

                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr style="height: 80px">
                                <td>Descripcion:</td>
                                <td>
                                    <div id="descripcion">
                                        <% if (servicio.getDescripcion() != null) {%>
                                        <textarea cols="" rows="4" name="descripcion" style="width: 200px;"><%= servicio.getDescripcion()%></textarea>
                                        <% } else {%>
                                        <textarea cols="" rows="4" name="descripcion" style="width: 200px;"></textarea>
                                        <% }%>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 80px">
                                <td>Nota:</td>
                                <td>
                                    <textarea cols="" rows="4" name="nota" style="width: 200px;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><label style="font-weight: 400; color: red; width: 100%">(*) Campos obligatorios</label></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <input type="hidden" name="idEvento" value="<%=idEvento%>"/>
                                    <div id="boton" class="demo" style="float: right; margin-bottom: 20px">
                                        <input class="submit" type="submit" name="create" value="Crear" style="width: 65px; margin-right: 10px" onclick=""/>
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

                <div id="alimentos">
                    <jsp:include page="audiovisualesEvento.jsp" flush="true"></jsp:include>
                </div>

                <div id="boton" class="demo" style="float: right; margin-bottom: 20px">
                    <input class="submit" type="submit" name="siguiente" value="Siguiente >>" style="width: 85px; height: 25px; margin-right: 40px" onclick="redirect('/ProyectoBanquetes/jsp/inicio/reservar/serviciosOT/formOtros.jsp?idEvento=<%=idEvento%>')"/>
                </div>
                <div id="boton" class="demo" style="float: right; margin-bottom: 20px; margin-right: 10px">
                    <input class="submit" type="submit" name="anterior" value="<< Anterior" style="width: 85px; height: 25px;" onclick="redirect('/ProyectoBanquetes/jsp/inicio/reservar/serviciosAB/formAlimentos.jsp?idEvento=<%=idEvento%>')"/>
                </div>

                <div id="espacio"></div>
            </div>
            <jsp:include page="../../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
