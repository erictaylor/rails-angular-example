angular.module('App').factory('Collection', ['$resource', ($resource) ->
  $resource '/api/collections'
])