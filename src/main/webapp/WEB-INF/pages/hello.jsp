<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html ng-app="worldApp" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Front-End</title>
	<script src="/resources/js/angular.js"></script>
	<script src="/resources/public/js/app.js"></script>
	<script src="/resources/public/js/controller.js"></script>
	<script src="/resources/public/js/ui-pagination.js"></script>
	<script src="/resources/public/js/user-service.js"></script>
	<script src="/resources/public/js/user-directive.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/public/css/hello.css">
	<link rel="stylesheet" type="text/css" href="/resources/public/css/modal-dialog.css">
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

		<input type="text" ng-model="search.input" placeholder="Search..." required />
		<select ng-model="search.status" ng-options="item for item in ['Nick', 'Login', 'Email']"></select>
		<button ng-click="searchUser(search)">Search</button>

		<div class="btn-group">
			<button class="btn btn-default" ng-disabled="deleteUser" ng-click="delUser()">Delete Selected</button>
			<button class="btn btn-default" ng-click="toggleShowUsers()">Create</button>
			<button class="btn btn-default" ng-click="getUsersByPage()">Show all users</button>
		</div>
	</div>

	<ng-include src="'/resources/public/html/users-panel.html'"></ng-include>

	<ng-include src="'/resources/public/html/users-create.html'"></ng-include>

	<ui-pagination ng-show="showPanel == 'showUsers' && showSearch == true" items="items" range="pagination.range" current="pagination.current" total="pagination.total"></ui-pagination>

	<script src="/resources/js/jquery-2.2.0.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
