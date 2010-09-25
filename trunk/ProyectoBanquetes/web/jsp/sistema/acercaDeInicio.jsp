<%-- 
    Document   : acercaDeInicio
    Created on : Sep 25, 2010, 2:53:52 PM
    Author     : maya
--%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="java.util.Date"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Acerca De</title>
        <jsp:include page="../include/head.jsp"></jsp:include>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>

    <body>
        <div id="pageWrap">
            <jsp:include page="../include/menuInicio.jsp"></jsp:include>
            <div id="content">

                <div id="disponibilidad" style="margin-left: 40px; margin-right: 90px">
                    <h1 id="letra1">Acerca del Sistema</h1>
                    <div id="espacio"></div>
                    Este sistema fue diseñado y desarrollado por <label style="font-weight: bold">María Alejandra Uribe | </label>  <label style="font-weight: bold; color: #115599">contacto: mariale.uribe@gmail.com</label>
                    <div style="height: 20px"></div>
                    
                    <div style="margin-bottom: 5px">El mismo tiene como principal objetivo la gestión de reserva de eventos.</div>

                    <div style="height: 15px"></div>

                    <div style="margin-bottom: 5px">Entre las operaciones que se pueden realizar se encuentran:</div>

                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">-</label> Realizar una reserva de forma intuitiva, así mismo como modificarla.</div>
                    
                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">-</label> Permite identificar fácilmente la disponibilidad de salones entre el rango de fechas deseadas, así como </div>
                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">&nbsp;</label> se puede distinguir fácilmente el estado de los eventos en el sistema (tentativos, confirmados o anulados).</div>

                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">-</label> Manejo de dependencia entre salones.</div>

                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">-</label> Gestión de mantenimiento:</div>

                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">&nbsp;</label> El sistema permite realizar el mantenimiento (crear, editar, habilitar/inhabilitar) de distintos módulos del sistema como lo son:</div>

                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 40px; margin-right: 10px;">-</label> Salones</div>
                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 40px; margin-right: 10px;">-</label> Montajes</div>
                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 40px; margin-right: 10px;">-</label> Servicios (Alimentos y bebidas, Equipos audiovisuales, y otros servicios)</div>
                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 40px; margin-right: 10px;">-</label> Empresas</div>
                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 40px; margin-right: 10px;">-</label> Personas de Contacto</div>

                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">-</label> Manejo de la cuenta de usuario, el cual permite modificar los datos del usuario logueado, así como su contraseña.</div>
                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">-</label> Además el sistema posee manejo de usuarios, lo cual permite dos vistas diferentes, una para el administrador, quien será</div>
                    <div style="margin-bottom: 5px"><label style="font-weight: bold; margin-left: 20px; margin-right: 10px;">&nbsp;</label> capaz de manejar los distintos usuarios del sistema y otra para otros usuarios quienes tienen acceso a las otras caracteristicas del mismo.</div>
               
                </div>
                <div id="espacio"></div>
                <div id="espacio"></div>
            </div>
            <jsp:include page="../include/footerInicio.jsp"></jsp:include>
        </div>
    </body>
</html>