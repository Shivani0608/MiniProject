package com.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/confirm")
public class confirm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String date;
            String lab_no;
            String event_id = request.getParameter("event_id");
            Connection con = myDB.getCon();
            PreparedStatement stmt1 = con.prepareStatement("insert into lab_booked values (?,?)");
            PreparedStatement stmt2 = con.prepareStatement("select start_date,lab_no from event_description where event_id=?");
            PreparedStatement stmt = con.prepareStatement("update event_description set flag = 1 where event_id=?");
            stmt.setInt(1, Integer.parseInt(event_id));
            stmt2.setInt(1, Integer.parseInt(event_id));
            ResultSet rs = stmt2.executeQuery();
            rs.next();
            date = rs.getString("start_date");
            lab_no = rs.getString("lab_no");

            stmt1.setString(1, lab_no);
            stmt1.setString(2, date);

            stmt1.executeUpdate();

            if (stmt.executeUpdate() != 0) {
                response.sendRedirect("/admin.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
