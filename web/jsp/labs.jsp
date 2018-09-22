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

        out.print("<div id='temp_lab' style='box-shadow: 20px 20px 20px #888888; width:820px; height:auto'>");

        while (rs.next()) {
%>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">Lab Name</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("lab_no")%>" readonly>
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">Capacity</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("capacity")%>" readonly>
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">Department</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("dept_name")%>" readonly>
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">HOD Name</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("hod_name")%>" readonly>
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">Assistant Name</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("assistant_name")%>" readonly>
    </div>
</div><div class="row mt-2 ">
    <div class="col-md-6">
        <label class="mylabel">Assistant Mobile Number </label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("mob_no")%>" readonly>
    </div>
</div>
<div class="row mt-2 pb-4">
    <div class="col-md-6">
        <label class="mylabel">Assistant Email</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("email")%>" readonly>
    </div>
</div>
</div>
    <%--<input class="myinput col-sm-6" type="text" value="<%=rs.getString("lab_no")%>" readonly><br>--%>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

</html>