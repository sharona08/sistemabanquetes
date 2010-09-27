<%-- 
    Document   : reservar
    Created on : Sep 2, 2010, 10:44:25 AM
    Author     : maya
--%>
<%@page import="javax.swing.UnsupportedLookAndFeelException"%>
<%@page import="javax.swing.UIManager"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioReserva"%>
<%@page import="com.banquetes.servicios.impl.ServicioReserva"%>
<%@page import="com.banquetes.dominio.ServicioServicioEvento"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.banquetes.dominio.Salon"%>
<%@page import="com.banquetes.servicios.impl.ServicioSalon"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioSalon"%>
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
<%@page import="com.banquetes.servicios.impl.ServicioEventoSala"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEventoSala"%>
<%@page import="com.banquetes.dominio.EventoSala"%>
<%@page import="com.banquetes.servicios.impl.ServicioEventoSala"%>
<%@page import="com.banquetes.servicios.interfaces.IServicioEventoSala"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Eliminar Salon de Reserva</title>
        <jsp:include page="../include/head.jsp"></jsp:include>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta HTTP-EQUIV="REFRESH" content="0; url=/ProyectoBanquetes/jsp/inicio/disponibilidad.jsp"/>
    </head>
    <body>
        <div id="pageWrap">
            <jsp:include page="../include/menu.jsp"></jsp:include>
            <div id="content">
                <h1 id="letra1">Eliminar salon de reserva</h1>

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

                            Integer idEvento = Integer.valueOf(request.getParameter("idEvento"));
                            Integer idSalon = Integer.valueOf(request.getParameter("salon"));

                            IServicioSalon servicioSalon = new ServicioSalon();
                            IServicioEventoSala servicioEventoSala = new ServicioEventoSala();

                            Salon salonConfirm = servicioSalon.getSalon(idSalon);

                            Object[] options = {"Si",
                                "No",
                                "Cancelar"};
                            int confirm = JOptionPane.showOptionDialog(null,
                                    "Esta operación eliminará los servicios contratados en dicho \n "
                                    + "salón.\n"
                                    + "¿Deseas exportar estos servicios del " + salonConfirm.getNombre() + " a otro salón?",
                                    "Advertencia",
                                    JOptionPane.YES_NO_CANCEL_OPTION,
                                    JOptionPane.WARNING_MESSAGE,
                                    null,
                                    options,
                                    options[2]);

                            //confirm: 0 = si, 1 = no, 2 = cancel
                            if (confirm == 0) { //Si es 0, entonces se exportan los servicios a otro salon

                                List<Salon> salonesReserva = servicioSalon.listarSalonesReservaConfirm(idEvento, idSalon);
                                List list = new ArrayList();
                                for (Salon s : salonesReserva) {
                                    list.add(s.getNombre());
                                }

                                Object[] salones = list.toArray();
                                String seleccion = (String) JOptionPane.showInputDialog(
                                        null,
                                        "Seleccione el salón:\n"
                                        + "",
                                        "Seleccione salón",
                                        JOptionPane.INFORMATION_MESSAGE,
                                        null,
                                        salones,
                                        salonesReserva.get(0).getNombre());

                                if (seleccion != null) {
                                    Salon salonSeleccionado = servicioSalon.getSalonNombre(seleccion);

                                    IServicioReserva servReserva = new ServicioReserva();
                                    List<ServicioServicioEvento> serviciosEventoOld = servReserva.listarServicioEventosSalon(idEvento, idSalon);

                                    for (ServicioServicioEvento s : serviciosEventoOld) {
                                        s.setIdSalon(salonSeleccionado.getId());

                                        if (!servReserva.existeServicioEvento(s)) {
                                            servReserva.crearServicioEvento(s);
                                        } else {
                                            //ya existe el servicio en ese salon
                                        }

                                    }

                                    Boolean result = servicioEventoSala.eliminarEventoSala(idEvento, idSalon);

                                    Salon salon = servicioSalon.getSalon(idSalon);

                                    if (result) {
                                        // si el salon es el consul, se debe eliminar el diplomat tambien,
                                        // si el salon es el diplomat, se deben eliminar los otros tres

                                        if (salon.getIdSalon() != null) {
                                            //SI NO EXISTEN MAS SALONES EN ESA RESERVA QUE TENGAN COMO SUPER SALON A ESE SALON

                                            List<EventoSala> eventosSala = servicioEventoSala.listarEventoSalas(idEvento);
                                            Boolean eliminar = Boolean.TRUE;

                                            for (EventoSala e : eventosSala) {
                                                if (e.getIdSalon().equals(salon.getIdSalon())) {
                                                    eliminar = Boolean.FALSE;
                                                    break;
                                                }
                                            }
                                            if (eliminar) {
                                                Boolean superSalon = servicioEventoSala.eliminarEventoSala(idEvento, salon.getIdSalon());
                                            }

                                        } else {
                                            List<Salon> subSalones = servicioSalon.listarSubsalones(salon.getId());
                                            if (!subSalones.isEmpty()) {

                                                for (Salon s : subSalones) {
                                                    Boolean subSalon = servicioEventoSala.eliminarEventoSala(idEvento, s.getId());
                                                }
                                            }
                                        }

                                        JOptionPane.showMessageDialog(null,
                                                "Exito! el salon " + salonConfirm.getNombre() + " ha sido eliminado exitosamente.",
                                                "Exito",
                                                JOptionPane.INFORMATION_MESSAGE);

                                    } else {
                                        JOptionPane.showMessageDialog(null,
                                                "Error! el salon " + salonConfirm.getNombre() + " no pudo ser eliminado.",
                                                "Error",
                                                JOptionPane.ERROR_MESSAGE);
                                    }

                                } else {
                                    //el usuario le dio a cancelar por lo que no se elimina nada
                                }

                            } else if (confirm == 1) { //Si es 1 no se exportan, y se elimina el salon

                                Boolean result = servicioEventoSala.eliminarEventoSala(idEvento, idSalon);

                                Salon salon = servicioSalon.getSalon(idSalon);

                                if (result) {
                                    // si el salon es el consul, se debe eliminar el diplomat tambien,
                                    // si el salon es el diplomat, se deben eliminar los otros tres

                                    if (salon.getIdSalon() != null) {
                                        //SI NO EXISTEN MAS SALONES EN ESA RESERVA QUE TENGAN COMO SUPER SALON A ESE SALON

                                        List<EventoSala> eventosSala = servicioEventoSala.listarEventoSalas(idEvento);
                                        Boolean eliminar = Boolean.TRUE;

                                        for (EventoSala e : eventosSala) {
                                            if (e.getIdSalon().equals(salon.getIdSalon())) {
                                                eliminar = Boolean.FALSE;
                                                break;
                                            }
                                        }
                                        if (eliminar) {
                                            Boolean superSalon = servicioEventoSala.eliminarEventoSala(idEvento, salon.getIdSalon());
                                        }

                                    } else {
                                        List<Salon> subSalones = servicioSalon.listarSubsalones(salon.getId());
                                        if (!subSalones.isEmpty()) {

                                            for (Salon s : subSalones) {
                                                Boolean subSalon = servicioEventoSala.eliminarEventoSala(idEvento, s.getId());
                                            }
                                        }
                                    }

                                    JOptionPane.showMessageDialog(null,
                                            "Exito! el salon ha sido eliminado exitosamente.",
                                            "Exito",
                                            JOptionPane.INFORMATION_MESSAGE);

                                } else {
                                    JOptionPane.showMessageDialog(null,
                                            "Error! el salon no pudo ser eliminado.",
                                            "Error",
                                            JOptionPane.ERROR_MESSAGE);
                                }

                            } else if (confirm == 2) {
                            }
                %>
            </div>
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
