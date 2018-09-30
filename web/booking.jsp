<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("user_name") == null) {
        response.sendRedirect("index.jsp");
    }


%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/main.css">


    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js">

    <%--https://code.jquery.com/jquery-3.3.1.js--%>


    <!-- JQuery -->
    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
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

    <%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>

    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

</head>
<style>
    .mySlides {
        display: none;
    }
</style>

<body>

<nav class="navbar navbar-expand-lg navbar-dark primary-color fixed-top">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#"><i class="fa fa-institution" aria-hidden="true"></i>&nbsp;INFRASTRUCTURE ALLOCATION
    </a>

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
                <a class="nav-link" href="logout.jsp" data-toggle="tooltip" title="LogOut"><i
                        class="fa fa-sign-out fa-rotate-180 fa-lg" aria-hidden="true"></i></a>
            </li>
            <!-- Dropdown -->
        </ul>
        <!-- Links -->
    </div>
    <!-- Collapsible content -->
</nav>

<div class="w3-content container-fluid" style="max-width:2000px;margin-top:70px">

    <!-- Automatic Slideshow Images -->
    <div class="mySlides w3-display-container w3-center">
        <img src="/img/pic3.jpg" style="width:100%;height: 450px;margin-right:80px;">
        <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
            <h3>Los Angeles</h3>
            <p><b>We had the best time playing at Venice Beach!</b></p>
        </div>
    </div>
    <div class="mySlides w3-display-container w3-center">
        <img src="img/pic5.JPG" style="width:100%;height: 450px;margin-right:80px;">
        <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
            <h3>Chicago</h3>
            <p><b>Thank you, Chicago - A night we won't forget.</b></p>
        </div>
    </div>
    <div class="mySlides w3-display-container w3-center">
        <img src="img/pic4.jpeg" style="width:100%;height: 450px;margin-right:80px;">
        <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
            <h3>New York</h3>
            <p><b>The atmosphere in New York is lorem ipsum.</b></p>
        </div>
    </div>
    <div class="mySlides w3-display-container w3-center">
        <img src="img/pic7.jpg" style="width:100%;height: 450px;margin-right:80px;">
        <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
            <h3>Chicago</h3>
            <p><b>Thank you, Chicago - A night we won't forget.</b></p>
        </div>
    </div>

    <div class="mySlides w3-display-container w3-center">
        <img src="img/pic1.JPG" style="width:100%;height: 450px;margin-right:80px;">
        <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
            <h3>Chicago</h3>
            <p><b>Thank you, Chicago - A night we won't forget.</b></p>
        </div>
    </div>

</div>


<div class="container-fluid">


    <div class="row mt-4">
        <div class="col">
            <center>
                <div class="main" id="main">
                    <form id="myForm">
                        <div class="mt-1">
                            <p>Search Labs by Date:</p>
                            <input type="date" name="date" id="date" required>
                            <button class=" fa fa-search btn btn-primary" data-toggle="tooltip" title="Search"
                                    type="submit">
                            </button>
                        </div>
                    </form>
                </div>
            </center>
        </div>
    </div>


    <div class="row">
        <%--<div class="col-sm-4">--%>
        <div class="container-fluid" id="lab_name"
             style="margin-top: 50px;margin-bottom: 50px; width: 95%;background-color: #ededf8;">

        </div>
        <%--</div>--%>
    </div>
</div>

<div class="container-fluid">

    <div class="row" id="labs">


    </div>

</div>
<div style="width: 100%; height:300px"></div>
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

</body>
</html>
