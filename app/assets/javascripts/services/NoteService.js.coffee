angular.module('noteApp').factory 'Note', ($resource, $http) ->
  class Note
    constructor: (collectionId, errorHandler) ->
      @service = $resource('/api/collections/:collection_id/notes/:id',
        {collection_id: collectionId, id: '@id'},
        {update: {method: 'PATCH'}})
      @errorHandler = errorHandler

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    create: (attrs) ->
      new @service(note: attrs).$save ((note) -> attrs.id = note.id), @errorHandler
      attrs

    delete: (note) ->
      new @service().$delete {id: note.id}, (-> null), @errorHandler

    update: (note, attrs) ->
      new @service(note: attrs).$update {id: note.id}, (-> null), @errorHandler

    all: ->
      @service.query((-> null), @errorHandler)