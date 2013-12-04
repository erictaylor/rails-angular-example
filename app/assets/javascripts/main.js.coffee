#= require_self
#= require_tree ./controllers/global
#= require_tree ./controllers/main
#= require_tree ./directives/global
#= require_tree ./directives/main
#= require_tree ./filters/global
#= require_tree ./filters/main
#= require_tree ./services/global
#= require_tree ./services/main

# Setup Angular App
App = angular.module("App", ["ngResource"])

# Routing
App.config(["$routeProvider", ($routeProvider) ->
  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' })
])

# CSRF Token Fix
App.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token').attr('content')
])