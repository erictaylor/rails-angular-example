angular.module("noteApp").directive "ghostDown", (GhostDown) ->

  link = (scope, element, attrs) ->

    displayContent = ->
      element.text content
      GhostDown.editor()

    content = undefined

    scope.$watch attrs.ghostDown, (value) ->
      content = value
      displayContent()

  link: link
