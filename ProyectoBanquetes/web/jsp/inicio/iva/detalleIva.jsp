<%-- 
    Document   : detalleEmpresa
    Created on : Sep 1, 2010, 3:36:56 PM
    Author     : maya
--%>

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

<%@page import="com.banquetes.dominio.Iva"%>
<%@page import="com.banquetes.servicios.impl.ServicioIva"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioIva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headInicio.jsp"></jsp:include>
        <script type="text/javascript">
            $(function() {
                $("button, input:submit, a", ".demo").button();

                $("a", ".demo").click(function() { return false; });
            });
        </script>
        <script type="text/javascript" src="../../js/jquery.validate.js"></script>
        <style type="text/css">
/*            label { width: 10em; float: left; }*/
            label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
            p { clear: both; }
            .submit { margin-left: 12em; }
            em { font-weight: bold; padding-right: 1em; vertical-align: top; }
        </style>

        <script>
            $(document).ready(function(){
                $("#commentForm").validate();
            });
        </script>
        <script type="text/javascript">
            function redirect(url){
                window.location.href=url;
            }
        </script>
        <title>IVA</title>
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <%
                            Integer id = new Integer(1);

                            IServicioIva servicioIva = new ServicioIva();
                            Iva iva = servicioIva.getIva(id);

                %>

                <div id="disponibilidad" style="margin-left: 10px">

                    <h1 id="letra1">IVA</h1>
                        <form method="get" action="updateIva.jsp" class="cmxform" id="commentForm">
                            <table width="40%" border="0">
                                <tr style="height: 40px">
                                    <td width="10%">Nombre:</td>
                                    <td width="30%">
                                        <input class="required" value="<%= iva.getPorcentaje()%>" name="porcentaje" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
                                <input type="submit" value="Guardar" style="width: 65px; margin-left: 175px; margin-right: 10px" onclick=""/>
                            </div>
                        </form>
                        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
                            <input type="submit" value="Cancelar" onclick="redirect('/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp')" style="width: 65px;"/>
                        </div>
                    </div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>