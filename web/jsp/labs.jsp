<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: shivani
  Date: 19/9/18
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String lab_name = request.getParameter("lab_name");
    Connection con = null;
    try {
        con = myDB.getCon();
        PreparedStatement ps = con.prepareStatement("select * from lab_details inner join assistant_info on lab_details.assistant_id = assistant_info.assistant_id  inner join dept_info di on lab_details.dept_id = di.dept_id   where lab_no= ?");
        ps.setString(1, lab_name);
        ResultSet rs = ps.executeQuery();

        out.print("<div>");
        out.print("<table border=2>");

        while (rs.next()) {
            out.print("<tr align=left><th>Lab Name:</th><th>"+ rs.getString("lab_no")+"</th></tr>");
            out.print("<tr align=left><th>Capacity:</th><th>"+ rs.getString("capacity")+"</th></tr>");
            out.print("<tr align=left><th>Department Name:</th><th>"+ rs.getString("dept_name")+"</th></tr>");
            out.print("<tr align=left><th>HOD Name:</th><th>"+ rs.getString("hod_name")+"</th></tr>");
            out.print("<tr align=left><th>Assistant Name:</th><th>"+ rs.getString("assistant_name")+"</th></tr>");
            out.print("<tr align=left><th>Assistant Mobile No:</th><th>"+ rs.getString("mob_no")+"</th></tr>");
            out.print("<tr align=left><th>Assistant Email:</th><th>"+ rs.getString("email")+"</th></tr>");

        }

        out.print("</table>");
        out.print("</div>");

    } catch (Exception e) {
        e.printStackTrace();
    }

%>