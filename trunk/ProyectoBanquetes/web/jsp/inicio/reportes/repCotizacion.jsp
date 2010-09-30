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
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/reportes/formCotizacion.jsp"/>
    </head>
    <body>

        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Cotizacion</h1>
                <%
                            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));

                            IServicioReserva servicioReserva = new ServicioReserva();
                            Double montoTotal = servicioReserva.costoTotalReserva(idEvento);
                            Double totalSalones = servicioReserva.costoTotalSalones(idEvento);
                            Double totalAB = servicioReserva.costoTotalServicios(idEvento, "AB");
                            Double totalAU = servicioReserva.costoTotalServicios(idEvento, "AU");
                            Double totalOT = servicioReserva.costoTotalServicios(idEvento, "OT");
                            Double totalIVA = servicioReserva.ivaReserva(idEvento);
                            Double totalServicio = servicioReserva.diezPorciento(idEvento);
                            Double subtotal = servicioReserva.subtotalReserva(idEvento);

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

                                masterReport = JasperCompileManager.compileReport(application.getRealPath("jsp/inicio/reportes/jasper/reporteCotizacion.jrxml"));

                                Map masterParams = new HashMap();
                                masterParams.put("idEvento", idEvento);
                                masterParams.put("rutaInicio", application.getRealPath("jsp/inicio/reportes/jasper/reporteCotizacionInicio.jasper"));
                                masterParams.put("rutaSalones", application.getRealPath("jsp/inicio/reportes/jasper/reporteCotizacionSubreporteSalones.jasper"));
                                masterParams.put("rutaAB", application.getRealPath("jsp/inicio/reportes/jasper/reporteCotizacionServiciosAB.jasper"));
                                masterParams.put("rutaAU", application.getRealPath("jsp/inicio/reportes/jasper/reporteCotizacionServiciosAU.jasper"));
                                masterParams.put("rutaOT", application.getRealPath("jsp/inicio/reportes/jasper/reporteCotizacionServiciosOT.jasper"));
                                masterParams.put("rutaFin", application.getRealPath("jsp/inicio/reportes/jasper/reporteCotizacionFin.jasper"));
                                masterParams.put("montoTotal", montoTotal);
                                masterParams.put("totalSalones", totalSalones);
                                masterParams.put("totalAB", totalAB);
                                masterParams.put("totalAU", totalAU);
                                masterParams.put("totalOT", totalOT);
                                masterParams.put("totalIVA", totalIVA);
                                masterParams.put("totalServicio", totalServicio);
                                masterParams.put("subtotal", subtotal);
                                masterParams.put("username", username);

                                jasperPrint = JasperFillManager.fillReport(masterReport, masterParams, conn);
                                JasperExportManager.exportReportToPdfFile(jasperPrint, application.getRealPath("jsp/inicio/reportes/PDF/cotizacion" + idEvento + "PDF.pdf"));
                                File file = new File(application.getRealPath("jsp/inicio/reportes/PDF/cotizacion" + idEvento + "PDF.pdf"));

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
