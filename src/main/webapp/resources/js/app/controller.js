angular.module("worldApp").controller("worldCtrl", function($scope, $http, UserService) { // Определение контроллера

    $scope.pagination = { current: 1, total: 5, range: 5 };
    $scope.selectCheckbox = [];
    $scope.selectRemove = false;
    $scope.deleteUser = true;
    $scope.showPanel = "showUsers";

    $scope.getUsersByPage = function(page) {
        UserService.getUserInfo(page).then(function(response) {
            $scope.pagination['total'] = $scope.calcPages(response.rows);
            $scope.items = response.users;
        });
    };

    $scope.getUsersByPage(1);

    $scope.createUser = function(user, valid) {
        if (valid) {
            $scope.showPanel = "showUsers";
            UserService.getUserCreate(user).then(function(response) {
                $scope.pagination['total'] = $scope.calcPages(response.rows);
                $scope.items = response.users;
            });
        } else {
            $scope.showError = true;
        }
    };

    $scope.delUser = function() {
        UserService.getUserDelete($scope.selectCheckbox).then(function(response) {

            if (response.users.length === 0 && response.rows > 1) {
                var page = --$scope.pagination.current;
                $scope.getUsersByPage(page);
            } else
                $scope.pagination['total'] = $scope.calcPages(response.rows);
                $scope.items = response.users;
        });

        $scope.deleteUser = true;
        $scope.selectCheckbox = [];
    };

    $scope.calcPages = function (rows) {
        var range = $scope.pagination['range'];
        return Math.floor((rows % range == 0) ? (rows / range) : (rows / range) + 1);
    };

    $scope.toggleItem = function(id) {
        var index = $scope.selectCheckbox.indexOf(id);
        (index > -1) ? $scope.selectCheckbox.splice(index, 1) : $scope.selectCheckbox.push(id);
        ($scope.selectCheckbox.length === 0) ? $scope.deleteUser = true : $scope.deleteUser = false;
    };

    $scope.toggleShowUsers = function() {
        $scope.showPanel = "createUser";
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