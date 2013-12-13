angular.module('noteApp').controller "CollectionController", ($scope, $timeout, $location, $routeParams, Note, Collection, GhostDown) ->
  $scope.sortMethod = 'created_at'

  $scope.init = () ->
    @noteService = new Note($routeParams.collection_id, serverErrorHandler)
    @collectionService = new Collection(serverErrorHandler)

    $scope.collection = @collectionService.find $routeParams.collection_id

    $scope.selectedNote = null
    $scope.selectedNotePreview = null

  $scope.addNote = ->
    @noteService.create title: 'A New Note', (note) ->
      $location.path("/collections/#{$routeParams.collection_id}/notes/#{note.id}")

  $scope.deleteNote = (note) ->
    result = confirm "Are you sure you want to remove this note?"

    if result
      @noteService.delete note
      $scope.collection.notes.splice $scope.collection.notes.indexOf(note), 1
      $scope.selectedNote = null

  $scope.showNote = (note) ->
    $scope.selectedNote = note
    $scope.selectedNotePreview = GhostDown.toHtml($scope.selectedNote.content)

  $scope.dateTime = (datetime) ->
    date = new Date datetime
    year = date.getFullYear()
    month = date.getMonth() + 1
    if date.getDate() < 10
      day = "0" + date.getDate()
    else
      day = date.getDate()
    return year + "-" + month + "-" + day

  $scope.lastUpdated = (date) ->

    # Number of milliseconds in sec, min, hour, day
    ONE_SEC = 1000
    ONE_MIN = ONE_SEC * 60
    ONE_HOUR = ONE_MIN * 60
    ONE_DAY = ONE_HOUR * 24

    # Last Updated Date
    updated_date = new Date(date)

    # Convert date to current time.
    date_ms = updated_date.getTime()
    current_ms = new Date().getTime()

    # Calc diff
    difference_ms = Math.abs(date_ms - current_ms)

    # Convert
    secs_ago = Math.round(difference_ms/ONE_SEC)
    mins_ago = Math.round(difference_ms/ONE_MIN)
    hours_ago = Math.round(difference_ms/ONE_HOUR)
    days_ago = Math.round(difference_ms/ONE_DAY)

    if secs_ago <= 60
      return secs_ago + " seconds ago"
    else if mins_ago <= 60
      if mins_ago == 1
        return mins_ago + " minute ago"
      else
        return mins_ago + " minutes ago"
    else if hours_ago <= 24
      if hours_ago == 1
        return hours_ago + " hour ago"
      else
        return hours_ago + " hours ago"
    else if hours_ago > 24
      if hours_ago == 1
        return days_ago + " day ago"
      else
        return days_ago + " days ago"
    else
      return "just now!"

  $scope.goToNote = (note) ->
    $location.path("/collections/#{$routeParams.collection_id}/notes/#{note.id}")

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")
