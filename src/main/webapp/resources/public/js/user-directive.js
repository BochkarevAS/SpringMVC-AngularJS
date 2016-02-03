angular.module("userDirective", []).directive("modalDialog", function($http) {

    return {
        restrict: "E",
        replace: true,
        transclude: true, // вставлять пользовательский контент внутри директивы
        link: function(scope, element, attributes) {

            scope.updateUser = function(user, valid) {
                if (valid) {
                    $http({
                        url: "/user",
                        method: "PUT",
                        data: user
                    }).then(function (response) {
                        if (response.status != 200) {
                            alert("Error update user!!!");
                        }
                    });
                } else {
                    scope.showError = true;
                }
            };
        },
        templateUrl: "/resources/public/html/users-update.html"
    }
});
