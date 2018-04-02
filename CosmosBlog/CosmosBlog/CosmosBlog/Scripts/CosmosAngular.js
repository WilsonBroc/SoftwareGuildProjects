var appMainModule = angular.module('myApp', []);

appMainModule.controller('myController',
    function($scope, $http) {

        var postService = {}
        var staticPageService = {}

        postService.getAllPosts = function() {
            return $http.get('/Blog/ListAllPosts/');
        };

        postService.getFourNewestPosts = function() {
            return $http.get('/Blog/ListNewestFourPosts/');
        }

        postService.getApprovedPosts = function(){
            return $http.get('/Blog/ListAllApprovedPosts/');
        }

        staticPageService.getAllPages = function() {
            return $http.get('/StaticPage/GetAllStaticPages/');
        }

        staticPageService.getMoreMenu = function() {
            return $http.get('/StaticPage/GetMoreMenu/');
        }

        listPosts();
        listPages();
        listApproved();
        

        
        function listPages() {
            var x = staticPageService.getAllPages().success(function (data) {
                console.log(data, "all pages");
            });
            staticPageService.getAllPages()
                .success(function(data) {
                    $scope.AllPages = data;
                });
        }
        function listPosts() {
            var x = postService.getAllPosts().success(function (data) {
                console.log(data, "all posts");
            });
            postService.getAllPosts()
                .success(function(data) {
                    $scope.allPosts = data;
                    for (var i = 0; i < $scope.allPosts.length; i++) {
                        var date = $scope.allPosts[i].DateCreated.replace(/\/Date\((-?\d+)\)\//, '$1');
                        $scope.allPosts[i].DateCreated = new Date(parseInt(date));
                        //$scope.cases[i].OffenseDate.toDateString();
                    }
                    console.log($scope.allPosts);
                });
        }

        function listApproved() {
            var x = postService.getApprovedPosts().success(function (data) {
                console.log(data, "approved posts");
            });
            postService.getApprovedPosts()
                .success(function(data) {
                    $scope.allApproved = data;
                });
        }

        getNewestPosts();
        getMoreMenu();

        function getNewestPosts() {
            var x = postService.getFourNewestPosts().success(function (data) {
                console.log(data, "four newer posts");
            });
            postService.getFourNewestPosts()
                .success(function(data) {
                    $scope.fourNewestPosts = data;
                    for (var i = 0; i < $scope.fourNewestPosts.length; i++) {
                        var date = $scope.fourNewestPosts[i].DateCreated.replace(/\/Date\((-?\d+)\)\//, '$1');
                        $scope.fourNewestPosts[i].DateCreated = new Date(parseInt(date));
                        //$scope.cases[i].OffenseDate.toDateString();
                    }
                    console.log($scope.fourNewestPosts);
                });
        }

        function getMoreMenu() {
            var x = staticPageService.getMoreMenu().success(function (data) {
                console.log(data, "more menu");
            });;
            staticPageService.getMoreMenu()
                .success(function(data) {
                    $scope.moreMenu = data;
                });
        }



    });