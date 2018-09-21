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


    <!-- JQuery -->
    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <!-- Bootstrap tooltips -->

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

<body>

<nav class="navbar navbar-expand-lg navbar-dark primary-color fixed-top">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#">Navbar</a>

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
            <li class="nav-item active">
                <a class="nav-link" href="#">Home
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="registration.jsp">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
            </li>
            <!-- Dropdown -->
        </ul>
        <!-- Links -->
    </div>
    <!-- Collapsible content -->
</nav>

<div class="container-fluid">


    <div class="row mt-4">
        <div class="col">
            <center>
                <div class="main" id="main">
                    <form id="myForm">
                        <div class="mt-1">
                            <p>Search Labs by Date:</p>
                            <input type="date" name="date" id="date" required>
                            <button class=" fa fa-search btn btn-primary" type="submit">
                            </button>
                        </div>
                    </form>
                </div>
            </center>
        </div>
    </div>


    <div class="row">
        <%--<div class="col-sm-4">--%>
        <div id="lab_name" style="margin-top: 50px; width: 100%">

        </div>
        <%--</div>--%>
    </div>
</div>

<div class="container-fluid" >

    <div class="row" id="labs">


    </div>

</div>
<script type="text/javascript">
    $(function () {
        $("#myForm").submit(function (e) {
            e.preventDefault();
            $("#lab_name").load("jsp/search.jsp?" + $("#myForm").serialize());

        });


    });
</script>

</body>
</html>
