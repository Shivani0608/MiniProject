<%--
  Created by IntelliJ IDEA.
  User: rashmi
  Date: 6/10/18
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    try {
    Connection con = myDB.getCon();
    int lab_id=57;
    String lab_no=request.getParameter("lab_name1");
    System.out.println(lab_no);
    String from_time =request.getParameter("lab_from_time1");
    System.out.println(from_time);
    String to_time=request.getParameter("lab_to_time1");
    System.out.println(to_time);
    String day=request.getParameter("lab_day1");
    System.out.println(day);
    int avail_day=Integer.parseInt(request.getParameter("avail_day1"));
    System.out.println(avail_day);
    int flag=0;
    PreparedStatement stmt = con.prepareStatement("insert into lab_time values(?,?,?,?,?,?,?)");
    stmt.setInt(1,lab_id);
    stmt.setString (2, lab_no);
    stmt.setString(3,from_time);
    stmt.setString(4,to_time);
    stmt.setString(5,day);
    stmt.setInt(6,avail_day);
    stmt.setInt(7,flag);
    stmt.executeUpdate();

} catch (Exception e) {

        out.print(e);
      }
%>


</body>
</html>
