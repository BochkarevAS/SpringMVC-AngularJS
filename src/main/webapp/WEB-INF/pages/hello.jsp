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
	<script src="/resources/js/app/directive.js"></script>
	<script src="/resources/js/app/service.js"></script>
	<script src="/resources/js/app/services.js"></script>


	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">

	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


	<link rel="stylesheet" type="text/css" href="/resources/css/hello.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/pop.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/pagination.css">

</head>

<body ng-controller="worldCtrl">

	<header>
		<div class="well">
			<div class="btn-group">
				<button class="btn btn-default" ng-disabled="deleteUser" ng-click="delUser()">Deleted</button>
				<button class="btn btn-default" ng-click="toggleShowUsers()">Create</button>
				<button class="btn btn-default">BBBBBBB</button>
			</div>
		</div>
	</header>

	<table class="table" ng-show="showUsers">
		<thead>
			<tr>
				<th></th>
				<th>id</th>
				<th>nick</th>
				<th>login</th>
				<th>email</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-class="{'set-collor': selectRemove}" ng-repeat="item in items">
				<td><i class="icon-trash"></i><input type="checkbox" ng-model="selectRemove" ng-click="toggleItem(item.id)"/></td>
				<td>{{ item.id }}</td>
				<td>{{ item.nick }}</td>
				<td>{{ item.login }}</td>
				<td>{{ item.email }}</td>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Action <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul>
					</div>
				</td>
			</tr>
		</tbody>
	</table>







	<form name="theForm" class="form-horizontal" ng-hide="showUsers" ng-submit="createUser(user, theForm.$valid)" novalidate>
		<fieldset>
			<div class="control-group">
				<label class="control-label">Nick:</label>
				<div class="controls">
					<input name="nick" type="text" class="input-xlarge span3" ng-model="user.nick" minlength="3" maxlength="7" required/>
					<span ng-show="showError" ng-class="isStyle ? 'has-error' : 'has-success'">
						{{ getError(theForm.nick.$error) }}
					</span>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Login:</label>
				<div class="controls">
					<input name="login" type="text" class="input-xlarge span3" ng-model="user.login" minlength="3" maxlength="7" required/>
					<span ng-show="showError" ng-class="isStyle ? 'has-error' : 'has-success'">
						{{ getError(theForm.login.$error) }}
					</span>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Email:</label>
				<div class="controls">
					<input name="email" type="email" class="input-xlarge span3" ng-model="user.email" required/>
					<span ng-show="showError" ng-class="isStyle ? 'has-error' : 'has-success'">
						{{ getError(theForm.email.$error) }}
					</span>
				</div>
			</div>

			<div class="controls">
				<button type="submit" class="btn">Add</button>
			</div>
		</fieldset>
	</form>


	<ui-pagination items="items" range="pagination.range" current="pagination.current" total="pagination.total"></ui-pagination>



	<script src="/resources/jquery/jquery-2.2.0.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
