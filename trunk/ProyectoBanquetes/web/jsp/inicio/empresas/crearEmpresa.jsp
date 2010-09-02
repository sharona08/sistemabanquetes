<%-- 
    Document   : crearEmpresa
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>

<%@page import="sun.org.mozilla.javascript.internal.JavaScriptException"%>
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
        <title>Crear Empresa</title>
        <!--        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/empresas/empresaFiltros.jsp"/>-->
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Crear Empresa</h1>
                <%
                            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();
                            Empresa empresa = new Empresa();
                            empresa.setRif(request.getParameter("rif"));
                            empresa.setNombre(request.getParameter("nombre"));
                            empresa.setTelefono(request.getParameter("telefono"));
                            empresa.setDireccion(request.getParameter("direccion"));
                            empresa.setHabilitado(true);

                            Boolean existe = servicioEmpresa.existeEmpresa(empresa);
                            if (!existe) {
                                Boolean result = servicioEmpresa.crearEmpresa(empresa);
                                if (result) {
                %>
                <script type="text/javascript">
                    alert("Exito! la empresa ha sido registrada exitosamente.");
                </script>
                <% } else {
                %>
                <script type="text/javascript">
                    alert("Error! la empresa no se pudo registrar.");
                </script>
                <%                                                }
                                            } else {
                %>
                <script type="text/javascript">
                    alert("Error! la empresa ya esta registrada.");
                </script>
                <%                            }
                %>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
