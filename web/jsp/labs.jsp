<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<head>
    <link rel="stylesheet" href="../css/main.css">
</head>


<%
    String lab_name = request.getParameter("lab_name");
    Connection con = null;
    try {
        con = myDB.getCon();
        PreparedStatement ps = con.prepareStatement("select * from lab_time inner join lab_details detail on lab_time.lab_no = detail.lab_no inner join assistant_info on detail.assistant_id = assistant_info.assistant_id  inner join dept_info di on detail.dept_id = di.dept_id   where lab_id= ?");
        ps.setString(1, lab_name);
        ResultSet rs = ps.executeQuery();
        //out.print("<div style='height:;'></div>");
        out.print("<div class='container-fluid' id='temp_lab' style='box-shadow: 20px 20px 20px #888888; width:820px; height:auto;background: url(img/logo.png) no-repeat left center;'>");

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
<div>
    <center><button class="btn btn-success" href="registration.jsp">Book&nbsp;<i class="fa fa-lock"></i></button></center>
</div>
    <%--<input class="myinput col-sm-6" type="text" value="<%=rs.getString("lab_no")%>" readonly><br>--%>
<%
            out.print("</div>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

</body>
</html>



