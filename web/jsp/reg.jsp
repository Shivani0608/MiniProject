<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%

        Connection con = myDB.getCon();

    String ename=request.getParameter("eventname");
    int rn= Integer.parseInt(request.getParameter("studrn"));

    String sname=request.getParameter("studname");

    String mail=request.getParameter("studmail");

    String mob=request.getParameter("studmn");

    String dept=request.getParameter("dept");

    String descript=request.getParameter("descp");

    String sd=request.getParameter("start_dt");
    String st=request.getParameter("start_time");
    String ed=request.getParameter("end_dt");

    String et=request.getParameter("end_time");

    String mis_id = (String) session.getAttribute("user_name");

    try {

        PreparedStatement stmt = con.prepareStatement("insert into event_description values (?,?,?,?,?,?,?,?,?,?,?,?)");

    
        stmt.setString(1,mis_id);
        stmt.setString(2, ename);
        stmt.setInt(3, rn);
        stmt.setString(4, sname);
        stmt.setString(5, mail);
        stmt.setString(6, mob);
        stmt.setString(7, dept);
        stmt.setString(8, descript);
        stmt.setString(9, sd);
        stmt.setString(10, st);
        stmt.setString(11, ed);
        stmt.setString(12, et);

        stmt.executeUpdate();

    }catch (Exception e){
        e.printStackTrace();
    }

%>