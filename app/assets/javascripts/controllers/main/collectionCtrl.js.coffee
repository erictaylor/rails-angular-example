angular.module('App').controller('CollectionCtrl', ['$scope', '$routeParams', 'ListNotes', ($scope, $routeParams, ListNotes) ->
  $scope.collectionId = $routeParams.id
  $scope.notes = ListNotes.query({collectionId:$scope.collectionId})
])