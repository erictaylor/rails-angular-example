angular.module('App').controller('IndexCtrl', ['$scope', '$location', 'Collection', ($scope, $location, Collection) ->
  $scope.helloWorld = "Hello World!"
  $scope.collections = Collection.query()

  $scope.showCollection = (collection) ->
    $location.url('/collection/'+collection.id)
])