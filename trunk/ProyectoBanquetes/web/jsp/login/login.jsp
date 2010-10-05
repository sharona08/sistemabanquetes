<%-- 
    Document   : index
    Created on : Sep 10, 2010, 11:21:59 AM
    Author     : maya
--%>

<%@page import="javax.swing.UnsupportedLookAndFeelException"%>
<%@page import="javax.swing.UIManager"%>
<%@page contentType="text/html; charset=iso-8859-1" session="true" language="java" import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Iniciar Sesion</title>
        <link rel="stylesheet" href="../datepicker/css/datepicker.css" type="text/css" />
        <link rel="stylesheet" media="screen" type="text/css" href="../datepicker/css/layout.css" />
        <script type="text/javascript" src="../datepicker/js/jquery.js"></script>
        <script type="text/javascript" src="../datepicker/js/datepicker.js"></script>
        <script type="text/javascript" src="../datepicker/js/eye.js"></script>
        <script type="text/javascript" src="../datepicker/js/utils.js"></script>
        <script type="text/javascript" src="../datepicker/js/layout.js?ver=1.0.2"></script>

        <link rel="stylesheet" type="text/css" href="../css/home.css" />
        <link rel="stylesheet" type="text/css" href="../css/disponibilidad.css" />
        <link rel="stylesheet" type="text/css" href="../dropDown/dropDown.css" />

        <script type="text/javascript" src="../dropDown/stuHover.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>

        <link type="text/css" href="../jQuery/css/jquery.ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="../jQuery/js/jquery-1.4.2.js"></script>
        <script type="text/javascript" src="../jQuery/js/jquery.ui.core.js"></script>
        <script type="text/javascript" src="../jQuery/js/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="../jQuery/js/jquery.ui.button.js"></script>
        <link type="text/css" href="../jQuery/css/demos.css" rel="stylesheet" />
        <script type="text/javascript">
            $(function() {
                $("button, input:submit, a", ".demo").button();

                $("a", ".demo").click(function() { return false; });
            });
        </script>
        <script type="text/javascript" src="../../jsp/js/jquery.validate.js"></script>
        <style type="text/css">
            label { width: 10em; float: left; }
            label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
            p { clear: both; }
            .submit { margin-left: 12em; }
            em { font-weight: bold; padding-right: 1em; vertical-align: top; }
        </style>

        <script type="text/javascript" >
            $(document).ready(function(){
                $("#commentForm").validate();
            });
        </script>
    </head>

    <body>
        <%
                    try {
                        // Set System L&F
                        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
                    } catch (UnsupportedLookAndFeelException e) {
                        // handle exception
                    } catch (ClassNotFoundException e) {
                        // handle exception
                    } catch (InstantiationException e) {
                        // handle exception
                    } catch (IllegalAccessException e) {
                        // handle exception
                    }

                    if (request.getParameter("error") != null) {
        %>
        <div id="error" class="ui-widget">
            <div class="ui-state-error ui-corner-all" style="padding: 0 .7em; color: white">
                <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                    <strong>Alert:</strong> <%=request.getParameter("error")%></p>
            </div>
        </div>
        <%  }%>
        <%
                    String nombre = (String) session.getAttribute("username");
                    if (nombre != null) {
                        out.println("Bienvenido  " + nombre + "  , <a href=\"logout.jsp\" >Salir</a>");
                    } else {
        %>
        <div id="pageWrap">
            <jsp:include page="../include/menuInicio.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">BIENVENIDO!</h1>
                <form action="../login/comprobar.jsp" method="post" class="cmxform" id="commentForm">
                    <label>Introduce tus datos:</label><br><br>
                    <fieldset>
                        <table width="25%">
                            <tr style="height: 40px;">
                                <td width="5%">Nombre:</td>
                                <td width="20%">
                                    <input class="required" type="text" name="username" style="width: 100%; height: 23px" align="middle" onKeyUp="this.value=this.value.toUpperCase();" ><br>
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td>Contrase&ntilde;a:</td>
                                <td>
                                    <input class="required" type="password" name="password" style="width: 100%; height: 23px" align="middle"><br>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="height: 40px;">
                                <td>&nbsp;</td>
                                <td>
                                    <div id="boton" class="demo" style="float: right; margin-bottom: 20px">
                                        <input class="submit" type="submit" value="Entrar"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <% }%>
                </form>
            </div>
            <jsp:include page="../include/footerInicio.jsp"></jsp:include>
        </div>
    </body>
</html>


