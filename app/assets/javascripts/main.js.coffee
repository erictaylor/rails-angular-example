#= require_self
#= require_tree ./controllers
#= require_tree ./directives
#= require_tree ./filters
#= require_tree ./services

# Setup Angular App
noteApp = angular.module('noteApp', ["ngResource", "ngRoute"])

# CSRF Token Fix
noteApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken

# Routing
noteApp.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/', redirectTo: '/dashboard'
  $routeProvider.when '/dashboard', templateUrl: '/templates/dashboard.html', controller: 'DashboardController'
  $routeProvider.when '/collections/:collection_id', templateUrl: '/templates/collection.html', controller: 'CollectionController'

  # Default
  # $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' })

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])