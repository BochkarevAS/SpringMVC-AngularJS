angular.module("frontendServices", []).service("UserService", function($http, $q) {
    return {
       getUserInfo: function(page) {
           var newUrl= "/user/" + page;

           if (page === undefined) {
               newUrl = "/user/" + 1;
           } else if (page === false) {
               newUrl = "/user";
           }

           var deferred = $q.defer();
           $http({
               url: newUrl,
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
                   deferred.reject('Error retrieving user info');
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
               headers: {"Content-Type": "application/json"}
           }).then(function(response) {
               if (response.status == 200) {
                   deferred.resolve(response.data);
               } else {
                   deferred.reject('Error retrieving user info');
               }
           });
           return deferred.promise;
       }
    }
});
