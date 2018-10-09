<%--
  Created by IntelliJ IDEA.
  User: rashmi
  Date: 8/10/18
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--</head>--%>
<%--<body>--%>

<%--</body>--%>
<%--</html>--%>
<%
    try {


        String assistant_id = request.getParameter("assistant_id");
        Connection con = myDB.getCon();

        PreparedStatement stmt = con.prepareStatement("delete from assistant_info where assistant_id=?");
        stmt.setString(1,assistant_id);

    } catch (Exception e) {

    }

%>
