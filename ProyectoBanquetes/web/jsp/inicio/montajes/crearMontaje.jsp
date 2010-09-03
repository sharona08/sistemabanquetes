<%-- 
    Document   : crearEmpresa
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Crear Montaje</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/montajes/montajeFiltros.jsp"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Montaje</h1>
                <%
                            IServicioMontaje servicioMontaje = new ServicioMontaje();
                            Montaje montaje = new Montaje();

                            montaje.setTipoMontaje(request.getParameter("nombre"));

                            Integer result = servicioMontaje.crearMontaje(montaje);
                            if (result != null) {
                %>
                <script type="text/javascript">
                    alert("Exito! el montaje ha sido registrado exitosamente.");
                </script> 
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el montaje no se pudo registrar.");
                </script>
                <% }%>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
