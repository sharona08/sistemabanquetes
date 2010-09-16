<%-- 
    Document   : updateEmpresa
    Created on : Sep 1, 2010, 4:36:29 PM
    Author     : maya
--%>
<%@page import="com.banquetes.servicios.interfaces.IServicioIva"%>
<%@page import="com.banquetes.servicios.impl.ServicioIva"%>
<%@page import="com.banquetes.dominio.Iva"%>
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
<%@page import="com.banquetes.dominio.Montaje"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioMontaje"%>
<%@page import="com.banquetes.servicios.impl.ServicioMontaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Editar IVA</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/iva/detalleIva.jsp">
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">IVA</h1>
                <%
                            IServicioIva servicioIva = new ServicioIva();
                            Iva iva = new Iva();
                            Integer id = new Integer(1);

                            iva.setId(id);
                            iva.setPorcentaje(new Double(request.getParameter("porcentaje")));

                            Boolean result = servicioIva.editarIva(iva);

                            if (result) {
                %>
                <script type="text/javascript">
                    alert("Exito! el IVA ha sido editado exitosamente.");
                </script>
                <% } else {%>
                <script type="text/javascript">
                    alert("Error! el IVA no pudo ser editado.");
                </script>

                <% }%>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
