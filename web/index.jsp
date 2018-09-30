<html>
<head>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">

    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>

</head>
<%
    if (request.getSession().getAttribute("user_name") != null) {
        response.sendRedirect("booking.jsp");
    }
%>
<body style="background-color:#DCDCDC ">
<!-- Default form login -->
<div class="row">
    <div class="col-lg-4"></div>
    <div class="col-lg-4 col-md-12">
        <form class="text-center border border-light mt-5 p-5" method="post"
              style="box-shadow: 2px 2px 10px #888888; background-color:#ffffff" action="auth_user">
            <!--<i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>-->
            <img src="img/logo.png" width="150px"><br><p class="h4 mb-4">Sign in</p>

            <!-- Email -->
            <input type="text" id="txt_id" name="txt_id" class="form-control mb-4" placeholder="MIS ID">

            <!-- Password -->
            <input type="password" id="txt_pass" name="txt_pass" class="form-control mb-4" placeholder="Password">

            <div>
                <!-- Forgot password -->
                <a href="">Forgot password?</a>
            </div>


            <!-- Sign in button -->
            <input type="submit" class="btn btn-info btn-block my-4" value="Sign In">
            <div style="color:red">
                <%
                    if (session.getAttribute("errorMessage") != null)
                        out.print("<p>Invalid Username or Password, Try Again!</p>");
                %>
            </div>
            <!-- Register -->
            <p>Not a member?
                <a href="sign_up.jsp">Register</a>
            </p>

        </form>

    </div>
</div>
</body>
</html>
