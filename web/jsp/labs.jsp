<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%--
  Created by IntelliJ IDEA.
  User: shivani
  Date: 19/9/18
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="../css/main.css">
</head>


<%
    String lab_name = request.getParameter("lab_name");
    Connection con = null;
    try {
        con = myDB.getCon();
        PreparedStatement ps = con.prepareStatement("select * from lab_details inner join assistant_info on lab_details.assistant_id = assistant_info.assistant_id  inner join dept_info di on lab_details.dept_id = di.dept_id   where lab_no= ?");
        ps.setString(1, lab_name);
        ResultSet rs = ps.executeQuery();

        out.print("<br><br><div id='temp_lab' style='box-shadow: 5px 10px 8px #888888; width:850px;'><center>");

        while (rs.next()) {
            out.print("<div><label class='mylabel''>Lab Name:</label><input type='text' class='myinput' value='" + rs.getString("lab_no") + "' readonly></div><br>");
            out.print("<label class='mylabel'>Capacity:</label><input type='text' class='myinput' value='" + rs.getString("capacity") +  "' readonly><br>");
            out.print("<label class='mylabel'>Department Name:</label><input type='text' class='myinput' value='" + rs.getString("dept_name") + "' readonly><br>");
            out.print("<label class='mylabel'>HOD Name:</label><input type='text' class='myinput' value='" + rs.getString("hod_name") + "' readonly><br>");
            out.print("<label class='mylabel'>Assistant Name:</label><input type='text' class='myinput' value='" + rs.getString("assistant_name") + "' readonly><br>");
            out.print("<label class='mylabel'>Assistant Mobile Number:</label><input type='text' class='myinput' value='" + rs.getString("mob_no") + "' readonly><br>");
            out.print("<label class='mylabel'>Assistant Email:</label><input type='text' class='myinput' value='" + rs.getString("email") + "' readonly><br>");
        }
        out.print("</center></div>");


    } catch (Exception e) {
        e.printStackTrace();
    }

%>

</html>