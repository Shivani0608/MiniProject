<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.java.myDB" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    Date date;
    String date1;
    //SimpleDateFormat sDate;
    int day;
    try {
        date1 = request.getParameter("date");

        date = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
        day = date.getDay();
        Connection con = myDB.getCon();
        PreparedStatement stmt = con.prepareStatement("select * from lab_time inner join lab_details on lab_time.lab_no = lab_details.lab_no " +
                "where lab_time.avail_day = ?");
        stmt.setInt(1, day);


        ResultSet rs = stmt.executeQuery();
        //out.print("<form action='lab_detail.jsp/' method='post'>");
        out.print("<div>");
        out.print("<table border=1>");

        out.print("<tr> <th> Lab Name </th> </tr>");
        while (rs.next()) {

            //String lab = rs.(2)

            out.print("<tr>");
            out.print("<td>");

            out.print("<a href='jsp/labs.jsp?lab_name=" + rs.getString("lab_no") + "'>");
            //out.print("<a href='#labs?jsp/labs.jsp?lab_name=" + rs.getString("lab_no") + "'>");
            out.print(rs.getString(2));
            out.print("</a>");
            out.print("</tr>");

        }


        out.print("</table>");


    } catch (Exception e) {
        e.printStackTrace();
    }
%>
