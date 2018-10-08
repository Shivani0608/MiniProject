<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Update Lab Details</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
<%
    try {
        String user = (String) session.getAttribute("user_name");


        Connection con = myDB.getCon();
        PreparedStatement stmt = con.prepareStatement("select * from lab_details inner join lab_time lt on lab_details.lab_no = lt.lab_no where lab_details.assistant_id = ?");
        PreparedStatement stmt1 = con.prepareStatement("select assistant_name from assistant_info where assistant_id=?");
        stmt1.setString(1, user);
        stmt.setString(1, user);
        ResultSet rs = stmt.executeQuery();
        ResultSet rs1 = stmt1.executeQuery();
        String lab_name = null;
        String capacity = null;
        String from_time = null;
        String to_time = null;
        String mobile = null;
        String day = null;
        String user_name = null;
        int flag = 0;
        while (rs1.next())
            user_name = rs1.getString("assistant_name");
        while (rs.next()) {
            lab_name = rs.getString("lab_no");
            capacity = rs.getString("capacity");
            from_time = rs.getString("from_time");
            to_time = rs.getString("to_time");
            day = rs.getString("day");

        }
        PreparedStatement stmt2 = con.prepareStatement("select * from lab_details where assistant_id=?");
        stmt2.setString(1, user);
        ResultSet rs2 = stmt2.executeQuery();
        rs2.next();

%>

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button>

    <a class="navbar-brand mr-1" href="admin.jsp">Welcome <%=user_name%> !</a>
    <a class="ml-auto" href="logout.jsp"><i class="fas fa-sign-out-alt"></i></a>

</nav>

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="admin.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="blank.jsp">
                <i class="fas fa-fw fa-edit"></i>
                <span>Update Lab Details</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="blank1.jsp">
                <i class="fas fa-fw fa-user-edit"></i>
                <span>Update User Details</span></a>
        </li>
    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="admin.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Update Lab Details</li>
            </ol>

            <!-- Page Content -->
            <h1>Update Lab Details</h1>
            <hr>
            <form action="/updateServlet" method="post" enctype="multipart/form-data">
                <div class="card">
                    <div class="card-header">
                        Update the Lab
                    </div>
                    <div class="card-body">
                        <div class="row mb-2">
                            <div class="col-4">
                                <label>Lab Name:</label>&nbsp;<input type="text" id="lab_name" name="lab_name"
                                                                     placeholder="Lab Name"
                                                                     value="<%=lab_name%>"
                            >
                            </div>
                            <div class="col-2">

                            </div>
                            <div class="col-4">
                                <label>Time From:</label>&nbsp;<input type="time" id="lab_from_time"
                                                                      name="lab_from_time"
                                                                      value="<%=from_time%>"
                                                                      readonly>
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-4">
                                <label>Capacity:</label>&nbsp;<input type="text" id="lab_capacity"
                                                                     name="lab_capacity"
                                                                     placeholder="Capacity"
                                                                     value="<%=capacity%>"
                                                                     readonly>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-4">
                                <label>Time To:</label>&nbsp;<input type="time" id="lab_to_time" name="lab_to_time"
                                                                    readonly
                                                                    value="<%=to_time%>">
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-4">
                                <label>From:</label><input type="text" id="currDay" value="<%=day%>" readonly>

                            </div>

                            <div class="col-4">
                                <label>To : </label>
                                <select id="lab_day" name="lab_day" readonly="">
                                    <option>Monday</option>
                                    <option>Tuesday</option>
                                    <option>Wednesday</option>
                                    <option>Thrusday</option>
                                    <option>Friday</option>
                                    <option>Saturday</option>
                                    <option>Sunday</option>
                                </select>
                            </div>
                            <div>
                                <img src="data:image/png; base64,<%=Base64.getEncoder().encodeToString(rs2.getBytes(5))%>" width="100" height="150"
                                     border="3"/>
                            </div>

                            <div class="col-2">
                                <label>Upload Photo</label><input type="file" name="photo" id="photo">
                            </div>

                        </div>

                    </div>
                    <div class="card-header">

                        <button class="btn btn-primary fa fa-edit" id="edit" type="button" onclick="enable()">
                            &nbsp;Edit
                        </button>
                        <button class="btn btn-success fa fa-save" type="submit">&nbsp;Save</button>

                    </div>
                </div>
            </form>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>


<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script>
    var i = 0;
    $('#edit').click(function () {
        if (i == 0) {
            $('#lab_from_time').prop('readonly', false);
            $('#lab_to_time').prop('readonly', false);
            $('#lab_capacity').prop('readonly', false);
            $('#lab_mobile').prop('readonly', false);
            $('#lab_day').prop('readonly', false);
            i++;
        } else {
            $('#lab_from_time').prop('readonly', true);
            $('#lab_to_time').prop('readonly', true);
            $('#lab_capacity').prop('readonly', true);
            $('#lab_mobile').prop('readonly', true);
            $('#lab_day').prop('readonly', true);
            i--;

        }
    });
</script>

</body>

</html>
