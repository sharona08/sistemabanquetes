<%-- 
    Document   : updateEmpresa
    Created on : Sep 1, 2010, 4:36:29 PM
    Author     : maya
--%>
<%@page import="javax.swing.JOptionPane"%>
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
        
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">IVA</h1>
                <%
                String mensaje = "";
                    String texto = "";
                            IServicioIva servicioIva = new ServicioIva();
                            Iva iva = new Iva();
                            Integer id = new Integer(1);

                            iva.setId(id);
                            iva.setPorcentaje(new Double(request.getParameter("porcentaje")));

                            Boolean result = servicioIva.editarIva(iva);

                            if (result) {
                                mensaje = "exito";
                                texto = "El IVA ha sido editado exitosamente.";

                            } else {
                                mensaje = "error";
                                texto = "El IVA no pudo ser editado.";
                            }
                %>
            </div>
            <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/iva/detalleIva.jsp?mensaje=<%=mensaje%>&texto=<%=texto%>">
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
