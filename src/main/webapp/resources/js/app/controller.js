angular.module("worldApp").controller("worldCtrl", function($scope, $http, UserService) { // Определение контроллера

    UserService.getUserInfo(false).then(function(response) {
        $scope.pagination['total'] = $scope.calcPages(response);
    });

    UserService.getUserInfo().then(function(response) {
        $scope.items = response;
    });

    $scope.createUser = function(user, valid) {
        if (valid) {
            $scope.showUsers = true;
            UserService.getUserCreate(user).then(function(response) {
                $scope.items = response;
            });
        } else {
            $scope.showError = true;
        }
    };

    $scope.delUser = function() {
        UserService.getUserDelete($scope.selectCheckbox).then(function(response) {
            $scope.items = response;
        });
        $scope.deleteUser = true;
        $scope.selectCheckbox = [];
    };

    $scope.calcPages = function (rows) {
        var range = $scope.pagination['range'];
        return Math.floor((rows % range == 0) ? (rows / range) : (rows / range) + 1);
    };

    $scope.pagination = { current: 1, total: 5, range: 5 };

    $scope.selectCheckbox = [];
    $scope.selectRemove = false;
    $scope.showUsers = true;
    $scope.deleteUser = true;

    $scope.toggleItem = function(id) {
        var index = $scope.selectCheckbox.indexOf(id);
        (index > -1) ? $scope.selectCheckbox.splice(index, 1) : $scope.selectCheckbox.push(id);
        ($scope.selectCheckbox.length === 0) ? $scope.deleteUser = true : $scope.deleteUser = false;
    };

    $scope.toggleShowUsers = function() {
        $scope.showUsers = false;
    };

    $scope.getError = function(error) {
        if (angular.isDefined(error)){
            $scope.isStyle = true;

            if (error.required) {
                return "Field can't to be empty!";
            } else if (error.email) {
                return "Email error!";
            } else if (error.minlength) {
                return "Field can't to be littel 3 char!";
            } else {
                $scope.isStyle = false;
                return "Succes!";
            }
        }
    };




});