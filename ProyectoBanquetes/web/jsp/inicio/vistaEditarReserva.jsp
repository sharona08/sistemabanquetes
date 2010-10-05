<%-- 
    Document   : vistaEditarReserva
    Created on : Sep 14, 2010, 9:47:30 PM
    Author     : maya
--%>
<%@ page session="true" %>

<%
            String nombre = "";
            HttpSession sesionOk = request.getSession();
            if (sesionOk.getAttribute("username") == null) {
%>

<meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/login/login.jsp?error=Coloca tus datos">

<%            } else {
                nombre = (String) sesionOk.getAttribute("username");
            }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../include/head.jsp"></jsp:include>
        <title>Editar Reserva</title>
        <script type="text/javascript">
            $(function() {
                $("button, input:submit, a", ".demo").button();

                $("a", ".demo").click(function() { return false; });
            });
        </script>
        <script type="text/javascript">
            function redirect(url){
                window.location.href=url;
            }
        </script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#commentForm").validate();
            });
        </script>
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">
                <div id="espacio"></div>

                <div id="toggleText" style="width: 40%; min-height: 300px; background-color: #dadada; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px">
                    <jsp:include page="../inicio/infoReserva2.jsp">
                        <jsp:param name="ID" value="<%= request.getParameter("ID")%>"></jsp:param>
                    </jsp:include>
                </div>

                <div id="espacio"></div>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
