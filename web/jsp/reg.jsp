<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%

        Connection con= myDB.getCon();

    String ename=request.getParameter("eventname");
    int rn= Integer.parseInt(request.getParameter("studrn"));
    /*out.print(rn);*/
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
    String lab= request.getParameter("lab_name");
    int flag=0;

    try
    {


        PreparedStatement stmt = con.prepareStatement("insert into event_description(lab_no, mis_id, event_name, stud_roll, stud_name, stud_email, mob_no, dept, description, start_date, start_time, end_date, end_time, flag) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        stmt.setString(1,lab);
        stmt.setString(2,mis_id);
        stmt.setString(3, ename);
        stmt.setInt(4, rn);
        stmt.setString(5, sname);
        stmt.setString(6, mail);
        stmt.setString(7, mob);
        stmt.setString(8, dept);
        stmt.setString(9, descript);
        stmt.setString(10, sd);
        stmt.setString(11, st);
        stmt.setString(12, ed);
        stmt.setString(13, et);
        stmt.setInt(14,flag);

        stmt.executeUpdate();
    }catch (Exception e){
        e.printStackTrace();
    }

%>