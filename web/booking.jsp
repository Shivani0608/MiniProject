<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>

<%
    if (request.getSession().getAttribute("user_name") == null) {
        response.sendRedirect("index.jsp");
    }
    String user = (String) session.getAttribute("user_name");
    Connection con = myDB.getCon();
    PreparedStatement stmt = con.prepareStatement("select * from teacher_info where mis_id=?");
    ResultSet rs;
    stmt.setString(1, user);
    rs = stmt.executeQuery();
    String fuser = null;
    String muser = null;
    String luser = null;
    String email_id = null;
    String mob = null;

    while (rs.next()) {
        fuser = rs.getString("fname");
        muser = rs.getString("mname");
        luser = rs.getString("lname");
        email_id = rs.getString("email_id");
        mob = rs.getString("mob_no");

    }

%>
<html>
<title>Booking</title>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js">

    <scrpit type="text/javascrpit" scr="https://code.jquery.com/jquery-3.3.1.js"></scrpit>


    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->

    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    html, body, h1, h2, h3, h4, h5, h6 {
        font-family: "Roboto", sans-serif
    }

    .mySlides {
        display: none;
    }

</style>
<body class="w3-light-grey">

<nav class="navbar navbar-expand-lg  fixed-top" style="background-color: #009688">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#"><i class="fa fa-institution" aria-hidden="true"></i>&nbsp;<strong>INFRASTRUCTURE
        ALLOCATION
    </strong></a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
            aria-controls="basicExampleNav"

            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="basicExampleNav">

        <!-- Links -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="jsp/user_book_history.jsp" data-toggle="tooltip" title="History"><i
                        class="fa fa-history fa-lg" aria-hidden="true"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp" data-toggle="tooltip" title="LogOut"><i
                        class="fa fa-sign-out fa-rotate-180 fa-lg" aria-hidden="true"></i></a>
            </li>

            <!-- Dropdown -->
        </ul>
        <!-- Links -->
    </div>
    <!-- Collapsible content -->
</nav>


<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;margin-top: 20px">

    <!-- The Grid -->
    <div class="w3-row-padding" style="margin-top: 70px" >

        <!-- Left Column -->
        <div class="w3-third" style="height: max-content">

            <div class="w3-white w3-text-grey w3-card-4" style="height:1044px">
                <div class="w3-display-container">
                    <center><img src="/img/pic1.JPG" class="w3-circle" style="margin-top: 10px" width="65%"
                                 height="200px"></center>
                </div>

                <div class="w3-container">
                    <p>
                    <h2><%=fuser%> <%=muser%> <%=luser%>
                    </h2></p>

                    <p><i class="fa fa-key fa-fw w3-margin-right w3-large w3-text-teal"></i><%=user%>
                    </p>
                    <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=email_id%>
                    </p>
                    <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mob%>
                    </p>
                    <hr>

                    <button class="w3-large" style="background: transparent;border: none"><b><i
                            class="fa fa-pencil fa-fw w3-margin-right w3-text-teal"></i>Update Personal Details</b>
                    </button>
                    <br>
                    <br>

                    <button class="w3-large w3-text-theme" style="border: none;background: transparent"><b><i
                            class="fa fa-history fa-fw w3-margin-right w3-text-teal"></i>View History</b>
                    </button>
                    <br>
                    <br>
                </div>
            </div>
            <br>
            <!-- End Left Column -->
        </div>


        <!-- Right Column -->
        <div class="w3-twothird">

            <!--images-->
            <div class="mySlides w3-display-container w3-center">
                <img src="/img/pic3.jpg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic5.JPG" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic4.jpeg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic7.jpg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic1.JPG" style="width:100%;height: 350px;margin-right:80px;">
            </div>
            <br><br>

            <!--End of images-->

            <div class="w3-container w3-card w3-white">
                <h2 class="w3-text-grey w3-padding-16"><i
                        class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Book a Lab</h2>

                    <!--Search Button-->

                    <div class="main" id="main">
                        <form id="myForm">
                            <div class="mt-1">
                                <p>Search Labs by Date:</p>
                                <input type="date" name="date" id="date" required>
                                <button class=" fa fa-search btn btn-primary ml-auto" data-toggle="tooltip"
                                        title="Search"
                                        type="submit">
                                </button>
                            </div>
                        </form>
                    </div>

                    <!---Loads Search.jsp-->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="container-fluid" id="lab_name"
                                 style="margin-top: 50px;margin-bottom: 50px; width: 95%; ">

                            </div>
                        </div>
                    </div>

            </div><br><br>

            <div class="w3-container w3-card w3-white">

                    <div class="row" id="labs">


                    </div>

                    <!-- <div style="width: 100%; height:300px"></div>-->



                <!-- End Right Column -->
            </div>

            <!-- End Grid -->
        </div>

        <!-- End Page Container -->
    </div>

    <footer class="w3-container w3-teal w3-center w3-margin-top">
        <p>Find me on social media.</p>
        <i class="fa fa-facebook-official w3-hover-opacity"></i>
        <i class="fa fa-instagram w3-hover-opacity"></i>
        <i class="fa fa-snapchat w3-hover-opacity"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity"></i>
        <i class="fa fa-twitter w3-hover-opacity"></i>
        <i class="fa fa-linkedin w3-hover-opacity"></i>
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
    </footer>

</body>
</html>


<script type="text/javascript">
    $(function () {
        $("#myForm").submit(function (e) {
            e.preventDefault();
            $("#lab_name").load("jsp/search.jsp?" + $("#myForm").serialize());

            if ($('#labs').length) {
                $("#labs").hide();

            }
        });


    });
    document.getElementById("date").valueAsDate = new Date();
</script>

<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {
            myIndex = 1
        }
        x[myIndex - 1].style.display = "block";
        setTimeout(carousel, 2000); // Change image every 2 seconds
    }
</script>
