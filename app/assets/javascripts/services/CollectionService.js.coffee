angular.module('noteApp').factory 'Collection', ($resource, $http) ->
  class Collection
    constructor: (errorHandler) ->
      @service = $resource('/api/collections/:id',
        {id: '@id'},
        {update: {method: 'PATCH'}})
      @errorHandler = errorHandler

    # Fix needed for the PATCH method to use application/json content type.
    defaults = $http.defaults.headers
    defaults.patch = defaults.patch || {}
    defaults.patch['Content-Type'] = 'application/json'

    create: (attrs, successHandler) ->
      new @service(collection: attrs).$save ((collection) -> successHandler(collection)), @errorHandler

    delete: (collection) ->
      new @service().$delete {id: collection.id}, (-> null), @errorHandler

    update: (list, attrs) ->
      new @service(collection: attrs).$update {id: collection.id}, (-> null), @errorHandler

    all: ->
      @service.query((-> null), @errorHandler)

    find: (id, successHandler) ->
      @service.get(id: id, ((collection)->
        successHandler?(colleciton)
        collection),
        @errorhandler)