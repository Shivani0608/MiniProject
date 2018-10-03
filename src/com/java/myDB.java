package com.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class myDB {

    static Connection con;

    public static Connection getCon() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SL3", "shubham", "shubham");
        } catch (ClassNotFoundException ex) {
        } catch (SQLException ex) {
        }
        return con;
    }


}
