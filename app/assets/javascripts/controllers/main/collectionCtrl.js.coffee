angular.module('App').controller('CollectionCtrl', ['$scope', '$routeParams', 'ListNotes', ($scope, $routeParams, ListNotes) ->
  $scope.collectionId = $routeParams.id
  $scope.notes = ListNotes.query({collectionId:$scope.collectionId}, ->
    $scope.selectedNote = $scope.notes[0]
  )

  # Set the selected note to the one that was clicked
  $scope.showNote = (note) ->
    $scope.selectedNote = note
])