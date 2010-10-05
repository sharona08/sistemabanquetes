<%-- 
    Document   : departamentoFiltros
    Created on : Sep 2, 2010, 1:39:46 PM
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
        <script type="text/javascript" src="../mensajeExito.js"></script>
        <title>Roles</title>
    </head>
    <body>
        <div id="pageWrap">
            <%
                        String mensaje = request.getParameter("mensaje");
                        if (mensaje != null) {
                            String id = "";
                            if (request.getParameter("id") == null) {
                                id = "";
                            } else {
                                id = request.getParameter("id");
                            }
                            String nombre = "";
                            if (request.getParameter("nombre") == null) {
                                nombre = "";
                            } else {
                                nombre = request.getParameter("nombre");
                            }
                            String texto = "";
                            if (request.getParameter("texto") == null) {
                                texto = "";
                            } else {
                                texto = request.getParameter("texto");
                            }
                            if (mensaje.equals("exito")) {

            %>

            <script type="text/javascript">
                exito();
            </script>
            <div id="info" style="float: inherit">
                Exito! <%=texto%> <a href="/ProyectoBanquetes/jsp/inicio/roles/rolFiltros.jsp?id=<%=id%>&nombre=<%= nombre%>" class="close">Cerrar</a>
            </div>
            <%                            } else if (mensaje.equals("error")) {
            %>
            <script type="text/javascript">
                error();
            </script>
            <div id="info2" style="float: inherit">
                Error! <%=texto%> <a href="/ProyectoBanquetes/jsp/inicio/roles/rolFiltros.jsp?id=<%=id%>&nombre=<%= nombre%>" class="close">Cerrar</a>
            </div>
            <%                            }
                        }
            %>

            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <%
                             String hiddenId = request.getParameter("id");
                             if (hiddenId == null) {
                                 hiddenId = "";
                             }
                            String hiddenNombre = request.getParameter("nombre");
                            if (hiddenNombre == null) {
                                hiddenNombre = "";
                            }

                %>

                <script type="text/javascript">
                    function includeDivMontajes()
                    {
                        document.getElementById("roles").style.display="block";
                    }

                    function hideDivMontajes()
                    {
                        document.getElementById("roles").style.display="none";
                    }
                </script>

                <div id="disponibilidad" style="margin-left: 10px">
                    <h1 id="letra1">ROLES</h1>

                    <form name="form" method="get" action="">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr style="height: 10px">
                                <td width="6%">&nbsp;</td>
                                <td width="17%">&nbsp;</td>
                                <td width="75%">&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>ID: </td>
                                <td>
                                    <input value="<%= hiddenId%>" name="id" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle"/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Nombre: </td>
                                <td>
                                    <input value="<%= hiddenNombre%>" name="nombre" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle"/>
                                </td>
                                <td>
                                    <div id="boton" class="demo">
                                        <input type="submit" name="ok" value="Ok" style="width: 35px; height: 25px;" align="middle" onclick="includeDivMontajes()"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </form>
                </div>

                <div id="roles" style="margin-left: 10px">
                    <jsp:include page="roles.jsp" flush="true"></jsp:include>
                </div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
