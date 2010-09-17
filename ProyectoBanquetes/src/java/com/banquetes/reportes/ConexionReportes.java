/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.banquetes.reportes;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author maya
 */
public class ConexionReportes {
    
    static Connection conn = null;

    public ConexionReportes() {
    }
    
    public Connection connection(){

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found.");
            System.exit(1);
        }
        //Para iniciar el Logger.
        //inicializaLogger();
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banquetes", "root", "admin");
            conn.setAutoCommit(false);
        } catch (SQLException e) {
            System.out.println("Error de conexión: " + e.getMessage());
            System.exit(4);
        }
        return conn;
    }

}
