<%-- 
    Document   : homeDepartamento
    Created on : Aug 12, 2010, 10:40:20 AM
    Author     : maya
--%>

<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="com.banquetes.servicios.interfaces.IServicioDepartamento" %>
<%@page import="com.banquetes.dominio.Departamento"%>
<%@page import="com.banquetes.servicios.impl.ServicioDepartamento"%>

<div id="departamento">
    <h1>Servicio departamento</h1>
    <p>
        <% out.println("Listar todos los departamentos");%>
    </p>

    <%IServicioDepartamento iServicioDepartamento = new ServicioDepartamento();%>
    <% List<Departamento> departamentos = iServicioDepartamento.listarDepartamentos();%>

    <table>
        <tr>
            <th>Departamento</th>
        </tr>
        <%for (Departamento departamento : departamentos) {%>
        <tr>
            <td>
                <a href=’<%= response.encodeURL("view?id=" + departamento.getId())%>’>
                    <%= departamento.getNombre()%>
                </a>
            </td>
        </tr>
        <% }%>
    </table>
</div>