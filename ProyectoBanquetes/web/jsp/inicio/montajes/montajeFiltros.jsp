<%-- 
    Document   : departamentoFiltros
    Created on : Sep 2, 2010, 1:39:46 PM
    Author     : maya
--%>

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
        <title>Montajes</title>
    </head>
    <body>
        <div id="pageWrap">
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
                        document.getElementById("montajes").style.display="block";
                    }

                    function hideDivMontajes()
                    {
                        document.getElementById("montajes").style.display="none";
                    }
                </script>

                <div id="disponibilidad" style="margin-left: 10px">
                    <h1 id="letra1">MONTAJES</h1>

                    <form name="form" method="get" action="">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr style="height: 10px">
                                <td width="12%">&nbsp;</td>
                                <td width="15%">&nbsp;</td>
                                <td width="73%">&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td>ID</td>
                                <td>
                                    <input value="<%= hiddenId%>" name="id" onKeyUp="this.value=this.value.toUpperCase();" style="width: 160px; height: 23px" align="middle"/>
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

                <div id="montajes" style="margin-left: 10px">
                    <jsp:include page="montajes.jsp" flush="true"></jsp:include>
                </div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
