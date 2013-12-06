angular.module('App').factory('ListNotes', ['$resource', ($resource) ->
  $resource '/api/collections/:collectionId/notes'
])