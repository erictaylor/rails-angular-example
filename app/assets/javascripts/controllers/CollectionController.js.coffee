angular.module('noteApp').controller "CollectionController", ($scope, $timeout, $routeParams, Note, Collection) ->
  $scope.init = () ->
    @noteService = new Note($routeParams.collection_id, serverErrorHandler)
    @collectionService = new Collection(serverErrorHandler)

    $scope.collection = @collectionService.find $routeParams.collection_id

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")
