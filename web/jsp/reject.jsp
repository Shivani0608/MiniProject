<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.java.myDB" %><%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 30/9/18
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try {


        String event_id = request.getParameter("event_id");
        Connection con = myDB.getCon();

        PreparedStatement stmt = con.prepareStatement("update event_description set flag = 2 where event_id=?");
        stmt.setInt(1, Integer.parseInt(event_id));

        if (stmt.executeUpdate() != 0) {
            response.sendRedirect("/admin.jsp");
        }

    } catch (Exception e) {

    }

%>
