<%-- 
    Document   : detalleEmpresa
    Created on : Sep 1, 2010, 3:36:56 PM
    Author     : maya
--%>

<%@page import="com.banquetes.dominio.Contacto"%>
<%@page import="com.banquetes.servicios.impl.ServicioContacto"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioContacto"%>
<%@page import="com.banquetes.dominio.Empresa"%>
<%@page import="com.banquetes.servicios.impl.ServicioEmpresa"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            IServicioEmpresa servicioEmpresa = new ServicioEmpresa();
            Integer id = Integer.valueOf(request.getParameter("hiddenId"));
            IServicioContacto servicioContacto = new ServicioContacto();
            Contacto contacto = servicioContacto.getContacto(id);

            String telefono = "";
            if (contacto.getTelefono() == null) {
                telefono = "--";
            } else {
                telefono = contacto.getTelefono();
            }
            String direccion = "";
            if (contacto.getDireccion() == null) {
                direccion = "--";
            } else {
                direccion = contacto.getDireccion();
            }
%>

<h1 id="letra2">INFORMACION CONTACTO # <% out.println(id);%></h1>
<div id="detalle" style="margin-left: 20px; margin-right: 20px; padding-top: 15px" align="center">
    <form method="get" action="updateContacto.jsp">
        <table width="80%" border="0">
            <tr style="height: 40px">
                <td width="30%">Nombre:</td>
                <td width="50%">
                    <input value="<%= contacto.getNombre()%>" name="nombreContacto" onKeyUp="this.value=this.value.toUpperCase();" style="width: 250px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Telefono:</td>
                <td>
                    <input value="<%= telefono%>" name="telefono" onKeyUp="this.value=this.value.toUpperCase();" style="width: 250px; height: 23px" align="middle" />
                </td>
            </tr>
            <tr style="height: 70px;">
                <td>Direccion:</td>
                <td>
                    <% if (!direccion.equals("")) {%>
                    <textarea name="descripcion" rows="4" cols="" style="width: 253px"><%=direccion%></textarea>
                    <% } else {%>
                    <textarea name="descripcion" rows="4" cols="" style="width: 253px"><%=""%></textarea>
                    <% }%>
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Estado:</td>
                <td>
                    <select name="estados" style="width: 255px; height: 25px">
                        <% if (contacto.getHabilitado()) {%>
                        <option selected>HABILITADO</option>
                        <option>INHABILITADO</option>
                        <% } else {%>
                        <option>HABILITADO</option>
                        <option selected>INHABILITADO</option>
                        <% }%>
                    </select>
                </td>
            </tr>
            <tr style="height: 40px">
                <td>Empresa:</td>
                <td>
                    <%
                                Empresa empresa = servicioEmpresa.getEmpresa(request.getParameter("rifEmpresa"));
                    %>
                    <input value="<%= empresa.getNombre()%>" name="telefono" onKeyUp="this.value=this.value.toUpperCase();" style="width: 250px; height: 23px" align="middle" disabled />
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
        <input type="hidden" name="hiddenId" value="<%= id%>"/>
        <input type="hidden" name="id" value="<%= request.getParameter("id")%>"/>
        <input type="hidden" name="nombre" value="<%= request.getParameter("nombre")%>"/>
        <input type="hidden" name="rifEmpresa" value="<%= request.getParameter("rifEmpresa")%>"/>
        <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
            <input type="submit" name="update" value="Guardar" style="width: 80px; height: 25px; margin-left: 250px; margin-right: 10px" onclick=""/>
        </div>
    </form>
    <div id="boton" class="demo" style="float: left; margin-bottom: 20px">
        <input type="submit" name="cancel" value="Cancelar" onclick="hideDivContacto()" style="width: 80px; height: 25px;"/>
    </div>
    <div id="espacio"></div>
</div>