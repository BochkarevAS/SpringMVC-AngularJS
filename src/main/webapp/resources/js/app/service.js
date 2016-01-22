angular.module("serviceApp", []).factory("Factory", function() {
    var thisIsPrivate = "private";

    function getPrivate() {
        return thisIsPrivate;
    }

    return {
        variable: "This is public",
        getPrivate: getPrivate
    };
});
