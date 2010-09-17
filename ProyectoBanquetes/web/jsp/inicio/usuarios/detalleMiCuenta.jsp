<%-- 
    Document   : detalleEmpresa
    Created on : Sep 1, 2010, 3:36:56 PM
    Author     : maya
--%>

<%@page import="java.util.List"%>
<%@page import="com.banquetes.dominio.Usuario"%>
<%@page import="com.banquetes.dominio.Rol"%>
<%@page import="com.banquetes.dominio.Rol"%>
<%@page import="com.banquetes.servicios.impl.ServicioRol"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioRol"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioUsuario"%>
<%@page import="com.banquetes.servicios.impl.ServicioUsuario"%>
<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
            Usuario usuario = new Usuario();
            String nombre = "";
            HttpSession sesionOk = request.getSession();
            if (sesionOk.getAttribute("username") == null) {
%>

<meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/login/login.jsp?error=Coloca tus datos">

<%            } else {
                nombre = (String) sesionOk.getAttribute("username");
                IServicioUsuario servicioUsuario = new ServicioUsuario();
                usuario = servicioUsuario.getUsuario(nombre);
            }
%>

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
            label { width: 10em; float: left; }
            label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
            p { clear: both; }
            /*            .submit { margin-left: 12em; }*/
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

        <title>Editar Usuario</title>
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../../include/menu.jsp"></jsp:include>
            <div id="content">

                <h1 id="letra1">INFORMACION USUARIO: <% out.println(usuario.getUsername());%></h1>
                <div style="margin-left: 20px; margin-right: 20px; padding-top: 15px">
                    <form method="get" action="updateMiCuenta.jsp" class="cmxform" id="commentForm">
                        <table width="50%" border="0">
                            <tr style="height: 40px">
                                <td width="20%">Nombre:</td>
                                <td width="30%">
                                    <input class="required" value="<%= usuario.getNombre()%>" name="nombreUsuario" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 40px">
                                <td>Apellido:</td>
                                <td>
                                    <input class="required"  value="<%= usuario.getApellido()%>" name="apellidoUsuario" onKeyUp="this.value=this.value.toUpperCase();" style="width: 195px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr style="height: 40px">
                                <td>Correo:</td>
                                <td>
                                    <input class="required" value="<%= usuario.getCorreo()%>" name="correo" style="width: 195px; height: 23px" align="middle" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <a href="detalleMiContrasena.jsp">Deseo editar mi contrase&ntilde;a</a>
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
                        <input type="hidden" name="id" value="<%= usuario.getUsername()%>"/>
                        <input type="hidden" name="nombre" value="<%= usuario.getNombre()%>"/>
                        <input type="hidden" name="apellido" value="<%= usuario.getApellido()%>"/>
                        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
                            <input type="submit" name="update" value="Guardar" style="width: 65px; margin-left: 290px; margin-right: 10px" onclick=""/>
                        </div>
                    </form>
                    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
                        <input type="submit" value="Cancelar" onclick="redirect('/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp')" style="width: 65px;"/>
                    </div>
                    <div id="espacio"></div>
                </div>
            </div>
            <jsp:include page="../../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>