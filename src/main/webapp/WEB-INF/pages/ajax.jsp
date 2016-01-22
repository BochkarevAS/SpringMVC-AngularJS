<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html ng-app="ajax">

<head>
    <script src="/resources/js/angular.js"></script>
    <script>

        var ajax = angular.module("ajax", []);

        ajax.controller("ajax", function($scope, $http) {


            $scope.temp = {
                litters: ["A", "B", "C"]
            };


            $scope.sendRequest = function() {

                if ($scope.password === undefined) {
                    $scope.status = "Input can not be empty!";
                    return;
                } else if ($scope.password === "") {
                    $scope.status = "";
                    return;
                }

                var res = $http.get("ajax?data=" + $scope.password);

                res.success(function(data, status, headers, config) {
                    $scope.status = data;
                });

                res.error(function(data, status, headers, config) {
                    alert( "failure message: ?");
                });
            }

            $scope.setStyle = function() {
               if ($scope.status === "esye") {
                   return "color: red; font-weight: bold;";
               } else if ($scope.status === "normal") {
                   return "color: blue; font-weight: bold;";
               }

                return "color: green; font-weight: bold;";
            }

            $scope.setLink = function(link) {

                var res = $http.get("accounts/" + link);

                res.success(function(data, status, headers, config) {
                    $scope.link = data;
                });

                res.error(function(data, status, headers, config) {
                    alert( "failure message: ?");
                });

            }

        });

    </script>

    <title>angular</title>
</head>

<body ng-controller="ajax">

    <img src="/resources/imag/dev.jpg" width="200" height="300">

    <div>
        <input ng-model="password" ng-keyup="sendRequest()" />
        <button ng-click="sendRequest()">add</button>
    </div>

    <span style="{{setStyle()}}">
        <h1>{{status}}</h1>
    </span>

    <ol>
        <li ng-repeat="litter in temp.litters">{{litter}}</li>
    </ol>

    <h1>
        <a href="#" ng-click="setLink(1)">1</a>
        <a href="#" ng-click="setLink(2)">2</a>
        <a href="#" ng-click="setLink(3)">3</a>
    </h1>

    {{link}}

</body>

</html>
