angular.module('noteApp').controller "DashboardController", ($scope, $routeParams, $location, Collection) ->

  $scope.init = ->
    @collectionsService = new Collection(serverErrorHandler)
    $scope.collections = @collectionsService.all()

  $scope.createCollection = (name) ->
    @collectionsService.create name: name, (collection) ->
      $location.url("/collections/#{collection.id}")

  $scope.deleteCollection = (collection, index) ->
    result = confirm "Are you sure you want to remove this collection?"

    if result
      @collectionsService.delete collection
      $scope.collections.splice index, 1

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")