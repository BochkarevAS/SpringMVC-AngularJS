angular.module("worldApp").directive("uiPagination", function($http, UserService) {
    return {
        restrict: "EA",
        replace: true,
        scope: {
            current: "=",
            items: "=",
            total: "=", //кол-во всего страниц
            range: "=" //кол-во страниц которые видны
        },
        templateUrl: "/resources/public/html/pagination.html",

        link: function(scope, element, attribute) {
            var calcPages = function() {
                var delta = Math.floor(scope.range / 2);

                scope.begin = scope.current - delta;
                if (scope.begin < 1) {
                    scope.begin = 1;
                }

                scope.end = scope.begin + scope.range - 1;
                if (scope.end > scope.total) {
                    scope.end = scope.total;
                    scope.begin = scope.end - (scope.range - 1);
                    if (scope.begin < 1) {
                        scope.begin = 1;
                    }
                }

                scope.pages = [];
                for (var i = scope.begin; i <= scope.end; i++) {
                    scope.pages.push(i);
                }
            };

            scope.$watch("current", calcPages);
            scope.$watch("total", calcPages);

            scope.isCurrent = function (index) {
                return scope.current == index;
            };

            scope.setCurrent = function (index) {
                scope.current = index;
                UserService.getUserInfo(index).then(function(response) {
                    scope.items = response.users;
                });
            };

            scope.hasPrev = function () {
                return scope.current > 1;
            };

            scope.prev = function () {
                if (scope.hasPrev()) {
                    scope.current--;
                    UserService.getUserInfo(scope.current).then(function(response) {
                        scope.items = response.users;
                    });
                }
            };

            scope.hasNext = function () {
                return scope.current < scope.total;
            };

            scope.next = function () {
                if (scope.hasNext()) {
                    scope.current++;
                    UserService.getUserInfo(scope.current).then(function(response) {
                        scope.items = response.users;
                    });
                }
            };

            scope.firstPage = function () {
                return scope.current == 1;
            };

            scope.goToFirstPage = function () {
                if (!scope.firstPage()) {
                    scope.current = 1;
                    UserService.getUserInfo(scope.current).then(function(response) {
                        scope.items = response.users;
                    });
                }
            };

            scope.lastPage = function () {
                return scope.current == scope.total;
            };

            scope.goToLastPage = function () {
                if (!scope.lastPage()) {
                    scope.current = scope.total;
                    UserService.getUserInfo(scope.current).then(function(response) {
                        scope.items = response.users;
                    });
                }
            };
        }
    };
});