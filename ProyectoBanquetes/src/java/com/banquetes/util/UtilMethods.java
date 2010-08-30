package com.banquetes.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author maya
 */
public class UtilMethods {

    public UtilMethods() {
    }

    public List<Date> listarFechas(String fechaInicio, String fechaFin) {
        List<Date> fechas = new ArrayList<Date>();

        if (fechaInicio != null && fechaFin != null) {
            try {
                DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedFechaInicio = formater.parse(fechaInicio);
                java.sql.Date sqlFechaInicio = new java.sql.Date(parsedFechaInicio.getTime());

                java.util.Date parsedFechaFin = formater.parse(fechaFin);
                java.sql.Date sqlFechaFin = new java.sql.Date(parsedFechaFin.getTime());

                Calendar calendar = new GregorianCalendar();
                calendar.setTime(new Date(sqlFechaInicio.getTime()));

                while (calendar.getTime().before(new Date(sqlFechaFin.getTime())) || calendar.getTime().equals(new Date(sqlFechaFin.getTime()))) {
                    Date resultado = calendar.getTime();
                    fechas.add(resultado);
                    calendar.add(Calendar.DATE, 1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return fechas;
    }

    public java.sql.Date getSqlDate(String date) {
        java.sql.Date sqlFecha = null;
        try {
            DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedFecha = formater.parse(date);
            sqlFecha = new java.sql.Date(parsedFecha.getTime());

        } catch (Exception e) {
            e.printStackTrace();
        }
        return sqlFecha;
    }
}
