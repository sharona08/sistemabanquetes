<%-- 
    Document   : reservar
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page import="com.banquetes.servicios.impl.ServicioEventoSala"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEventoSala"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.IOException"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.io.File"%>
<%@page import="com.banquetes.reportes.ConexionReportes"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="com.banquetes.reportes.Reportes"%>
<%@page import="java.util.List"%>
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

<%@page import="java.sql.Time"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <title>Reservar</title>
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/reportes/formCierreMes.jsp"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Cotizacion</h1>
                <%
                            String mes = request.getParameter("mes");
                            String ano = request.getParameter("ano");

                            Connection conn = null;

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banquetes", "root", "admin");
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                            JasperPrint jasperPrint;

                            try {
                                JasperReport masterReport = null;

                                masterReport = JasperCompileManager.compileReport(application.getRealPath("jsp/inicio/reportes/jasper/repCierreMes.jrxml"));

                                Map masterParams = new HashMap();
                                masterParams.put("rutaSalones", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesServiciosSalones.jasper"));
                                masterParams.put("rutaAB", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesServiciosAB.jasper"));
                                masterParams.put("rutaAU", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesServiciosAU.jasper"));
                                masterParams.put("rutaOT", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesServiciosOT.jasper"));
                                masterParams.put("rutaTotal", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesTOTAL.jasper"));
                                masterParams.put("rutaSubtotalSalones", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesSubtotalSalones.jasper"));
                                masterParams.put("rutaSubtotalAB", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesSubtotalAB.jasper"));
                                masterParams.put("rutaSubtotalAU", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesSubtotalAU.jasper"));
                                masterParams.put("rutaSubtotalOT", application.getRealPath("jsp/inicio/reportes/jasper/repCierreMesSubtotalOT.jasper"));
                                masterParams.put("mes", mes);
                                masterParams.put("ano", ano);

                                jasperPrint = JasperFillManager.fillReport(masterReport, masterParams, conn);
                                JasperExportManager.exportReportToPdfFile(jasperPrint, application.getRealPath("jsp/inicio/reportes/PDF/cierreMes" + mes + "-" + ano + "PDF.pdf"));
                                File file = new File(application.getRealPath("jsp/inicio/reportes/PDF/cierreMes" + mes + "-" + ano + "PDF.pdf"));

                                Desktop.getDesktop().open(file);

                            } catch (IOException ex) {
                                Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
                            } catch (JRException e) {
                                e.printStackTrace();
                            }

                %>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
