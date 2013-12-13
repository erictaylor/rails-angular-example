angular.module('noteApp').controller "NoteController", ($scope, $timeout, $location, $routeParams, Note, GhostDown) ->

  $scope.init = () ->
    @noteService = new Note($routeParams.collection_id, serverErrorHandler)
    $scope.note = @noteService.find $routeParams.note_id

  $scope.saveNote = (note) ->
    @noteService.update(note, title: note.title, content: note.content)


  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")
