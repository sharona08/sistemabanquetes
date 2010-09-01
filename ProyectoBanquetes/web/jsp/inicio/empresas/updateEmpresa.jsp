<%-- 
    Document   : updateEmpresa
    Created on : Sep 1, 2010, 4:36:29 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Editar empresa</title>
        <%
                    String hiddenRif = "";
                    if (request.getParameter("hiddenRif") == null) {
                        hiddenRif = "";
                    } else {
                        hiddenRif = request.getParameter("hiddenRif");
                    }
                    String rif = "";
                    if (request.getParameter("rif") == null) {
                        rif = "";
                    } else {
                        rif = request.getParameter("rif");
                     }
                    String nombre = "";
                    if (request.getParameter("nombre") == null) {
                        nombre = "";
                    } else {
                        nombre = request.getParameter("nombre");
                    }
        %>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/empresas/empresaFiltros.jsp?rif=<%= rif%>&nombre=<%= nombre%>">
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">EMPRESAS</h1>
                <%
                            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();
                            Empresa empresa = new Empresa();
                            out.print(hiddenRif + ", ");
                            out.print(request.getParameter("nombreEmpresa") + ", ");
                            out.print(request.getParameter("telefono") + ", ");
                            out.print(request.getParameter("direccion"));
                            empresa.setRif(hiddenRif);
                            empresa.setNombre(request.getParameter("nombreEmpresa"));
                            empresa.setTelefono(request.getParameter("telefono"));
                            empresa.setDireccion(request.getParameter("direccion"));

                            Boolean habilitado = null;
                            String estadoActual = request.getParameter("estados");

                            if (estadoActual.equals("HABILITADO")) {
                                habilitado = Boolean.TRUE;
                            } else if (estadoActual.equals("INHABILITADO")) {
                                habilitado = Boolean.FALSE;
                            }

                            empresa.setHabilitado(habilitado);

                            servicioEmpresa.editarEmpresa(empresa);
                %>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
