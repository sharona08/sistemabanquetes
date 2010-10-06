<%--
    Document   : acercaDe
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
        <title>Politicas de Uso</title>
        <jsp:include page="../include/head.jsp"></jsp:include>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>

    <body>
        <div id="pageWrap">
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">

                <div id="disponibilidad" style="margin-left: 40px; margin-right: 90px; text-align: justify">
                    <h1 id="letra1">Políticas de Uso</h1>
                    <div id="espacio"></div>
                    Este sistema fue diseñado y desarrollado por <label style="font-weight: bold">María Alejandra Uribe Martelo | </label>  <label style="font-weight: bold; color: #115599">contacto: mariale.uribe@gmail.com</label>
                    <div style="height: 20px"></div>

                    <div style="margin-bottom: 5px">El uso de este sistema web está sujeto a los siguientes términos y condiciones, que deberán ser cumplidos por los usuarios de éste y que usted acepta, por el sólo hecho de usar el mismo.</div>

                    <div style="height: 15px"></div>

                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px;">1)</label> Maria Alejandra Uribe Martelo, en adelante "el administrador", revisara periódicamente las Politicas de uso de su sitio web, pudiendo modificarlos en cualquier momento, produciendo dichas modificaciones, sus efectos desde el momento en que son introducidas a este sitio web.</div>
                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px;">2)</label> El administrador no garantiza que el uso del sitio web se encuentre libre de error, o de virus o de cualquier otro componente de carácter dañino, ademas no es responsable del daño directo, indirecto, previsto o imprevisto, o cualquier otro, que provoque al sistema computacional del usuario, al usuario o a terceros, el uso de su sitio web, del material o de los servicios ofrecidos en éste.</div>
                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px;">3)</label> Tanto el acceso a la Web como el uso inconsentido que pueda efectuarse de la información contenida en la misma es de la exclusiva responsabilidad de quien lo realiza. El administrador no responderá de ninguna consecuencia, daño o perjuicio que pudieran derivarse de dicho acceso o uso. El administrador no se hace responsable de los errores de seguridad, que se puedan producir ni de los daños que puedan causarse al sistema informático del usuario (hardware y software), o a los ficheros o documentos almacenados en el mismo, como consecuencia de:</div>
                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px; margin-left: 25px">I)</label> La presencia de un virus en el ordenador del usuario que sea utilizado para la conexión a los servicios y contenidos de la Web.</div>
                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px; margin-left: 25px">II)</label> Mal funcionamiento del navegador.</div>
                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px; margin-left: 25px">III)</label> Del uso de versiones no actualizadas del mismo.</div>
                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px;">4)</label> El administrador es titular de los derechos de propiedad industrial referidos a sus productos y servicios. Respecto a las citas de productos y servicios de terceros, El administrador reconoce a favor de sus titulares los correspondientes derechos de propiedad industrial e intelectual, no implicando su sola mención o aparición en la Web la existencia de derechos o responsabilidad alguna de El administrador sobre los mismos, como tampoco respaldo, patrocinio, o recomendación por parte de El administrador, a no ser que se manifieste de manera expresa.</div>
                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px;">5)</label> La utilización no autorizada de la información contenida en la Web, su reventa, así como la lesión de los derechos de Propiedad Intelectual o Industrial de El administrador dará lugar a las responsabilidades legalmente establecidas.</div>
                    <div style="margin-bottom: 10px"><label style="font-weight: bold; margin-right: 5px;">6)</label> El administrador, se reserva el derecho a la privacidad y por ese motivo omite la dirección física dejando como única forma de contacto la dirección electrónica definida en este documento.</div>


                    <div style="height: 20px"></div>
                    <div id="espacio"></div>
                    <div style="text-align: center">María Alejandra Uribe Martelo © 2010</div>


                </div>
                <div style="height: 20px"></div>
                <div id="espacio"></div>
            </div>
            <jsp:include page="../include/footerInicio.jsp"></jsp:include>
        </div>
    </body>
</html>