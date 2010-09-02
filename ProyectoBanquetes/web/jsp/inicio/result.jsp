<%@page import="javax.swing.text.Document"%>
<%@page import="com.banquetes.util.UtilMethods"%>
<%@page import="com.banquetes.servicios.TO.DisponibilidadSalonTO"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    $(function() {
        $("button, input:submit, a", ".demo").button();

        $("a", ".demo").click(function() { return false; });
    });
</script>

<script type="text/javascript">
    function includeDiv()
    {
        document.getElementById("toggleText").style.display="block";
    }
    function hideDiv()
    {
        document.getElementById("toggleText").style.display="none";
    }
</script>

<script type="text/javascript">
    var value;
    function rowValue(fila){
        var table = document.getElementById("tableId");
        var row = table.rows[fila];
        var cell = row.cells[0];
        var content = cell.firstChild.nodeValue;
        alert(content);
        return content
    }

</script>

<%!    UtilMethods util = new UtilMethods();%>

<%
            Integer cont = 0;
            String fechaInicioJSP = request.getParameter("fechaInicio");
            String fechaFinJSP = request.getParameter("fechaFin");
            String salonJSP = request.getParameter("salon");
%>

<div id="resultDisponibilidad" style="margin-right: 10px">
    <table id="tableId" width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr align="center" style="height: 30px; background-color: #919999; border-color: #556270; font-weight: bolder; color: white">
            <td width="4%">ID</td>
            <td width="8%">Fecha</td>
            <td width="8%">Disponible</td>
            <td width="72%">Evento</td>
            <td width="8%">Opcion</td>
        </tr>
        <%
                    IServicioSalon iServicioSalon2 = new ServicioSalon();
                    List<Date> fechas = util.listarFechas(fechaInicioJSP, fechaFinJSP);
                    for (Date fecha1 : fechas) {
                        java.util.Date utilFecha = fecha1;
                        java.sql.Date sqlFecha = new java.sql.Date(utilFecha.getTime());
                        List<DisponibilidadSalonTO> disponibles;
                        if (request.getParameter("anulados") != null) {
                            disponibles = iServicioSalon2.listarDisponibilidadSalonesAnulados(salonJSP, sqlFecha);
                        } else {
                            disponibles = iServicioSalon2.listarDisponibilidadSalones(salonJSP, sqlFecha);
                        }
        %>

        <%

                                for (DisponibilidadSalonTO d : disponibles) {
                                    cont++;

        %>

        <% if (d.getEstadoEvento().equals("T")) {%>

        <tr align="center" style="height: 25px" bgcolor="#FFF05F">
            <%  } else if (d.getEstadoEvento().equals("C")) {

            %>
        <tr align="center" style="height: 25px" bgcolor="#94CA3D">

            <% } else if (request.getParameter("anulados") != null) {
                 if (d.getEstadoEvento().equals("A")) {

            %>

        <tr align="center" style="height: 25px" bgcolor="#FF8080">
<!--        <tr align="center" style="height: 25px" bgcolor="#FC5454">-->

            <% }%>
            <% }%>

            <td><%= d.getIdEvento()%></td>
            <td><%= sqlFecha.toString()%></td>
            <td>
                <h2>NO</h2>
            </td>
            <td>
                <% out.print(d.getNombreEmpresa() + ", CONTACTO: " + d.getNombreContacto() + " : "+ d.getNombreEvento() + ". INICIO: " + d.getFechaInicio() + ". FIN: " + d.getFechaFin());%>
            </td>
            <td>
                <div id="boton" class="demo">
                    <form method="get" action="">
                        <input type="hidden" id="fechaInicio" name="fechaInicio" value="<%= fechaInicioJSP%>">
                        <input type="hidden" id="fechaFin" name="fechaFin" value="<%= fechaFinJSP%>">
                        <input type="hidden" id="fecha" name="fecha" value="<%= sqlFecha%>">
                        <input type="hidden" id="salon" name="salon" value="<%= d.getNombreSalon()%>">
                        <input type="hidden" id="ok" name="ok" value="OK">
                        <input type="hidden" id="ID" name="ID" value="<%= d.getIdEvento()%>">
                        <% if(request.getParameter("anulados")!=null) {%>
                        <input type="hidden" id="anulados" name="anulados" value="<%= request.getParameter("anulados")%>">
                        <% }%>
                        <input type="submit" name="editar" value="Editar" style="width: 65px; margin-top: 1px; margin-bottom: 1px;" onclick=""/>
                    </form>
                </div>

            </td>
        </tr>

        <% }

                                if (disponibles.isEmpty()) {
                                    cont++;
        %>
        <tr align="center" style="height: 25px">
            <td> -- </td>
            <td><%= sqlFecha.toString()%></td>
            <td>
                SI
            </td>
            <td> -- </td>
            <td>
                <div id="boton" class="demo">
                    <input type="submit" name="reservar" value="Reservar " style="width: 65px; margin-top: 1px; margin-bottom: 1px;"/>
                </div>
            </td>
        </tr>

        <% }%>

        <% }%>
    </table>
</div>

<div id="espacio"></div>
<%
            if (request.getParameter("ID") != null) {%>

<div id="toggleText" style="width: 40%; min-height: 300px; background-color: #B9B9B9; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px">
    <jsp:include page="../inicio/infoReserva.jsp">
        <jsp:param name="fechaInicio" value="<%= fechaInicioJSP%>"></jsp:param>
        <jsp:param name="fechaFin" value="<%= fechaFinJSP%>"></jsp:param>
        <jsp:param name="salon" value="<%= request.getParameter("salon")%>"></jsp:param>
        <jsp:param name="ID" value="<%= request.getParameter("ID")%>"></jsp:param>
    </jsp:include>
</div>

<%  } %>

<div id="espacio"></div>