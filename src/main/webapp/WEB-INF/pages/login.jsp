<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html ng-app="ajax">

<head>
    <title>angular</title>
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/public/css/hello.css">
</head>

<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">

            <%--<div class="navbar-header">--%>
                <%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">--%>
                    <%--<span class="sr-only">Toggle navigation</span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                <%--</button>--%>
                <%--<a class="navbar-brand" href="#">Brand</a>--%>
            <%--</div>--%>


            <div class="collapse navbar-collapse">
                <form method="POST" action="j_spring_security_check" id="signin" class="navbar-form navbar-right" role="form" novalidate>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="email" type="text" class="form-control" name='user_login' value="" placeholder="Email Address">
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="password" type="password" class="form-control" name="password_login" value="" placeholder="Password">
                    </div>

                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
            </div>
        </div>
    </nav>

    <script src="/resources/js/jquery-2.2.0.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
