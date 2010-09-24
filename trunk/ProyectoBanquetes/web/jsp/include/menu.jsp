<%-- 
    Document   : menu
    Created on : Aug 12, 2010, 3:36:35 PM
    Author     : maya
--%>
<%@page import="com.banquetes.dominio.Usuario"%>
<%@page import="com.banquetes.servicios.impl.ServicioUsuario"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioUsuario"%>
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
<div id="header">
    <div id="headerTop">
        <div style="float: right; margin-right: 50px; margin-top: 50px">

            <label>Bienvenido, <%=nombre%> | <a href="/ProyectoBanquetes/jsp/login/logout.jsp">cerrar sesion</a></label>
        </div>
        <!--        <div id="warning" class="ui-widget" style="position: absolute; float: inherit; width: 100%">
                    <div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em;">
                        <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                            <strong>Hey!</strong> Sample ui-state-highlight style.</p>
                    </div>
                </div>-->

        <!--        <div id="error" class="ui-widget">
                    <div class="ui-state-error ui-corner-all" style="padding: 0 .7em; color: white">
                        <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                            <strong>Alert:</strong> Sample ui-state-error style.</p>
                    </div>
                </div>-->

        <!--        <div id="logo">
                    <a href="/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp"></a>
                </div>-->
    </div>
    <ul id="nav">
        <li class="top"><a href="/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp" class="top_link"><span>Inicio</span></a></li>
        <li class="top"><a href="" id="products" class="top_link"><span class="down">Mantenimiento</span></a>
            <ul class="sub">
                <li class="mid"><a href="" class="fly">Servicios</a>
                    <ul>
                        <li><a href="/ProyectoBanquetes/jsp/inicio/alimentosBebidas/alimentoFiltros.jsp">Alimentos y Bebidas</a></li>
                        <li><a href="/ProyectoBanquetes/jsp/inicio/audiovisuales/audiovisualFiltros.jsp">Audiovisuales</a></li>
                        <li><a href="/ProyectoBanquetes/jsp/inicio/otros/otroFiltros.jsp">Otros</a></li>
                    </ul>
                </li>
                <li class="mid"><a href="/ProyectoBanquetes/jsp/inicio/empresas/empresaFiltros.jsp" class="fly">Empresas</a>
                    <ul>
                        <li><a href="/ProyectoBanquetes/jsp/inicio/contactos/contactoFiltros.jsp">Contactos</a></li>
                    </ul>
                </li>
                <li><a href="/ProyectoBanquetes/jsp/inicio/salones/salonFiltros.jsp">Salones</a></li>
                <li><a href="/ProyectoBanquetes/jsp/inicio/montajes/montajeFiltros.jsp">Montajes</a></li>
                <li><a href="/ProyectoBanquetes/jsp/inicio/departamentos/departamentoFiltros.jsp">Departamentos</a></li>
            </ul>
        </li>
        <li class="top"><a href="" id="services" class="top_link"><span class="down">Reportes</span></a>
            <ul class="sub" >
                <li><a href="/ProyectoBanquetes/jsp/inicio/reportes/formOrdenServicio.jsp">Orden de Servicio</a></li>
                <li><a href="/ProyectoBanquetes/jsp/inicio/reportes/formCotizacion.jsp">Cotización</a></li>
                <li><a href="">Servicio más vendido</a></li>
                <li><a href="">Salón más vendido</a></li>
                <li><a href="">Ventas salón</a></li>
                <li><a href="">Cierre ventas</a></li>
            </ul>
        </li>
        <li class="top"><a href="" id="contacts" class="top_link"><span class="down">Reserva</span></a>
            <ul class="sub">
                <li><a href="/ProyectoBanquetes/jsp/inicio/verReservaID.jsp">Ver Reserva</a></li>
                <li><a href="/ProyectoBanquetes/jsp/inicio/editarReservaID.jsp">Editar Reserva</a></li>
            </ul>
        </li>
<!--        <li class="top"><a href="" id="shop" class="top_link"><span class="down">Disponibilidad</span></a>
            <ul class="sub">
                <li><a href="">Salones</a></li>
            </ul>
        </li>-->
        <%
                    if (usuario.getIdRol().equals(new Integer(1))) {
        %>
        <li class="top"><a href="/ProyectoBanquetes/jsp/inicio/usuarios/usuarioFiltros.jsp" id="shop" class="top_link"><span class="down">Usuarios</span></a>
            <ul class="sub">
                <li><a href="/ProyectoBanquetes/jsp/inicio/roles/rolFiltros.jsp">Roles</a></li>
            </ul>
        </li>
        <li class="top"><a href="/ProyectoBanquetes/jsp/inicio/iva/detalleIva.jsp" id="privacy" class="top_link"><span>IVA</span></a></li>
        <% } %>
        <li class="top"><a href="/ProyectoBanquetes/jsp/inicio/usuarios/detalleMiCuenta.jsp" id="privacy" class="top_link"><span>Mi Cuenta</span></a></li>

        <li class="top"><a href="#nogo57" id="privacy" class="top_link"><span>Acerca De</span></a></li>
        <li class="top2">&nbsp;</li>
        <li class="top3">&nbsp;</li>
    </ul>
</div>