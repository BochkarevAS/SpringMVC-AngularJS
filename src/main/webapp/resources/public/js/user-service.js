angular.module("userService", []).service("UserService", function($http, $q) {

    return {
       getUserInfo: function(page) {
           var deferred = $q.defer();
           if (page === undefined) page = 1;
           $http({
               url: "/user/" + page,
               method: "GET"
           }).then(function(response) {
               if (response.status == 200) {
                   deferred.resolve(response.data);
               } else {
                   deferred.reject('Error retrieving user info');
               }
           });
           return deferred.promise;
       },
       getUserCreate: function(user) {
           var deferred = $q.defer();
           $http({
               url: '/user',
               method: 'POST',
               data: user
           }).then(function(response) {
               if (response.status == 200) {
                   deferred.resolve(response.data);
               } else {
                   deferred.reject('Error user create');
               }
           });
           return deferred.promise;
       },
       getUserDelete: function(listIndex) {
           var deferred = $q.defer();
           $http({
               url: "/user",
               method: "DELETE",
               data: listIndex,
               headers: { "Content-Type": "application/json" }
           }).then(function(response) {
               if (response.status == 200) {
                   deferred.resolve(response.data);
               } else {
                   deferred.reject('Error user delete');
               }
           });
           return deferred.promise;
       },
       getUserSearch: function(search) {
           var deferred = $q.defer();
           $http({
               url: "/user/search",
               method: "PUT",
               data: search
           }).then(function(response) {
               if (response.status == 200) {
                   deferred.resolve(response.data);
               } else {
                   deferred.reject('Error user search');
               }
           });
           return deferred.promise;
       }
    };
});
