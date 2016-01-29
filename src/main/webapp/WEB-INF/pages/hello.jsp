<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html ng-app="worldApp" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Front-End</title>
	<script src="/resources/js/angular.js"></script>
	<script src="/resources/js/app/app.js"></script>
	<script src="/resources/js/app/controller.js"></script>
	<script src="/resources/js/app/ui-pagination.js"></script>
	<script src="/resources/js/app/services.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/hello.css">
</head>

<body ng-controller="worldCtrl">

	<header>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="collapse navbar-collapse navbar-form navbar-right">
					<a class="btn btn-primary" href="j_spring_security_logout">Logout</a>
				</div>
			</div>
		</nav>
	</header>

	<div class="well" ng-show="showPanel == 'showUsers'">
		<div class="btn-group">
			<button class="btn btn-default" ng-disabled="deleteUser" ng-click="delUser()">Deleted</button>
			<button class="btn btn-default" ng-click="toggleShowUsers()">Create</button>
			<button class="btn btn-default">BBBBBBB</button>
		</div>
	</div>

	<ng-include src="'/resources/html/users-panel.html'"></ng-include>

	<ng-include src="'/resources/html/users-create.html'"></ng-include>

	<ui-pagination ng-show="showPanel == 'showUsers'" items="items" range="pagination.range" current="pagination.current" total="pagination.total"></ui-pagination>

	<script src="/resources/jquery/jquery-2.2.0.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
