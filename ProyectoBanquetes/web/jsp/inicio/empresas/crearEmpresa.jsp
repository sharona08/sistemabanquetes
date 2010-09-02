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
        <link rel="stylesheet" href="../../datepicker/css/datepicker.css" type="text/css" />
        <link rel="stylesheet" media="screen" type="text/css" href="../../datepicker/css/layout.css" />
        <script type="text/javascript" src="../../datepicker/js/jquery.js"></script>
        <script type="text/javascript" src="../../datepicker/js/datepicker.js"></script>
        <script type="text/javascript" src="../../datepicker/js/eye.js"></script>
        <script type="text/javascript" src="../../datepicker/js/utils.js"></script>
        <script type="text/javascript" src="../../datepicker/js/layout.js?ver=1.0.2"></script>
        <link rel="stylesheet" type="text/css" href="../../css/home.css" />
        <link rel="stylesheet" type="text/css" href="../../css/disponibilidad.css" />
        <link rel="stylesheet" type="text/css" href="../../dropDown/dropDown.css" />
        <script type="text/javascript" src="../../dropDown/stuHover.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>
        <link type="text/css" href="../../jQuery/css/jquery.ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="../../jQuery/js/jquery-1.4.2.js"></script>
        <script type="text/javascript" src="../../jQuery/js/jquery.ui.core.js"></script>
        <script type="text/javascript" src="../../jQuery/js/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="../../jQuery/js/jquery.ui.button.js"></script>
        <link type="text/css" href="../../jQuery/css/demos.css" rel="stylesheet" />
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
