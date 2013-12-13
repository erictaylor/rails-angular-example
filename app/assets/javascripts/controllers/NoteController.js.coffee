angular.module('noteApp').controller "NoteController", ($scope, $timeout, $location, $routeParams, Note, GhostDown) ->

  $scope.init = () ->
    @noteService = new Note($routeParams.collection_id, serverErrorHandler)
    $scope.note = @noteService.find $routeParams.note_id

  $scope.saveNote = (note) ->
    # Totally hacked together.
    content = $('#entry-markdown').val()
    @noteService.update(note, title: note.title, content: content)

  editor = ->
    console.log "Hey look"

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")
