<%-- 
    Document   : createEmpresa
    Created on : Sep 2, 2010, 10:12:46 AM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
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
        <title>Crear Empresa</title>
    </head>
    <script type="text/javascript">
        $(function() {
            $("button, input:submit, a", ".demo").button();

            $("a", ".demo").click(function() { return false; });
        });
    </script>

    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">CREAR EMPRESA</h1>
                <div style="height: 10px"></div>
                <div style="padding-left: 20px; background-color: #dadada; width: 30%; height: 300px">
                    <div id="espacio"></div>
                    <form method="get" action="crearEmpresa.jsp">
                        <table width="100%" border="0">
                            <tr style="height: 30px">
                                <td width="10%">RIF:</td>
                                <td width="30%">
                                    <input value="" name="rif" onKeyUp="this.value=this.value.toUpperCase();" style="width: 180px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td width="30%">Nombre:</td>
                                <td width="50%">
                                    <input value="" name="nombre" onKeyUp="this.value=this.value.toUpperCase();" style="width: 180px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td>Telefono:</td>
                                <td>
                                    <input value="" name="telefono" onKeyUp="this.value=this.value.toUpperCase();" style="width: 180px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 70px;">
                                <td>Direccion:</td>
                                <td>
                                    <textarea name="direccion" rows="4" cols="20" style="width: 181px">
                                    </textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
                            <input type="submit" name="create" value="Guardar" style="width: 65px; margin-left: 270px; margin-right: 10px" onclick=""/>
                        </div>
                    </form>
                </div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
