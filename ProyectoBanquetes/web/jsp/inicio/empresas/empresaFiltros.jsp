<%-- 
    Document   : empresa
    Created on : Sep 1, 2010, 11:51:46 AM
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
        <title>Empresas</title>
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
                Exito! <%=texto%> <a href="/ProyectoBanquetes/jsp/inicio/empresas/empresaFiltros.jsp?id=<%=id%>&nombre=<%= nombre%>" class="close">Cerrar</a>
            </div>
            <%                            } else if (mensaje.equals("error")) {
            %>
            <script type="text/javascript">
                error();
            </script>
            <div id="info2" style="float: inherit">
                Error! <%=texto%> <a href="/ProyectoBanquetes/jsp/inicio/empresas/empresaFiltros.jsp?id=<%=id%>&nombre=<%= nombre%>" class="close">Cerrar</a>
            </div>
            <%                            }
                        }
            %>

            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <%
                            String hiddenRif = request.getParameter("rif");
                            if (hiddenRif == null) {
                                hiddenRif = "";
                            }
                            String hiddenNombre = request.getParameter("nombre");
                            if (hiddenNombre == null) {
                                hiddenNombre = "";
                            }

                            Boolean check = Boolean.FALSE;
                            if (request.getParameter("inhabilitados") != null) {
                                check = Boolean.TRUE;
                            } else {
                                check = Boolean.FALSE;
                            }
                %>

                <script type="text/javascript">
                    function includeDivEmpresas()
                    {
                        document.getElementById("empresas").style.display="block";
                    }

                    function hideDivEmpresas()
                    {
                        document.getElementById("empresas").style.display="none";
                    }
                </script>

                <div id="disponibilidad" style="margin-left: 10px">
                    <h1 id="letra1">EMPRESAS</h1>

                    <form name="form" method="get" action="">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr style="height: 10px">
                                <td width="12%">&nbsp;</td>
                                <td width="15%">&nbsp;</td>
                                <td width="73%">&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Mostrar Inhabilitados </td>
                                <td>
                                    <% if (check) {%>
                                    <input type="checkbox" name="inhabilitados" value="ON" checked/>
                                    <% } else {%>
                                    <input type="checkbox" name="inhabilitados" value="ON" />
                                    <% }%>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Rif</td>
                                <td>
                                    <input value="<%= hiddenRif%>" name="rif" onKeyUp="this.value=this.value.toUpperCase();" style="width: 160px; height: 23px" align="middle"/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Nombre</td>
                                <td>
                                    <input value="<%= hiddenNombre%>" name="nombre" onKeyUp="this.value=this.value.toUpperCase();" style="width: 160px; height: 23px" align="middle"/>
                                </td>
                                <td>
                                    <div id="boton" class="demo">
                                        <input type="submit" name="ok" value="Ok" style="width: 35px; height: 25px;" align="middle" onclick="includeDivEmpresas()"/>
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

                <div id="empresas" style="margin-left: 10px">
                    <jsp:include page="empresas.jsp" flush="true"></jsp:include>
                </div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
