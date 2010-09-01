<%-- 
    Document   : empresa
    Created on : Sep 1, 2010, 11:51:46 AM
    Author     : maya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
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

        <script type="text/javascript">
            $(function() {
                $("button, input:submit, a", ".demo").button();

                $("a", ".demo").click(function() { return false; });
            });
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="pageWrap">
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
                                    <input value="<%= hiddenRif %>" name="rif" onKeyUp="this.value=this.value.toUpperCase();" style="width: 160px; height: 23px" align="middle"/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Nombre</td>
                                <td>
                                    <input value="<%= hiddenNombre %>" name="nombre" onKeyUp="this.value=this.value.toUpperCase();" style="width: 160px; height: 23px" align="middle"/>
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
